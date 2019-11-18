using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Data;
using DataManager;

/// <summary>
/// Summary description for MainMenuDAL
/// </summary>
namespace BusinessLogic
{
    public class MainMenuDAL
    {
        DataUtilities objUtilities = new DataUtilities();
        public int InsertMainMenu(MainMenuEntity ObjMainMenuEntity, char Operation)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@MainMenuID", ObjMainMenuEntity.MainMenuID);
            ht.Add("@MenuName", ObjMainMenuEntity.MenuName);
            ht.Add("@Status", ObjMainMenuEntity.Status);
            ht.Add("@Operation", Operation);
            return objUtilities.ExecuteNonQuery("InsertMainMenuDetails", ht);

        }
        public DataSet GetMainMenuDetails(int MainMenuID)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@MainMenuID", MainMenuID);
            return objUtilities.ExecuteDataSet("GetMainMenuDetails", ht);
        }
        public int DeleteMainMenu(int MainMenuID)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@MainMenuID", MainMenuID);
            return objUtilities.ExecuteNonQuery("DeleteMainMenu", ht);
        }
    }
}