<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.master" AutoEventWireup="true" CodeFile="SubMenu.aspx.cs" Inherits="SubMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <!-- Listings -->
        <div class="col-lg-12 col-sm-12">
            <div id="add-listing">

                <!-- Section -->
                <div class="add-listing-section">

                    <!-- Headline -->
                    <div class="add-listing-headline">
                        <h3><i class="sl sl-icon-doc"></i>Add Sub menu</h3>
                    </div>
                    <div class="row with-forms">
                        <div class="col-md-12" style="margin-left: 310px;">
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                        </div>
                    </div>
                    <!-- Title -->
                    <div class="row with-forms">
                        <div class="col-md-6">
                            <label>Main Menu List</label>
                            <asp:DropDownList ID="dropMainMenuList" runat="server" AppendDataBoundItems="true" placeholder="Main Menu"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvdropMainMenuList" runat="server" ErrorMessage="Please Select main Menu" Display="Dynamic" ControlToValidate="dropMainMenuList" ForeColor="Red" ValidationGroup="Submenu" InitialValue="-1"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-6">
                            <label>Sub Menu Name</label>
                            <asp:TextBox ID="txtName" runat="server" placeholder="Menu Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvtxtName" runat="server" ErrorMessage="Please Enter Name" ControlToValidate="txtName" ForeColor="Red" ValidationGroup="Submenu" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row with-forms">
                        <div class="col-md-6">
                            <label>Status</label>
                            <asp:DropDownList ID="dropStatus" runat="server" AppendDataBoundItems="true" placeholder="Status">
                                <asp:ListItem Text="-Select-" Value="-1"></asp:ListItem>
                                <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                <asp:ListItem Text="InActive" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvdropStatus" runat="server" ErrorMessage="Please Select Status" ControlToValidate="dropStatus"
                                ForeColor="Red" ValidationGroup="Submenu" Display="Dynamic" InitialValue="-1"></asp:RequiredFieldValidator>

                        </div>
                        <div class="col-md-6">
                            <label>URL</label>
                            <asp:TextBox ID="txtURL" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvURL" runat="server" ControlToValidate="txtURL" ForeColor="Red"
                                ErrorMessage="Please Enter URL" ValidationGroup="Submenu" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row with-forms">
                        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" CssClass="button" ValidationGroup="Submenu" Text="Submit" />
                        <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" CssClass="button" ValidationGroup="Submenu" Text="Update" />
                        <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" CssClass="button" Text="Cancel" />

                    </div>
                    <!-- Row -->
                    <div class="row with-forms">
                        <div class="col-lg-12 col-md-12">
                            <div class="dashboard-list-box">
                                <div class="add-listing-headline">
                                    <h3><i class="sl sl-icon-doc"></i>Sub menu List</h3>
                                </div>
                                <div class="table-box">
                                    <table class="basic-table booking-table">
                                        <asp:HiddenField ID="hfSubMenuId" runat="server" Value="0" />
                                        <asp:GridView ID="gvSubMenuList" runat="server" Width="100%"
                                            AutoGenerateColumns="False" CssClass="basic-table booking-table"
                                            EmptyDataText="There are no records to display." OnRowCommand="gvSubMenuList_RowCommand"
                                            BorderStyle="Solid" BorderWidth="0px" AllowPaging="true" PageSize="100"
                                            ForeColor="Black" OnPageIndexChanging="gvSubMenuList_PageIndexChanging">

                                            <Columns>
                                                <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <%#Container.DataItemIndex+1%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="SubMenuID" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblSubMenuID" Text='<%#Eval("SubMenuID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Main Menu">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblMainMenuID" Text='<%#Eval("MainName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblName" Text='<%#Eval("SubMenuName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblStatus" Text='<%#Eval("Status").ToString()=="1"?"Active" :"Inactive" %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="URL">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblURL" Text='<%#Eval("URL") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Edit">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkEditButton" runat="server" CssClass="sl sl-icon-pencil" CommandName="EditMenu" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delete">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkDeleteButton" runat="server" CssClass="sl sl-icon-close" CommandName="DeleteMenu" />
                                                    </ItemTemplate>

                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Section / End -->

                    <!-- Section -->





                </div>
                <div class="pagination-container">
                    <nav class="pagination">
                        <ul>
                            <li><a href="#" class="current-page">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#"><i class="sl sl-icon-arrow-right"></i></a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
</asp:Content>

