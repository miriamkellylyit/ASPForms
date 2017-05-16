<%-- Registration Screen created by Miriam Kelly --%>

<%-- Registration Screen Navbar --%>

<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MainLibrary.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h1 class="col-md-12 jumbotron text-center" style="color: lawngreen">REGISTRATION SCREEN</h1>
            <p style="color: darkgreen">Please enter ALL details to create a new account.</p>

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
                                <li class="active"><a runat="server" id="mnuRegister" href="~/Account/Register" style="color: blue">Register</a></li>
                                <li><a runat="server" href="~/Account/Login">Log in</a></li>
                            </ul>
                </div>
            </div>
        </div>
<%-- Error Message --%>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
<%-- Validate details entered --%>
    <div class="form-horizontal">
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="tbxFirstname" CssClass="col-md-2 control-label">Firstname</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbxFirstname" CssClass="form-control" placeholder ="First Name" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxFirstname"
                    CssClass="text-danger" ErrorMessage="The Firstname field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="tbxSurname" CssClass="col-md-2 control-label">Surname</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbxSurname" CssClass="form-control"  placeholder ="Surname" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxSurname"
                    CssClass="text-danger" ErrorMessage="The Surname field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="tbxTypeOfUser" CssClass="col-md-2 control-label" >Type of User</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbxTypeOfUser" CssClass="form-control" placeholder ="STU(Student) STF(Staff) MGR(Manager)" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxTypeOfUser"
                    CssClass="text-danger" ErrorMessage="The Type of User field is required. (Student=STU; Employee=STF or MGR" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="tbxUsername" CssClass="col-md-2 control-label">Username</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbxUsername" CssClass="form-control" placeholder ="TypeOfUser+Surname+FirstInitial"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxUsername"
                    CssClass="text-danger" ErrorMessage="The Username field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="tbxPassword" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbxPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxPassword"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
<%-- Confirm Password --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="tbxConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbxConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="tbxPassword" ControlToValidate="tbxConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
<%-- Create New User --%>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
    </div>
</asp:Content>