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
    
    public partial class DVD
    {
        public int ItemNumber { get; set; }
        public string Producer { get; set; }
        public string Comments { get; set; }
    
        public virtual ITEMDETAIL ITEMDETAIL { get; set; }
    }
}