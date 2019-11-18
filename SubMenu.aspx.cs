using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityManager;
using System.Drawing;
using BusinessLogic;
using System.Data;

public partial class SubMenu : System.Web.UI.Page
{
    SubMenuDAL objSubMenuDAL = new SubMenuDAL();
    SubMenuEntity objSubMenuEntity = new SubMenuEntity();
    MainMenuDAL objMainMenuDAL = new MainMenuDAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            GetMainMenuList();
            GetGridData();
            btnUpdate.Visible = false;
        }
    }
    private void GetGridData()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = objSubMenuDAL.GetSubMenuDetails(0);
            if(ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                gvSubMenuList.DataSource = ds;
                gvSubMenuList.DataBind();
            }
            else
            {
                gvSubMenuList.DataSource = null;
                gvSubMenuList.DataBind();
            }
        }
        catch(Exception ex)
        {

        }
    }
    private void GetMainMenuList()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = objMainMenuDAL.GetMainMenuDetails(0);
            if(ds.Tables.Count >0 && ds.Tables[0].Rows.Count > 0)
            {
                dropMainMenuList.DataSource = ds;
                dropMainMenuList.DataTextField = "MenuName";
                dropMainMenuList.DataValueField = "MainMenuID";
                dropMainMenuList.DataBind();               
            }
            dropMainMenuList.Items.Insert(0, new ListItem("--Select Main Menu --", "-1"));
        }
        catch(Exception ex)
        {

        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            objSubMenuEntity.MainMenuID = Convert.ToInt32(dropMainMenuList.SelectedValue);
            objSubMenuEntity.SubMenuName = txtName.Text;
            objSubMenuEntity.URL = txtURL.Text;
            objSubMenuEntity.Status = Convert.ToInt32(dropStatus.SelectedValue);
            int Result = objSubMenuDAL.InsertMainMenu(objSubMenuEntity,'I');
            if(Result > 0)
            {
                lblMessage.Text = "Submenu created successfully";
                lblMessage.ForeColor = Color.Green;
            }
            else
            {
                lblMessage.Text = "Please try again";
                lblMessage.ForeColor = Color.Red;
            }
            Clear();
            GetGridData();
        }
        catch(Exception ex)
        {

        }
    }
    private void Clear()
    {
        dropMainMenuList.SelectedValue = "-1";
        txtName.Text = "";
        dropStatus.SelectedValue = "-1";
        txtURL.Text = "";
    }
    protected void gvSubMenuList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName != "Page")
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int SubmenuID = Convert.ToInt32(((Label)row.FindControl("lblSubMenuID")).Text.ToString());
                if (e.CommandName == "EditMenu")
                {
                    btnUpdate.Visible = true;
                    btnSubmit.Visible = false;
                    GetSubMenuData(SubmenuID);
                }
                if (e.CommandName == "DeleteMenu")
                {
                    int DeleteMenu = objSubMenuDAL.DeleteSubMenu(SubmenuID);
                    if(DeleteMenu > 0)
                    {
                        lblMessage.Text = "Deleted Successfully";
                        GetGridData();
                    }
                }

            }
        }
        catch(Exception ex)
        {

        }
    }
    private void GetSubMenuData(int SubmenuID)
    {
        try
        {
            DataSet dsmenu = objSubMenuDAL.GetSubMenuDetails(SubmenuID);
            if(dsmenu.Tables[0].Rows.Count > 0)
            {
                hfSubMenuId.Value = dsmenu.Tables[0].Rows[0]["SubMenuID"].ToString();
                dropMainMenuList.SelectedValue = dsmenu.Tables[0].Rows[0]["MainMenuID"].ToString();
                txtName.Text = dsmenu.Tables[0].Rows[0]["SubMenuName"].ToString();
                dropStatus.SelectedValue = dsmenu.Tables[0].Rows[0]["Status"].ToString();
                txtURL.Text = dsmenu.Tables[0].Rows[0]["URL"].ToString();
            }
        }
        catch(Exception ex)
        {

        }
    }
    protected void gvSubMenuList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("SubMenu.aspx", false);
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            objSubMenuEntity.SubMenuID = Convert.ToInt32(hfSubMenuId.Value);
            objSubMenuEntity.MainMenuID = Convert.ToInt32(dropMainMenuList.SelectedValue);
            objSubMenuEntity.SubMenuName = txtName.Text;
            objSubMenuEntity.Status = Convert.ToInt32(dropStatus.SelectedValue);
            objSubMenuEntity.URL = txtURL.Text;
            int Result = objSubMenuDAL.InsertMainMenu(objSubMenuEntity, 'U');
            if (Result > 0)
            {
                lblMessage.Text = "Submenu updated successfully";
                lblMessage.ForeColor = Color.Green;
                btnUpdate.Visible = false;
                btnSubmit.Visible = true;
            }
            else
            {
                lblMessage.Text = "Please try again";
                lblMessage.ForeColor = Color.Red;
            }
            Clear();
            GetGridData();
        }
        catch(Exception ex)
        {

        }
    }
   
}