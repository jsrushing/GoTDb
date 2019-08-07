using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using GoTDb.App_Data;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace GoTDb
{
	public class Scene
	{
		public string SceneId { get; set; }
		public string Season { get; set; }
		public string Episode { get; set; }
		public int LocationId { get; set; }
		public string LocationName { get; set; }
		public string CharacterIds { get; set; } // comma-delimited string of character ids
		public string Keywords { get; set; }
		public string TimeStamp { get; set; }
		public string Description { get; set; }
		public List<Character> Characters { get; set; }
		public string CreatedBy { get; set; }
		public string EditedBy { get; set; }
		public DateTime CreatedOn { get; set; }
		public DateTime EditedOn { get; set; }
		public double TimeStampAsDecimal { get { return calcTimeStampAsDecimal(); } }
		public bool AndComparison { get; set; }

		//private HtmlForm myForm { get; set; }
		private List<Character> allCharacters = new List<Character>();

		public Scene()
		{
			this.Characters = new List<Character>();
		}

		private double calcTimeStampAsDecimal()
		{
			int i = TimeStamp.IndexOf(":");
			string sMin = TimeStamp.Substring(0, TimeStamp.IndexOf(":"));
			string sSec = TimeStamp.Substring(TimeStamp.IndexOf(":") + 1, 2);
			if (Convert.ToInt16(sSec) > 59) { sSec = "asdf"; }
			double dMin = Convert.ToDouble(sMin);
			double dSec = Convert.ToDouble(sSec) / 60;
			return dMin + dSec;
		}
		
		public void BuildFromDataSet(DataSet ds)
		{
			DataTable dt = ds.Tables[0];
				DataRow dr = dt.Rows[0];
				this.CreatedBy = dr["CreatedBy"] != null ? dr["CreatedBy"].ToString() : string.Empty;
				this.EditedBy = dr["EditedBy"] != null ? dr["EditedBy"].ToString() : string.Empty;
				this.CreatedOn = DateTime.Parse(dr["CreatedOn"].ToString());
				this.Description = dr["Description"] != null ? dr["Description"].ToString() : string.Empty;
				this.Season = dr["Season"] != null ? dr["Season"].ToString() : string.Empty;
				this.Episode = dr["Episode"] != null ? dr["Episode"].ToString() : string.Empty;
				this.LocationId = dr["LocationId"] != null ? Convert.ToInt32(dr["LocationId"].ToString()) : 0;
				this.TimeStamp = dr["TimeStamp"] != null ? dr["TimeStamp"].ToString() : string.Empty;
			dt = ds.Tables[1];		// characters
				List<Character> chars = new List<Character>();
				string sCharIdsAsString = "";
				foreach(DataRow dr2 in dt.Rows)
				{
					this.Characters.Add(new Character(dr2["CharacterId"].ToString()));
					sCharIdsAsString += dr2["CharacterId"].ToString() + ",";
					//this.Characters.Add(new Character {FirstName = dr2["firstName"].ToString(), LastName = dr2["lastName"].ToString()});
				}
				this.CharacterIds = sCharIdsAsString.Substring(0, sCharIdsAsString.Length - 1);
			dt = ds.Tables[2];	// keywords
				string s = string.Empty;
				foreach(DataRow dr2 in dt.Rows)
				{
					s += dr2["Keyword"].ToString() + ", ";
				}
				this.Keywords = s.Substring(0, s.Length - 2);
		}

		public List<Character> GetCharacters()
		{
			List<Character> lstRtrn = new List<Character>();

			if(this.GetCharacterIds() != null)
			{
				if(this.Characters.Count > 0)
				{
					lstRtrn = this.Characters;
				}
				else 
				{
					if(this.allCharacters.Count == 0)
					{
						allCharacters = Utilities.GetAllCharacters();
					}
					lstRtrn = allCharacters.Where(x => this.CharacterIds.Split(',').Contains(x.Id)).ToList();
					this.Characters = lstRtrn;
				}
			}
			return lstRtrn;
		}

		public string GetCharacterIds()
		{
			string iRtrn = null;

			if(this.CharacterIds != null)
			{
				iRtrn = this.CharacterIds;
			}
			else if(this.Characters.Count > 0)
			{
				string ids = string.Empty;
				foreach(Character c in this.Characters)
				{
					ids += c.Id + ",";
				}
				iRtrn = ids.Substring(0, ids.Length - 1);
				this.CharacterIds = iRtrn;
			}
			return iRtrn;
		}

		public bool IsIdenticalTo(Scene scene)
		{
			return
				this.GetCharacterIds() == scene.GetCharacterIds() &
				this.Description == scene.Description &
				this.Keywords == scene.Keywords &
				this.LocationId == scene.LocationId &
				this.TimeStamp == scene.TimeStamp;

		}

		public void PopulateCharacterDropdownsFromScene(HtmlForm form)
		{
			if (this.GetCharacterIds() != null)
			{
				string[] arrCharacterIds = this.CharacterIds.Split(',');
				List<DropDownList> dropdowns = Utilities.GetCharacterListBoxes(form);

				for (int i = 0; i < arrCharacterIds.Length; i++)
				{
					dropdowns[i].SelectedValue = arrCharacterIds[i];
				}
			}
		}

		public void PopulateForm(HtmlForm myForm)
		{
			try
			{
				DropDownList seasonDdl = (DropDownList)myForm.FindControl("ddlSeason");
				DropDownList episodeDdl = (DropDownList)myForm.FindControl("ddlEpisode");
				seasonDdl.SelectedValue = this.Season;
				SetEpisodeCount(seasonDdl.SelectedItem, true, ref episodeDdl);  // populates the Episode dropdown according to Season (season 7 has 7 ep's, all others have 10).
				episodeDdl.SelectedValue = this.Episode;
			}
			catch
			{
				((HtmlGenericControl)myForm.FindControl("lblSeasonNumber")).InnerText = this.Season;
				((HtmlGenericControl)myForm.FindControl("lblEpisodeNumber")).InnerText = this.Episode;
			}

			try { ((TextBox)myForm.FindControl("txtTimeStamp")).Text = this.TimeStamp; }
			catch { }
			try { ((TextBox)myForm.FindControl("txtDescription")).Text = this.Description; }
			catch { }

			((DropDownList)myForm.FindControl("ddlLocation")).SelectedValue = this.LocationId.ToString();
			PopulateCharacterDropdownsFromScene(myForm);
			((TextBox)myForm.FindControl("txtKeywords")).Text = this.Keywords;
		}

		public void SetEpisodeCount(ListItem selectedItem, bool includeAnySelection, ref DropDownList dropDown)
		{
			ListItem li = null;
			try
			{
				dropDown.Items.Clear();

				int iEpisodeCount = DbAccess.GetEpisodeCount(Convert.ToInt32(selectedItem.Value));

				for (int iFill = 1; iFill < iEpisodeCount + 1; iFill++)
				{
					li = new ListItem(iFill.ToString(), iFill.ToString());
					dropDown.Items.Add(li);
				}

				if (includeAnySelection)
				{
					dropDown.Items.Insert(0, new ListItem("Any", "0"));
				}
			}
			catch (Exception ex)
			{
				// there was a problem getting the episode count
			}
		}
	}
}