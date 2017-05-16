<%-- ITEMDETAILS Screen Created by Miriam Kelly --%>

<%-- Item Details Screen NavBar --%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="MainLibrary.Transactions" %>
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
                        <li><a runat="server"  id="mnuSearch" href="~/Search" >Browse</a></li>
                        <li class="active"><a runat="server"  id="mnuTransactions" href="~/Updates" style="color: blue">Updates</a></li>             
                    </ul>
                    <ul class="nav navbar-nav navbar-right">                       
                        <li><a runat="server" href="~/Account/Login">Log Out</a></li>
                    </ul>
                </div>
            </div>
        </div>
<%-- ITEMDETAILS table --%>
    <h2>&nbsp;</h2>
    <div class="jumbotron">
        <h2 style="color: lawngreen" class="text-center">Item details</h2>
    </div>
    <br />
    <br />
    <div class="lead1">
        <asp:ListView ID="lstAllITEMDETAIL" runat="server"
            OnItemEditing="lstAllITEMDETAIL_ItemEditing"
            OnItemUpdating="lstAllITEMDETAIL_ItemUpdating"
            OnItemCanceling="lstAllITEMDETAIL_ItemCanceling"
            OnItemDeleting="lstAllITEMDETAIL_ItemDeleting"
            InsertItemPosition="LastItem"
            OnItemInserting="lstAllITEMDETAIL_ItemInserting">
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
                                    <th id="Th7" runat="server">SubDivisionID</th>
                                    <th id="Th8" runat="server">ItemID</th>
                                    <th id="Th9" runat="server">ReservationID</th>
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
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="lblItemNumber" runat="server" Text='<%# Eval("ItemNumber") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblCopiesOwned" runat="server" Text='<%# Eval("CopiesOwned") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblCopiesOnShelf" runat="server" Text='<%# Eval("CopiesOnShelf") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblCopiesBorrowed" runat="server" Text='<%# Eval("CopiesBorrowed") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblSubDivisionID" runat="server" Text='<%# Eval("SubDivisionID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblItemID" runat="server" Text='<%# Eval("ItemID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblReservationID" runat="server" Text='<%# Eval("ReservationID") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <EditItemTemplate>
                <tr>
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />               
                    <td>
                        <asp:TextBox ID="tbxItemNumber" runat="server" Text='<%# Bind("ItemNumber") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxTitle" runat="server" Text='<%# Bind("Title") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxCopiesOwned" runat="server" Text='<%# Bind("CopiesOwned") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxCopiesOnShelf" runat="server" Text='<%# Bind("CopiesOnShelf") %>' />
                    </td>   
                    <td>
                        <asp:TextBox ID="tbxCopiesBorrowed" runat="server" Text='<%# Bind("CopiesBorrowed") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxSubDivisionID" runat="server" Text='<%# Bind("SubDivisionID") %>' />
                    </td>     
                     <td>
                        <asp:TextBox ID="tbxItemId" runat="server" Text='<%# Bind("ItemID") %>' />
                    </td>                                
                    <td>
                        <asp:TextBox ID="tbxReservationID" runat="server" Text='<%# Bind("ReservationID") %>' />
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
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="tbxItemNumber" runat="server" Text='<%# Bind("ItemNumber") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxTitle" runat="server" Text='<%# Bind("Title") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxCopiesOwned" runat="server" Text='<%# Bind("CopiesOwned") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxCopiesOnShelf" runat="server" Text='<%# Bind("CopiesOnShelf") %>' />
                    </td>   
                    <td>
                        <asp:TextBox ID="tbxCopiesBorrowed" runat="server" Text='<%# Bind("CopiesBorrowed") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxSubDivisionID" runat="server" Text='<%# Bind("SubDivisionID") %>' />
                    </td>    
                    <td>
                        <asp:TextBox ID="tbxItemID" runat="server" Text='<%# Bind("ItemID") %>' />
                    </td>                                    
                    <td>
                        <asp:TextBox ID="tbxReservationID" runat="server" Text='<%# Bind("ReservationID") %>' />
                    </td>


                </tr>
            </InsertItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

