<%-- Login Page Created by Miriam Kelly --%>

<%-- Login Page Navbar --%>

<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MainLibrary.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h1 class="col-md-12 jumbotron text-center" style="color: lawngreen">LOGIN SCREEN</h1>
            <p  style="color: darkgreen">Please enter Username and Password OR                             <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>.</p>

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
                            <ul class="nav navbar-nav navbar-right">
                                <li><a runat="server" id="mnuRegister" href="~/Account/Register">Register</a></li>
                                <li class="active"><a runat="server" href="~/Account/Login" style="color: blue">Log in</a></li>
                            </ul>
                </div>
            </div>
        </div>
<%-- Validate Login Details --%>
    <div class="row">
        <div class="col-md-20">
            <section >
                <div class="form-horizontal">

                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="tbxUsername" CssClass="col-md-2 control-label">Username</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="tbxUsername" CssClass="form-control" placeholder ="TypeOfUser+Surname+FirstInitial" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxUsername"
                                CssClass="text-danger" ErrorMessage="The Username field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="tbxPassword" CssClass="col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="tbxPassword" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxPassword" CssClass="text-danger" ErrorMessage="The password field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="LogIn_Click" Text="Log in" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
                <p>
                    <%-- Enable this once you have account confirmation enabled for password reset functionality
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                    --%>
                </p>
            </section>
    </div>
    </div>
</asp:Content>
