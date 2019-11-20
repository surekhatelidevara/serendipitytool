using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Data;
using DataManager;
using EntityManager;

/// <summary>
/// Summary description for ImagesForSubMenuDAL
/// </summary>
/// 
namespace BusinessLogic
{
    public class ImagesForSubMenuDAL
    {
        DataUtilities objUtilities = new DataUtilities();
        public int InsertImagesForSubMenu(ImagesForSubMenu ObjImagesForSubMenu, char Operation)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@SubMenuImageId", ObjImagesForSubMenu.SubMenuImageId);
            ht.Add("@Image", ObjImagesForSubMenu.Image);
            ht.Add("@MainMenuID", ObjImagesForSubMenu.MainMenuID);
            ht.Add("@SubMenuID", ObjImagesForSubMenu.SubMenuID);
            ht.Add("@Operation", Operation);
            return objUtilities.ExecuteNonQuery("InsertImagesForSubMenu", ht);

        }
        public DataSet GetImagesSubMenuDetails(int SubMenuImageId)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@SubMenuImageId", SubMenuImageId);
            return objUtilities.ExecuteDataSet("GetImagesForSubMenu", ht);
        }
    }
}