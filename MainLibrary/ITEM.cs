//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MainLibrary
{
    using System;
    using System.Collections.Generic;
    
    public partial class ITEM
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ITEM()
        {
            this.ITEMDETAILs = new HashSet<ITEMDETAIL>();
        }
    
        public int ItemID { get; set; }
        public string ItemType { get; set; }
        public double OverDueCharge { get; set; }
        public string ChargeType { get; set; }
        public int LibraryID { get; set; }
    
        public virtual LIBRARY LIBRARY { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ITEMDETAIL> ITEMDETAILs { get; set; }
    }
}
