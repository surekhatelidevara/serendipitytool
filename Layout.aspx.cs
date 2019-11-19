using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityManager;
using DataManager;
using BusinessLogic;
using System.Drawing;
using System.Data;
public partial class Layout : System.Web.UI.Page
{
    LayoutEntity objLayoutEntity = new LayoutEntity();
    LayoutDAL objLayoutDAL = new LayoutDAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnUpdate.Visible = false;
            GetLayout();
        }
    }
    protected void btnSumbit_Click(object sender, EventArgs e)
    {
        try
        {
            string strname = "";
            if (fuLogoImage.HasFile)
            {
                strname = fuLogoImage.FileName.ToString();
                fuLogoImage.PostedFile.SaveAs(Server.MapPath("~/images/") + strname);
            } 
            objLayoutEntity.LayoutID = 0;
            objLayoutEntity.LogoImage = strname;
            objLayoutEntity.PhoneNumber = txtPhoneNum.Text;
            objLayoutEntity.EmailID = txtEmail.Text;

            int result = objLayoutDAL.InsertLayoutDetails(objLayoutEntity, 'i');
            if (result > 0)
            {
                lblMessage.Text = "Layout created successfully";
                lblMessage.ForeColor = Color.Green;
            }
            else
            {
                lblMessage.Text = "Please try again";
                lblMessage.ForeColor = Color.Red;
            }
            Clear();
        }
        catch
        {

        }
    }
    private void Clear()
    {
        txtEmail.Text = "";
        txtPhoneNum.Text = "";
        lblPhotoName.Text = "";
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Layout.aspx", false);
    }
    protected void gvLayout_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void gvLayout_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void gvLayout_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName != "Page")
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int RowIndex = row.RowIndex;
                ViewState["LayoutID"] = ((Label)row.FindControl("lblLayoutID")).Text.ToString();

                if (e.CommandName == "Edit")
                {
                    btnUpdate.Visible = true;
                    btnSumbit.Visible = false;
                    rfvLogoImage.Enabled = false;
                    GetLayoutData(Convert.ToInt32(ViewState["LayoutID"].ToString()));
                }

            }
        }
        catch
        {

        }
    }
    private void GetLayoutData(int LayoutID)
    {
        try
        {
            DataSet dsmenu = objLayoutDAL.GetLayoutDetails(LayoutID);
            if (dsmenu.Tables[0].Rows.Count > 0)
            {
                txtPhoneNum.Text = dsmenu.Tables[0].Rows[0]["PhoneNumber"].ToString();
                txtEmail.Text = dsmenu.Tables[0].Rows[0]["EmailID"].ToString();
                lblPhotoName.Text = dsmenu.Tables[0].Rows[0]["LogoImage"].ToString();
                
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string strname = "";
            if (lblPhotoName.Text != "" && fuLogoImage.HasFile == false)
            {
                objLayoutEntity.LogoImage = lblPhotoName.Text;
            }
            else
            {
                if (this.fuLogoImage.FileName != "")
                {
                    strname = fuLogoImage.FileName.ToString();
                    fuLogoImage.PostedFile.SaveAs(Server.MapPath("~/images/") + strname);
                    objLayoutEntity.LogoImage = strname;
                }
                else
                {
                    objLayoutEntity.LogoImage = "";
                }
            }
            objLayoutEntity.LayoutID = Convert.ToInt32(ViewState["LayoutID"].ToString());          
            objLayoutEntity.PhoneNumber = txtPhoneNum.Text;
            objLayoutEntity.EmailID = txtEmail.Text;

            int result = objLayoutDAL.InsertLayoutDetails(objLayoutEntity, 'u');
            if (result > 0)
            {
                lblMessage.Text = "Layout updated successfully";
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
            GetLayout();
        }
        catch
        {

        }
    }
    public void GetLayout()
    {
        try
        {
            DataSet ds = objLayoutDAL.GetLayoutDetails(0);
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                gvLayout.DataSource = ds;
            }
            else
            {
                gvLayout.DataSource = null;
            }
            gvLayout.DataBind();
        }
        catch
        {

        }
    }
}