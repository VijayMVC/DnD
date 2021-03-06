/**
 * INSPINIA - Responsive Admin Theme
 *
 * Inspinia theme use AngularUI Router to manage routing and views
 * Each view are defined as state.
 * Initial there are written state for all view in theme.
 *
 */
function config($stateProvider, $urlRouterProvider, $ocLazyLoadProvider, IdleProvider, KeepaliveProvider, dropzoneOpsProvider) {

    // Configure Idle settings
    IdleProvider.idle(5); // in seconds
    IdleProvider.timeout(120); // in seconds

    $urlRouterProvider.otherwise(function ($injector) {
        var $state = $injector.get('$state');
        $state.go('logins');
    });

    $ocLazyLoadProvider.config({
        // Set to true if you want to see what and when is dynamically loaded
        debug: false
    });

    //dropzoneOpsProvider.setOptions({
    //    url: 'api/Product/UploadProductImages',
    //    acceptedFiles: 'image/jpeg, images/jpg, image/png',
    //    addRemoveLinks: true,
    //    dictDefaultMessage: 'Click to add or drag and drop  product images',
    //    dictRemoveFile: 'Remove image',
    //    dictResponseError: 'Could not upload this image',
    //    autoProcessQueue: false
    //});

    dropzoneOpsProvider.setOptions({
        url: 'api/Product/UploadProductImages',
        acceptedFiles: 'image/jpeg, images/jpg, image/png',
        addRemoveLinks: true,
        dictDefaultMessage: 'Click to add or drag and drop  product images',
        dictRemoveFile: 'Remove image',
        dictResponseError: 'Could not upload this image'
    });

    $stateProvider

        //.state('dashboards', {
        //    abstract: true,
        //    url: "/dashboards",
        //    templateUrl: "app/views/common/content.html",
        //})
        .state('logins', {
            url: "/login",
            templateUrl: "app/views/login.html",
            data: { pageTitle: 'Login', specialClass: 'gray-bg' }
        })
        .state('register', {
            url: "/register",
            templateUrl: "app/views/register.html",
            data: { pageTitle: 'Register', specialClass: 'gray-bg' }
        })
        .state('forgot_password', {
            url: "/forgot_password",
            templateUrl: "app/views/forgot_password.html",
            data: { pageTitle: 'Forgot password', specialClass: 'gray-bg' }
        })
        .state('products', {
            abstract: true,
            url: "/products",
            templateUrl: "app/views/common/content.html"
        })
        .state('products.productsList', {
            url: "/productsList",
            templateUrl: "app/views/products/products/products.html",
            data: { pageTitle: 'Products' }
        })
        .state('sell', {
            abstract: true,
            url: "/sales",
            templateUrl: "app/views/common/content.html"
        })
        .state('sell.dosell', {
            url: "/sell",
            templateUrl: "app/views/sell/sell/sell.html",
            data: { pageTitle: 'Sell' },
            resolve: {
                loadPlugin: function ($ocLazyLoad) {
                    return $ocLazyLoad.load([
                        {
                            files: ['Scripts/plugins/blueimp/jquery.blueimp-gallery.min.js', 'Content/plugins/blueimp/css/blueimp-gallery.min.css']
                        },
                        {
                            insertBefore: '#loadBefore',
                            name: 'localytics.directives',
                            files: ['Content/plugins/chosen/bootstrap-chosen.css', 'Scripts/plugins/chosen/chosen.jquery.js', 'Scripts/plugins/chosen/chosen.js']
                        }
                    ]);
                }
            }
        })
        .state('reporting', {
            abstract: true,
            url: "/reporting",
            templateUrl: "app/views/common/content.html"
        })
        .state('reporting.retaildashboard', {
            url: "/retaildashboard",
            templateUrl: "app/views/reporting/retaildashboard/retaildashboard.html",
            data: { pageTitle: 'Retail Dashboard' },
            resolve: {
                loadPlugin: function ($ocLazyLoad) {
                    return $ocLazyLoad.load([
                        {
                            name: 'angles',
                            files: ['Scripts/plugins/chartJs/angles.js', 'Scripts/plugins/chartJs/Chart.min.js']
                        },
                        {
                            name: 'angular-peity',
                            files: ['Scripts/plugins/peity/jquery.peity.min.js', 'Scripts/plugins/peity/angular-peity.js']
                        },
                        {
                            serie: true,
                            name: 'angular-flot',
                            files: ['Scripts/plugins/flot/jquery.flot.js', 'Scripts/plugins/flot/jquery.flot.time.js', 'Scripts/plugins/flot/jquery.flot.tooltip.min.js', 'Scripts/plugins/flot/jquery.flot.spline.js', 'Scripts/plugins/flot/jquery.flot.resize.js', 'Scripts/plugins/flot/jquery.flot.pie.js', 'Scripts/plugins/flot/curvedLines.js', 'Scripts/plugins/flot/angular-flot.js',]
                        },
                        {
                            serie: true,
                            files: ['Content/plugins/c3/c3.min.css', 'Scripts/plugins/d3/d3.min.js', 'Scripts/plugins/c3/c3.min.js']
                        },
                        {
                            serie: true,
                            name: 'gridshore.c3js.chart',
                            files: ['Scripts/plugins/c3/c3-angular.min.js']
                        }
                    ]);
                }
            }
        })
        .state('products.addproduct', {
            url: "/addproduct",
            templateUrl: "app/views/products/products/addEditProduct.html",
            data: { pageTitle: 'Add Product' },
            resolve: {
                loadPlugin: function ($ocLazyLoad) {
                    return $ocLazyLoad.load([
                        {
                            files: ['Content/plugins/summernote/summernote.css', 'Content/plugins/summernote/summernote-bs3.css', 'Scripts/plugins/summernote/summernote.min.js']
                        },
                        {
                            name: 'summernote',
                            files: ['Content/plugins/summernote/summernote.css', 'Content/plugins/summernote/summernote-bs3.css', 'Scripts/plugins/summernote/summernote.min.js', 'Scripts/plugins/summernote/angular-summernote.min.js']
                        },
                        {
                            files: ['Scripts/plugins/jasny/jasny-bootstrap.min.js', 'Content/plugins/jasny/jasny-bootstrap.min.css']
                        },
                        {
                            name: 'ui.switchery',
                            files: ['Content/plugins/switchery/switchery.css', 'Scripts/plugins/switchery/switchery.js', 'Scripts/plugins/switchery/ng-switchery.js']
                        },
                        {
                            files: ['Content/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css']
                        },
                        {
                            name: 'ui.select',
                            files: ['Scripts/plugins/ui-select/select.min.js', 'Content/plugins/ui-select/select.min.css']
                        },
                        {
                            name: 'ngTagsInput',
                            files: ['Scripts/plugins/ngTags//ng-tags-input.min.js', 'Content/plugins/ngTags/ng-tags-input-custom.min.css']
                        },
                    ]);
                }
            }
        })
        .state('products.suppliers', {
            url: "/suppliers",
            templateUrl: "app/views/products/suppliers/suppliers.html",
            data: { pageTitle: 'Suppliers' }
        })
        .state('products.addsupplier', {
            url: "/addsupplier",
            templateUrl: "app/views/products/suppliers/addEditSupplier.html",
            data: { pageTitle: 'Suppliers' }
        })
        .state('products.discountOffers', {
            url: "/discountOffers",
            templateUrl: "app/views/products/discountOffers/discountOffers.html",
            data: { pageTitle: 'Discount Offers' }
        })
        .state('products.addDiscountOffer', {
            url: "/addDiscountOffer",
            templateUrl: "app/views/products/discountOffers/addEditDiscountOffer.html",
            data: { pageTitle: 'Discount Offers' },
            resolve: {
                loadPlugin: function ($ocLazyLoad) {
                    return $ocLazyLoad.load([
                        {
                            files: ['Scripts/plugins/moment/moment.min.js']
                        },
                        {
                            serie: true,
                            files: ['Scripts/plugins/daterangepicker/daterangepicker.js', 'Content/plugins/daterangepicker/daterangepicker-bs3.css']
                        },
                        {
                            name: 'daterangepicker',
                            files: ['Scripts/plugins/daterangepicker/angular-daterangepicker.js']
                        }
                    ]);
                }
            }
        })
        .state('products.stockcontrol', {
            url: "/stocktransfers",
            templateUrl: "app/views/products/stockControl/stockControl.html",
            data: { pageTitle: 'Stock Transfers' }
        })
        .state('products.purchaseOrder', {
            url: "/purchaseOrder",
            templateUrl: "app/views/products/stockControl/addEditPurchaseOrder.html",
            data: { pageTitle: 'Purchase Order' }
        })
        .state('products.returnOrder', {
            url: "/returnOrder",
            templateUrl: "app/views/products/stockControl/addEditReturnOrder.html",
            data: { pageTitle: 'Return Order' }
        })
        .state('products.transferOrder', {
            url: "/transferOrder",
            templateUrl: "app/views/products/stockControl/addEditTransferOrder.html",
            data: { pageTitle: 'Transfer Order' },
            resolve: {
                loadPlugin: function ($ocLazyLoad) {
                    return $ocLazyLoad.load([
                        {
                            files: ['Scripts/plugins/moment/moment.min.js']
                        },
                        {
                            name: 'datePicker',
                            files: ['Content/plugins/datapicker/angular-datapicker.css', 'Scripts/plugins/datapicker/angular-datepicker.js']
                        }
                    ]);
                }
            }
        })
        .state('products.types', {
            url: "/categories",
            templateUrl: "app/views/products/productTypes/productTypes.html",
            data: { pageTitle: 'Tags' },
            resolve: {
                loadPlugin: function ($ocLazyLoad) {
                    return $ocLazyLoad.load([
                        {
                            insertBefore: '#loadBefore',
                            name: 'toaster',
                            files: ['Scripts/plugins/toastr/toastr.min.js', 'Content/plugins/toastr/toastr.min.css']
                        },
                        {
                            files: ['Scripts/plugins/footable/footable.all.min.js', 'Content/plugins/footable/footable.core.css']
                        },
                        {
                            name: 'ui.footable',
                            files: ['Scripts/plugins/footable/angular-footable.js']
                        }
                    ]);
                }
            }
        })
        .state('products.tags', {
            url: "/tags",
            templateUrl: "app/views/products/tags/tags.html",
            data: { pageTitle: 'Tags' },
            resolve: {
                loadPlugin: function ($ocLazyLoad) {
                    return $ocLazyLoad.load([
                        {
                            insertBefore: '#loadBefore',
                            name: 'toaster',
                            files: ['Scripts/plugins/toastr/toastr.min.js', 'Content/plugins/toastr/toastr.min.css']
                        },
                        {
                            files: ['Scripts/plugins/footable/footable.all.min.js', 'Content/plugins/footable/footable.core.css']
                        },
                        {
                            name: 'ui.footable',
                            files: ['Scripts/plugins/footable/angular-footable.js']
                        }
                    ]);
                }
            }
        })
        .state('products.brands', {
            url: "/brands",
            templateUrl: "app/views/products/brands/brands.html",
            data: { pageTitle: 'Brands' },
            resolve: {
                loadPlugin: function ($ocLazyLoad) {
                    return $ocLazyLoad.load([
                        {
                            insertBefore: '#loadBefore',
                            name: 'toaster',
                            files: ['Scripts/plugins/toastr/toastr.min.js', 'Content/plugins/toastr/toastr.min.css']
                        },
                        {
                            files: ['Scripts/plugins/footable/footable.all.min.js', 'Content/plugins/footable/footable.core.css']
                        },
                        {
                            name: 'ui.footable',
                            files: ['Scripts/plugins/footable/angular-footable.js']
                        }
                    ]);
                }
            }
        })
        .state('setup', {
            abstract: true,
            url: "/setup",
            templateUrl: "app/views/common/content.html"
        })
        .state('customers', {
            abstract: true,
            url: "/customers",
            templateUrl: "app/views/common/content.html"
        })
        .state('customers.customersList', {
            url: "/customersList",
            templateUrl: "app/views/customers/customers/customers.html",
            data: { pageTitle: 'Customers' }
        })
        .state('customers.addcustomer', {
            url: "/addcustomer",
            templateUrl: "app/views/customers/customers/addCustomer.html",
            data: { pageTitle: 'Add Customer' },
            resolve: {
                loadPlugin: function ($ocLazyLoad) {
                    return $ocLazyLoad.load([
                        {
                            name: 'summernote',
                            files: ['Content/plugins/summernote/summernote.css', 'Content/plugins/summernote/summernote-bs3.css', 'Scripts/plugins/summernote/summernote.min.js', 'Scripts/plugins/summernote/angular-summernote.min.js']
                        },
                        {
                            files: ['Scripts/plugins/jasny/jasny-bootstrap.min.js', 'Content/plugins/jasny/jasny-bootstrap.min.css']
                        },
                        {
                            name: 'ui.switchery',
                            files: ['Content/plugins/switchery/switchery.css', 'Scripts/plugins/switchery/switchery.js', 'Scripts/plugins/switchery/ng-switchery.js']
                        },
                        {
                            files: ['Content/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css']
                        },
                        {
                            name: 'ui.select',
                            files: ['Scripts/plugins/ui-select/select.min.js', 'Content/plugins/ui-select/select.min.css']
                        },
                        {
                            name: 'ngTagsInput',
                            files: ['Scripts/plugins/ngTags//ng-tags-input.min.js', 'Content/plugins/ngTags/ng-tags-input-custom.min.css']
                        },
                    ]);
                }
            }
        })
        .state('customers.updateCustomer', {
            url: "/updateCustomer",
            templateUrl: "app/views/customers/customers/updateCustomer.html",
            data: { pageTitle: 'Update Customer' },
            resolve: {
                loadPlugin: function ($ocLazyLoad) {
                    return $ocLazyLoad.load([
                        {
                            name: 'summernote',
                            files: ['Content/plugins/summernote/summernote.css', 'Content/plugins/summernote/summernote-bs3.css', 'Scripts/plugins/summernote/summernote.min.js', 'Scripts/plugins/summernote/angular-summernote.min.js']
                        },
                        {
                            files: ['Scripts/plugins/jasny/jasny-bootstrap.min.js', 'Content/plugins/jasny/jasny-bootstrap.min.css']
                        },
                        {
                            name: 'ui.switchery',
                            files: ['Content/plugins/switchery/switchery.css', 'Scripts/plugins/switchery/switchery.js', 'Scripts/plugins/switchery/ng-switchery.js']
                        },
                        {
                            files: ['Content/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css']
                        },
                        {
                            name: 'ui.select',
                            files: ['Scripts/plugins/ui-select/select.min.js', 'Content/plugins/ui-select/select.min.css']
                        },
                        {
                            name: 'ngTagsInput',
                            files: ['Scripts/plugins/ngTags//ng-tags-input.min.js', 'Content/plugins/ngTags/ng-tags-input-custom.min.css']
                        },
                    ]);
                }
            }
        })
        .state('customers.groups', {
            url: "/groups",
            templateUrl: "app/views/customers/groups/groups.html",
            data: { pageTitle: 'Customer Groups' },
            resolve: {
                loadPlugin: function ($ocLazyLoad) {
                    return $ocLazyLoad.load([
                        {
                            insertBefore: '#loadBefore',
                            name: 'toaster',
                            files: ['Scripts/plugins/toastr/toastr.min.js', 'Content/plugins/toastr/toastr.min.css']
                        },
                        {
                            files: ['Scripts/plugins/footable/footable.all.min.js', 'Content/plugins/footable/footable.core.css']
                        },
                        {
                            name: 'ui.footable',
                            files: ['Scripts/plugins/footable/angular-footable.js']
                        }
                    ]);
                }
            }
        })
        .state('customers.marketting', {
            url: "/marketting",
            templateUrl: "app/views/customers/marketting/marketting.html",
            data: { pageTitle: 'Marketing' }
        })
        .state('setting', {
            abstract: true,
            url: "/setting",
            templateUrl: "app/views/common/content.html"
        })
        .state('setting.setting', {
            url: "/setting",
            templateUrl: "app/views/setting/setting/setting.html",
            data: { pageTitle: 'Setting' }
        })
        .state('setting.store', {
            url: "/store",
            templateUrl: "app/views/setting/store/storeSetup.html",
            data: { pageTitle: 'Store Setup' },
            resolve: {
                loadPlugin: function ($ocLazyLoad) {
                    return $ocLazyLoad.load([
                        {
                            name: 'summernote',
                            files: ['Content/plugins/summernote/summernote.css', 'Content/plugins/summernote/summernote-bs3.css', 'Scripts/plugins/summernote/summernote.min.js', 'Scripts/plugins/summernote/angular-summernote.min.js']
                        },
                        {
                            files: ['Scripts/plugins/jasny/jasny-bootstrap.min.js', 'Content/plugins/jasny/jasny-bootstrap.min.css']
                        },
                        {
                            name: 'ui.switchery',
                            files: ['Content/plugins/switchery/switchery.css', 'Scripts/plugins/switchery/switchery.js', 'Scripts/plugins/switchery/ng-switchery.js']
                        },
                        {
                            files: ['Content/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css']
                        },
                        {
                            name: 'ui.select',
                            files: ['Scripts/plugins/ui-select/select.min.js', 'Content/plugins/ui-select/select.min.css']
                        },
                        {
                            name: 'ngTagsInput',
                            files: ['Scripts/plugins/ngTags//ng-tags-input.min.js', 'Content/plugins/ngTags/ng-tags-input-custom.min.css']
                        },
                    ]);
                }
            }
        });


}
angular
    .module('inspinia')
    .config(config)
    .run(function ($rootScope, $state) {
        $rootScope.$state = $state;
    });
