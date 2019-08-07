using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoTDb
{
	public class Character
	{
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public string Notes { get; set; }
		public string Id { get; set; }
		public string FullName { get { return FirstName + " " + LastName; } }

		public Character() { }

		public Character(string Id)
		{
			this.Id = Id;
		}
	}
}