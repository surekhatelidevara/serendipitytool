﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityManager;
using DataManager;
using System.Data;
using BusinessLogic;
using System.Drawing;

public partial class MainMenu : System.Web.UI.Page
{
    MainMenuDAL mainMenuDAL=new MainMenuDAL();
    MainMenuEntity mainMenuEntity = new MainMenuEntity();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetMenu();
            btnUpdate.Visible = false;
        }
    }
    public void GetMenu()
    {
        try
        {
            DataSet ds = mainMenuDAL.GetMainMenuDetails(0);
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                gvMainMenu.DataSource = ds;
            }
            else
            {
                gvMainMenu.DataSource = null;
            }
            gvMainMenu.DataBind();
        }
        catch
        {

        }
    }
    protected void btnSumbit_Click(object sender, EventArgs e)
    {
        try
        {
            mainMenuEntity.MainMenuID = 0;
            mainMenuEntity.MenuName = txtMenuName.Text;
            mainMenuEntity.Status = ddlStatus.SelectedValue;

            int result = mainMenuDAL.InsertMainMenu(mainMenuEntity, 'i'); 
            if (result > 0)
            {
                lblMessage.Text = "Main Menu created successfully";
                lblMessage.ForeColor = Color.Green;
            }
            else
            {
                lblMessage.Text = "Please try again";
                lblMessage.ForeColor = Color.Red;
            }
            Clear();
            GetMenu();
        }
        catch
        {

        }
    }
    protected void gvMainMenu_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {        
            btnSumbit.Visible = false;
            btnUpdate.Visible = true;
            if (e.CommandName != "Page")
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int RowIndex = row.RowIndex;
                ViewState["MainMenuID"] = ((Label)row.FindControl("lblMainMenuID")).Text.ToString();

                if (e.CommandName == "Edit")
                {
                    txtMenuName.Text = ((Label)row.FindControl("lblMenuName")).Text.ToString();
                    ddlStatus.SelectedItem.Text = ((Label)row.FindControl("lblStatus")).Text.ToString();
                }

                else if (e.CommandName == "Delete")
                {
                    int DeleteMenu = mainMenuDAL.DeleteMainMenu(Convert.ToInt32(ViewState["MainMenuID"].ToString()));
                    if (DeleteMenu > 0)
                    {
                        lblMessage.Text = "Deleted Successfully";
                        GetMenu();
                        Clear();
                    }
                }
            
            }
        }
        catch
        {
            
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
         try
         {

             mainMenuEntity.MainMenuID = Convert.ToInt32(ViewState["MainMenuID"].ToString());
             mainMenuEntity.Status = ddlStatus.SelectedValue;
             mainMenuEntity.MenuName = txtMenuName.Text;

             int result = mainMenuDAL.InsertMainMenu(mainMenuEntity, 'U'); 
             if (result >0)
             {
                 lblMessage.Text = "Main Menu updated successfully";
                 lblMessage.ForeColor = Color.Green;
                 btnUpdate.Visible = false;
                 btnSumbit.Visible = true;
             }
             else
             {
                 lblMessage.Text = "Please try again";
                 lblMessage.ForeColor = Color.Red;
             }
             Clear();
             GetMenu();
         }
         catch
         {
            
         }
    }
    private void Clear()
    {
        txtMenuName.Text = "";
        ddlStatus.SelectedValue = "";
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("MainMenu.aspx", false);
    }
    protected void gvMainMenu_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void gvMainMenu_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
}