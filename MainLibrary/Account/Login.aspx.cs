using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using MainLibrary.Models;
using System.Linq;
using System.Web.UI.WebControls;

namespace MainLibrary.Account
{
    public partial class Login : Page
    {
        // LIBRARY Database
        LIBRARYEntities db = new LIBRARYEntities();
        USER user = new USER();

        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            ((SiteMaster)this.Master).MenuVisibility = false;
            ((SiteMaster)this.Master).TransactionsVisibility = false;
            ((SiteMaster)this.Master).SearchVisibility = false;
        }

        // Validate User
        protected void LogIn_Click(object sender, EventArgs e)
        {
            bool authenticated = false;
            var username = tbxUsername.Text;
            var password = tbxPassword.Text;
            foreach (var _user in db.USERS.Where(t => t.Username == username && t.Password == password))
            {
                user = _user;
                authenticated = true;
                //break;

            }
            // Valid User
            if (authenticated)
            {
                //Label lblUser = this.Master.FindControl("lblUsername") as Label;
                //lblUser.Text = user.Username.ToString();
                ((SiteMaster)this.Master).UserNameVisibility = true;
                ((SiteMaster)this.Master).UserNameLabel = this.user.Username.ToString();
                ((SiteMaster)this.Master).currentuser = this.user;
                ((SiteMaster)this.Master).MenuVisibility = true;
                ((SiteMaster)this.Master).TransactionsVisibility = true;
                ((SiteMaster)this.Master).SearchVisibility = true;

                // ((SiteMaster)this.Master).UserName = user.Username;
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);

            }
            // Invalid User - Display Error Message
            else
            {
                FailureText.Text = "Invalid login attempt. Please check your user details and try again.";
                ErrorMessage.Visible = true;
            }
        }
    }
}