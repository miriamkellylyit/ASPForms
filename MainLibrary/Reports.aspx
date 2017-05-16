<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="MainLibrary.Reports" %>
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
                        <li  class="active"><a runat="server"  id="mnuReports" href="~/Reports" style="color: blue">Reports</a></li>
                        <li><a runat="server"  id="mnuSearch" href="~/Search">Browse</a></li>
                        <li><a runat="server"  id="mnuTransactions" href="~/Updates">Updates</a></li>             
                    </ul>
                    <ul class="nav navbar-nav navbar-right">                       
                        <li><a runat="server" href="~/Account/Login">Log Out</a></li>
                    </ul>
                </div>
            </div>
        </div>

    <h1 class="col-md-12 jumbotron text-center" style="color: lawngreen">REPORT DETAILS</h1>
    <p style="color: darkgreen">
        Click button below to select the various Reports:
    </p>
    <p>
        <a class="btn btn-default" href="http://172.28.128.101/ReportServer/Pages/ReportViewer.aspx?%2fPublisher+Report%2fOverdue+Item&rs:Command=Render">Overdue Item</a>
        <a class="btn btn-default" href="http://172.28.128.101/ReportServer/Pages/ReportViewer.aspx?%2fPublisher+Report%2fOverdue+Books+Report&rs:Command=Render">Overdue Books Report</a>
        <a class="btn btn-default" href="http://172.28.128.101/ReportServer/Pages/ReportViewer.aspx?%2fPublisher+Report%2fReplacement+Book+Report&rs:Command=Render">Replacement Book Report</a>
        <a class="btn btn-default" href="http://172.28.128.101/ReportServer/Pages/ReportViewer.aspx?%2fPublisher+Report%2fReserved+Books+for+Collection+Report&rs:Command=Render">Reserved Books for Collection Report</a>
        <a class="btn btn-default" href="http://172.28.128.101/ReportServer/Pages/ReportViewer.aspx?%2fPublisher+Report%2fNew+Book+Report&rs:Command=Render">New Book Report</a>
        <a class="btn btn-default" href="http://172.28.128.101/ReportServer/Pages/ReportViewer.aspx?%2fPublisher+Report%2fPublisher+Buy+Transaction+Report&rs:Command=Render">Publisher Buy Transaction Report</a>
        <a class="btn btn-default" href="http://172.28.128.101/ReportServer/Pages/ReportViewer.aspx?%2fPublisher+Report%2fMember+Monthly+Outstanding+Balance+Report&rs:Command=Render">Member Monthly Outstanding Balance Report</a>
        <a class="btn btn-default" href="http://172.28.128.101/ReportServer/Pages/ReportViewer.aspx?%2fPublisher+Report%2fMonthly+Cost-Revenue+Report+By+Book&rs:Command=Render">Monthly Cost-Revenue report by book</a>
        <a class="btn btn-default" href="http://172.28.128.101/ReportServer/Pages/ReportViewer.aspx?%2fPublisher+Report%2fMonthly+Cost-Revenue+Report+By+Publisher&rs:Command=Render">Monthly Cost-Revenue Report By Publisher</a>
        <a class="btn btn-default" href="http://172.28.128.101/ReportServer/Pages/ReportViewer.aspx?%2fPublisher+Report%2fTotal+Montly-Yearly+Balance&rs:Command=Render">Total Monthly-Yearly Balance</a>
    </p>

</asp:Content>
