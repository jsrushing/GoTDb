using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace GoTDb.App_Data
{
	public static class DbAccess
	{
		private static string ConnString(string resourceId)
		{
			return ConfigurationManager.ConnectionStrings[resourceId].ToString();
		}

		private static string ConnString()
		{
			return ConfigurationManager.ConnectionStrings["Main"].ToString();
		}


		public static int AddCharacter(Character character)
		{
			int iRtrn = -1;
			try
			{
				using (SqlConnection cnn = new SqlConnection(ConnString("Main")))
				{
					using (SqlCommand cmd = new SqlCommand("AddCharacter", cnn))
					{
						cmd.Connection.Open();
						cmd.CommandType = CommandType.StoredProcedure;
						cmd.Parameters.AddWithValue("@firstName", character.FirstName);
						cmd.Parameters.AddWithValue("@lastName", character.LastName);
						cmd.Parameters.AddWithValue("@notes", character.Notes);
						cmd.Parameters.Add("@returnValue", SqlDbType.Int);
						cmd.Parameters["@returnValue"].Direction = ParameterDirection.Output;
						cmd.ExecuteNonQuery();
						iRtrn = Convert.ToInt16(cmd.Parameters["@returnValue"].Value);
					}
				}
			}
			catch
			{
				iRtrn = 0;
			}
			return iRtrn;
		}

		public static int AddLocation(Location location)
		{
			int iRtrn = -1;
			try
			{
				using (SqlConnection cnn = new SqlConnection(ConnString("Main")))
				{
					using (SqlCommand cmd = new SqlCommand("AddLocation", cnn))
					{
						cmd.Connection.Open();
						cmd.CommandType = CommandType.StoredProcedure;
						cmd.Parameters.AddWithValue("@name", location.Name);
						cmd.Parameters.AddWithValue("@notes", location.Notes);
						cmd.Parameters.Add("@returnValue", SqlDbType.Int);
						cmd.Parameters["@returnValue"].Direction = ParameterDirection.Output;
						cmd.ExecuteNonQuery();
						iRtrn = Convert.ToInt16(cmd.Parameters["@returnValue"].Value);
					}
				}
			}
			catch
			{
				iRtrn = 0;
			}
			return iRtrn;
		}

		public static int AddOrEditScene(Scene scene, string sceneIdToEdit)
		{
			int iRtrn = -1;
			string sProcName = sceneIdToEdit != "0" ? "EditScene" : "AddScene";
			try
			{
				using (SqlConnection cnn = new SqlConnection(ConnString("Main")))
				{
					using (SqlCommand cmd = new SqlCommand(sProcName, cnn))
					{
						cmd.Connection.Open();
						cmd.CommandType = CommandType.StoredProcedure;
						cmd.Parameters.AddWithValue("@createdBy", System.Security.Principal.WindowsIdentity.GetCurrent().Name);

						if(sceneIdToEdit != "0")
						{
							cmd.Parameters.AddWithValue("@sceneId", sceneIdToEdit);
						}

						cmd.Parameters.AddWithValue("@seasonNumber",	scene.Season);
						cmd.Parameters.AddWithValue("@episodeNumber",	scene.Episode);
						cmd.Parameters.AddWithValue("@locationId",		scene.LocationId);
						cmd.Parameters.AddWithValue("@timeStamp",		scene.TimeStamp);
						cmd.Parameters.AddWithValue("@description",		scene.Description);
						cmd.Parameters.AddWithValue("@characters",		scene.GetCharacterIds());
						cmd.Parameters.AddWithValue("@keywords",		scene.Keywords);
						cmd.Parameters.AddWithValue("@timeStampAsDecimal", scene.TimeStampAsDecimal);
						cmd.Parameters.Add("@returnValue", SqlDbType.Int);
						cmd.Parameters["@returnValue"].Direction = ParameterDirection.Output;
						cmd.ExecuteNonQuery();
						iRtrn = Convert.ToInt16(cmd.Parameters["@returnValue"].Value);
					}
				}
			}
			catch
			{
				iRtrn = 0;
			}
			return iRtrn;
		}

		public static DataTable GetFullCharacterListForSelectionDropdowns()
		{
			DataTable dt = new DataTable();
			try
			{
				using (SqlConnection cnn = new SqlConnection(ConnString("Main")))
				{
					using (SqlCommand cmd = new SqlCommand("GetCharacters", cnn))
					{
						cmd.Connection.Open();
						cmd.CommandType = CommandType.StoredProcedure;
						using (SqlDataAdapter da = new SqlDataAdapter())
						{
							da.SelectCommand = cmd;
							da.Fill(dt);
						}
					}
				}
			}
			catch
			{ }
			return dt;
		}

		public static int GetEpisodeCount(int seasonNumber)
		{
			int iOut = 0;
			try
			{
				using (SqlConnection cnn = new SqlConnection(ConnString("Main")))
				{
					using (SqlCommand cmd = new SqlCommand("GetEpisodeCount", cnn))
					{
						cmd.Connection.Open();
						cmd.CommandType = CommandType.StoredProcedure;
						cmd.Parameters.AddWithValue("@seasonNumber", seasonNumber);
						cmd.Parameters.Add("@episodeCount", DbType.Int16);
						cmd.Parameters["@episodeCount"].Direction = ParameterDirection.Output;
						cmd.ExecuteNonQuery();
						int.TryParse(cmd.Parameters["@episodeCount"].Value.ToString(), out iOut);
					}
				}
			}
			catch
			{ }
			return iOut;
		}

		public static DataTable GetLocations()
		{
			DataTable dt = new DataTable();
			try
			{
				using (SqlConnection cnn = new SqlConnection(ConnString("Main")))
				{
					using (SqlCommand cmd = new SqlCommand("GetLocations", cnn))
					{
						cmd.Connection.Open();
						cmd.CommandType = CommandType.StoredProcedure;
						using (SqlDataAdapter da = new SqlDataAdapter())
						{
							da.SelectCommand = cmd;
							da.Fill(dt);
						}
					}
				}
			}
			catch
			{ }
			return dt;
		}

		public static Scene GetScene(string sceneId)
		{
			Scene s = new Scene();
			try
			{
				using (SqlConnection cnn = new SqlConnection(ConnString("Main")))
				{
					using (SqlCommand cmd = new SqlCommand("GetScene", cnn))
					{
						using(DataSet ds = new DataSet())
						{
							cmd.Connection.Open();
							cmd.CommandType = CommandType.StoredProcedure;
							cmd.Parameters.AddWithValue("@sceneId", sceneId);
							using(SqlDataAdapter da = new SqlDataAdapter(cmd))
							{
								da.Fill(ds);
							}
							s.BuildFromDataSet(ds);
						}
					}
				}
			}
			catch
			{ }

			return s;
		}

		public static List<Scene> SearchForScenes(Scene scene)
		{
			DataTable dt = new DataTable();
			List<Scene> scenes = new List<Scene>();
			List<Scene> scenes2 = new List<Scene>();
			Scene s = null;
			string sceneTimestamp = string.Empty;
			string lastSceneId = string.Empty;

			try
			{
				using (SqlConnection cnn = new SqlConnection(ConnString("Main")))
				{
					using (SqlCommand cmd = new SqlCommand("SearchScenes", cnn))
					{
						cmd.Connection.Open();
						cmd.CommandType = CommandType.StoredProcedure;
						cmd.Parameters.AddWithValue("@seasonNumber", scene.Season);
						cmd.Parameters.AddWithValue("@episodeNumber", scene.Episode);
						cmd.Parameters.AddWithValue("@locationId", scene.LocationId);
						cmd.Parameters.AddWithValue("@characters", scene.GetCharacterIds());

						DataSet ds = new DataSet();

						using(SqlDataAdapter da = new SqlDataAdapter(cmd))
						{
							da.Fill(ds);
						}

						using(DataTableReader rdrTable = new DataTableReader(ds.Tables[0]))
						{
							while (rdrTable.Read())
							{
								if (rdrTable["SceneId"].ToString() != lastSceneId)
								{
									lastSceneId		= rdrTable["SceneId"].ToString();
									s				= new Scene();
									s.SceneId		= lastSceneId;
									s.Season		= rdrTable["Season"].ToString();
									s.Episode		= rdrTable["Episode"].ToString();
									s.LocationId	= Convert.ToInt32(rdrTable["LocationId"].ToString());
									s.LocationName	= rdrTable["LocationName"].ToString();
									s.Description	= rdrTable["Description"].ToString();
									s.TimeStamp		= rdrTable["Timestamp"].ToString();

									s.Characters = (from DataRow dr in ds.Tables[1].Rows			// from https://stackoverflow.com/questions/208532/how-do-you-convert-a-datatable-into-a-generic-list
													where dr["SceneId"].ToString() == s.SceneId
													select new Character
													{
														Id = dr["CharacterId"].ToString(),
														FirstName = dr["FirstName"].ToString(),
														LastName = dr["LastName"].ToString(),
														Notes = dr["Notes"].ToString()
													}).ToList();
									scenes.Add(s);
								}
							}


							//while(rdrTable.Read())
							//{
							//	s = new Scene();
							//	s.SceneId = rdrTable["SceneId"].ToString();

							//	if(s.SceneId != lastSceneId)
							//	{
							//		lastSceneId		= s.SceneId;
							//		s.SceneId		= rdrTable["SceneId"].ToString();
							//		s.Season		= rdrTable["Season"].ToString();
							//		s.Episode		= rdrTable["Episode"].ToString();
							//		s.LocationId	= Convert.ToInt32(rdrTable["LocationId"].ToString());
							//		s.LocationName	= rdrTable["LocationName"].ToString();
							//		s.Description	= rdrTable["Description"].ToString();
							//		s.TimeStamp		= rdrTable["Timestamp"].ToString();

							//		s.Characters = (from DataRow dr in ds.Tables[1].Rows
							//						where dr["SceneId"].ToString() == s.SceneId
							//						select new Character
							//						{
							//							Id = dr["CharacterId"].ToString(),
							//							FirstName = dr["FirstName"].ToString(),
							//							LastName = dr["LastName"].ToString(),
							//							Notes = dr["Notes"].ToString()
							//						}).ToList(); 
							//		scenes.Add(s);
							//	}
							//}
						}
						


						//using(SqlDataReader rdr = cmd.ExecuteReader())
						//{
						//	while(rdr.Read())		// Results come back ungrouped with multiple rows for each scene when the scene has more than 1 character.  This is by design.
						//	{						// Group the scene's characters here to be added to the Characters dropdown on the scene's row in the results grid.
						//		s = new Scene();
						//		s.TimeStamp = rdr["Timestamp"].ToString();

						//		if(s.TimeStamp != tempTimeStamp)
						//		{
						//			tempTimeStamp	= s.TimeStamp;
						//			s.SceneId		= rdr["SceneId"].ToString();
						//			s.Season		= rdr["Season"].ToString();
						//			s.Episode		= rdr["Episode"].ToString();
						//			s.LocationId	= Convert.ToInt32(rdr["LocationId"].ToString());
						//			s.LocationName	= rdr["LocationName"].ToString();
						//			s.Description	= rdr["Description"].ToString();
						//			s.Characters.Add(new Character());
						//			scenes.Add(s);
						//		}
						//	}
						//}
					}
				}
			}
			catch
			{ }
			return scenes;
		}
	}
}