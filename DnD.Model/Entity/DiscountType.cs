﻿namespace DnD.Model.Entity
{
    using System;
    using System.Collections.Generic;

    public partial class DiscountType
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DiscountType()
        {
            this.DiscountOffers = new HashSet<DiscountOffer>();
        }

        public int DiscountTypeId { get; set; }
        public string DiscountTypeName { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DiscountOffer> DiscountOffers { get; set; }
    }
}
