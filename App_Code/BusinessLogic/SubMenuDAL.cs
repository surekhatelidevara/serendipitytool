using DataManager;
using EntityManager;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SubMenuDAL
/// </summary>
public class SubMenuDAL
{
    DataUtilities objUtilities = new DataUtilities();
    public int InsertMainMenu(SubMenuEntity ObjSubMenuEntity, char Operation)
    {
        Hashtable ht = new Hashtable();
        ht.Add("@MainMenuID", ObjSubMenuEntity.MainMenuID);
        ht.Add("@SubMenuName", ObjSubMenuEntity.SubMenuName);
        ht.Add("@Status", ObjSubMenuEntity.Status);
        ht.Add("@Operation", Operation);
        return objUtilities.ExecuteNonQuery("InsertSubMenuDetails", ht);

    }
}