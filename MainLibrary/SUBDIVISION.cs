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
    
    public partial class SUBDIVISION
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SUBDIVISION()
        {
            this.ITEMDETAILs = new HashSet<ITEMDETAIL>();
        }
    
        public int SubDivisionID { get; set; }
        public string SubDivisionName { get; set; }
        public int SubjectID { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ITEMDETAIL> ITEMDETAILs { get; set; }
        public virtual SUBJECT SUBJECT { get; set; }
    }
}
