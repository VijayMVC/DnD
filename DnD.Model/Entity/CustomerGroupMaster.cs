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
    
    public partial class CustomerGroupMaster
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CustomerGroupMaster()
        {
            this.CustomerGroups = new HashSet<CustomerGroup>();
        }
    
        public int CustomerGroupMasterId { get; set; }
        public string GroupName { get; set; }
        public bool IsActive { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public Nullable<int> DiscountPercentage { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CustomerGroup> CustomerGroups { get; set; }
    }
}
