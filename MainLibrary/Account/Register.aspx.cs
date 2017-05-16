using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using MainLibrary.Models;
using MainLibrary;

namespace MainLibrary.Account
{
    public partial class Register : Page
    {
        // LIBRARY Database
        LIBRARYEntities db = new LIBRARYEntities();
        //  Create New User
        protected void CreateUser_Click(object sender, EventArgs e)
        {

            USER user = new USER();
            // Obtain data entered on screen
            var username = tbxUsername.Text;
            var password = tbxPassword.Text;
            var firstname = tbxFirstname.Text;
            var surname = tbxSurname.Text;
            var typeOfuser = tbxTypeOfUser.Text;
            //  Populate database fields
            user.Username = username;
            user.Password = password;
            user.Firstname = firstname;
            user.Surname = surname;

            //Create User Name automatically
            var firstnameFirstLetter = tbxFirstname.Text.Substring(0, 1).ToLower();
            var usrname = typeOfuser + surname + firstnameFirstLetter;
            // Check if User already Exists
            bool exists = CheckIfExists(user);
            // Add User to database
            if (!exists)
            {
                bool updated = UpdateUserRecord(user, "Add");

                if (updated)
            {
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnURL"], Response);
                ((SiteMaster)this.Master).MenuVisibility = true;
                ((SiteMaster)this.Master).TransactionsVisibility = true;
            }

            else
            //  Error if unable to write to database
            {
                ErrorMessage.Text = "Problem saving record to database";
            }
        }
        else
        // User Exists
        {
            ErrorMessage.Text = "The user already exists.";
        }
    }
        private bool CheckIfExists(USER user)
        {
            bool exists = false;
            try
            {
                foreach (var _user in db.USERS.Where(t => t.Username == user.Username))
                {
                    exists = true;
                }

            }
            catch (Exception ex)
            {
                ErrorMessage.Text = "Problem checking if the user exists " + ex.InnerException;
            }
            return exists;
        }

        public bool UpdateUserRecord(USER user, string entityState)
        {
            bool updated = false;
            try
            {
                if (entityState == "Add")
                {
                    if (user.Username != null && user.Password != null)
                    {
                        //Add User
                        db.Entry(user).State = System.Data.Entity.EntityState.Added;
                    }
                }
                if (entityState == "Modify")
                {
                    foreach (var _user in db.USERS.Where(t => t.Username == user.Username))
                    {
                        _user.Username = user.Username;
                        _user.Password = user.Password;
                        _user.Firstname = user.Firstname;
                        _user.Surname = user.Surname;
                    }
                    db.Configuration.AutoDetectChangesEnabled = true;
                    db.Configuration.ValidateOnSaveEnabled = true;
                }
                if (entityState == "Delete")
                {
                    db.USERS.RemoveRange(
                    db.USERS.Where(t => t.Username == user.Username));
                }
                int saved = db.SaveChanges();
                if (saved > 0)
                {
                    // Database Updated
                    updated = true;
                }
            }
            catch (Exception ex)
            {
                ErrorMessage.Text = "Problem saving record to database" + ex.InnerException;
            }
            return updated;
        }
    }
}

