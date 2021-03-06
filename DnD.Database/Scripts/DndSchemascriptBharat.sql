USE [master]
GO
/****** Object:  Database [DND]    Script Date: 11/19/2017 6:02:54 AM ******/
CREATE DATABASE [DND]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DND', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.BTHAVVA\MSSQL\DATA\DND.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DND_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.BTHAVVA\MSSQL\DATA\DND_log.ldf' , SIZE = 1792KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DND] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DND].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DND] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DND] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DND] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DND] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DND] SET ARITHABORT OFF 
GO
ALTER DATABASE [DND] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DND] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DND] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DND] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DND] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DND] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DND] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DND] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DND] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DND] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DND] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DND] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DND] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DND] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DND] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DND] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DND] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DND] SET RECOVERY FULL 
GO
ALTER DATABASE [DND] SET  MULTI_USER 
GO
ALTER DATABASE [DND] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DND] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DND] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DND] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DND] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DND]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](70) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Currency]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[CurrencyId] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyName] [nvarchar](100) NOT NULL,
	[CurrencySymbol] [nvarchar](10) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[CurrencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Company] [nvarchar](100) NULL,
	[CustomerCode] [nvarchar](100) NULL,
	[CustomerGroupId] [int] NULL,
	[IsLoyaltyEnabled] [bit] NULL,
	[DateOfBirth] [datetime] NULL,
	[Sex] [nvarchar](10) NULL,
	[Phone] [nvarchar](20) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Fax] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[Website] [nvarchar](50) NULL,
	[Twitter] [nvarchar](50) NULL,
	[IsCustomerOptedOutMail] [bit] NULL,
	[PhysicalAddressStreet1] [nvarchar](200) NULL,
	[PhysicalAddressStreet2] [nvarchar](200) NULL,
	[PhysicalSuburb] [nvarchar](100) NULL,
	[PhysicalCity] [nvarchar](100) NULL,
	[PhysicalPostcode] [nvarchar](50) NULL,
	[PhysicalState] [nvarchar](50) NULL,
	[PhysicalCountryId] [int] NULL,
	[IsPostalAddSameAsPhysicalAdd] [bit] NULL,
	[PostalAddressStree1] [nvarchar](200) NULL,
	[PostalAddressStreet2] [nvarchar](200) NULL,
	[PostalSuburb] [nvarchar](100) NULL,
	[PostalCity] [nvarchar](100) NULL,
	[PostalPostCode] [nvarchar](50) NULL,
	[PostalState] [nvarchar](50) NULL,
	[PostalCountryId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerGroup]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerGroup](
	[CustomerGroupId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerGroupMasterId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_CustomerGroup] PRIMARY KEY CLUSTERED 
(
	[CustomerGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerGroupMaster]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerGroupMaster](
	[CustomerGroupMasterId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_CustomerGroupMasterId] PRIMARY KEY CLUSTERED 
(
	[CustomerGroupMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DealnDonePlan]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealnDonePlan](
	[DealnDonePlanId] [int] IDENTITY(1,1) NOT NULL,
	[DealnDonePlanName] [nvarchar](100) NULL,
	[PlanCost] [decimal](18, 2) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_DealnDonePlan] PRIMARY KEY CLUSTERED 
(
	[DealnDonePlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountOffer]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountOffer](
	[DiscountOfferId] [int] IDENTITY(1,1) NOT NULL,
	[OfferName] [nvarchar](100) NOT NULL,
	[OfferDisplayText] [nvarchar](400) NULL,
	[DiscountTypeId] [int] NULL,
	[DiscountOfferTypeId] [int] NULL,
	[DiscountPercentOff] [decimal](18, 0) NULL,
	[BuyUnitsToGetUnits] [int] NULL,
	[GetUnitsWhenBoughtUnits] [int] NULL,
	[BuyUnitsToGetPercentOff] [decimal](18, 0) NULL,
	[OfferValidFrom] [datetime] NULL,
	[OfferValidTo] [datetime] NULL,
	[DiscountOfferOrderAmount] [decimal](18, 0) NULL,
	[DiscountOfferDiscountPercentOnOrderAmount] [int] NULL,
 CONSTRAINT [PK_DiscountOffer] PRIMARY KEY CLUSTERED 
(
	[DiscountOfferId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountOfferCustomer]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountOfferCustomer](
	[DiscountOfferCustomerId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountOfferId] [int] NOT NULL,
	[CustomerGroupId] [int] NOT NULL,
 CONSTRAINT [PK_DiscountOfferCustomer] PRIMARY KEY CLUSTERED 
(
	[DiscountOfferCustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountOfferStoreOutlet]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountOfferStoreOutlet](
	[DiscountOfferStoreOutletId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountOfferId] [int] NOT NULL,
	[StoreOutletId] [int] NOT NULL,
 CONSTRAINT [PK_DiscountOfferStoreOutlet] PRIMARY KEY CLUSTERED 
(
	[DiscountOfferStoreOutletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountOfferType]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountOfferType](
	[DiscountOfferTypeId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountOfferTypeName] [nvarchar](300) NULL,
 CONSTRAINT [PK_DiscountOfferType] PRIMARY KEY CLUSTERED 
(
	[DiscountOfferTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountType]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountType](
	[DiscountTypeId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_DiscountType] PRIMARY KEY CLUSTERED 
(
	[DiscountTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountTypeData]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountTypeData](
	[DiscountTypeDataId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountOfferId] [int] NOT NULL,
	[DiscountTypeId] [int] NOT NULL,
	[DiscountOfferTypeId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
 CONSTRAINT [PK_DiscountTypeData] PRIMARY KEY CLUSTERED 
(
	[DiscountTypeDataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DisplayPrice]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DisplayPrice](
	[DisplayPriceId] [int] IDENTITY(1,1) NOT NULL,
	[DisplayPriceName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_DisplayPrice] PRIMARY KEY CLUSTERED 
(
	[DisplayPriceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DNDUser]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNDUser](
	[DNDUserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[MiddleName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[PasswordSalt] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_DNDUser] PRIMARY KEY CLUSTERED 
(
	[DNDUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LabelPrinterFormat]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabelPrinterFormat](
	[LabelPrinterFormatId] [int] IDENTITY(1,1) NOT NULL,
	[FormatName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_LabelPrinterFormat] PRIMARY KEY CLUSTERED 
(
	[LabelPrinterFormatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PricingTier]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PricingTier](
	[PricingTierId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MarkupPercentage] [decimal](18, 2) NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_PricingTier] PRIMARY KEY CLUSTERED 
(
	[PricingTierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](200) NOT NULL,
	[ProductHandle] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ProductTypeId] [int] NOT NULL,
	[ProductBrandId] [int] NOT NULL,
	[SupplierId] [int] NULL,
	[SupplierCode] [nvarchar](100) NULL,
	[SalesAccountCode] [nvarchar](100) NULL,
	[PurchaseAccountCode] [nvarchar](100) NULL,
	[IsProductCanBeSold] [bit] NOT NULL,
	[ProductLoyalty] [decimal](16, 2) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[StoreId] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsProductHasVariants] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductBrand]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductBrand](
	[ProductBrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](100) NULL,
	[BrandDescription] [nvarchar](300) NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[StoreId] [int] NULL,
 CONSTRAINT [PK_ProductBrand] PRIMARY KEY CLUSTERED 
(
	[ProductBrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductImage](
	[ProductImageId] [int] IDENTITY(1,1) NOT NULL,
	[Image] [varbinary](max) NOT NULL,
	[IsPrimaryImage] [bit] NOT NULL,
	[FileType] [nvarchar](50) NOT NULL,
	[FileName] [nvarchar](100) NOT NULL,
	[ProductId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[ProductImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductInventory]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInventory](
	[ProductInventoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductVariantId] [int] NULL,
	[ProductVariantSKU] [nvarchar](50) NULL,
	[ProductVariantSupplierCode] [nvarchar](50) NULL,
	[StoreOutletId] [int] NULL,
	[StoreOutletCurrentInventory] [int] NULL,
	[StoreOutletReorderPoint] [int] NULL,
	[StoreOutletReorderAmount] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[ProductVariantSupplyPrice] [decimal](18, 0) NULL,
	[ProductVariantMarkupPercentage] [decimal](18, 0) NULL,
	[ProductVariantPriceExcludingTax] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ProductInventory] PRIMARY KEY CLUSTERED 
(
	[ProductInventoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductOutletPricing]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOutletPricing](
	[ProductOutletPricingId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[PricingTierId] [int] NULL,
	[StoreOutletId] [int] NULL,
	[SalestaxId] [int] NULL,
	[TaxAmount] [decimal](18, 2) NULL,
	[ProductPriceIncludingTax] [decimal](18, 2) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductOutletPricing] PRIMARY KEY CLUSTERED 
(
	[ProductOutletPricingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductPricing]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPricing](
	[ProductPricingId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[PricingTierId] [int] NULL,
	[SupplyPrice] [decimal](18, 2) NULL,
	[MarkupPercentage] [decimal](16, 2) NULL,
	[ProductPriceExcludingTax] [decimal](18, 2) NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductPricing] PRIMARY KEY CLUSTERED 
(
	[ProductPricingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductSupplier]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSupplier](
	[ProductSupplierId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](100) NOT NULL,
	[SupplierDefaultMarkup] [decimal](18, 2) NULL,
	[Description] [nvarchar](max) NULL,
	[Firstname] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NULL,
	[Company] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Fax] [nvarchar](20) NULL,
	[Website] [nvarchar](100) NULL,
	[Twitter] [nvarchar](100) NULL,
	[AddressStreet1] [nvarchar](200) NULL,
	[AddressStreet2] [nvarchar](200) NULL,
	[Postcode] [nvarchar](20) NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[StoreId] [int] NULL,
 CONSTRAINT [PK_ProductSupplier] PRIMARY KEY CLUSTERED 
(
	[ProductSupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductTag]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTag](
	[ProductTagId] [int] IDENTITY(1,1) NOT NULL,
	[ProductTagMasterId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductTag] PRIMARY KEY CLUSTERED 
(
	[ProductTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductTagMaster]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTagMaster](
	[ProductTagMasterId] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](100) NULL,
	[StoreId] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductTagMaster] PRIMARY KEY CLUSTERED 
(
	[ProductTagMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeName] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[StoreId] [int] NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductVariant]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVariant](
	[ProductVariantId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductVariantName] [nvarchar](300) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ProductVariant] PRIMARY KEY CLUSTERED 
(
	[ProductVariantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductVariantAttribute]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVariantAttribute](
	[ProductVariantAttributeId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductVariantAttributeMasterId] [int] NOT NULL,
	[VariantAttributeTagName] [nvarchar](100) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[StoreId] [int] NULL,
 CONSTRAINT [PK_ProductVariantAttribute] PRIMARY KEY CLUSTERED 
(
	[ProductVariantAttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductVariantAttributeMaster]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVariantAttributeMaster](
	[ProductVariantAttributeMasterId] [int] IDENTITY(1,1) NOT NULL,
	[VariantAttributeName] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductVariantAttributeMaster] PRIMARY KEY CLUSTERED 
(
	[ProductVariantAttributeMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseStockOrder]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseStockOrder](
	[PurchaseStockOrderId] [int] IDENTITY(1,1) NOT NULL,
	[StockOrderTypeId] [int] NOT NULL,
	[OrderName] [nvarchar](200) NOT NULL,
	[OrderFromId] [int] NOT NULL,
	[DeliveryDueDate] [datetime] NOT NULL,
	[PurchaseStockOrderNumber] [nvarchar](100) NULL,
	[DeliveryToOutletId] [int] NOT NULL,
	[SupplierInvoice] [nvarchar](100) NULL,
	[IsAutoFillFromReorderPoint] [bit] NOT NULL,
	[OrderCreatedDate] [datetime] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_PurchaseStockOrder] PRIMARY KEY CLUSTERED 
(
	[PurchaseStockOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RegisterOpenCloseStatusType]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisterOpenCloseStatusType](
	[RegisterOpenCloseStatusTypeId] [int] IDENTITY(1,1) NOT NULL,
	[RegisterOpenCloseStatusTypeName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_RegisterOpenCloseStatusType] PRIMARY KEY CLUSTERED 
(
	[RegisterOpenCloseStatusTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReturnStockOrder]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnStockOrder](
	[ReturnStockOrderId] [int] IDENTITY(1,1) NOT NULL,
	[StockOrderTypeId] [int] NOT NULL,
	[OrderName] [nvarchar](200) NOT NULL,
	[DeliveryDueDate] [datetime] NOT NULL,
	[DeliveryToSupplierId] [int] NOT NULL,
	[ReturnNumber] [nvarchar](100) NULL,
	[ReturnFromOutletId] [int] NOT NULL,
	[SupplierInvoice] [nvarchar](100) NULL,
	[IsAutoFillFromReorderPoint] [bit] NOT NULL,
	[OrderCreatedDate] [datetime] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ReturnStockOrder] PRIMARY KEY CLUSTERED 
(
	[ReturnStockOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleManagement]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleManagement](
	[RoleManagementId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_RoleManagement] PRIMARY KEY CLUSTERED 
(
	[RoleManagementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesTax]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesTax](
	[SalesTaxId] [int] IDENTITY(1,1) NOT NULL,
	[TaxName] [nvarchar](100) NOT NULL,
	[TaxRate] [decimal](18, 2) NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SalesTax] PRIMARY KEY CLUSTERED 
(
	[SalesTaxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SellOpenCloseRegister]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellOpenCloseRegister](
	[SellOpenCloseRegisterId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[LoggedInUserId] [int] NOT NULL,
	[LoggedInUserTypeId] [int] NOT NULL,
	[StoreOutletId] [int] NOT NULL,
	[StoreOutletRegisterId] [int] NOT NULL,
	[RegisterOpenCloseStatusTypeId] [int] NOT NULL,
	[RegisterOpeningDateTime] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SellOpenCloseRegister] PRIMARY KEY CLUSTERED 
(
	[SellOpenCloseRegisterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupAccount]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupAccount](
	[SetupAccountId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupAccount] PRIMARY KEY CLUSTERED 
(
	[SetupAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupAccountClearOutData]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupAccountClearOutData](
	[SetupAccountClearOutDataId] [int] IDENTITY(1,1) NOT NULL,
	[SetupAccountId] [int] NOT NULL,
	[IsClearSalesHistory] [bit] NULL,
	[IsClearSalesHistoryAndProducts] [bit] NULL,
	[IsClearCustomers] [bit] NULL,
	[IsClearOutDataCompleted] [bit] NULL,
	[PlanSelectedId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupAccountClearOutData] PRIMARY KEY CLUSTERED 
(
	[SetupAccountClearOutDataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupContactInformation]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupContactInformation](
	[SetupContactInformationId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[ContactFirstName] [nvarchar](100) NULL,
	[ContactLastName] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Website] [nvarchar](50) NULL,
	[TwitterHandle] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupContactInformation] PRIMARY KEY CLUSTERED 
(
	[SetupContactInformationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupGeneralStoreSettings]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupGeneralStoreSettings](
	[SetupGeneralStoreSettingsId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[StoreName] [nvarchar](50) NOT NULL,
	[StorePrivateURL] [nvarchar](100) NULL,
	[DefaultCurrencyId] [int] NULL,
	[TimeZoneId] [int] NULL,
	[DisplayPricesId] [int] NULL,
	[LabelPrinterFormatId] [int] NULL,
	[SKUGenerationId] [int] NULL,
	[CurrentSequenceNumber] [nvarchar](100) NULL,
	[UserSwitchingSecurityId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupGeneralStoreSettings] PRIMARY KEY CLUSTERED 
(
	[SetupGeneralStoreSettingsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupLoyaltyPointsId]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupLoyaltyPointsId](
	[SetupLoyaltyPointsId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[DoEnableLoyaltyPoints] [bit] NULL,
	[SpendingAmountForLoyalty] [decimal](18, 2) NULL,
	[EarningAmountForLoyalty] [decimal](18, 2) NULL,
	[DoOfferBonusLoyaltyPoints] [bit] NULL,
	[BonusLoyaltyAmount] [decimal](18, 2) NULL,
	[IsShowWelcomeEmail] [bit] NULL,
	[LoyaltyWelcomEmailSubject] [nvarchar](500) NULL,
	[LoyaltyWelcomEmailMessage] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupLoyaltyPointsId] PRIMARY KEY CLUSTERED 
(
	[SetupLoyaltyPointsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupPaymentType]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupPaymentType](
	[SetupPaymentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[PaymentTypeName] [nvarchar](100) NOT NULL,
	[PaymentTypeCustomName] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupPaymentType] PRIMARY KEY CLUSTERED 
(
	[SetupPaymentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupRegistersAskForNote]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupRegistersAskForNote](
	[SetupRegistersAskForNoteId] [int] IDENTITY(1,1) NOT NULL,
	[AskForNoteName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupRegistersAskForNote] PRIMARY KEY CLUSTERED 
(
	[SetupRegistersAskForNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupRegistersCashManagement]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupRegistersCashManagement](
	[SetupRegistersCashManagementId] [int] IDENTITY(1,1) NOT NULL,
	[CashManagementName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupRegistersCashManagement] PRIMARY KEY CLUSTERED 
(
	[SetupRegistersCashManagementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupRegistersReceiptTemplate]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupRegistersReceiptTemplate](
	[SetupRegistersReceiptTemplateId] [int] IDENTITY(1,1) NOT NULL,
	[ReceiptTemplateName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupRegistersReceiptTemplate] PRIMARY KEY CLUSTERED 
(
	[SetupRegistersReceiptTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupSalesTaxGroupId]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupSalesTaxGroupId](
	[SetupSalesTaxGroupId] [int] IDENTITY(1,1) NOT NULL,
	[SetupSalesTaxGroupMasterId] [int] NOT NULL,
	[SalesTaxId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupSalesTaxGroupId] PRIMARY KEY CLUSTERED 
(
	[SetupSalesTaxGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupSalesTaxGroupMaster]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupSalesTaxGroupMaster](
	[SetupSalesTaxGroupMasterId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[TaxGroupName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupSalesTaxGroupMaster] PRIMARY KEY CLUSTERED 
(
	[SetupSalesTaxGroupMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupStoreAddress]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupStoreAddress](
	[SetupStoreAddressId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[PhysicalAddressStreet1] [nvarchar](200) NULL,
	[PhysicalAddressStreet2] [nvarchar](200) NULL,
	[PhysicalSuburb] [nvarchar](50) NULL,
	[PhysicalCity] [nvarchar](50) NULL,
	[PhysicalPostcode] [nvarchar](20) NULL,
	[PhysicalState] [nvarchar](50) NULL,
	[PhysicalCountryId] [int] NULL,
	[IsPostalAddressSameAsPhysicalAddress] [bit] NULL,
	[PostalAddressStreet1] [nvarchar](200) NULL,
	[PostalAddressStreet2] [nvarchar](200) NULL,
	[PostalSuburb] [nvarchar](50) NULL,
	[PostalCity] [nvarchar](50) NULL,
	[PostalPostCode] [nvarchar](20) NULL,
	[PostalState] [nvarchar](50) NULL,
	[PostalCountryId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupStoreAddress] PRIMARY KEY CLUSTERED 
(
	[SetupStoreAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SKUGenerationType]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SKUGenerationType](
	[SKUGenerationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[SKUGenerationName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SKUGenerationType] PRIMARY KEY CLUSTERED 
(
	[SKUGenerationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockOrderStatus]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockOrderStatus](
	[StockOrderStatusId] [int] IDENTITY(1,1) NOT NULL,
	[StockOrderStatusName] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_StockOrderStatus] PRIMARY KEY CLUSTERED 
(
	[StockOrderStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockOrderType]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockOrderType](
	[StockOrderTypeId] [int] IDENTITY(1,1) NOT NULL,
	[OrderTypeName] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_StockOrderType] PRIMARY KEY CLUSTERED 
(
	[StockOrderTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Store]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[StoreId] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [nvarchar](100) NOT NULL,
	[StoreURL] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StoreOutlet]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreOutlet](
	[StoreOutletId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[OutletName] [nvarchar](100) NOT NULL,
	[OutletDefaultSalesTaxId] [int] NULL,
	[OutletOrderNumberPrefix] [nvarchar](100) NULL,
	[OutletOrderNumber] [nvarchar](100) NULL,
	[SupplierReturnPrefix] [nvarchar](100) NULL,
	[SupplierReturnNumber] [nvarchar](100) NULL,
	[IsNegativeInventory] [bit] NOT NULL,
	[PhysicalAddressStreet1] [nvarchar](200) NULL,
	[PhysicalAddressStreet2] [nvarchar](200) NULL,
	[Suburb] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[Postcode] [nvarchar](20) NULL,
	[State] [nvarchar](50) NULL,
	[CountryId] [int] NULL,
	[TimezoneId] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[TwitterHandle] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_StoreOutlet] PRIMARY KEY CLUSTERED 
(
	[StoreOutletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StoreOutletRegister]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreOutletRegister](
	[StoreOutletRegisterId] [int] IDENTITY(1,1) NOT NULL,
	[StoreOutletId] [int] NOT NULL,
	[RegisterName] [nvarchar](100) NOT NULL,
	[CashManagementId] [int] NULL,
	[ReceiptTemplateId] [int] NULL,
	[ReceiptNumber] [nvarchar](50) NULL,
	[ReceiptPrefix] [nvarchar](50) NULL,
	[ReceiptSufix] [nvarchar](50) NULL,
	[IsSelectUserForNextSaleAtEndOfSale] [bit] NULL,
	[DoEmailReceipt] [bit] NULL,
	[DoPrintReceipt] [nchar](10) NULL,
	[AskForNoteId] [int] NULL,
	[DoPrintNoteOnReceipt] [bit] NULL,
	[DoShowDiscountsOnReceipts] [bit] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_StoreOutletRegister] PRIMARY KEY CLUSTERED 
(
	[StoreOutletRegisterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StoreUser]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StoreUser](
	[StoreUserId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[StoreOutletId] [int] NOT NULL,
	[IsAllOutletUser] [bit] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[ProfileImage] [varbinary](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_StoreUser] PRIMARY KEY CLUSTERED 
(
	[StoreUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TimeZone]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeZone](
	[TimeZoneId] [int] IDENTITY(1,1) NOT NULL,
	[DsiplayName] [nvarchar](100) NOT NULL,
	[StandardName] [nvarchar](100) NULL,
	[HasDST] [bit] NOT NULL,
	[UTCOffset] [time](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_TimeZone] PRIMARY KEY CLUSTERED 
(
	[TimeZoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransferStockOrder]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransferStockOrder](
	[TransferStockOrderId] [int] IDENTITY(1,1) NOT NULL,
	[StockOrderTypeId] [int] NOT NULL,
	[OrderName] [nvarchar](200) NOT NULL,
	[DeliveryDueDate] [datetime] NOT NULL,
	[SourceOutletId] [int] NOT NULL,
	[DestinationOutletId] [int] NOT NULL,
	[IsAutoFillFromReorderPoint] [bit] NOT NULL,
	[OrderCreatedDate] [datetime] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_TransferStockOrder] PRIMARY KEY CLUSTERED 
(
	[TransferStockOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserRoleId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserSwitchingSecurityType]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSwitchingSecurityType](
	[UserSwitchingSecurityTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UserSwitchingSecurityTypeName] [nvarchar](200) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_UserSwitchingSecurityType] PRIMARY KEY CLUSTERED 
(
	[UserSwitchingSecurityTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Country] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Currency] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CustomerGroup] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CustomerGroupMaster] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DealnDonePlan] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DisplayPrice] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DNDUser] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[LabelPrinterFormat] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PurchaseStockOrder] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[RegisterOpenCloseStatusType] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ReturnStockOrder] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[RoleManagement] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SellOpenCloseRegister] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupAccount] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupAccountClearOutData] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupContactInformation] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupLoyaltyPointsId] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupPaymentType] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupRegistersAskForNote] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupRegistersCashManagement] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupRegistersReceiptTemplate] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupSalesTaxGroupId] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupSalesTaxGroupMaster] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupStoreAddress] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SKUGenerationType] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[StoreOutletRegister] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[StoreUser] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TimeZone] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TransferStockOrder] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserRole] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserSwitchingSecurityType] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Country] FOREIGN KEY([PhysicalCountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Country]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Country1] FOREIGN KEY([PostalCountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Country1]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerGroup] FOREIGN KEY([CustomerGroupId])
REFERENCES [dbo].[CustomerGroup] ([CustomerGroupId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerGroup]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Store]
GO
ALTER TABLE [dbo].[CustomerGroup]  WITH CHECK ADD  CONSTRAINT [FK_CustomerGroup_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[CustomerGroup] CHECK CONSTRAINT [FK_CustomerGroup_Customer]
GO
ALTER TABLE [dbo].[CustomerGroup]  WITH CHECK ADD  CONSTRAINT [FK_CustomerGroup_CustomerGroupMaster] FOREIGN KEY([CustomerGroupMasterId])
REFERENCES [dbo].[CustomerGroupMaster] ([CustomerGroupMasterId])
GO
ALTER TABLE [dbo].[CustomerGroup] CHECK CONSTRAINT [FK_CustomerGroup_CustomerGroupMaster]
GO
ALTER TABLE [dbo].[DiscountOffer]  WITH CHECK ADD  CONSTRAINT [FK_DiscountOffer_DiscountOfferType] FOREIGN KEY([DiscountOfferTypeId])
REFERENCES [dbo].[DiscountOfferType] ([DiscountOfferTypeId])
GO
ALTER TABLE [dbo].[DiscountOffer] CHECK CONSTRAINT [FK_DiscountOffer_DiscountOfferType]
GO
ALTER TABLE [dbo].[DiscountOffer]  WITH CHECK ADD  CONSTRAINT [FK_DiscountOffer_DiscountType] FOREIGN KEY([DiscountTypeId])
REFERENCES [dbo].[DiscountType] ([DiscountTypeId])
GO
ALTER TABLE [dbo].[DiscountOffer] CHECK CONSTRAINT [FK_DiscountOffer_DiscountType]
GO
ALTER TABLE [dbo].[DiscountOfferCustomer]  WITH CHECK ADD  CONSTRAINT [FK_DiscountOfferCustomer_CustomerGroup] FOREIGN KEY([CustomerGroupId])
REFERENCES [dbo].[CustomerGroup] ([CustomerGroupId])
GO
ALTER TABLE [dbo].[DiscountOfferCustomer] CHECK CONSTRAINT [FK_DiscountOfferCustomer_CustomerGroup]
GO
ALTER TABLE [dbo].[DiscountOfferCustomer]  WITH CHECK ADD  CONSTRAINT [FK_DiscountOfferCustomer_DiscountOffer] FOREIGN KEY([DiscountOfferId])
REFERENCES [dbo].[DiscountOffer] ([DiscountOfferId])
GO
ALTER TABLE [dbo].[DiscountOfferCustomer] CHECK CONSTRAINT [FK_DiscountOfferCustomer_DiscountOffer]
GO
ALTER TABLE [dbo].[DiscountOfferStoreOutlet]  WITH CHECK ADD  CONSTRAINT [FK_DiscountOfferStoreOutlet_DiscountOffer] FOREIGN KEY([DiscountOfferId])
REFERENCES [dbo].[DiscountOffer] ([DiscountOfferId])
GO
ALTER TABLE [dbo].[DiscountOfferStoreOutlet] CHECK CONSTRAINT [FK_DiscountOfferStoreOutlet_DiscountOffer]
GO
ALTER TABLE [dbo].[DiscountOfferStoreOutlet]  WITH CHECK ADD  CONSTRAINT [FK_DiscountOfferStoreOutlet_StoreOutlet] FOREIGN KEY([StoreOutletId])
REFERENCES [dbo].[StoreOutlet] ([StoreOutletId])
GO
ALTER TABLE [dbo].[DiscountOfferStoreOutlet] CHECK CONSTRAINT [FK_DiscountOfferStoreOutlet_StoreOutlet]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductBrand] FOREIGN KEY([ProductBrandId])
REFERENCES [dbo].[ProductBrand] ([ProductBrandId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductBrand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductSupplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[ProductSupplier] ([ProductSupplierId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductSupplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([ProductTypeId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Store]
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK_ProductImage_Product]
GO
ALTER TABLE [dbo].[ProductInventory]  WITH CHECK ADD  CONSTRAINT [FK_ProductInventory_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductInventory] CHECK CONSTRAINT [FK_ProductInventory_Product]
GO
ALTER TABLE [dbo].[ProductInventory]  WITH CHECK ADD  CONSTRAINT [FK_ProductInventory_ProductVariant] FOREIGN KEY([ProductVariantId])
REFERENCES [dbo].[ProductVariant] ([ProductVariantId])
GO
ALTER TABLE [dbo].[ProductInventory] CHECK CONSTRAINT [FK_ProductInventory_ProductVariant]
GO
ALTER TABLE [dbo].[ProductOutletPricing]  WITH CHECK ADD  CONSTRAINT [FK_ProductOutletPricing_PricingTier] FOREIGN KEY([PricingTierId])
REFERENCES [dbo].[PricingTier] ([PricingTierId])
GO
ALTER TABLE [dbo].[ProductOutletPricing] CHECK CONSTRAINT [FK_ProductOutletPricing_PricingTier]
GO
ALTER TABLE [dbo].[ProductOutletPricing]  WITH CHECK ADD  CONSTRAINT [FK_ProductOutletPricing_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductOutletPricing] CHECK CONSTRAINT [FK_ProductOutletPricing_Product]
GO
ALTER TABLE [dbo].[ProductOutletPricing]  WITH CHECK ADD  CONSTRAINT [FK_ProductOutletPricing_StoreOutlet] FOREIGN KEY([StoreOutletId])
REFERENCES [dbo].[StoreOutlet] ([StoreOutletId])
GO
ALTER TABLE [dbo].[ProductOutletPricing] CHECK CONSTRAINT [FK_ProductOutletPricing_StoreOutlet]
GO
ALTER TABLE [dbo].[ProductPricing]  WITH CHECK ADD  CONSTRAINT [FK_ProductPricing_PricingTier] FOREIGN KEY([PricingTierId])
REFERENCES [dbo].[PricingTier] ([PricingTierId])
GO
ALTER TABLE [dbo].[ProductPricing] CHECK CONSTRAINT [FK_ProductPricing_PricingTier]
GO
ALTER TABLE [dbo].[ProductPricing]  WITH CHECK ADD  CONSTRAINT [FK_ProductPricing_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductPricing] CHECK CONSTRAINT [FK_ProductPricing_Product]
GO
ALTER TABLE [dbo].[ProductTag]  WITH CHECK ADD  CONSTRAINT [FK_ProductTag_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductTag] CHECK CONSTRAINT [FK_ProductTag_Product]
GO
ALTER TABLE [dbo].[ProductTag]  WITH CHECK ADD  CONSTRAINT [FK_ProductTag_ProductTagMaster] FOREIGN KEY([ProductTagMasterId])
REFERENCES [dbo].[ProductTagMaster] ([ProductTagMasterId])
GO
ALTER TABLE [dbo].[ProductTag] CHECK CONSTRAINT [FK_ProductTag_ProductTagMaster]
GO
ALTER TABLE [dbo].[ProductVariant]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariant_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductVariant] CHECK CONSTRAINT [FK_ProductVariant_Product]
GO
ALTER TABLE [dbo].[ProductVariantAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariantAttribute_ProductVariantAttributeMaster] FOREIGN KEY([ProductVariantAttributeMasterId])
REFERENCES [dbo].[ProductVariantAttributeMaster] ([ProductVariantAttributeMasterId])
GO
ALTER TABLE [dbo].[ProductVariantAttribute] CHECK CONSTRAINT [FK_ProductVariantAttribute_ProductVariantAttributeMaster]
GO
ALTER TABLE [dbo].[PurchaseStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseStockOrder_StockOrderType] FOREIGN KEY([StockOrderTypeId])
REFERENCES [dbo].[StockOrderType] ([StockOrderTypeId])
GO
ALTER TABLE [dbo].[PurchaseStockOrder] CHECK CONSTRAINT [FK_PurchaseStockOrder_StockOrderType]
GO
ALTER TABLE [dbo].[ReturnStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnStockOrder_ProductSupplier] FOREIGN KEY([DeliveryToSupplierId])
REFERENCES [dbo].[ProductSupplier] ([ProductSupplierId])
GO
ALTER TABLE [dbo].[ReturnStockOrder] CHECK CONSTRAINT [FK_ReturnStockOrder_ProductSupplier]
GO
ALTER TABLE [dbo].[ReturnStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnStockOrder_StockOrderType] FOREIGN KEY([StockOrderTypeId])
REFERENCES [dbo].[StockOrderType] ([StockOrderTypeId])
GO
ALTER TABLE [dbo].[ReturnStockOrder] CHECK CONSTRAINT [FK_ReturnStockOrder_StockOrderType]
GO
ALTER TABLE [dbo].[ReturnStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnStockOrder_StoreOutlet] FOREIGN KEY([ReturnFromOutletId])
REFERENCES [dbo].[StoreOutlet] ([StoreOutletId])
GO
ALTER TABLE [dbo].[ReturnStockOrder] CHECK CONSTRAINT [FK_ReturnStockOrder_StoreOutlet]
GO
ALTER TABLE [dbo].[RoleManagement]  WITH CHECK ADD  CONSTRAINT [FK_RoleManagement_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[RoleManagement] CHECK CONSTRAINT [FK_RoleManagement_Role]
GO
ALTER TABLE [dbo].[SellOpenCloseRegister]  WITH CHECK ADD  CONSTRAINT [FK_SellOpenCloseRegister_RegisterOpenCloseStatusType] FOREIGN KEY([RegisterOpenCloseStatusTypeId])
REFERENCES [dbo].[RegisterOpenCloseStatusType] ([RegisterOpenCloseStatusTypeId])
GO
ALTER TABLE [dbo].[SellOpenCloseRegister] CHECK CONSTRAINT [FK_SellOpenCloseRegister_RegisterOpenCloseStatusType]
GO
ALTER TABLE [dbo].[SetupAccount]  WITH CHECK ADD  CONSTRAINT [FK_SetupAccount_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[SetupAccount] CHECK CONSTRAINT [FK_SetupAccount_Store]
GO
ALTER TABLE [dbo].[SetupAccountClearOutData]  WITH CHECK ADD  CONSTRAINT [FK_SetupAccountClearOutData_SetupAccount] FOREIGN KEY([SetupAccountId])
REFERENCES [dbo].[SetupAccount] ([SetupAccountId])
GO
ALTER TABLE [dbo].[SetupAccountClearOutData] CHECK CONSTRAINT [FK_SetupAccountClearOutData_SetupAccount]
GO
ALTER TABLE [dbo].[SetupContactInformation]  WITH CHECK ADD  CONSTRAINT [FK_SetupContactInformation_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[SetupContactInformation] CHECK CONSTRAINT [FK_SetupContactInformation_Store]
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings]  WITH CHECK ADD  CONSTRAINT [FK_SetupGeneralStoreSettings_Currency] FOREIGN KEY([DefaultCurrencyId])
REFERENCES [dbo].[Currency] ([CurrencyId])
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings] CHECK CONSTRAINT [FK_SetupGeneralStoreSettings_Currency]
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings]  WITH CHECK ADD  CONSTRAINT [FK_SetupGeneralStoreSettings_DisplayPrice] FOREIGN KEY([DisplayPricesId])
REFERENCES [dbo].[DisplayPrice] ([DisplayPriceId])
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings] CHECK CONSTRAINT [FK_SetupGeneralStoreSettings_DisplayPrice]
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings]  WITH CHECK ADD  CONSTRAINT [FK_SetupGeneralStoreSettings_LabelPrinterFormat] FOREIGN KEY([LabelPrinterFormatId])
REFERENCES [dbo].[LabelPrinterFormat] ([LabelPrinterFormatId])
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings] CHECK CONSTRAINT [FK_SetupGeneralStoreSettings_LabelPrinterFormat]
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings]  WITH CHECK ADD  CONSTRAINT [FK_SetupGeneralStoreSettings_SKUGenerationType] FOREIGN KEY([SKUGenerationId])
REFERENCES [dbo].[SKUGenerationType] ([SKUGenerationTypeId])
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings] CHECK CONSTRAINT [FK_SetupGeneralStoreSettings_SKUGenerationType]
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings]  WITH CHECK ADD  CONSTRAINT [FK_SetupGeneralStoreSettings_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings] CHECK CONSTRAINT [FK_SetupGeneralStoreSettings_Store]
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings]  WITH CHECK ADD  CONSTRAINT [FK_SetupGeneralStoreSettings_TimeZone] FOREIGN KEY([TimeZoneId])
REFERENCES [dbo].[TimeZone] ([TimeZoneId])
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings] CHECK CONSTRAINT [FK_SetupGeneralStoreSettings_TimeZone]
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings]  WITH CHECK ADD  CONSTRAINT [FK_SetupGeneralStoreSettings_UserSwitchingSecurityType] FOREIGN KEY([UserSwitchingSecurityId])
REFERENCES [dbo].[UserSwitchingSecurityType] ([UserSwitchingSecurityTypeId])
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings] CHECK CONSTRAINT [FK_SetupGeneralStoreSettings_UserSwitchingSecurityType]
GO
ALTER TABLE [dbo].[SetupLoyaltyPointsId]  WITH CHECK ADD  CONSTRAINT [FK_SetupLoyaltyPointsId_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[SetupLoyaltyPointsId] CHECK CONSTRAINT [FK_SetupLoyaltyPointsId_Store]
GO
ALTER TABLE [dbo].[SetupPaymentType]  WITH CHECK ADD  CONSTRAINT [FK_SetupPaymentType_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[SetupPaymentType] CHECK CONSTRAINT [FK_SetupPaymentType_Store]
GO
ALTER TABLE [dbo].[SetupSalesTaxGroupId]  WITH CHECK ADD  CONSTRAINT [FK_SetupSalesTaxGroupId_SalesTax] FOREIGN KEY([SalesTaxId])
REFERENCES [dbo].[SalesTax] ([SalesTaxId])
GO
ALTER TABLE [dbo].[SetupSalesTaxGroupId] CHECK CONSTRAINT [FK_SetupSalesTaxGroupId_SalesTax]
GO
ALTER TABLE [dbo].[SetupSalesTaxGroupId]  WITH CHECK ADD  CONSTRAINT [FK_SetupSalesTaxGroupId_SetupSalesTaxGroupMaster] FOREIGN KEY([SetupSalesTaxGroupMasterId])
REFERENCES [dbo].[SetupSalesTaxGroupMaster] ([SetupSalesTaxGroupMasterId])
GO
ALTER TABLE [dbo].[SetupSalesTaxGroupId] CHECK CONSTRAINT [FK_SetupSalesTaxGroupId_SetupSalesTaxGroupMaster]
GO
ALTER TABLE [dbo].[SetupStoreAddress]  WITH CHECK ADD  CONSTRAINT [FK_SetupStoreAddress_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[SetupStoreAddress] CHECK CONSTRAINT [FK_SetupStoreAddress_Store]
GO
ALTER TABLE [dbo].[StoreOutlet]  WITH CHECK ADD  CONSTRAINT [FK_StoreOutlet_SalesTax] FOREIGN KEY([OutletDefaultSalesTaxId])
REFERENCES [dbo].[SalesTax] ([SalesTaxId])
GO
ALTER TABLE [dbo].[StoreOutlet] CHECK CONSTRAINT [FK_StoreOutlet_SalesTax]
GO
ALTER TABLE [dbo].[StoreOutletRegister]  WITH CHECK ADD  CONSTRAINT [FK_StoreOutletRegister_SetupRegistersAskForNote] FOREIGN KEY([AskForNoteId])
REFERENCES [dbo].[SetupRegistersAskForNote] ([SetupRegistersAskForNoteId])
GO
ALTER TABLE [dbo].[StoreOutletRegister] CHECK CONSTRAINT [FK_StoreOutletRegister_SetupRegistersAskForNote]
GO
ALTER TABLE [dbo].[StoreOutletRegister]  WITH CHECK ADD  CONSTRAINT [FK_StoreOutletRegister_SetupRegistersCashManagement] FOREIGN KEY([CashManagementId])
REFERENCES [dbo].[SetupRegistersCashManagement] ([SetupRegistersCashManagementId])
GO
ALTER TABLE [dbo].[StoreOutletRegister] CHECK CONSTRAINT [FK_StoreOutletRegister_SetupRegistersCashManagement]
GO
ALTER TABLE [dbo].[StoreOutletRegister]  WITH CHECK ADD  CONSTRAINT [FK_StoreOutletRegister_SetupRegistersReceiptTemplate] FOREIGN KEY([ReceiptTemplateId])
REFERENCES [dbo].[SetupRegistersReceiptTemplate] ([SetupRegistersReceiptTemplateId])
GO
ALTER TABLE [dbo].[StoreOutletRegister] CHECK CONSTRAINT [FK_StoreOutletRegister_SetupRegistersReceiptTemplate]
GO
ALTER TABLE [dbo].[StoreOutletRegister]  WITH CHECK ADD  CONSTRAINT [FK_StoreOutletRegister_StoreOutlet] FOREIGN KEY([StoreOutletId])
REFERENCES [dbo].[StoreOutlet] ([StoreOutletId])
GO
ALTER TABLE [dbo].[StoreOutletRegister] CHECK CONSTRAINT [FK_StoreOutletRegister_StoreOutlet]
GO
ALTER TABLE [dbo].[StoreUser]  WITH CHECK ADD  CONSTRAINT [FK_StoreUser_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[StoreUser] CHECK CONSTRAINT [FK_StoreUser_Role]
GO
ALTER TABLE [dbo].[StoreUser]  WITH CHECK ADD  CONSTRAINT [FK_StoreUser_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[StoreUser] CHECK CONSTRAINT [FK_StoreUser_Store]
GO
ALTER TABLE [dbo].[StoreUser]  WITH CHECK ADD  CONSTRAINT [FK_StoreUser_StoreOutlet] FOREIGN KEY([StoreOutletId])
REFERENCES [dbo].[StoreOutlet] ([StoreOutletId])
GO
ALTER TABLE [dbo].[StoreUser] CHECK CONSTRAINT [FK_StoreUser_StoreOutlet]
GO
ALTER TABLE [dbo].[TransferStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_TransferStockOrder_StockOrderType] FOREIGN KEY([StockOrderTypeId])
REFERENCES [dbo].[StockOrderType] ([StockOrderTypeId])
GO
ALTER TABLE [dbo].[TransferStockOrder] CHECK CONSTRAINT [FK_TransferStockOrder_StockOrderType]
GO
ALTER TABLE [dbo].[TransferStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_TransferStockOrder_StoreOutlet] FOREIGN KEY([SourceOutletId])
REFERENCES [dbo].[StoreOutlet] ([StoreOutletId])
GO
ALTER TABLE [dbo].[TransferStockOrder] CHECK CONSTRAINT [FK_TransferStockOrder_StoreOutlet]
GO
ALTER TABLE [dbo].[TransferStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_TransferStockOrder_StoreOutlet_DestinationOutletId] FOREIGN KEY([DestinationOutletId])
REFERENCES [dbo].[StoreOutlet] ([StoreOutletId])
GO
ALTER TABLE [dbo].[TransferStockOrder] CHECK CONSTRAINT [FK_TransferStockOrder_StoreOutlet_DestinationOutletId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_StoreUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[StoreUser] ([StoreUserId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_StoreUser]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteBrand]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_DeleteBrand]
/*****************************************************************************************************************
FUNCTION:	[usp_DeleteBrand]
PURPOSE:	Delete a Brand
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductBrandId int,
@UpdatedBy int
)
AS
BEGIN

	Update  ProductBrand SET UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 0
	WHERE ProductBrandId = @ProductBrandId

	SELECT @ProductBrandId

END


GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteProductType]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_DeleteProductType]
/*****************************************************************************************************************
FUNCTION:	[usp_DeleteProductType]
PURPOSE:	Delete a ProductType
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductTypeId int,
@UpdatedBy int
)
AS
BEGIN

	Update  ProductType SET UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 0
	WHERE ProductTypeId = @ProductTypeId

	SELECT @ProductTypeId

END


GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteSupplier]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_DeleteSupplier]
/*****************************************************************************************************************
FUNCTION:	[usp_DeleteSupplier]
PURPOSE:	Delete a Supplier
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductSupplierId int,
@UpdatedBy int
)
AS
BEGIN

	Update  ProductSupplier SET UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 0
	WHERE ProductSupplierId = @ProductSupplierId

	SELECT @ProductSupplierId

END


GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteTag]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_DeleteTag]
/*****************************************************************************************************************
FUNCTION:	[usp_DeleteTag]
PURPOSE:	Delete a Tag
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductTagMasterId int,
@UpdatedBy int
)
AS
BEGIN

	Update  ProductTagMaster SET UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 0
	WHERE ProductTagMasterId = @ProductTagMasterId

	SELECT @ProductTagMasterId

END


GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllBrandsByStore]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllBrandsByStore]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllBrands]
PURPOSE:	Get all brands of the store.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@StoreId int
)
AS
BEGIN
	SELECT ProductBrandId, BrandName, BrandDescription, IsActive
	FROM ProductBrand
	WHERE IsActive = 1
	--and StoreId = @StoreId

END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllBrandsByStore 1
------------------------------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllMasterDataForCreateOrEditDiscountOffer]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllMasterDataForCreateOrEditDiscountOffer]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllMasterDataForCreateOrEditDiscountOffer]
PURPOSE:	
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@StoreId int
)
AS
BEGIN

	select distinct DiscountTypeId, DiscountTypeName
	From DiscountType

	select distinct DiscountOfferTypeId, DiscountOfferTypeName 
	from DiscountOfferType

	select distinct ProductId, ProductName 
	from Product where IsActive = 1

	select Distinct ProductTagId, TagName 
	from ProductTag where IsActive = 1 
	--and StoreId = @StoreId

	select ProductTypeId, ProductTypeName 
	from ProductType where IsActive = 1
	--and StoreId = @StoreId

	select ProductBrandId, BrandName, BrandDescription 
	from ProductBrand where IsActive = 1
	--and StoreId = @StoreId

	select StoreOutletId, OutletName 
	from StoreOutlet where IsActive = 1
	--and StoreId = @StoreId

	select distinct CustomerGroupMasterId, GroupName
	from CustomerGroupMaster
	Where IsActive = 1
	
END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllMasterDataForCreateOrEditDiscountOffer 1
------------------------------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllMasterDataForCreateOrEditProduct]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllMasterDataForCreateOrEditProduct]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllMasterDataForCreateOrEditProduct]
PURPOSE:	Get all Product tags categories brands suppliers by store.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@StoreId int
)
AS
BEGIN

	select Distinct TagName, ProductTagMasterId
	from ProductTagMaster where IsActive = 1 
	--and StoreId = @StoreId

	select ProductTypeId, ProductTypeName 
	from ProductType where IsActive = 1
	--and StoreId = @StoreId

	select ProductBrandId, BrandName, BrandDescription 
	from ProductBrand where IsActive = 1
	--and StoreId = @StoreId

	select ProductSupplierId, SupplierName, SupplierDefaultMarkup, Description 
	from ProductSupplier where IsActive = 1
	--and StoreId = @StoreId

	select StoreOutletId, OutletName, OutletDefaultSalesTaxId 
	from StoreOutlet where IsActive = 1
	--and StoreId = @StoreId

	select ProductVariantAttributeMasterId, VariantAttributeName 
	from ProductVariantAttributeMaster
	Where IsActive = 1

	select SalesTaxId, TaxName, TaxRate 
	from SalesTax Where IsActive = 1

END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllMasterDataForCreateOrEditProduct 1
------------------------------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllProductsByStore]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllProductsByStore]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllProductsByStore]
PURPOSE:	Get all products of the store.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@StoreId int
)
AS
BEGIN
	
	SELECT DISTINCT  P.ProductId,P.ProductName, PIM.[Image], PTY.ProductTypeId, PTY.ProductTypeName, P.CreatedOn, 
	--PT.TagName, 
	PB.BrandName, PS.SupplierName, P.IsActive
	FROM Product P
	LEFT JOIN ProductBrand PB ON P.ProductBrandId = PB.ProductBrandId
	LEFT JOIN ProductSupplier PS ON P.SupplierId = PS.ProductSupplierId
	LEFT JOIN ProductTag PT ON P.ProductId = PT.ProductId
	LEFT JOIN ProductImage PIM ON P.ProductId = PIM.ProductId
	LEFT JOIN ProductType PTY ON PTY.ProductTypeId = P.ProductTypeId
	WHERE P.IsActive = 1

	--Product Tags
	SELECT P.ProductId, PTM.TagName
	FROM Product P
	INNER JOIN ProductTag PT ON P.ProductId = PT.ProductTagId
	INNER JOIN ProductTagMaster PTM ON PT.ProductTagMasterId = PTM.ProductTagMasterId
	WHERE P.IsActive = 1



END
------------------------------------------------------------------------------------------------------------------
--usp_GetAllProductsByStore 1
------------------------------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllProductsForSaleByStore]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllProductsForSaleByStore]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllProductsForSaleByStore]
PURPOSE:	Get all products of the store for sale.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@StoreId int,
@OutletId int
)
AS
BEGIN
	
	select distinct P.ProductId, P.ProductName, PIM.[Image] AS ProductImage, PTY.ProductTypeId, PTY.ProductTypeName, p.IsProductHasVariants, P.CreatedOn, 
	PIN.StoreOutletCurrentInventory CurrentInventory, PIN.ProductVariantPriceExcludingTax AS Price, PIN.StoreOutletId from ProductInventory PIN
	INNER JOIN Product P On PIN.ProductId = P.ProductId
	LEFT JOIN ProductImage PIM ON P.ProductId = PIM.ProductId
	LEFT JOIN ProductType PTY ON PTY.ProductTypeId = P.ProductTypeId
	WHERE P.IsActive = 1 and PIN.StoreOutletId = @OutletId --and P.StoreId = @StoreId 

END
------------------------------------------------------------------------------------------------------------------
--usp_GetAllProductsForSaleByStore 1, 1
------------------------------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllProductTypesByStore]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllProductTypesByStore]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllProductTypes]
PURPOSE:	Get all ProductTypes of the store.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@StoreId int
)
AS
BEGIN
	SELECT ProductTypeId, ProductTypeName, IsActive
	FROM ProductType
	WHERE IsActive = 1
	--and StoreId = @StoreId

END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllProductTypesByStore 1
------------------------------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllSalesTaxList]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllSalesTaxList]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllSalesTaxList]
PURPOSE:	usp_GetAllSalesTaxList.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@StoreId int
)
AS
BEGIN

	select SalesTaxId, TaxName, TaxRate 
	from SalesTax Where IsActive = 1

END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllSalesTaxList 1
------------------------------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllSuppliersByStore]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllSuppliersByStore]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllSuppliersByStore]
PURPOSE:	Get all brands of the store.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@StoreId int
)
AS
BEGIN
	SELECT ProductSupplierId, SupplierName, SupplierDefaultMarkup, Description, Firstname, Lastname, 
	Company, Email, Phone, Mobile, Fax, Website, Twitter, AddressStreet1, AddressStreet2, Postcode, State, Country, 
	CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive
	FROM ProductSupplier
	WHERE IsActive = 1
	--and StoreId = @StoreId

END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllSuppliersByStore 1
------------------------------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllTagsByStore]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllTagsByStore]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllTags]
PURPOSE:	Get all tags of the store.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@StoreId int
)
AS
BEGIN
	SELECT Distinct ProductTagMasterId, TagName, IsActive
	FROM ProductTagMaster
	WHERE IsActive = 1
	--and StoreId = @StoreId

END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllTagsByStore 1
------------------------------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[usp_GetInventoryBySearch]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetInventoryBySearch]
/*****************************************************************************************************************
FUNCTION:	[usp_GetInventoryBySearch]
PURPOSE:	Get inventory by search.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@NameSkuHandleSupplier nvarchar(200)= null
)
AS
BEGIN
	
	SELECT DISTINCT P.ProductId, P.ProductName, P.IsProductHasVariants, PV.ProductVariantId, PV.ProductVariantName, [PI].ProductVariantSKU As ProductSKU, 
	P.IsActive
	FROM Product P
	Join ProductVariant PV On P.ProductId = PV.ProductId
	JOIN ProductInventory [PI] ON P.ProductId = [PI].ProductId and PV.ProductVariantId = [PI].ProductVariantId
	Where @NameSkuHandleSupplier is null or P.ProductName LIKE '%' + @NameSkuHandleSupplier + '%'
	OR (@NameSkuHandleSupplier is null or P.ProductHandle LIKE '%' + @NameSkuHandleSupplier + '%')
	OR (@NameSkuHandleSupplier is null or [PI].ProductVariantSKU LIKE '%' + @NameSkuHandleSupplier + '%')
	OR (@NameSkuHandleSupplier is null or PV.ProductVariantName LIKE '%' + @NameSkuHandleSupplier + '%')

	SELECT  PV.ProductVariantId, [PI].StoreOutletId, [PI].StoreOutletCurrentInventory, [PI].ProductVariantSupplyPrice
	FROM Product P
	Join ProductVariant PV On P.ProductId = PV.ProductId
	JOIN ProductInventory [PI] ON P.ProductId = [PI].ProductId and PV.ProductVariantId = [PI].ProductVariantId
	Where @NameSkuHandleSupplier is null or P.ProductName LIKE '%' + @NameSkuHandleSupplier + '%'
	OR (@NameSkuHandleSupplier is null or P.ProductHandle LIKE '%' + @NameSkuHandleSupplier + '%')
	OR (@NameSkuHandleSupplier is null or [PI].ProductVariantSKU LIKE '%' + @NameSkuHandleSupplier + '%')
	OR (@NameSkuHandleSupplier is null or PV.ProductVariantName LIKE '%' + @NameSkuHandleSupplier + '%')

END
------------------------------------------------------------------------------------------------------------------
--usp_GetInventoryBySearch 'Prod'
------------------------------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[usp_GetProductsBySearch]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetProductsBySearch]
/*****************************************************************************************************************
FUNCTION:	[usp_GetProductsBySearch]
PURPOSE:	Get all products by search.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@NameSkuHandleSupplier nvarchar(200)= null,
@ProductTypeId int = null,
@ProductBrandId int = null,
@ProductSupplierId int = null,
@ProductTags nvarchar(200)= null 
)
AS
BEGIN
	
	SELECT P.ProductName, P.ProductId, P.CreatedOn, 
	PB.BrandName, PS.SupplierName, P.IsActive
	FROM Product P
	LEFT JOIN ProductBrand PB ON P.ProductBrandId = PB.ProductBrandId
	LEFT JOIN ProductSupplier PS ON P.SupplierId = PS.ProductSupplierId
	LEFT JOIN ProductTag PT ON P.ProductId = PT.ProductId
	LEFT JOIN ProductType PTy ON P.ProductTypeId = PTy.ProductTypeId
	--WHERE P.IsActive = 1
	Where @NameSkuHandleSupplier is null or P.ProductName LIKE '%' + @NameSkuHandleSupplier + '%'
	OR (@NameSkuHandleSupplier is null or P.ProductHandle LIKE '%' + @NameSkuHandleSupplier + '%')
	OR (@NameSkuHandleSupplier is null or PS.SupplierName LIKE '%' + @NameSkuHandleSupplier + '%')
	and (@ProductTypeId IS NULL OR @ProductTypeId = P.ProductTypeId)
		and (@ProductBrandId IS NULL OR @ProductBrandId = P.ProductBrandId)
	and (@ProductSupplierId IS NULL OR @ProductSupplierId = P.SupplierId)

	--Product Tags
	--SELECT P.ProductId, PT.TagName
	--FROM Product P
	--INNER JOIN ProductTag PT ON P.ProductId = PT.ProductId
	--WHERE P.IsActive = 1



END
------------------------------------------------------------------------------------------------------------------
--usp_GetProductsBySearch 'Red', null, null, null, null
------------------------------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[usp_GetStoreOutlets]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetStoreOutlets]
/*****************************************************************************************************************
FUNCTION:	[usp_GetStoreOutlets]
PURPOSE:	Get all outlets by store
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@StoreId int
)
AS
BEGIN

	select StoreOutletId, OutletName, OutletDefaultSalesTaxId 
	from StoreOutlet where IsActive = 1
	--and StoreId = @StoreId
END
------------------------------------------------------------------------------------------------------------------
--EXEC GetStoreOutlets 1
------------------------------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[usp_InsertBrand]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertBrand]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertRole]
PURPOSE:	Insert a new Role.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@BrandName nvarchar(200),
@BrandDescription nvarchar(Max),
@CreatedBy int
)
AS
BEGIN
	INSERT INTO ProductBrand(BrandName, BrandDescription, CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@BrandName, @BrandDescription, @CreatedBy, GETDATE(), @CreatedBy, GETDATE(), 1)

	SELECT SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[usp_InsertProduct]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertProduct]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertProduct]
PURPOSE:	Insert a new Product.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductName nvarchar(200),
@ProductHandle nvarchar(200),
@IsProductCanBeSold bit,
@Description nvarchar(max),
@ProductTypeId int,
@ProductBrandId int,
@SupplierId int,
@SupplierCode nvarchar(100) NULL,
@SalesAccountCode nvarchar(40) NULL,
@PurchaseAccountCode nvarchar(40) NULL,
@IsProductHasVariants bit,
@CreatedBy int
)
AS
BEGIN
	INSERT INTO Product(ProductName, ProductHandle, IsProductCanBeSold, ProductLoyalty, Description, ProductTypeId, ProductBrandId, SupplierId,
	SupplierCode, SalesAccountCode, PurchaseAccountCode, IsProductHasVariants, StoreId, CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@ProductName, @ProductHandle, @IsProductCanBeSold, 0.00, @Description, @ProductTypeId, @ProductBrandId, @SupplierId, @SupplierCode,
	@SalesAccountCode, @PurchaseAccountCode, @IsProductHasVariants, 1, @CreatedBy,	GETDATE(), @CreatedBy, GETDATE(), 1) 	
	

	SELECT SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[usp_InsertProductImage]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertProductImage]
/*****************************************************************************************************************
FUNCTION:	[[usp_InsertProductImage]]
PURPOSE:	Insert a new Product Image.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductId int,
@Image varbinary(max),
@FileType nvarchar(50),
@FileName nvarchar(100)
)
AS
BEGIN
	INSERT INTO ProductImage(ProductId, IsPrimaryImage, [Image], FileType, [FileName], CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@ProductId, 1, @Image, @FileType, @FileName, 1, GETDATE(), 1, GETDATE(), 1)

	SELECT SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[usp_InsertProductInventory]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertProductInventory]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertProductInventory]
PURPOSE:	Insert Product Inventory
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductId int,
@ProductVariantId int,
@ProductVariantSKU nvarchar(100),
@ProductVariantSupplierCode nvarchar(100),
@ProductVariantSupplyPrice decimal,
@ProductVariantMarkup decimal,
@ProductVariantRetailPrice decimal,
@StoreOutletInventoryList XML
)
AS
BEGIN


CREATE TABLE #StoreOutletInventoryList (StoreOutletId INT, StoreOutletCurrentInventory SMALLINT, StoreOutletReorderPoint INT, StoreOutletReorderAmount INT)
			
	INSERT INTO #StoreOutletInventoryList 
	SELECT DISTINCT   
		StoreOutletInventoryList.StoreOutletInventory.value('StoreOutletId[1]', 'int') as StoreOutletId,
		StoreOutletInventoryList.StoreOutletInventory.value('StoreOutletCurrentInventory[1]', 'int') as StoreOutletCurrentInventory,
		StoreOutletInventoryList.StoreOutletInventory.value('StoreOutletReorderPoint[1]', 'int') as StoreOutletReorderPoint,
		StoreOutletInventoryList.StoreOutletInventory.value('StoreOutletReorderAmount[1]', 'int') as StoreOutletReorderAmount
	FROM @StoreOutletInventoryList.nodes('//StoreOutletInventory') StoreOutletInventoryList(StoreOutletInventory)


	IF (SELECT  COUNT(1) FROM #StoreOutletInventoryList) > 0
	BEGIN
		INSERT INTO ProductInventory(ProductId, ProductVariantId, ProductVariantSKU, ProductVariantSupplierCode, ProductVariantSupplyPrice, ProductVariantMarkupPercentage, ProductVariantPriceExcludingTax,  StoreOutletId, StoreOutletCurrentInventory,
		StoreOutletReorderPoint, StoreOutletReorderAmount, IsActive, CreatedBy, CreatedOn, UpdatedBy, UpdatedOn)
		SELECT @ProductId, @ProductVariantId, @ProductVariantSKU, @ProductVariantSupplierCode, @ProductVariantSupplyPrice, @ProductVariantMarkup, @ProductVariantRetailPrice, StoreOutletId, StoreOutletCurrentInventory, 
		StoreOutletReorderPoint, StoreOutletReorderAmount, 1, 1, GETDATE(), 1, GETDATE() FROM #StoreOutletInventoryList
	END

	DROP Table #StoreOutletInventoryList

END



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertProductOutletPricing]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertProductOutletPricing]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertProductOutletPricing]
PURPOSE:	Insert a new Product Outlet Pricing.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductOutletPricingsList XML
)
AS
BEGIN

CREATE TABLE #ProductOutletPricingsList (ProductId BIGINT, PricingTierId INT, StoreOutletId INT,SalestaxId SMALLINT, 
									TaxAmount Decimal, ProductPriceIncludingTax Decimal)
			
	-- Push Product Pricing list to temp table
	INSERT INTO #ProductOutletPricingsList 
	SELECT DISTINCT   
		ProductOutletPricingsList.ProductOutletPricing.value('ProductId[1]', 'int') as ProductId,
		ProductOutletPricingsList.ProductOutletPricing.value('PricingTierId[1]', 'int') as PricingTierId,
		ProductOutletPricingsList.ProductOutletPricing.value('StoreOutletId[1]', 'int') as StoreOutletId,
		ProductOutletPricingsList.ProductOutletPricing.value('SalestaxId[1]', 'int') as SalestaxId,
		ProductOutletPricingsList.ProductOutletPricing.value('TaxAmount[1]', 'decimal') as TaxAmount,
		ProductOutletPricingsList.ProductOutletPricing.value('ProductPriceIncludingTax[1]', 'decimal') as ProductPriceIncludingTax
	FROM @ProductOutletPricingsList.nodes('//ProductOutletPricing') ProductOutletPricingsList(ProductOutletPricing)


	IF (SELECT  COUNT(1) FROM #ProductOutletPricingsList) > 0
	BEGIN
		INSERT INTO ProductOutletPricing(ProductId, PricingTierId, StoreOutletId, SalestaxId, TaxAmount, ProductPriceIncludingTax,
		  CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
		SELECT ProductId, PricingTierId, StoreOutletId, SalesTaxId, TaxAmount, ProductPriceIncludingTax, 
		1, GETDATE(), 1, GETDATE(), 1 FROM #ProductOutletPricingsList
	END

	DROP Table #ProductOutletPricingsList

END



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertProductPricing]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertProductPricing]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertProductPricing]
PURPOSE:	Insert a new Product Pricing.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductPricingsList XML
)
AS
BEGIN

CREATE TABLE #ProductPricingsList (ProductId BIGINT, PricingTierId SMALLINT,SupplyPrice decimal, 
									MarkupPercentage Decimal, ProductPriceExcludingTax Decimal)
			
	-- Push Product Pricing list to temp table
	INSERT INTO #ProductPricingsList 
	SELECT DISTINCT   
		ProductPricingsList.ProductPricing.value('ProductId[1]', 'int') as ProductId,
		ProductPricingsList.ProductPricing.value('PricingTierId[1]', 'int') as PricingTierId,
		ProductPricingsList.ProductPricing.value('SupplyPrice[1]', 'decimal') as SupplyPrice,
		ProductPricingsList.ProductPricing.value('MarkupPercentage[1]', 'decimal') as MarkupPercentage,
		ProductPricingsList.ProductPricing.value('ProductPriceExcludingTax[1]', 'decimal') as ProductPriceExcludingTax
	FROM @ProductPricingsList.nodes('//ProductPricing') ProductPricingsList(ProductPricing)


	IF (SELECT  COUNT(1) FROM #ProductPricingsList) > 0
	BEGIN
		INSERT INTO ProductPricing(ProductId, PricingTierId, SupplyPrice, MarkupPercentage, ProductPriceExcludingTax,
		  CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
		SELECT ProductId, PricingTierId, SupplyPrice, MarkupPercentage, ProductPriceExcludingTax, 
		1, GETDATE(), 1, GETDATE(), 1 FROM #ProductPricingsList
	END

	DROP Table #ProductPricingsList

END



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertProductTag]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertProductTag]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertProductTag]
PURPOSE:	Insert a new Tag.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@TagsList XML
)
AS
BEGIN

CREATE TABLE #TagsList (ProductId BIGINT, ProductTagName nvarchar(100))
			
	-- Push Goal alignment list to temp table
	INSERT INTO #TagsList 
	SELECT DISTINCT   
		TagsList.Tag.value('ProductId[1]', 'int') as ProductId,
		TagsList.Tag.value('ProductTagName[1]', 'nvarchar(100)') as ProductTagName
	FROM @TagsList.nodes('//Tag') TagsList(Tag)
	
	INSERT INTO ProductTagMaster(TagName,  CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	SELECT ProductTagName, 1, GETDATE(), 1, GETDATE(), 1 FROM #TagsList TL 
	Where NOT EXISTS (select * FROM ProductTagMaster PTM WHERE TL.ProductTagName = PTM.TagName)

	IF (SELECT  COUNT(1) FROM #TagsList) > 0
	BEGIN
		INSERT INTO ProductTag(ProductId, ProductTagMasterId,  CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
		SELECT ProductId, PTM.ProductTagMasterId, 1, GETDATE(), 1, GETDATE(), 1 FROM #TagsList TL
		INNER JOIN ProductTagMaster PTM On TL.ProductTagName = PTM.TagName
	END

	DROP Table #TagsList

END



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertProductType]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertProductType]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertRole]
PURPOSE:	Insert a new Role.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductTypeName nvarchar(200),
@CreatedBy int
)
AS
BEGIN
	INSERT INTO ProductType(ProductTypeName, CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@ProductTypeName, @CreatedBy, GETDATE(), @CreatedBy, GETDATE(), 1)

	SELECT SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[usp_InsertProductVariant]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertProductVariant]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertProductVariant]
PURPOSE:	Insert a new Product Variant.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductId int,
@ProductVariantName nvarchar(300)
)
AS
BEGIN
	INSERT INTO ProductVariant(ProductId, ProductVariantName, CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@ProductId, @ProductVariantName, 1, GETDATE(), 1, GETDATE(), 1)

	SELECT SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[usp_InsertProductVariantAttribute]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertProductVariantAttribute]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertProductVariantAttribute]
PURPOSE:	Insert a Product Variant Attributes.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductVariantAttributesList XML
)
AS
BEGIN

CREATE TABLE #ProductVariantAttributesList (ProductId BIGINT, ProductVariantAttributeMasterId SMALLINT, VariantAttributeTagName nvarchar(100))
			
	INSERT INTO #ProductVariantAttributesList 
	SELECT DISTINCT   
		ProductVariantAttributesList.productVariantAttribute.value('ProductId[1]', 'int') as ProductId,
		ProductVariantAttributesList.productVariantAttribute.value('ProductVariantAttributeMasterId[1]', 'int') as ProductVariantAttributeMasterId,
		ProductVariantAttributesList.productVariantAttribute.value('VariantAttributeTagName[1]', 'nvarchar(100)') as VariantAttributeTagName
	FROM @ProductVariantAttributesList.nodes('//productVariantAttribute') ProductVariantAttributesList(productVariantAttribute)


	IF (SELECT  COUNT(1) FROM #ProductVariantAttributesList) > 0
	BEGIN
		INSERT INTO ProductVariantAttribute(ProductId, ProductVariantAttributeMasterId, VariantAttributeTagName,  CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive, StoreId)
		SELECT ProductId, ProductVariantAttributeMasterId, VariantAttributeTagName, 1, GETDATE(), 1, GETDATE(), 1, 1 FROM #ProductVariantAttributesList
	END

	DROP Table #ProductVariantAttributesList

END



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertSupplier]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertSupplier]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertSupplier]
PURPOSE:	Insert a new Supplier.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@SupplierName nvarchar(200),
@SupplierDefaultMarkup decimal,
@Description nvarchar(max) = null,
@Firstname nvarchar(100),
@Lastname nvarchar(100) = null,
@Company nvarchar(100) = null,
@Email nvarchar(100) = null,
@Phone nvarchar(40) = null,
@Mobile nvarchar(40) = null,
@Fax nvarchar(40) = null,
@Website nvarchar(200) = null,
@Twitter nvarchar(200) = null,
@AddressStreet1 nvarchar(400) = null,
@AddressStreet2 nvarchar(400) = null,
@Postcode nvarchar(40) = null,
@State nvarchar(100) = null,
@Country nvarchar(100) = null,
@CreatedBy int
)
AS
BEGIN
	INSERT INTO ProductSupplier(SupplierName, SupplierDefaultMarkup, Description, Firstname, Lastname, 
	Company, Email, Phone, Mobile, Fax, Website, Twitter, AddressStreet1, AddressStreet2, Postcode, State, Country, 
	CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@SupplierName, @SupplierDefaultMarkup, @Description, @Firstname, @Lastname, @Company, @Email, @Phone,
	@Mobile, @Fax, @Website, @Twitter, @AddressStreet1, @AddressStreet2, @Postcode, @State, @Country, @CreatedBy,
	GETDATE(), @CreatedBy, GETDATE(), 1) 	
	

	SELECT SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[usp_InsertTag]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertTag]
/*****************************************************************************************************************
FUNCTION:	[uusp_InsertTag]
PURPOSE:	Insert a new Tag.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@TagName nvarchar(200),
@CreatedBy int
)
AS
BEGIN
	INSERT INTO ProductTagMaster(TagName,  CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@TagName, @CreatedBy, GETDATE(), @CreatedBy, GETDATE(), 1)

	SELECT SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateBrand]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_UpdateBrand]
/*****************************************************************************************************************
FUNCTION:	[usp_UpdateBrand]
PURPOSE:	Update Brand.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductBrandId int,
@BrandName nvarchar(200),
@BrandDescription nvarchar(Max),
@UpdatedBy int
)
AS
BEGIN
	Update ProductBrand SET BrandName = @BrandName, BrandDescription = @BrandDescription, UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 1
	WHERE ProductBrandId = @ProductBrandId

	SELECT @ProductBrandId

END


GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateProductType]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_UpdateProductType]
/*****************************************************************************************************************
FUNCTION:	[usp_UpdateProductType]
PURPOSE:	Update ProductType.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductTypeId int,
@ProductTypeName nvarchar(200),
@UpdatedBy int
)
AS
BEGIN
	Update ProductType SET ProductTypeName = @ProductTypeName, UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 1
	WHERE ProductTypeId = @ProductTypeId

	SELECT @ProductTypeId

END


GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateSupplier]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_UpdateSupplier]
/*****************************************************************************************************************
FUNCTION:	[usp_UpdateSupplier]
PURPOSE:	Update Supplier.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductSupplierId int,
@SupplierName nvarchar(200),
@SupplierDefaultMarkup decimal,
@Description nvarchar(max),
@Firstname nvarchar(100),
@Lastname nvarchar(100),
@Company nvarchar(100),
@Email nvarchar(100),
@Phone nvarchar(40),
@Mobile nvarchar(40),
@Fax nvarchar(40),
@Website nvarchar(200),
@Twitter nvarchar(200),
@AddressStreet1 nvarchar(400),
@AddressStreet2 nvarchar(400),
@Postcode nvarchar(40),
@State nvarchar(100),
@Country nvarchar(100),
@UpdatedBy int
)
AS
BEGIN

	Update ProductSupplier SET SupplierName = @SupplierName, SupplierDefaultMarkup = @SupplierDefaultMarkup, 
	Description = @Description, Firstname = @Firstname, Lastname = @Lastname, Company = @Company, Email = @Email,
	Phone = @Phone, Mobile = @Mobile, Fax = @Fax, Website = @Website, Twitter = @Twitter, AddressStreet1 = @AddressStreet1,
	AddressStreet2 = @AddressStreet2, Postcode = @Postcode, State = @State, Country = @Country, UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 1
	WHERE ProductSupplierId = @ProductSupplierId


	SELECT @ProductSupplierId

END


GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateTag]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_UpdateTag]
/*****************************************************************************************************************
FUNCTION:	[usp_UpdateTag]
PURPOSE:	Update Tag.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductTagMasterId int,
@TagName nvarchar(200),
@UpdatedBy int
)
AS
BEGIN
	Update ProductTagMaster SET TagName = @TagName, UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 1
	WHERE ProductTagMasterId = @ProductTagMasterId

	SELECT @ProductTagMasterId

END


GO
USE [master]
GO
ALTER DATABASE [DND] SET  READ_WRITE 
GO
