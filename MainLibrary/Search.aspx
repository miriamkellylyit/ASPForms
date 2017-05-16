<%-- Search Screen created by Miriam Kelly --%>

<%-- Search Screen Navbar --%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="MainLibrary.Search" %>
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
                        <li class="active"><a runat="server"  id="mnuSearch" href="~/Search" style="color: blue">Browse</a></li>
                        <li><a runat="server"  id="mnuTransactions" href="~/Updates" >Updates</a></li>             
                    </ul>
                    <ul class="nav navbar-nav navbar-right">                       
                        <li><a runat="server" href="~/Account/Login">Log Out</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <h1 class="col-md-12 jumbotron text-center" style="color: lawngreen">BROWSE RECORDS</h1>
        <p style="color: darkgreen">
           Please select records from the drop down box below:
        </p>
<%-- Enter Database to search --%>
    <div class="form-horizontal">
        <div class="form-group">
            <div class="col-md-10">
                <asp:DropDownList ID="cboDatabaseChoice" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="cboDatabaseChoice_SelectedIndexChanged" runat="server">
                    <asp:ListItem>USERS</asp:ListItem>
                    <asp:ListItem>ITEMDETAIL</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
<%-- Enter text to search for --%>
        <div class="form-group">
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbxSearchText" CssClass="form-control" placeholder ="Enter Search text here"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxSearchText"
                CssClass="text-danger" ErrorMessage="Text is required in the search box." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-10">
                <asp:Button runat="server" OnClick="Search_Click" Text="Browse" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
<%-- ITEMDETAIL Table --%>
    <p>
        <div class="lead">
            <asp:ListView ID="lstAllITEMDETAIL" runat="server" Visible="false">
                <LayoutTemplate>
                    <table id="Table1" runat="server">
                        <tr id="Tr1" runat="server">
                            <td id="Td1" runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1">
                                    <tr id="Tr2" runat="server">
                                        <th id="Th1" runat="server" border="1"></th>
                                        <th id="Th2" runat="server">ItemNumber</th>
                                        <th id="Th3" runat="server">Title</th>
                                        <th id="Th4" runat="server">CopiesOwned</th>
                                        <th id="Th5" runat="server">CopiesOnShelf</th>
                                        <th id="Th6" runat="server">CopiesBorrowed</th>
                                        <th id="Th7" runat="server">ItemID</th>
                                        <th id="Th8" runat="server">ReservationID</th>
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
                           
                        </td>
                        <td>
                            <asp:Label ID="lblItemNumber" runat="server" Text='<%# Eval("ItemNumber") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Title" runat="server" Text='<%# Eval("Title") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CopiesOwned" runat="server" Text='<%# Eval("CopiesOwned") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("CopiesOnShelf") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("CopiesBorrowed") %>' />
                        </td>
                                                <td>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("SubDivisionID") %>' />
                        </td>
                                                <td>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("ItemID") %>' />
                        </td>
                                                <td>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("ReservationID") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
               
               
            </asp:ListView>
        </div>
    </p>
<%-- USER Table --%>
        <p>
        <div class="lead">
            <asp:ListView ID="lstAllUSER" runat="server" Visible="false">
                <LayoutTemplate>
                    <table id="Table1" runat="server">
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
                           
                        </td>
                        <td>
                            <asp:Label ID="lblUsername" runat="server" Text='<%# Eval("Username") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("Password") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lblFirstname" runat="server" Text='<%# Eval("Firstname") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lblSurname" runat="server" Text='<%# Eval("Surname") %>' />
                        </td>                   
                    </tr>
                </ItemTemplate>
                           
            </asp:ListView>
        </div>
    </p>


</asp:Content>
