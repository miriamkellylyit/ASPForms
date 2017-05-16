<%-- Updates Screen Created by Miriam Kelly --%>

<%-- Updates Screen NavBar --%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Updates.aspx.cs" Inherits="MainLibrary.Updates" %>
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
                    <ul class ="nav navbar-nav">
                        <li><a runat="server" id="mnuAbout" href="~/Default">Welcome</a></li>
                        <li><a runat="server"  id="mnuReports" href="~/Reports">Reports</a></li>
                        <li><a runat="server"  id="mnuSearch" href="~/Search">Browse</a></li>
                        <li class="active"><a runat="server"  id="mnuTransactions" href="~/Transactions" style="color: blue">Updates</a></li>             
                    </ul>
                    <ul class="nav navbar-nav navbar-right">                       
                        <li><a runat="server" href="~/Account/Login">Log Out</a></li>
                    </ul>
                </div>
            </div>
        </div>

    <h1 class="col-md-12 jumbotron text-center" style="color: lawngreen">UPDATES</h1>
    <p style="color: darkgreen">
        Click button below to select the section to update:
    </p>
<%-- Updates Screen links --%>
    <p>
        <a class="btn btn-default" href="http://localhost:4797//Transactions">Item Detail</a>
        <a class="btn btn-default" href="http://localhost:4797/User">Users</a>
    </p>
</asp:Content>
