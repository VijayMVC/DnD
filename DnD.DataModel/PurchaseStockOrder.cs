//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DnD.DataModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class PurchaseStockOrder
    {
        public int PurchaseStockOrderId { get; set; }
        public int StockOrderTypeId { get; set; }
        public string OrderName { get; set; }
        public int OrderFromId { get; set; }
        public System.DateTime DeliveryDueDate { get; set; }
        public string PurchaseStockOrderNumber { get; set; }
        public int DeliveryToOutletId { get; set; }
        public string SupplierInvoice { get; set; }
        public bool IsAutoFillFromReorderPoint { get; set; }
        public System.DateTime OrderCreatedDate { get; set; }
        public int OrderStatusId { get; set; }
        public bool IsActive { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
    
        public virtual StockOrderType StockOrderType { get; set; }
    }
}
