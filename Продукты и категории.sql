USE [Products]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Продукты
CREATE TABLE [dbo].[Products](
	[Id] [int] NOT NULL IDENTITY PRIMARY KEY,
	[Product] [nchar](30) NULL
) ON [PRIMARY]
GO

INSERT INTO Products VALUES ('Майка');
INSERT INTO Products VALUES ('Футболка');
INSERT INTO Products VALUES ('Чашка');
INSERT INTO Products VALUES ('Ложка');
INSERT INTO Products VALUES ('Фоторамка');

 -- Категории
CREATE TABLE [dbo].[Categories](
	[Id] [int] NOT NULL IDENTITY PRIMARY KEY,
	[Category] [nchar](30) NULL
) ON [PRIMARY]
GO

INSERT INTO Categories VALUES ('Одежда');
INSERT INTO Categories VALUES ('Посуда');
INSERT INTO Categories VALUES ('Белое');
INSERT INTO Categories VALUES ('Синее');

-- Связь продуктов с категориями
CREATE TABLE [dbo].[ProductCategory](
	[Id] [int] NOT NULL IDENTITY PRIMARY KEY,
	[Id_product] [int] NOT NULL,
	[Id_category] [int] NOT NULL
) ON [PRIMARY]
GO

INSERT INTO ProductCategory VALUES (1, 1);
INSERT INTO ProductCategory VALUES (1, 3);
INSERT INTO ProductCategory VALUES (2, 1);
INSERT INTO ProductCategory VALUES (2, 4);
INSERT INTO ProductCategory VALUES (3, 2);
INSERT INTO ProductCategory VALUES (3, 3);

SELECT 
		Product, 
		Category
  FROM 
		Products p 
		LEFT JOIN
		ProductCategory pc ON p.Id = pc.Id_product 
		LEFT JOIN 
		Categories ct ON pc.Id_category = ct.Id
