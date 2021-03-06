﻿using DnD.BLL.Providers;
using DnD.Model.Entity;
using DnD.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;


namespace DnD.API.API
{
    public class ProductController : BaseApiController
    {
        /// <summary>
        /// declare object for role manager provider
        /// </summary>
        readonly IProductManager _productManager;

        public ProductController(IProductManager productManager)
            : base()
        {
            _productManager = productManager;
        }

        /// <summary>
        /// Get the all Products list 
        /// </summary>
        /// <returns>Collection of Products</returns>
        [HttpGet]
        [ActionName("GetAllProductsByStore")]
        public IHttpActionResult GetAllProductsByStore()
        {
            try
            {
                return Ok(_productManager.GetAllProductsByStore(1));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Get the all Products list 
        /// </summary>
        /// <returns>Collection of Products</returns>
        [HttpGet]
        [ActionName("GetAllProductsForSaleByStore")]
        public IHttpActionResult GetAllProductsForSaleByStore()
        {
            try
            {
                return Ok(_productManager.GetAllProductsForSaleByStore(1));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Get the all Products By Search
        /// </summary>
        /// <returns>Collection of Products</returns>
        [HttpPost]
        [ActionName("GetProductsBySearch")]
        public IHttpActionResult GetProductsBySearch([FromBody]ProductSearchCriteria searchCriteriaObject)
        {
            try
            {
                return Ok(_productManager.GetProductsBySearch(searchCriteriaObject));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }
        }


        /// <summary>
        /// Get Inventory By Search
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [ActionName("GetInventoryBySearch")]
        public IHttpActionResult GetInventoryBySearch([FromBody]ProductSearchCriteria searchCriteriaObject)
        {
            try
            {
                return Ok(_productManager.GetInventoryBySearch(searchCriteriaObject));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }
        }

        /// <summary>
        /// Save Brand
        /// </summary>
        /// <returns>Brand Id</returns>
        [HttpPost]
        [ActionName("SaveBrand")]
        public IHttpActionResult SaveBrand(ProductBrand productBrandObj)
        {
            try
            {
                return Ok(_productManager.SaveBrand(productBrandObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Update Brand
        /// </summary>
        /// <returns>Brand Id</returns>
        [HttpPost]
        [ActionName("UpdateBrand")]
        public IHttpActionResult UpdateBrand(ProductBrand productBrandObj)
        {
            try
            {
                return Ok(_productManager.UpdateBrand(productBrandObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Delete Brand
        /// </summary>
        /// <returns>Brand Id</returns>
        [HttpPost]
        [ActionName("DeleteBrand")]
        public IHttpActionResult DeleteBrand(ProductBrand productBrandObj)
        {
            try
            {
                return Ok(_productManager.DeleteBrand(productBrandObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }


        /// <summary>
        /// Get the all Brands list 
        /// </summary>
        /// <returns>Collection of Brands</returns>
        [HttpGet]
        [ActionName("GetAllBrands")]
        public IHttpActionResult GetAllBrands()
        {
            try
            {
                return Ok(_productManager.GetAllBrandsByStore(1));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Get the all Customers list 
        /// </summary>
        /// <returns>Collection of customers</returns>
        [HttpGet]
        [ActionName("GetAllCustomers")]
        public IHttpActionResult GetAllCustomers()
        {
            try
            {
                return Ok(_productManager.GetAllCustomersByStore(1));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        [HttpPost]
        public async Task<IHttpActionResult> UploadProductImages()
        {
            List<ProductImage> images = new List<ProductImage>();
            if (!Request.Content.IsMimeMultipartContent())
                throw new HttpResponseException(HttpStatusCode.UnsupportedMediaType);
            try
            {
                var provider = new MultipartMemoryStreamProvider();
                await Request.Content.ReadAsMultipartAsync(provider);
                foreach (var file in provider.Contents)
                {
                    if (file.Headers.ContentLength > 0)
                    {
                        ProductImage image = new ProductImage();
                        image.Image = await file.ReadAsByteArrayAsync();
                        image.FileType = file.Headers.ContentType.MediaType;
                        image.FileName = file.Headers.ContentDisposition.FileName.Trim('\"');
                        //File.WriteAllBytes(imagePath, buffer);
                        images.Add(image);
                    }
                }
                SessionManager.Current.ProductImages = images;
                return Ok();
            }
            catch (Exception ex)
            {
                var response = Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
                throw new HttpResponseException(response);
            }
        }

        /// <summary>
        /// Save Product
        /// </summary>
        /// <returns>Product Id</returns>
        [HttpPost]
        [ActionName("SaveProduct")]
        public IHttpActionResult SaveProduct(Product productObj)
        {
            try
            {
                return Ok(_productManager.SaveProduct(productObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        //[HttpPost]
        //[ActionName("UploadProductImages")]
        //public IHttpActionResult UploadProductImages()
        //{
        //    bool isSavedSuccessfully = true;
        //    string fName = "";
        //    try
        //    {
        //        //HttpResponseMessage result = null;
        //        var httpRequest = HttpContext.Current.Request;
        //        if (httpRequest.Files.Count > 0)
        //        {
        //            foreach (string file in httpRequest.Files)
        //            {
        //                var postedFile = httpRequest.Files[file];
        //                //Save file content goes here
        //                fName = postedFile.FileName;
        //                if (file != null && postedFile.ContentLength > 0)
        //                {

        //                    var originalDirectory = new DirectoryInfo(string.Format("{0}img\\ProductImages", HttpContext.Current.Server.MapPath(@"\")));

        //                    string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "imagepath");

        //                    var fileName1 = Path.GetFileName(postedFile.FileName);

        //                    bool isExists = System.IO.Directory.Exists(pathString);

        //                    if (!isExists)
        //                        System.IO.Directory.CreateDirectory(pathString);

        //                    var path = string.Format("{0}\\{1}", pathString, postedFile.FileName);
        //                    postedFile.SaveAs(path);

        //                }

        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
        //        return BadRequest();
        //    }
        //    if (isSavedSuccessfully)
        //    {
        //        return Json(new { Message = fName });
        //    }
        //    else
        //    {
        //        return Json(new { Message = "Error in saving file" });
        //    }
        //}

        /// <summary>
        /// Save Supplier
        /// </summary>
        /// <returns>Supplier Id</returns>
        [HttpPost]
        [ActionName("SaveSupplier")]
        public IHttpActionResult SaveSupplier(ProductSupplier productSupplierObj)
        {
            try
            {
                return Ok(_productManager.SaveSupplier(productSupplierObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Update Supplier
        /// </summary>
        /// <returns>Supplier Id</returns>
        [HttpPut]
        [ActionName("UpdateSupplier")]
        public IHttpActionResult UpdateSupplier(ProductSupplier productSupplierObj)
        {
            try
            {
                return Ok(_productManager.UpdateSupplier(productSupplierObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Delete Supplier
        /// </summary>
        /// <returns>Supplier Id</returns>
        [HttpPost]
        [ActionName("DeleteSupplier")]
        public IHttpActionResult DeleteSupplier(ProductSupplier productSupplierObj)
        {
            try
            {
                return Ok(_productManager.DeleteSupplier(productSupplierObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }


        /// <summary>
        /// Get the all Suppliers list 
        /// </summary>
        /// <returns>Collection of Suppliers</returns>
        [HttpGet]
        [ActionName("GetAllSuppliers")]
        public IHttpActionResult GetAllSuppliers()
        {
            try
            {
                return Ok(_productManager.GetAllSuppliersByStore(1));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Save Type
        /// </summary>
        /// <returns>Type Id</returns>
        [HttpPost]
        [ActionName("SaveType")]
        public IHttpActionResult SaveType(ProductType productTypeObj)
        {
            try
            {
                return Ok(_productManager.SaveType(productTypeObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Update Type
        /// </summary>
        /// <returns>Type Id</returns>
        [HttpPut]
        [ActionName("UpdateType")]
        public IHttpActionResult UpdateType(ProductType productTypeObj)
        {
            try
            {
                return Ok(_productManager.UpdateType(productTypeObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Delete Type
        /// </summary>
        /// <returns>Type Id</returns>
        [HttpPost]
        [ActionName("DeleteType")]
        public IHttpActionResult DeleteType(ProductType productTypeObj)
        {
            try
            {
                return Ok(_productManager.DeleteType(productTypeObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }


        /// <summary>
        /// Get the all Types list 
        /// </summary>
        /// <returns>Collection of Types</returns>
        [HttpGet]
        [ActionName("GetAllTypes")]
        public IHttpActionResult GetAllTypes()
        {
            try
            {
                return Ok(_productManager.GetAllTypesByStore(1));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }



        /// <summary>
        /// Save Tag
        /// </summary>
        /// <returns>Tag Id</returns>
        [HttpPost]
        [ActionName("SaveTag")]
        public IHttpActionResult SaveTag(ProductTagMaster productTagMasterObj)
        {
            try
            {
                return Ok(_productManager.SaveTag(productTagMasterObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Update Tag
        /// </summary>
        /// <returns>Tag Id</returns>
        [HttpPut]
        [ActionName("UpdateTag")]
        public IHttpActionResult UpdateTag(ProductTagMaster productTagMasterObj)
        {
            try
            {
                return Ok(_productManager.UpdateTag(productTagMasterObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Delete Tag
        /// </summary>
        /// <returns>Tag Id</returns>
        [HttpPost]
        [ActionName("DeleteTag")]
        public IHttpActionResult DeleteTag(ProductTagMaster productTagMasterObj)
        {
            try
            {
                return Ok(_productManager.DeleteTag(productTagMasterObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }


        /// <summary>
        /// Get the all Tags list 
        /// </summary>
        /// <returns>Collection of Tags</returns>
        [HttpGet]
        [ActionName("GetAllTags")]
        public IHttpActionResult GetAllTags()
        {
            try
            {
                return Ok(_productManager.GetAllTagsByStore(1));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Get All MasterData For Create Or Edit Product
        /// </summary>
        /// <returns>Collection of Tags</returns>
        [HttpGet]
        [ActionName("GetAllMasterDataForCreateOrEditProduct")]
        public IHttpActionResult GetAllMasterDataForCreateOrEditProduct()
        {
            try
            {
                return Ok(_productManager.GetAllMasterDataForCreateOrEditProduct(1));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }
        }

        /// <summary>
        /// Get All Sales Tax
        /// </summary>
        /// <returns>Collection of Tags</returns>
        [HttpGet]
        [ActionName("GetAllSalesTaxList")]
        public IHttpActionResult GetAllSalesTaxList()
        {
            try
            {
                return Ok(_productManager.GetAllSalesTaxList(1));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }
        }

        /// <summary>
        /// Get All MasterData For Create Or Edit Discount Offer
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [ActionName("GetAllMasterDataForCreateOrEditDiscountOffer")]
        public IHttpActionResult GetAllMasterDataForCreateOrEditDiscountOffer()
        {
            try
            {
                return Ok(_productManager.GetAllMasterDataForCreateOrEditDiscountOffer(1));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }
        }

        /// <summary>
        /// Get Store Outlet
        /// </summary>
        /// <returns>Collection of Outlets</returns>
        [HttpGet]
        [ActionName("GetStoreOutlets")]
        public IHttpActionResult GetStoreOutlets()
        {
            try
            {
                return Ok(_productManager.GetStoreOutlets(1));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }
        }



    }
}
