﻿using DnD.Model.Entity;
using DnD.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DnD.BLL.Providers
{
    public interface IProductManager
    {
        int SaveBrand(ProductBrand productBrandObj);
        int UpdateBrand(ProductBrand productBrandObj);
        int DeleteBrand(ProductBrand productBrandObj);
        List<ProductBrand> GetAllBrandsByStore(int storeId);
        List<Product> GetAllProductsByStore(int storeId);
        List<Product> GetProductsBySearch(ProductSearchCriteria searchCriteriaObject);
        int SaveProduct(Product productObj);
        int SaveSupplier(ProductSupplier productSupplierObj);
        int UpdateSupplier(ProductSupplier productSupplierObj);
        int DeleteSupplier(ProductSupplier productSupplierObj);
        List<ProductSupplier> GetAllSuppliersByStore(int storeId);
        int SaveType(ProductType productTypeObj);
        int UpdateType(ProductType productTypeObj);
        int DeleteType(ProductType productTypeObj);
        List<ProductType> GetAllTypesByStore(int storeId);
        int SaveTag(ProductTag productTagObj);
        int UpdateTag(ProductTag productTagObj);
        int DeleteTag(ProductTag productTagObj);
        List<ProductTag> GetAllTagsByStore(int storeId);
        AddEditProductMasterViewModel GetAllMasterDataForCreateOrEditProduct(int storeId);
    }
}