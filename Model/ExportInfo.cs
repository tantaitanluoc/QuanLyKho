//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuanLyKho.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class ExportInfo
    {
        public string id { get; set; }
        public string materialId { get; set; }
        public string exportId { get; set; }
        public int customerId { get; set; }
        public Nullable<int> count { get; set; }
        public string status { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual Export Export { get; set; }
        public virtual Material Material { get; set; }
    }
}
