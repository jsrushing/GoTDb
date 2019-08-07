using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoTDb
{
	public partial class AddLocation : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				string s = Request.UrlReferrer.ToString();
				s = s.Contains('?') ? s.Substring(0, s.IndexOf('?')) : s;
				if (ViewState["prevPage"] == null) { ViewState["prevPage"] = s; }
			}
		}

		protected void btnAddLocation_Click(object sender, EventArgs e)
		{
			Location l = new Location();
			l.Name = txtLocationName.Text;
			l.Notes = txtLocationNotes.Text;
			Utilities u = new Utilities();
			int iResult = u.AddLocation(l);
			if (iResult == 0)
			{
				// display error
			}
			else if (iResult == -1)
			{
				lblLocationExists.Visible = true;
			}
			else
			{
				RedirectToCaller(iResult.ToString());
			}
		}

		protected void btnCancelAddLocation_Click(object sender, EventArgs e)
		{
			RedirectToCaller("");
		}

		private void RedirectToCaller(string newLocationId)
		{
			string s = ViewState["prevPage"].ToString() + (newLocationId.Length > 0 ? "?newLocationId=" + newLocationId : "");
			ViewState.Remove("prevPage");
			Response.Redirect(s);
		}
	}
}