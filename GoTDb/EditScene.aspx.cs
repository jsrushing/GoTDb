using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace GoTDb
{
	public partial class EditScene : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if(!IsPostBack)
			{
				lblHiddenSceneId.InnerText = Session["sceneIdUnderEdit"].ToString();
				Utilities.PopulateLocationAndCharacterDropdownsOnPageLoad(Form, false);

				if (Session["SceneForRepopulate_Edit"] == null)
				{
					Scene s = Utilities.GetScene(Session["sceneIdUnderEdit"].ToString());
					Session["scene2Edit"] = s;
					s.PopulateForm(Form);
				}
				else
				{
					Scene s = (Scene)Session["SceneForRepopulate_Edit"];
					s.PopulateForm(Form);

					if (Session["CommitScene"] != null && Session["CommitScene"].ToString() == "1")
					{
						Session.Remove("CommitScene");
						UpdateScene();
					}
					else
					{
						s.PopulateForm(Form);
					}

					Session.Remove("SceneForRepopulate_Edit");
				}

				if (Request.QueryString["newLocationId"] != null)
				{
					ddlLocation.SelectedValue = Request.QueryString["newLocationId"];
				}

				if (Request.QueryString["newCharacterId"] != null)
				{
					Utilities.SelectCharacterIdInDropdowns(Request.QueryString["newCharacterId"], Form);
				}
			}

			lblCharacterRequired.Visible = false;
			lblSceneExists.Visible = false;
			lblTimeStampInvalid.Visible = false;
			lblDuplicateCharacter.Visible = false;
		}

		private void UpdateScene()
		{
			int iResult = AppValidator.AddOrEditScene((Scene)Session["SceneForRepopulate_Edit"], lblHiddenSceneId.InnerText);

			switch (iResult)
			{
				case 1:		// successful db call, db return
					Session.Remove("SceneForRepopulate_Edit");
					ViewState["prevPage"] = "default.aspx";
					Response.Redirect("Default.aspx");
					break;
				case 0:		// db call failed, db return
					{
						lblUncodedError.InnerText = "Database error '0'";
						break;
					}
				default:
					lblUncodedError.InnerText = "Unspecified error, iRtrn = " + iResult.ToString();
					lblUncodedError.Visible = true;
					break;
			}
		}

		protected void btnUpdateScene_Click(object sender, EventArgs e)
		{
			Scene s = Utilities.GetSceneFromPage(Form);
			s.SceneId = lblHiddenSceneId.InnerText;

			if (ValidateScene(s))
			{
				Session["SceneForRepopulate_Edit"] = s;
				Response.Redirect("ConfirmAddEdit.aspx");
			}	
		}

		protected void btnCancelUpdate_Click(object sender, EventArgs e)
		{
			CancelSelected();
		}

		private void CancelSelected()
		{
			Response.Redirect("Default.aspx");
		}

		private Scene GetCurrentScene()
		{
			Scene scene = (Scene)Session["scene2Edit"];
			scene = Utilities.GetSceneFromPage(Form);
			return scene;
		}

		protected void btnAddCharacter_Click(object sender, EventArgs e)
		{
			Session["SceneForRepopulate_Edit"] = GetCurrentScene();
			Response.Redirect("AddCharacter.aspx");
		}

		protected void btnAddLocation_Click(object sender, EventArgs e)
		{
			Session["SceneForRepopulate_Edit"] = GetCurrentScene();
			Response.Redirect("AddLocation.aspx");
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
			else
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