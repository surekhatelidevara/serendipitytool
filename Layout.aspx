<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.master" AutoEventWireup="true" CodeFile="Layout.aspx.cs" Inherits="Layout" %>

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
                        <h3><i class="sl sl-icon-map"></i>Layout</h3>
                    </div>
                    <div class="row with-forms">
                        <div class="col-md-12" style="margin-left: 310px;">
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="submit-section">

                        <!-- Row -->

                        <div class="row with-forms">
                            <div class="col-md-6">
                                <label>Logo Image</label>
                                <asp:FileUpload runat="server" ID="fuLogoImage"  />
                                <a id="anchorId" href="#" runat="server" target="_blank">
                                    <asp:Label ID="lblPhotoName" runat="server" /></a>
                                <asp:RequiredFieldValidator ID="rfvLogoImage" runat="server" ControlToValidate="fuLogoImage" ForeColor="Red"
                                    ErrorMessage="Please Upload Image" ValidationGroup="Layout" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ControlToValidate="fuLogoImage" runat="server" ID="revfuLogoImage" ForeColor="Red"
                                    Display="Dynamic" CssClass="span6 m-wrap" ErrorMessage="Select only jpg,png Files." ValidationGroup="Layout"
                                    ValidationExpression="^.*\.(jpg|png|JPG|PNG)$" />
                            </div>
                            <div class="col-md-6">
                                <label>Phone Number</label>
                                <asp:TextBox ID="txtPhoneNum" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPhoneNum" runat="server" ControlToValidate="txtPhoneNum" ForeColor="Red"
                                    ErrorMessage="Please Enter Phone Number" ValidationGroup="Layout" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row with-forms">
                            <div class="col-md-6">
                                <label>Email</label>
                                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ForeColor="Red"
                                    ErrorMessage="Please Enter Email ID" ValidationGroup="Layout" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Please check Email Format"
                                    ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Layout">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <!-- Row / End -->
                        <asp:Button runat="server" ID="btnSumbit" OnClick="btnSumbit_Click" CssClass="button" Text="Submit" ValidationGroup="Layout" />
                        <asp:Button runat="server" ID="btnUpdate" OnClick="btnUpdate_Click" CssClass="button" Text="Update" ValidationGroup="Layout" />
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
                    <asp:GridView runat="server" ID="gvLayout" CssClass="basic-table booking-table" AutoGenerateColumns="False" DataKeyNames="LayoutID"
                        OnRowEditing="gvLayout_RowEditing" OnRowDeleting="gvLayout_RowDeleting" OnRowCommand="gvLayout_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="S No.">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Layout Id" Visible="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblLayoutID" Text='<%#Eval("LayoutID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Logo">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblLogo" Text='<%#Eval("LogoImage") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Phone Number">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblPhoneNum" Text='<%#Eval("PhoneNumber") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblEmail" Text='<%#Eval("EmailID") %>'></asp:Label>
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

