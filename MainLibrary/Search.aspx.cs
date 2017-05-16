using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MainLibrary
{
    public partial class Search : System.Web.UI.Page
    {

        test t = new test();
        // Database to search
        public string databaseToSearch
        {
            get
            {
                return (string)ViewState["databaseToSearch"] ?? "";
            }
            set
            {
                ViewState["databaseToSearch"] = value;
            }
        }

        public partial class test
        {
            public string a;
        }

        // LIBRARY database
        LIBRARYEntities db = new LIBRARYEntities();
  
        // Search for text entered
        string searchText { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {

        }
        // Select from dropdown list
        protected void cboDatabaseChoice_SelectedIndexChanged(object sender, EventArgs e)
        {
            var _dropdownlist = (DropDownList)sender;
            if (_dropdownlist.SelectedIndex > -1)
            {
                ResetItemDetailView();
                ResetUserView();
                ListItem item = _dropdownlist.SelectedItem;
                databaseToSearch = item.Value;
                t.a = item.Value;

            }
        }
        //  Search for record on table
        protected void Search_Click(object sender, EventArgs e)
        {
            searchText = tbxSearchText.Text;
            PerformSearch(databaseToSearch, searchText);
        }
        // Search ITEMDETAIL table
        private void PerformSearch(string databaseToSearch, string searchText)
        {
            if (databaseToSearch == "ITEMDETAIL")
            {
                lstAllITEMDETAIL.DataSource = GetItemDetail(searchText);
                if (lstAllITEMDETAIL.Items.Count > 0)
                {
                    lstAllITEMDETAIL.Visible = true;
                }
                lstAllITEMDETAIL.DataBind();
            }
            // Search USERS table
            if (databaseToSearch == "USERS")
            {
                lstAllUSER.DataSource = GetUser(searchText);
                if (lstAllUSER.Items.Count > 0)
                {
                    lstAllUSER.Visible = true;
                }
                lstAllUSER.DataBind();
            }

        }
        // Get record details from ITEMDETAIL table
        private DataTable GetItemDetail(string searchText)
        {
            ITEMDETAIL p = new ITEMDETAIL();
            object[] obj = new object[8];
            DataTable dt = new DataTable();
            dt.Columns.Add("ItemNumber");
            dt.Columns.Add("Title");
            dt.Columns.Add("CopiesOwned");
            dt.Columns.Add("CopiesOnShelf");
            dt.Columns.Add("CopiesBorrowed");
            dt.Columns.Add("SubDivisionID");
            dt.Columns.Add("ItemID");
            dt.Columns.Add("ReservationID");
            foreach (var itemdetail in db.ITEMDETAILs.Where(t => t.Title == searchText))
            {
                obj[0] = itemdetail.ItemNumber;
                obj[1] = itemdetail.Title;
                obj[2] = itemdetail.CopiesOwned;
                obj[3] = itemdetail.CopiesOnShelf;
                obj[4] = itemdetail.CopiesBorrowed;
                obj[5] = itemdetail.SubDivisionID;
                obj[6] = itemdetail.ItemID;
                obj[7] = itemdetail.ReservationID;
                dt.Rows.Add(obj);
            }
            return dt;
        }
        // Get record details from USER table
        private DataTable GetUser(string searchText)
        {
            USER p = new USER();
            object[] obj = new object[4];
            DataTable dt = new DataTable();
            dt.Columns.Add("Username");
            dt.Columns.Add("Password");
            dt.Columns.Add("Firstname");
            dt.Columns.Add("Surname");

            foreach (var user in db.USERS.Where(t => t.Username == searchText))
            {
                obj[0] = user.Username;
                obj[1] = user.Password;
                obj[2] = user.Firstname;
                obj[3] = user.Surname;
                dt.Rows.Add(obj);
            }
            return dt;
        }
        //  Reset Index for ITEMDETAIL
        private void ResetItemDetailView()
        {
            lstAllITEMDETAIL.EditIndex = -1;
            lstAllITEMDETAIL.DataSource = GetItemDetail("");
            lstAllITEMDETAIL.DataBind();
        }
        //  Reset Index for USER
        private void ResetUserView()
        {
            lstAllUSER.EditIndex = -1;
            lstAllUSER.DataSource = GetUser("");
            lstAllUSER.DataBind();
        }
    }
}