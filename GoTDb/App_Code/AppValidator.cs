using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoTDb
{
	public class AppValidator
	{
		public static bool NewSceneAlreadyExists(Scene scene)
		{
			return false;
		}

		private static bool TimeStampIsValid(Scene scene)
		{
			bool isValid = true;
			try
			{
				double d = scene.TimeStampAsDecimal;
			}
			catch
			{
				isValid = false;
			}
			return isValid;
		}

		public static int ValidateScene(Scene scene, int AddendForDupCharacter)
		{
			int iResult = 1;

			if (!TimeStampIsValid(scene))
			{
				iResult = -2;
			}
			else if (scene.GetCharacterIds() == null)
			{
				iResult = -3;
			}
			else if (scene.IsIdenticalTo(Utilities.GetScene(scene.SceneId)))
			{
				iResult = -4;
			}

			string duplicatedCharacterId = Utilities.GetDuplicatedCharacters(scene);

			if (duplicatedCharacterId.Length > 0)
			{
				iResult = AddendForDupCharacter + Convert.ToInt32(duplicatedCharacterId);
			}

			return iResult;
		}

		public static int AddOrEditScene(Scene scene, string sceneIdToUpdate)
		{
			Utilities u = new Utilities();
			return u.AddOrEditScene(scene, sceneIdToUpdate);
		}
	}
}