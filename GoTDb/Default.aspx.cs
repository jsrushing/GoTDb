/* Created by: JS Rushing
 * Created on: 11/20/17
 * Description: A database tailored for Game of Thrones.  Users can add characters, locations, and new scenes.
 * 
 * Bugs:
 *	12/9/17 02:45 SOLVED
 *	Episode sort is not in numberic order.  Changed dbo.SearchScenes to sort by created field 'EpisodeAsInt'.
 *	
 * ToDo:
 *	> Implement search results grid paging.
 *	> 12/2/17 : Create a 'You are about to add (or edit) a scene with the following details.  Continue? Y/N' screen.
 *		> DONE 12/11/17
 *	> 12/9/17 : Check for duplicate characters before adding/editing scene.
 *		> DONE 12/12/17
 *		
 */


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoTDb
{
	public partial class _Default : System.Web.UI.Page
	{
		List<Scene> foundScenes = new List<Scene>();

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				Utilities.PopulateLocationAndCharacterDropdownsOnPageLoad(Form, true);

				if (Session["SceneForRepopulate_Default"] != null)
				{
					Scene s = (Scene)Session["SceneForRepopulate_Default"];
					s.PopulateForm(Form);
					Session.Remove("SceneForRepopulate_Default");
				}

				if(Request.QueryString["newLocationId"] != null)
				{
					ddlLocation.SelectedValue = Request.QueryString["newLocationId"];
				}

				if (Request.QueryString["newCharacterId"] != null)
				{
					Utilities.SelectCharacterIdInDropdowns(Request.QueryString["newCharacterId"], Form);
				}

				if (Session["doSearch"] != null) { DoSearch(); Session.Remove("doSearch"); }

				Session.Remove("sceneIdUnderEdit");
			}
		}

		protected void btnAddScene_Click(object sender, EventArgs e)
		{
			Session["SceneForRepopulate_Default"] = Utilities.GetSceneFromPage(Form);
			Session["doSearch"] = gridSceneSearchResults.Rows.Count > 0 ? "1" : null;
			Response.Redirect("AddScene.aspx");
		}

		protected void btnSearch_Click(object sender, EventArgs e)
		{
			DoSearch();
		}

		protected void ddlSeason_SelectedIndexChanged(object sender, EventArgs e)
		{
			Utilities.SetEpisodeCount(ddlSeason.SelectedItem, true, ref ddlEpisode);
		}

		private void DoSearch()
		{
			Scene s = Utilities.GetSceneFromPage(Form);
			Utilities u = new Utilities();
			foundScenes = u.SearchForScenes(s);
			lblNoResults.Visible = foundScenes.Count > 0 ? false : true;
			gridSceneSearchResults.DataSource = foundScenes.Count > 0 ? foundScenes : null;
			gridSceneSearchResults.DataBind();
		}

		protected void gridSceneSearchResults_SelectedIndexChanged(object sender, EventArgs e)
		{
			Session["SceneForRepopulate_Default"] = Utilities.GetSceneFromPage(Form);
			Session["doSearch"] = "1";
			RedirectForEdit(gridSceneSearchResults, 1);
		}

		protected void gridSceneSearchResults_RowCreated(object sender, GridViewRowEventArgs e)
		{
			e.Row.Cells[1].Visible = false;
		}

		protected void gridSceneSearchResults_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			if(e.Row.RowIndex > -1)
			{
				DropDownList ddl = (DropDownList)e.Row.FindControl("ddlFoundCharacters");
				ddl.DataSource =  foundScenes[e.Row.RowIndex].Characters;
				ddl.DataBind();
			}
		}

		protected void btnClearCharacters_Click(object sender, EventArgs e)
		{
			Utilities.ClearCharacterSelections(Form);
		}

		protected void RedirectForEdit(GridView grid, int IdCellIndex)
		{
			try
			{
				GridViewRow row = grid.SelectedRow;
				Session["sceneIdUnderEdit"] = row.Cells[IdCellIndex].Text;
				Response.Redirect("EditScene.aspx");
			}
			catch (System.FormatException)
			{
				
			}
			catch (Exception ex)
			{
				string s = ex.Message;
			}
		}

		//private void SetEpisodeCount()
		//{
		//	Utilities.SetEpisodeCount(ddlSeason.SelectedItem, false, ref ddlEpisode);
		//}

		protected void gridSceneSearchResults_PageIndexChanging(object sender, GridViewPageEventArgs e)
		{
			gridSceneSearchResults.PageIndex = e.NewPageIndex;
			gridSceneSearchResults.DataBind();
		}

		protected void gridSceneSearchResults_PageIndexChanged(object sender, EventArgs e)
		{

		}

	}
}