<%-- Users Screen Created by Miriam Kelly --%>

<%-- Users Screen NavBar --%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="MainLibrary.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div class="navbar navbar-default navbar-fixed-top" id="mainMenu" style="background-color: darkgreen">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navHeaderCollapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="#" style="color: lawngreen"> LYIT Main Library</a>
                    <asp:Label CssClass="navbar-brand" ID="lblUsername" runat="server"></asp:Label>                 
                </div>

                <div class="collapse navbar-collapse navHeaderCollapse">
                    <ul class ="nav navbar-nav" >
                        <li><a runat="server" id="mnuAbout" href="~/Default" >Welcome</a></li>
                        <li><a runat="server"  id="mnuReports" href="~/Reports" >Reports</a></li>
                        <li><a runat="server"  id="mnuSearch" href="~/Search" >Search</a></li>
                        <li class="active"><a runat="server"  id="mnuTransactions" href="~/Updates" style="color: blue">|Updates</a></li>             
                    </ul>
                    <ul class="nav navbar-nav navbar-right">                       
                        <li><a runat="server" href="~/Account/Login">Log Out</a></li>
                    </ul>
                </div>
            </div>
        </div>
<%-- USERS table data --%>
    <h2>&nbsp;</h2>
    <div class="jumbotron">
        <h2 style="color: lawngreen" class="text-center">User details</h2>
    </div>
    <br />
    <br />
    <div class="lead1">
        <asp:ListView ID="lstAllUsers" runat="server"
            OnItemEditing="lstAllUsers_ItemEditing"
            OnItemUpdating="lstAllUsers_ItemUpdating"
            OnItemCanceling="lstAllUsers_ItemCanceling"
            OnItemDeleting="lstAllUsers_ItemDeleting"
            InsertItemPosition="LastItem"
            OnItemInserting="lstAllUsers_ItemInserting">
            <LayoutTemplate>
                <table id="Table2" runat="server">
                    <tr id="Tr1" runat="server">
                        <td id="Td1" runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1">
                                <tr id="Tr2" runat="server">
                                    <th id="Th1" runat="server" border="1"></th>
                                    <th id="Th2" runat="server">Username</th>
                                    <th id="Th3" runat="server">Password</th>
                                    <th id="Th4" runat="server">Firstname</th>
                                    <th id="Th5" runat="server">Surname</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="Tr3" runat="server">
                        <td id="Td2" runat="server" style=""></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete"
                            Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
                    <td>
                        <asp:TextBox ID="tbxPassword" runat="server" Text='<%# Bind("Password") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxFirstname" runat="server" Text='<%# Bind("Firstname") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxSurname" runat="server" Text='<%# Bind("Surname") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <EditItemTemplate>
                <tr>
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update"
                            Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel"
                            Text="Cancel" />

                    <td>
                        <asp:TextBox ID="tbxUserName" runat="server" Text='<%# Bind("UserName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxPassword" runat="server" Text='<%# Bind("Password") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxFirstname" runat="server" Text='<%# Bind("Firstname") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxSurname" runat="server" Text='<%# Bind("Surname") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert"
                            Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel"
                            Text="Clear" />
                    </td>
                   <td>
                        <asp:TextBox ID="tbxUserName" runat="server" Text='<%# Bind("UserName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxPassword" runat="server" Text='<%# Bind("Password") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxFirstname" runat="server" Text='<%# Bind("Firstname") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxSurname" runat="server" Text='<%# Bind("Surname") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
