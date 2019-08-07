using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GoTDb.App_Data;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace GoTDb
{
	public class Utilities
	{
		public int AddCharacter(Character character)
		{
			return DbAccess.AddCharacter(character);
		}

		public int AddLocation(Location location)
		{
			return DbAccess.AddLocation(location);
		}

		public int AddOrEditScene(Scene scene, string sceneIdToEdit)
		{
			return DbAccess.AddOrEditScene(scene, sceneIdToEdit);
		}

		public static void ClearCharacterSelections(HtmlForm form)
		{
			foreach (DropDownList d in GetCharacterListBoxes(form))
			{
				d.SelectedIndex = 0;
			}
		}

		public static List<Character> GetAllCharacters()
		{
			DataTable dt = DbAccess.GetFullCharacterListForSelectionDropdowns();
			List<Character> l = (
				from DataRow dr in dt.Rows
				select new Character
				{
					Id = dr["Id"].ToString(),
					FirstName = dr["FirstName"].ToString(),
					LastName = dr["LastName"].ToString(),
					Notes = dr["Notes"].ToString()
				}).ToList();
			return l;
		}

		public static string GetCharacterNameFromFormWithId(HtmlForm form, string characterId)
		{
			string sRtrn = string.Empty;
			foreach (DropDownList ddl in GetCharacterListBoxes(form))
			{
				if(ddl.SelectedIndex > 0 && ddl.SelectedValue == characterId)
				{
					sRtrn = ddl.SelectedItem.Text;
					break;
				}
			}
			return sRtrn;
		}

		public static string GetDuplicatedCharacters(Scene scene)
		{
			string iRtrn = string.Empty;
			List<string> sCharIds = scene.GetCharacterIds().Split(',').ToList();

			if (sCharIds.Count != sCharIds.Distinct().Count())
			{
				List<string> lDups = (sCharIds.GroupBy(x => x).Where(group => group.Count() > 1).Select(group => group.Key)).ToList();
				iRtrn = lDups[0];
			}
			return iRtrn;
		}

		public static DataTable GetLocations()
		{
			return DbAccess.GetLocations();
		}

		public static Scene GetScene(string sceneId)
		{
			return DbAccess.GetScene(sceneId);
		}

		public static Scene GetSceneFromPage(HtmlForm form)
		{
			Scene scene = new Scene();

			try
			{
				scene.Season = ((DropDownList)form.FindControl("ddlSeason")).SelectedValue;		// These do not exist on EditScene.aspx.
				scene.Episode = ((DropDownList)form.FindControl("ddlEpisode")).SelectedValue;	//
			}
			catch 
			{
				scene.Season = ((HtmlGenericControl)form.FindControl("lblSeasonNumber")).InnerText;
				scene.Episode = ((HtmlGenericControl)form.FindControl("lblEpisodeNumber")).InnerText;
			}

			try { scene.TimeStamp = ((TextBox)form.FindControl("txtTimeStamp")).Text; }			// These do not exist on Default.aspx.
			catch { }
			try { scene.Description = ((TextBox)form.FindControl("txtDescription")).Text; }		//
			catch { }
			try { scene.AndComparison = ((RadioButton)form.FindControl("radAndComparison")).Checked; }	// Exists only on Default.aspx.
			catch { }

			scene.LocationId = Convert.ToInt16(((DropDownList)form.FindControl("ddlLocation")).SelectedValue);
			scene.LocationName = ((DropDownList)form.FindControl("ddlLocation")).SelectedItem.Text;
			scene.CharacterIds = GetSelectedCharacterIds(form);
			scene.Keywords = ((TextBox)form.FindControl("txtKeywords")).Text.ToLower();
			return scene;
		}

		public static string GetSelectedCharacterIds(HtmlForm form)
		{
			string sRtrn = string.Empty;

			foreach (DropDownList d in GetCharacterListBoxes(form))
			{
				if (d.SelectedValue != "0")
				{
					sRtrn += d.SelectedValue + ",";
				}
			}
			return sRtrn.Length > 0 ? sRtrn.Substring(0, sRtrn.Length - 1) : null;
		}

		public static void PopulateCharacterDropdownsFromScene(HtmlForm form, Scene scene)
		{
			if (scene.GetCharacterIds() != null)
			{
				string[] arrCharacterIds = scene.CharacterIds.Split(',');
				List<DropDownList> dropdowns = GetCharacterListBoxes(form);

				for (int i = 0; i < arrCharacterIds.Length; i++)
				{
					dropdowns[i].SelectedValue = arrCharacterIds[i];
				}
			}
		}

		public static void PopulateLocationAndCharacterDropdownsOnPageLoad(HtmlForm form, bool allowAny)
		{
			DropDownList ddl = (DropDownList)form.FindControl("ddlLocation");
			ddl.DataSource = GetLocations();
			ddl.DataBind();

			if(allowAny)
			{
				ddl.Items.Insert(0, new ListItem("Any", "0"));
			}

			List<Character> chars = GetAllCharacters();
			Character cNull = new Character { FirstName = string.Empty, LastName = string.Empty, Id = "0" };	// Add blank row so user can clear a character dropdown when desired.
			chars.Insert(0, cNull);		

			foreach(DropDownList ddl2 in GetCharacterListBoxes(form))
			{
				ddl2.DataSource = chars;
				ddl2.DataBind();
			}
		}

		public static void PopulatePageFromScene(HtmlForm form, Scene scene)
		{
			try
			{
				DropDownList seasonDdl = (DropDownList)form.FindControl("ddlSeason");
				DropDownList episodeDdl = (DropDownList)form.FindControl("ddlEpisode");
				seasonDdl.SelectedValue = scene.Season;
				SetEpisodeCount(seasonDdl.SelectedItem, true, ref episodeDdl);	// populates the Episode dropdown according to Season (season 7 has 7 ep's, all others have 10).
				episodeDdl.SelectedValue = scene.Episode;
			}
			catch
			{
				((HtmlGenericControl)form.FindControl("lblSeasonNumber")).InnerText = scene.Season;
				((HtmlGenericControl)form.FindControl("lblEpisodeNumber")).InnerText = scene.Episode;
			}

			try { ((TextBox)form.FindControl("txtTimeStamp")).Text = scene.TimeStamp; }
			catch { }
			try { ((TextBox)form.FindControl("txtDescription")).Text = scene.Description; }
			catch { }

			((DropDownList)form.FindControl("ddlLocation")).SelectedValue = scene.LocationId.ToString();
			PopulateCharacterDropdownsFromScene(form, scene);
			((TextBox)form.FindControl("txtKeywords")).Text = scene.Keywords;
		}

		private static List<Scene> ProcessFoundScenes(List<Scene> foundScenes, Scene s)
		{
			if(foundScenes.Count > 0)
			{
				List<Scene> foundScenes2 = new List<Scene>();

				if ((s.GetCharacterIds() != null || s.GetCharacters().Count > 0) && s.AndComparison)		// If the search included characters, and the user selected 'include ALL characters in search', then
				{																					//  find only the scenes whose character lists include all those characters.
					int foundCharacters = 0;
					string[] cIds = s.GetCharacterIds().Split(',');
					
					foreach (Scene sc in foundScenes)
					{
						foreach (Character c in sc.GetCharacters())
						{
							if(cIds.Contains(c.Id))
							{
								foundCharacters++;

								if (foundCharacters.Equals(cIds.Length))
								{
									foundScenes2.Add(sc);
									break;
								}
							}
						}
						foundCharacters = 0;
					}
					foundScenes = foundScenes2;
				}
			}
			return foundScenes;
		}

		public List<Scene> SearchForScenes(Scene scene)
		{
			return ProcessFoundScenes(DbAccess.SearchForScenes(scene), scene);
		}

		public static void SelectCharacterIdInDropdowns(string characterId, HtmlForm form)
		{
			foreach(DropDownList ddl in GetCharacterListBoxes(form))
			{
				if(ddl.SelectedIndex == 0)
				{
					ddl.SelectedValue = characterId;
					break;
				}
				else if(ddl.SelectedValue == characterId)
				{
					break;
				}
			}
		}

		public static void SetEpisodeCount(ListItem selectedItem, bool includeAnySelection, ref DropDownList dropDown)
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

				if(includeAnySelection)
				{
					dropDown.Items.Insert(0, new ListItem("Any", "0"));
				}
			}
			catch (Exception ex)
			{
				// there was a problem getting the episode count
			} 
		}

		#region private methods
		public static List<DropDownList> GetCharacterListBoxes(HtmlForm form)
		{
			List<DropDownList> l = new List<DropDownList>();
			foreach (Control c in form.Controls)
			{
				if (c.ID != null && c.ID.Contains("ddlCharacter"))
				{
					l.Add((DropDownList)c);
				}
			}
			return l;
		} 
		#endregion
	}
}