<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.master" AutoEventWireup="true" CodeFile="MainMenu.aspx.cs" Inherits="MainMenu" %>

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
                        <div class="col-md-12" style="margin-left:310px;">
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
                                <asp:DropDownList ID="ddlStatus" CssClass="chosen-select-no-single" runat="server">
                                    <asp:ListItem Text="Select" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="InActive" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvstatus" runat="server" ControlToValidate="ddlStatus" Display="dynamic" ErrorMessage="Please Select Status"
                                    ValidationGroup="Menu" ForeColor="red" InitialValue=""></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <!-- Row / End -->
                        <asp:Button runat="server" ID="btnSumbit" OnClick="btnSumbit_Click" CssClass="button" Text="Submit" ValidationGroup="Menu"/>
                        <asp:Button runat="server" ID="btnUpdate" OnClick="btnUpdate_Click" CssClass="button" Text="Update" ValidationGroup="Menu"/>
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
                    <%--<table class="basic-table booking-table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Date</th>
                                <th>Booking ID</th>
                                <th>Destination</th>
                                <th>No of Tickets</th>
                                <th>Payment</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Ricky Ponting</td>
                                <td>2019/01/18</td>
                                <td class="t-id">C253</td>
                                <td>Greece - Zakynthos</td>
                                <td>7</td>
                                <td><span class="paid t-box">Paid</span></td>
                                <td><span class="cancel t-box">Cancelled</span></td>
                                <td>
                                    <a href="#" class="button gray"><i class="sl sl-icon-pencil"></i></a>
                                    <a href="#" class="button gray"><i class="sl sl-icon-close"></i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Micheal</td>
                                <td>2019/01/18</td>
                                <td class="t-id">C023</td>
                                <td>Bulgary - Sunny Beach</td>
                                <td>2</td>
                                <td><span class="unpaid t-box">Unpaid</span></td>
                                <td><span class="approved t-box">Approved</span></td>
                                <td>
                                    <a href="#" class="button gray"><i class="sl sl-icon-pencil"></i></a>
                                    <a href="#" class="button gray"><i class="sl sl-icon-close"></i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Jim Morrison</td>
                                <td>2019/01/18</td>
                                <td class="t-id">E453</td>
                                <td>Washington</td>
                                <td>11</td>
                                <td><span class="paid t-box">Paid</span></td>
                                <td><span class="pending t-box">Pending</span></td>
                                <td>
                                    <a href="#" class="button gray"><i class="sl sl-icon-pencil"></i></a>
                                    <a href="#" class="button gray"><i class="sl sl-icon-close"></i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Michelle</td>
                                <td>2019/01/18</td>
                                <td class="t-id">C253</td>
                                <td>Tokyo, Japan</td>
                                <td>3</td>
                                <td><span class="paid t-box">Paid</span></td>
                                <td><span class="pending t-box">Pending</span></td>
                                <td>
                                    <a href="#" class="button gray"><i class="sl sl-icon-pencil"></i></a>
                                    <a href="#" class="button gray"><i class="sl sl-icon-close"></i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Ricky Ponting</td>
                                <td>2019/01/18</td>
                                <td class="t-id">C253</td>
                                <td>Brussels</td>
                                <td>7</td>
                                <td><span class="unpaid t-box">Unpaid</span></td>
                                <td><span class="pending t-box">Pending</span></td>
                                <td>
                                    <a href="#" class="button gray"><i class="sl sl-icon-pencil"></i></a>
                                    <a href="#" class="button gray"><i class="sl sl-icon-close"></i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Ricky Ponting</td>
                                <td>2019/01/18</td>
                                <td class="t-id">C253</td>
                                <td>Greece - Zakynthos</td>
                                <td>7</td>
                                <td><span class="paid t-box">Paid</span></td>
                                <td><span class="cancel t-box">Cancelled</span></td>
                                <td>
                                    <a href="#" class="button gray"><i class="sl sl-icon-pencil"></i></a>
                                    <a href="#" class="button gray"><i class="sl sl-icon-close"></i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Micheal</td>
                                <td>2019/01/18</td>
                                <td class="t-id">C023</td>
                                <td>Bulgary - Sunny Beach</td>
                                <td>2</td>
                                <td><span class="unpaid t-box">Unpaid</span></td>
                                <td><span class="approved t-box">Approved</span></td>
                                <td>
                                    <a href="#" class="button gray"><i class="sl sl-icon-pencil"></i></a>
                                    <a href="#" class="button gray"><i class="sl sl-icon-close"></i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Jim Morrison</td>
                                <td>2019/01/18</td>
                                <td class="t-id">E453</td>
                                <td>Washington</td>
                                <td>11</td>
                                <td><span class="paid t-box">Paid</span></td>
                                <td><span class="pending t-box">Pending</span></td>
                                <td>
                                    <a href="#" class="button gray"><i class="sl sl-icon-pencil"></i></a>
                                    <a href="#" class="button gray"><i class="sl sl-icon-close"></i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Michelle</td>
                                <td>2019/01/18</td>
                                <td class="t-id">C253</td>
                                <td>Tokyo, Japan</td>
                                <td>3</td>
                                <td><span class="paid t-box">Paid</span></td>
                                <td><span class="pending t-box">Pending</span></td>
                                <td>
                                    <a href="#" class="button gray"><i class="sl sl-icon-pencil"></i></a>
                                    <a href="#" class="button gray"><i class="sl sl-icon-close"></i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Ricky Ponting</td>
                                <td>2019/01/18</td>
                                <td class="t-id">C253</td>
                                <td>Brussels</td>
                                <td>7</td>
                                <td><span class="unpaid t-box">Unpaid</span></td>
                                <td><span class="pending t-box">Pending</span></td>
                                <td>
                                    <a href="#" class="button gray"><i class="sl sl-icon-pencil"></i></a>
                                    <a href="#" class="button gray"><i class="sl sl-icon-close"></i></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>--%>
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

