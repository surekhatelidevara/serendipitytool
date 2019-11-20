using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Data;
using DataManager;
using EntityManager;

/// <summary>
/// Summary description for ImagesForMainMenuDAL
/// </summary>
/// 
namespace BusinessLogic
{
    public class ImagesForMainMenuDAL
    {
        DataUtilities objUtilities = new DataUtilities();
        public int InsertImagesForMainMenu(ImagesForMainMenu ObjImagesForMainMenu, char Operation)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@MainImageId", ObjImagesForMainMenu.MainImageId);
            ht.Add("@Image", ObjImagesForMainMenu.Image);
            ht.Add("@MainMenuID", ObjImagesForMainMenu.MainMenuID);
            ht.Add("@Operation", Operation);
            return objUtilities.ExecuteNonQuery("InsertImagesForMainMenu", ht);

        }
        public DataSet GetImagesMainMenuDetails(int MainImageId)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@MainImageId", MainImageId);
            return objUtilities.ExecuteDataSet("GetImagesForMainMenu", ht);
        }
    }
}