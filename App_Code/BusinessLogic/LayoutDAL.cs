using DataManager;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EntityManager;
using System.Data;
/// <summary>
/// Summary description for LayoutDAL
/// </summary>
namespace BusinessLogic
{
    public class LayoutDAL
    {
        DataUtilities objUtilities = new DataUtilities();
        public int InsertLayoutDetails(LayoutEntity ObjLayoutEntity, char Operation)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@LayoutID", ObjLayoutEntity.LayoutID);
            ht.Add("@LogoImage", ObjLayoutEntity.LogoImage);
            ht.Add("@PhoneNumber", ObjLayoutEntity.PhoneNumber);
            ht.Add("@EmailID", ObjLayoutEntity.EmailID);
            ht.Add("@Operation", Operation);
            return objUtilities.ExecuteNonQuery("InsertLayoutDetails", ht);

        }
        public DataSet GetLayoutDetails(int LayoutID)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@LayoutID", LayoutID);
            return objUtilities.ExecuteDataSet("GetLayoutDetails", ht);
        }
    }
}