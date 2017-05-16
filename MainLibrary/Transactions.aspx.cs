using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MainLibrary
{
    public partial class Transactions : System.Web.UI.Page
    {
        // LIBRARY Database
        LIBRARYEntities db = new LIBRARYEntities();

        public object Messagebox { get; private set; }
        // Load detail from ITEMDETAIL table
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lstAllITEMDETAIL.DataSource = GetItemDetail();
                lstAllITEMDETAIL.DataBind();
            }
        }

        //  Display records from ITEMDETAIL table
        protected void lstAllITEMDETAIL_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            ITEMDETAIL itemdetail = new ITEMDETAIL();
            TextBox tbx = (e.Item.FindControl("tbxItemNumber")) as TextBox;
            if (tbx != null)
                itemdetail.ItemNumber = Convert.ToInt16(tbx.Text);
            tbx = (e.Item.FindControl("tbxTitle")) as TextBox;
            if (tbx != null)
                itemdetail.Title = tbx.Text;
            tbx = (e.Item.FindControl("tbxCopiesOwned")) as TextBox;
            if (tbx != null)
                itemdetail.CopiesOwned = Convert.ToInt16(tbx.Text);
            tbx = (e.Item.FindControl("tbxCopiesOnShelf")) as TextBox;
            if (tbx != null)
                itemdetail.CopiesOnShelf = Convert.ToInt16(tbx.Text);
            tbx = (e.Item.FindControl("tbxCopiesBorrowed")) as TextBox;
            if (tbx != null)
                itemdetail.CopiesBorrowed = Convert.ToInt16(tbx.Text);
            tbx = (e.Item.FindControl("tbxSubDivisionID")) as TextBox;
            if (tbx != null)
                itemdetail.SubDivisionID = Convert.ToInt16(tbx.Text);
            tbx = (e.Item.FindControl("tbxItemID")) as TextBox;
            if (tbx != null)
                itemdetail.ItemID = Convert.ToInt16(tbx.Text);
            tbx = (e.Item.FindControl("tbxReservationID")) as TextBox;
            if (tbx != null)
                itemdetail.ReservationID = Convert.ToInt16(tbx.Text);
            UpdateItemDetailRecord(itemdetail, "Add");
            ResetItemDetailView();
        }

        //  Update Index for record selected
        protected void lstAllITEMDETAIL_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            lstAllITEMDETAIL.EditIndex = e.NewEditIndex;
            lstAllITEMDETAIL.DataSource = GetItemDetail();
            lstAllITEMDETAIL.DataBind();
        }
        // Item to update
        protected void lstAllITEMDETAIL_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            ITEMDETAIL itemdetail = new ITEMDETAIL();
            TextBox tbx = (lstAllITEMDETAIL.Items[e.ItemIndex].FindControl("tbxItemNumber")) as TextBox;
            if (tbx != null)
                itemdetail.ItemNumber = Convert.ToInt16(tbx.Text);
            tbx = (lstAllITEMDETAIL.Items[e.ItemIndex].FindControl("tbxTitle")) as TextBox;
            if (tbx != null)
                itemdetail.Title = tbx.Text;
            tbx = (lstAllITEMDETAIL.Items[e.ItemIndex].FindControl("tbxCopiesOwned")) as TextBox;
            if (tbx != null)
                itemdetail.CopiesOwned = Convert.ToInt16(tbx.Text); 
            tbx = (lstAllITEMDETAIL.Items[e.ItemIndex].FindControl("tbxCopiesOnShelf")) as TextBox;
            if (tbx != null)
                itemdetail.CopiesOnShelf = Convert.ToInt16(tbx.Text);
            tbx = (lstAllITEMDETAIL.Items[e.ItemIndex].FindControl("tbxCopiesBorrowed")) as TextBox;
            if (tbx != null)
                itemdetail.CopiesBorrowed = Convert.ToInt16(tbx.Text); 
            tbx = (lstAllITEMDETAIL.Items[e.ItemIndex].FindControl("tbxSubDivisionID")) as TextBox;
            if (tbx != null)
                itemdetail.SubDivisionID = Convert.ToInt16(tbx.Text);
            tbx = (lstAllITEMDETAIL.Items[e.ItemIndex].FindControl("tbxItemID")) as TextBox;
            if (tbx != null)
                itemdetail.ItemID = Convert.ToInt16(tbx.Text);
            tbx = (lstAllITEMDETAIL.Items[e.ItemIndex].FindControl("tbxReservationID")) as TextBox;
            if (tbx != null)
                itemdetail.ReservationID = Convert.ToInt16(tbx.Text);
            UpdateItemDetailRecord(itemdetail, "Modify");
            ResetItemDetailView();
        }

        protected void lstAllITEMDETAIL_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            ResetItemDetailView();
        }


        protected void lstAllITEMDETAIL_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            lstAllITEMDETAIL.EditIndex = e.ItemIndex;
            lstAllITEMDETAIL.DataSource = GetItemDetail();
            lstAllITEMDETAIL.DataBind();

            try
            {
                ITEMDETAIL itemdetail = new ITEMDETAIL();
            TextBox tbx = (lstAllITEMDETAIL.Items[e.ItemIndex].FindControl("tbxItemNumber")) as TextBox;
            if (tbx != null)
                itemdetail.ItemNumber = Convert.ToInt16(tbx.Text);
            tbx = (lstAllITEMDETAIL.Items[e.ItemIndex].FindControl("tbxTitle")) as TextBox;
            if (tbx != null)
                itemdetail.Title = tbx.Text;
            tbx = (lstAllITEMDETAIL.Items[e.ItemIndex].FindControl("tbxCopiesOwned")) as TextBox;
            if (tbx != null)
                itemdetail.CopiesOwned = Convert.ToInt16(tbx.Text);
            tbx = (lstAllITEMDETAIL.Items[e.ItemIndex].FindControl("tbxCopiesOnShelf")) as TextBox;
            if (tbx != null)
                itemdetail.CopiesOnShelf = Convert.ToInt16(tbx.Text);
            tbx = (lstAllITEMDETAIL.Items[e.ItemIndex].FindControl("tbxCopiesBorrowed")) as TextBox;
            if (tbx != null)
                itemdetail.CopiesBorrowed = Convert.ToInt16(tbx.Text);
            tbx = (lstAllITEMDETAIL.Items[e.ItemIndex].FindControl("tbxSubDivisionID")) as TextBox;
            if (tbx != null)
                itemdetail.SubDivisionID = Convert.ToInt16(tbx.Text);
            tbx = (lstAllITEMDETAIL.Items[e.ItemIndex].FindControl("tbxItemID")) as TextBox;
            if (tbx != null)
                itemdetail.ItemID = Convert.ToInt16(tbx.Text);
            tbx = (lstAllITEMDETAIL.Items[e.ItemIndex].FindControl("tbxReservationID")) as TextBox;
            if (tbx != null)
                itemdetail.ReservationID = Convert.ToInt16(tbx.Text);
                lstAllITEMDETAIL.EditIndex = e.ItemIndex;
                UpdateItemDetailRecord(itemdetail, "Delete");

            }
            catch (Exception ex)
            {
                   
                Messagebox.Equals(ex.InnerException);
            }
        }
        //  Get detail from database
        private DataTable GetItemDetail()
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
            foreach (var itemdetail in db.ITEMDETAILs)
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
            // record detail
            return dt;
        }

        //  Reset Index
        private void ResetItemDetailView()
        {
            lstAllITEMDETAIL.EditIndex = -1;
            lstAllITEMDETAIL.DataSource = GetItemDetail();
            lstAllITEMDETAIL.DataBind();
        }


        public void UpdateItemDetailRecord(ITEMDETAIL itemdetail, string entityState)
        {
            if (entityState == "Add")
            {
                if (itemdetail.Title == null)
                {
                    itemdetail.Title = " ";
                }
                if (itemdetail.CopiesOwned == 0)
                {
                    itemdetail.CopiesOwned = 0;
                }
                if (itemdetail.CopiesOnShelf == 0)
                {
                    itemdetail.CopiesOnShelf = 0;
                }
                if (itemdetail.CopiesBorrowed == 0)
                {
                    itemdetail.CopiesBorrowed = 0;
                }
                if (itemdetail.SubDivisionID == 0)
                {
                    itemdetail.SubDivisionID = 0;
                }
                if (itemdetail.ReservationID == 0)
                {
                    itemdetail.ReservationID = 0;
                }
                //  Add new record
                db.Entry(itemdetail).State = System.Data.Entity.EntityState.Added;
            }
            if (entityState == "Modify")
            {
                foreach (var itemdetailitem in db.ITEMDETAILs.Where(t => t.ItemNumber == itemdetail.ItemNumber))
                {
                    itemdetailitem.ItemNumber = itemdetail.ItemNumber;
                    itemdetailitem.Title = itemdetail.Title;
                }
                //  Update Record
                db.Configuration.AutoDetectChangesEnabled = true;
                db.Configuration.ValidateOnSaveEnabled = true;
            }
            if (entityState == "Delete")
            {
                foreach (var itemdetailitem in db.ITEMDETAILs.Where(t => t.ItemNumber == itemdetail.ItemNumber))
                {
                    itemdetailitem.ItemNumber = itemdetail.ItemNumber;
                    itemdetailitem.Title = itemdetail.Title;
                    itemdetailitem.CopiesOwned = itemdetail.CopiesOwned;
                    itemdetailitem.CopiesOnShelf = itemdetail.CopiesOnShelf;
                    itemdetailitem.CopiesBorrowed = itemdetail.CopiesBorrowed;
                    itemdetailitem.SubDivisionID = itemdetail.SubDivisionID;
                    itemdetailitem.ItemID = itemdetail.ItemID;
                    itemdetailitem.ReservationID = itemdetail.ReservationID;
                }
                // Record deleted
                db.ITEMDETAILs.RemoveRange(
                db.ITEMDETAILs.Where(t => t.ItemNumber == itemdetail.ItemNumber));
                db.Configuration.ValidateOnSaveEnabled = true;
            }
            // Database Updated
            db.SaveChanges();
        }

    }
}