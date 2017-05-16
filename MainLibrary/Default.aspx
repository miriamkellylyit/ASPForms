<%-- Created by Miriam Kelly --%>

<%-- NavBar for Welcome Page --%>

<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MainLibrary._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

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
                        <li  class="active"><a runat="server" id="mnuAbout" href="~/Default" style="color: blue">Welcome</a></li>
                        <li><a runat="server"  id="mnuReports" href="~/Reports">Reports</a></li>
                        <li><a runat="server"  id="mnuSearch" href="~/Search">Browse</a></li>
                        <li><a runat="server"  id="mnuTransactions" href="~/Updates">Updates</a></li>             
                    </ul>
                    <ul class="nav navbar-nav navbar-right">                       
                        <li><a runat="server" href="~/Account/Login">Log Out</a></li>
                    </ul>
                </div>
            </div>
        </div>
<%-- Welcome Page Paragraph --%>
        <div class="jumbotron">
        <h1 style="color: lawngreen" class="text-center">WELCOME</h1>
        <p style="color: lawngreen" class="text-center">Welcome to the LYIT Main Library.</p>
        <p style="color: lawngreen" class="text-center"> Here you can browse and view various reports on items, publishers and authors.</p>
        </div>

    <div class="row" style="color: darkgreen">
        <p> Select from the links below to take you to the relevant section</p>
        <div class="col-md-4">
            <h2>Reports Section</h2>
            <p>
                Click here to view reports from the database.
            </p>
            <p>
                <a class="btn btn-default" href="/reports.aspx">Browse reports &raquo;</a>
            </p>
        </div>
<%-- Welcome Page Selection links --%>
        <div class="col-md-4">
            <h2>Update records</h2>
            <p>
                Click here to update records from the database.
            </p>
             <p>
                <a class="btn btn-default" href="/Updates.aspx">Update records &raquo;</a>
            </p>
           
        </div>
        <div class="col-md-4">
            <h2>Browse records</h2>
            <p>
                Click here to browse data from the database.
            </p>
            <p>
                <a class="btn btn-default" href="/search.aspx">Browse records &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
