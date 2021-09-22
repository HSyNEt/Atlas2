
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/22/2021 16:07:59
-- Generated from EDMX file: C:\Users\husyd\source\repos\Atlas\ModelDB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [EntityDts];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[iCarts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[iCarts];
GO
IF OBJECT_ID(N'[dbo].[iOrders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[iOrders];
GO
IF OBJECT_ID(N'[dbo].[iProducts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[iProducts];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'iCarts'
CREATE TABLE [dbo].[iCarts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [account_id] nvarchar(max)  NULL,
    [product_id] int  NOT NULL,
    [product_name] nvarchar(max)  NULL,
    [product_descript] nvarchar(max)  NULL,
    [product_price] nvarchar(max)  NULL,
    [product_qua] int  NOT NULL,
    [product_img] nvarchar(max)  NULL
);
GO

-- Creating table 'iOrders'
CREATE TABLE [dbo].[iOrders] (
    [id] int IDENTITY(1,1) NOT NULL,
    [product_id] int  NOT NULL,
    [account_id] nvarchar(max)  NULL,
    [order_delivery] nvarchar(max)  NULL,
    [order_price] nvarchar(max)  NULL,
    [product_name] nvarchar(max)  NULL
);
GO

-- Creating table 'iProducts'
CREATE TABLE [dbo].[iProducts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NULL,
    [Description] nvarchar(max)  NULL,
    [Price] nvarchar(max)  NULL,
    [Img] nvarchar(max)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'iCarts'
ALTER TABLE [dbo].[iCarts]
ADD CONSTRAINT [PK_iCarts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [id] in table 'iOrders'
ALTER TABLE [dbo].[iOrders]
ADD CONSTRAINT [PK_iOrders]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [Id] in table 'iProducts'
ALTER TABLE [dbo].[iProducts]
ADD CONSTRAINT [PK_iProducts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------