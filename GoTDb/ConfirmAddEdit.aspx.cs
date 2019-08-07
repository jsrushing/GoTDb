using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoTDb
{
	public partial class ConfirmAddEdit : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if(!IsPostBack)
			{
				ViewState["prevPage"] = Request.UrlReferrer.ToString();
				Scene scene = Session["SceneForRepopulate_Add"] != null ? (Scene)Session["SceneForRepopulate_Add"] : (Scene)Session["SceneForRepopulate_Edit"];
				lblSeason.InnerText			= scene.Season;
				lblEpisode.InnerText		= scene.Episode;
				lblLocation.InnerText		= scene.LocationName;
				lblKeywords.InnerText		= scene.Keywords;
				lblTimestamp.InnerText		= scene.TimeStamp;
				//lblDescription.InnerText	= scene.Description;
				txtDescription.Text			= scene.Description;
				lstCharacters.DataSource	= scene.GetCharacters();
				lstCharacters.DataBind();			
			}
		}

		protected void btnCommitScene_Click(object sender, EventArgs e)
		{
			Session["CommitScene"] = "1";
			RedirectToCaller();
		}

		protected void btnCancel_Click(object sender, EventArgs e)
		{
			RedirectToCaller();
		}

		private void RedirectToCaller()
		{
			string s = ViewState["prevPage"].ToString();
			ViewState.Remove("prevPage");
			Response.Redirect(s);
		}
	}
}