//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DnD.Model.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class SetupContactInformation
    {
        public int SetupContactInformationId { get; set; }
        public int StoreId { get; set; }
        public string ContactFirstName { get; set; }
        public string ContactLastName { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string Website { get; set; }
        public string TwitterHandle { get; set; }
        public bool IsActive { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
    
        public virtual Store Store { get; set; }
    }
}