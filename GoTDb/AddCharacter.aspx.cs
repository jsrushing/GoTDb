using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using GoTDb.App_Data;

namespace GoTDb
{
	public partial class AddCharacter : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if(!IsPostBack)
			{
				string s = Request.UrlReferrer.ToString();
				s = s.Contains('?') ? s.Substring(0, s.IndexOf('?')) : s;
				if (ViewState["prevPage"] == null) { ViewState["prevPage"] = s; }
			}
		}

		protected void btnAddCharacter_Click(object sender, EventArgs e)
		{
			Character c = new Character();
			c.FirstName = txtCharacterFirstName.Text;
			c.LastName = txtCharacterLastName.Text;
			c.Notes = txtCharacterNotes.Text;
			Utilities u = new Utilities();
			int iResult = u.AddCharacter(c);

			if (iResult == 0)
			{
				// display error
			}
			else if(iResult == -1)
			{
				lblCharacterExists.Visible = true;
			}
			else
			{
				RedirectToCaller(iResult.ToString());
			}
		}

		protected void btnCancelAddCharacter_Click(object sender, EventArgs e)
		{
			RedirectToCaller("");
		}

		private void RedirectToCaller(string newCharacterId)
		{
			string s = ViewState["prevPage"].ToString() + (newCharacterId.Length > 0 ? "?newCharacterId=" + newCharacterId : ""); ;
			ViewState.Remove("prevPage");
			Response.Redirect(s);
		}
	}
}