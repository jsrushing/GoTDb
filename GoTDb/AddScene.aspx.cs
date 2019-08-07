using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GoTDb.App_Data;
using GoTDb;
using System.Configuration;

namespace GoTDb
{
	public partial class WebForm1 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if(1 > 0)
			{
				Console.WriteLine("greater");
			}

			if (!IsPostBack)
			{
				Utilities.PopulateLocationAndCharacterDropdownsOnPageLoad(Form, false);
				Utilities.SetEpisodeCount(ddlSeason.SelectedItem, false, ref ddlEpisode);
			}

			if (Session["SceneForRepopulate_Add"] != null)
			{
				Scene scene = (Scene)Session["SceneForRepopulate_Add"];

				if (Session["CommitScene"] != null && Session["CommitScene"].ToString() == "1")
				{
					Session.Remove("CommitScene");
					AddScene();
				}
				else
				{
					scene.PopulateForm(Form);
				}

				Session.Remove("SceneForRepopulate_Add");
			}

			if (Request.QueryString["newLocationId"] != null)
			{
				ddlLocation.SelectedValue = Request.QueryString["newLocationId"];
			}

			if (Request.QueryString["newCharacterId"] != null)
			{
				Utilities.SelectCharacterIdInDropdowns(Request.QueryString["newCharacterId"], Form);
			} 
			
			lblCharacterRequired.Visible = false;
			lblSceneExists.Visible = false;
			lblTimeStampInvalid.Visible = false;
			lblDuplicateCharacter.Visible = false;
		}

		private void AddScene()
		{
			switch (AppValidator.AddOrEditScene((Scene)Session["SceneForRepopulate_Add"], "0"))
			{
				case 1:		// successful db call, db return
					Session.Remove("SceneForRepopulate_Add");
					ViewState["prevPage"] = "default.aspx";
					RedirectToCaller();
					break;
				case 0:		// db call failed, db return
					{
						lblUncodedError.InnerText = "Database error '0'";
						break;
					}
				case -1:	// scene exists, db return
					lblSceneExists.InnerText = ConfigurationManager.AppSettings["sceneExistsErrorMessage"];
					lblSceneExists.Visible = true;
					break;
				default:
					lblUncodedError.InnerText = "Unspecified error";
					break;
			}
		}

		protected void btnAddScene_Click(object sender, EventArgs e)
		{
			Scene s = Utilities.GetSceneFromPage(Form);
			if(ValidateScene(s))
			{
				Session["SceneForRepopulate_Add"] = s;
				Response.Redirect("ConfirmAddEdit.aspx");
			}
		}

		protected void btnAddCharacter_Click(object sender, EventArgs e)
		{
			Session["SceneForRepopulate_Add"] = Utilities.GetSceneFromPage(Form);
			Response.Redirect("AddCharacter.aspx");
		}

		protected void btnAddLocation_Click(object sender, EventArgs e)
		{
			Session["SceneForRepopulate_Add"] = Utilities.GetSceneFromPage(Form);
			Response.Redirect("AddLocation.aspx");
		}

		protected void btnCancelAddScene_Click(object sender, EventArgs e)
		{
			ViewState["prevPage"] = "Default.aspx";
			RedirectToCaller();
		}

		protected void ddlSeason_SelectedIndexChanged(object sender, EventArgs e)
		{
			Utilities.SetEpisodeCount(ddlSeason.SelectedItem, false, ref ddlEpisode);
		}

		protected void btnClearCharacters_Click(object sender, EventArgs e)
		{
			Utilities.ClearCharacterSelections(Form);
		}

		private void RedirectToCaller()
		{
			string s = ViewState["prevPage"].ToString();
			ViewState.Remove("prevPage");
			Response.Redirect(s);
		}

		private bool ValidateScene(Scene scene)
		{
			bool isValid = false;
			int iAddendForDupCharacter = 10000;
			int iRslt = AppValidator.ValidateScene(scene, iAddendForDupCharacter);

			if (iRslt > iAddendForDupCharacter)
			{
				int charId = iRslt - iAddendForDupCharacter;
				lblDuplicateCharacter.InnerText = String.Format(lblDuplicateCharacter.InnerText, Utilities.GetCharacterNameFromFormWithId(Form, charId.ToString()));
				lblDuplicateCharacter.Visible = true;
			}
			{
				switch (iRslt)
				{
					case 1:
						isValid = true;
						break;
					case -1:	// scene exists, db return
						lblSceneExists.InnerText = ConfigurationManager.AppSettings["sceneExistsErrorMessage"];
						lblSceneExists.Visible = true;
						break;
					case -2:	// timestamp is invalid (e.g. 'asdf'), AppValidator method return
						lblTimeStampInvalid.InnerText = ConfigurationManager.AppSettings["timeStampErrorMessage"];
						lblTimeStampInvalid.Visible = true;
						break;
					case -3:	// no characters selected, AppValidator method return
						lblCharacterRequired.InnerText = ConfigurationManager.AppSettings["noCharactersErrorMessage"];
						lblCharacterRequired.Visible = true;
						break;
					case -4:
						lblSceneExists.InnerText = ConfigurationManager.AppSettings["sceneExistsErrorMessage"];
						lblSceneExists.Visible = true;
						break;
				}
			}
			return isValid;
		}
	}
}