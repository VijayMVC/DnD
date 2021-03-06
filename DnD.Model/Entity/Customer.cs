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
    
    public partial class Customer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Customer()
        {
            this.CustomerGroups = new HashSet<CustomerGroup>();
        }
    
        public int CustomerId { get; set; }
        public int StoreId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Company { get; set; }
        public string CustomerCode { get; set; }
        public Nullable<int> CustomerGroupId { get; set; }
        public Nullable<bool> IsLoyaltyEnabled { get; set; }
        public Nullable<System.DateTime> DateOfBirth { get; set; }
        public string Sex { get; set; }
        public string Phone { get; set; }
        public string Mobile { get; set; }
        public string Fax { get; set; }
        public string Email { get; set; }
        public string Website { get; set; }
        public string Twitter { get; set; }
        public Nullable<bool> IsCustomerOptedOutMail { get; set; }
        public string PhysicalAddressStreet1 { get; set; }
        public string PhysicalAddressStreet2 { get; set; }
        public string PhysicalSuburb { get; set; }
        public string PhysicalCity { get; set; }
        public string PhysicalPostcode { get; set; }
        public string PhysicalState { get; set; }
        public Nullable<int> PhysicalCountryId { get; set; }
        public Nullable<bool> IsPostalAddSameAsPhysicalAdd { get; set; }
        public string PostalAddressStree1 { get; set; }
        public string PostalAddressStreet2 { get; set; }
        public string PostalSuburb { get; set; }
        public string PostalCity { get; set; }
        public string PostalPostCode { get; set; }
        public string PostalState { get; set; }
        public Nullable<int> PostalCountryId { get; set; }
        public bool IsActive { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
    
        public virtual Country Country { get; set; }
        public virtual Country Country1 { get; set; }
        public virtual CustomerGroup CustomerGroup { get; set; }
        public virtual Store Store { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CustomerGroup> CustomerGroups { get; set; }
    }
}
