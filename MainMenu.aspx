﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.master" AutoEventWireup="true" CodeFile="MainMenu.aspx.cs" Inherits="MainMenu" %>

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
                        <h3><i class="sl sl-icon-map"></i>Main Menu</h3>
                    </div>
                    <div class="row with-forms">
                        <div class="col-md-12" style="margin-left: 310px;">
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="submit-section">

                        <!-- Row -->
                        <div class="row with-forms">

                            <!-- Name -->
                            <div class="col-md-6">
                                <label>Menu Name</label>
                                <asp:TextBox ID="txtMenuName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMenuName" runat="server" ControlToValidate="txtMenuName" ForeColor="Red"
                                    ErrorMessage="Please Enter Menu Name" ValidationGroup="Menu" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-6">
                                <label>Status</label>
                                <asp:DropDownList ID="ddlStatus" runat="server" AppendDataBoundItems="true">
                                    <asp:ListItem Text="-Select-" Value="-1"></asp:ListItem>
                                    <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="InActive" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvstatus" runat="server" ControlToValidate="ddlStatus" Display="dynamic" ErrorMessage="Please Select Status"
                                    ValidationGroup="Menu" ForeColor="red" InitialValue="-1"></asp:RequiredFieldValidator>
                            </div>

                        </div>
                        <div class="row with-forms">
                            <div class="col-md-6">
                                <label>URL</label>
                                <asp:TextBox ID="txtURL" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvURL" runat="server" ControlToValidate="txtURL" ForeColor="Red"
                                    ErrorMessage="Please Enter URL" ValidationGroup="Menu" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-6">
                                <label>Logo Image</label>
                                <asp:FileUpload runat="server" ID="fuLogoImage" />
                                <a id="anchorId" href="#" runat="server" target="_blank">
                                    <asp:Label ID="lblPhotoName" runat="server" /></a>
                                <asp:RequiredFieldValidator ID="rfvLogoImage" runat="server" ControlToValidate="fuLogoImage" ForeColor="Red"
                                    ErrorMessage="Please Upload Image" ValidationGroup="Menu" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ControlToValidate="fuLogoImage" runat="server" ID="revfuLogoImage" ForeColor="Red"
                                    Display="Dynamic" CssClass="span6 m-wrap" ErrorMessage="Select only jpg,png Files." ValidationGroup="Menu"
                                    ValidationExpression="^.*\.(jpg|png|JPG|PNG)$" />
                            </div>
                        </div>
                        <div class="row with-forms">
                            <div class="col-md-6">
                                <label>Phone Number</label>
                                <asp:TextBox ID="txtPhoneNum" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPhoneNum" runat="server" ControlToValidate="txtPhoneNum" ForeColor="Red"
                                    ErrorMessage="Please Enter Phone Number" ValidationGroup="Menu" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-6">
                                <label>Email</label>
                                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ForeColor="Red"
                                    ErrorMessage="Please Enter Email ID" ValidationGroup="Menu" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Please check Email Format"
                                    ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Menu">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <!-- Row / End -->
                        <asp:Button runat="server" ID="btnSumbit" OnClick="btnSumbit_Click" CssClass="button" Text="Submit" ValidationGroup="Menu" />
                        <asp:Button runat="server" ID="btnUpdate" OnClick="btnUpdate_Click" CssClass="button" Text="Update" ValidationGroup="Menu" />
                        <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" CssClass="button" Text="Cancel" />
                    </div>
                </div>
                <!-- Section / End -->



            </div>
        </div>

        <div class="col-lg-12 col-md-12 col-xs-12">
            <div class="dashboard-list-box">
                <h4 class="gray">Main Menu</h4>
                <div class="table-box">
                    <asp:GridView runat="server" ID="gvMainMenu" CssClass="basic-table booking-table" AutoGenerateColumns="False" DataKeyNames="MainMenuID"
                        OnRowEditing="gvMainMenu_RowEditing" OnRowDeleting="gvMainMenu_RowDeleting" OnRowCommand="gvMainMenu_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="S No.">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Menu Id" Visible="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblMainMenuID" Text='<%#Eval("MainMenuID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Menu Name">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblMenuName" Text='<%#Eval("MenuName") %>'></asp:Label>
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
                                    <asp:LinkButton ID="lnkEditButton" runat="server" CssClass="sl sl-icon-pencil" CommandName="Edit" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDeleteButton" runat="server" CssClass="sl sl-icon-close" CommandName="Delete" />
                                </ItemTemplate>

                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                </div>
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

