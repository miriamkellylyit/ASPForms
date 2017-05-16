using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace MainLibrary
{
    public partial class User : System.Web.UI.Page
    {
        //LIBRARY Database
        LIBRARYEntities db = new LIBRARYEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lstAllUsers.DataSource = GetUsers();
                lstAllUsers.DataBind();
            }
        }

        //  Display USER records
        protected void lstAllUsers_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            USER user = new USER();
            TextBox tbx = (e.Item.FindControl("tbxUserName")) as TextBox;
            if (tbx != null)
                user.Username = tbx.Text;
            tbx = (e.Item.FindControl("tbxPassword")) as TextBox;
            if (tbx != null)
                user.Password = tbx.Text;
            tbx = (e.Item.FindControl("tbxFirstname")) as TextBox;
            if (tbx != null)
                user.Firstname = tbx.Text;
            tbx = (e.Item.FindControl("tbxSurname")) as TextBox;
            if (tbx != null)
                user.Surname = tbx.Text;
            UpdateUserRecord(user, "Add");
            ResetUserView();
        }
        // Set Index for Item Selected
        protected void lstAllUsers_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            lstAllUsers.EditIndex = e.NewEditIndex;
            lstAllUsers.DataSource = GetUsers();
            lstAllUsers.DataBind();
        }
        //  Populate screen
        protected void lstAllUsers_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            USER user = new USER();
            TextBox tbx = (lstAllUsers.Items[e.ItemIndex].FindControl("tbxUsername")) as TextBox;
            if (tbx != null)
                user.Username = tbx.Text;
            tbx = (lstAllUsers.Items[e.ItemIndex].FindControl("tbxPassword")) as TextBox;
            if (tbx != null)
                user.Password = tbx.Text;
            tbx = (lstAllUsers.Items[e.ItemIndex].FindControl("tbxFirstname")) as TextBox;
            if (tbx != null)
                user.Firstname = tbx.Text;
            tbx = (lstAllUsers.Items[e.ItemIndex].FindControl("tbxSurname")) as TextBox;
            if (tbx != null)
                user.Surname = tbx.Text;
            UpdateUserRecord(user, "Modify");
            ResetUserView();
        }
        // Cancel 
        protected void lstAllUsers_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            ResetUserView();
        }
        //  Delete record selected
        protected void lstAllUsers_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {

            lstAllUsers.EditIndex = e.ItemIndex;
            lstAllUsers.DataSource = GetUsers();
            lstAllUsers.DataBind();
        
        USER user = new USER();
            TextBox tbx = (lstAllUsers.Items[e.ItemIndex].FindControl("tbxUsername")) as TextBox;
            if (tbx != null)
                user.Username = tbx.Text;
            tbx = (lstAllUsers.Items[e.ItemIndex].FindControl("tbxPassword")) as TextBox;
            if (tbx != null)
                user.Password = tbx.Text;
            tbx = (lstAllUsers.Items[e.ItemIndex].FindControl("tbxFirstname")) as TextBox;
            if (tbx != null)
                user.Firstname = tbx.Text;
            tbx = (lstAllUsers.Items[e.ItemIndex].FindControl("tbxSurname")) as TextBox;
            if (tbx != null)
                user.Surname = tbx.Text;
            lstAllUsers.EditIndex = e.ItemIndex;
            UpdateUserRecord(user, "Delete");


        }
        //  Get USER detail
        private DataTable GetUsers()
        {
            USER p = new USER();
            object[] obj = new object[4];
            DataTable dt = new DataTable();
            dt.Columns.Add("Username");
            dt.Columns.Add("Password");
            dt.Columns.Add("Firstname");
            dt.Columns.Add("Surname");
            foreach (var user in db.USERS)
            {
                obj[0] = user.Username;
                obj[1] = user.Password;
                obj[2] = user.Firstname;
                obj[3] = user.Surname;
                dt.Rows.Add(obj);
            }
            // Detail record
            return dt;
        }
        //  Reset Index
        private void ResetUserView()
        {
            lstAllUsers.EditIndex = -1;
            lstAllUsers.DataSource = GetUsers();
            lstAllUsers.DataBind();
        }
        //  Add New User
        public void UpdateUserRecord(USER user, string entityState)
        {
            if (entityState == "Add")
            {
                if (user.Username == null)
                {
                    user.Username = " ";
                }
                if (user.Password == null)
                {
                    user.Password = " ";
                }
                if (user.Firstname == null)
                {
                    user.Firstname = " ";
                }
                if (user.Surname == null)
                {
                    user.Surname = " ";
                }
                // New User Added
                db.Entry(user).State = System.Data.Entity.EntityState.Added;
            }
            //  Update
            if (entityState == "Modify")
            {
                foreach (var useritem in db.USERS.Where(t => t.Username == user.Username))
                {
                    useritem.Username = user.Username;
                    useritem.Password = user.Password;
                    useritem.Firstname = user.Firstname;
                    useritem.Surname = user.Surname;
                }
                db.Configuration.AutoDetectChangesEnabled = true;
                db.Configuration.ValidateOnSaveEnabled = true;
            }
            // Delete
            if (entityState == "Delete")
            {

                foreach (var useritem in db.USERS.Where(t => t.Username == user.Username))
                {
                    useritem.Username = user.Username;
                    useritem.Password = user.Password;
                    useritem.Firstname = user.Firstname;
                    useritem.Surname = user.Surname;
                }
                    db.USERS.RemoveRange(
                    db.USERS.Where(t => t.Username == user.Username));
                    db.Configuration.ValidateOnSaveEnabled = true;
            }
            //  USER table updated
            db.SaveChanges();

        }
    }
}