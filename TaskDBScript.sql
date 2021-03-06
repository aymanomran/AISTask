USE [master]
GO
/****** Object:  Database [EvaluationTaskDB]    Script Date: 03/02/2020 10:09:47 ص ******/
CREATE DATABASE [EvaluationTaskDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EvaluationTaskDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EvaluationTaskDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EvaluationTaskDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EvaluationTaskDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EvaluationTaskDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EvaluationTaskDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EvaluationTaskDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EvaluationTaskDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EvaluationTaskDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EvaluationTaskDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EvaluationTaskDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EvaluationTaskDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EvaluationTaskDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EvaluationTaskDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EvaluationTaskDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EvaluationTaskDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EvaluationTaskDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EvaluationTaskDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EvaluationTaskDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EvaluationTaskDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EvaluationTaskDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EvaluationTaskDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EvaluationTaskDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EvaluationTaskDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EvaluationTaskDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EvaluationTaskDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EvaluationTaskDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EvaluationTaskDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EvaluationTaskDB] SET RECOVERY FULL 
GO
ALTER DATABASE [EvaluationTaskDB] SET  MULTI_USER 
GO
ALTER DATABASE [EvaluationTaskDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EvaluationTaskDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EvaluationTaskDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EvaluationTaskDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EvaluationTaskDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EvaluationTaskDB', N'ON'
GO
USE [EvaluationTaskDB]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 03/02/2020 10:09:47 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Qty] [decimal](18, 0) NULL,
	[LastSalePrice] [money] NULL,
	[LastPurchasePrice] [money] NULL,
	[SalePrice] [money] NULL,
	[PurchasePrice] [money] NULL,
	[StorID] [int] NULL,
	[UnitType] [bit] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemPackage]    Script Date: 03/02/2020 10:09:48 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemPackage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [nvarchar](50) NULL,
	[PackageID] [int] NULL,
 CONSTRAINT [PK_ItemPackage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogTable]    Script Date: 03/02/2020 10:09:48 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_LogTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Package]    Script Date: 03/02/2020 10:09:48 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Packege] [nvarchar](50) NULL,
 CONSTRAINT [PK_Package] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stor]    Script Date: 03/02/2020 10:09:48 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Stor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserT]    Script Date: 03/02/2020 10:09:48 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[AllItemsData]    Script Date: 03/02/2020 10:09:48 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AllItemsData]
AS
SELECT        dbo.Item.ID, dbo.Item.Name AS ItemName, dbo.Item.Qty AS Quantity, dbo.Item.LastSalePrice, dbo.Item.LastPurchasePrice, dbo.Item.SalePrice, dbo.Item.PurchasePrice, dbo.Item.UnitType, dbo.Stor.Name AS StorName
FROM            dbo.Item INNER JOIN
                         dbo.Stor ON dbo.Item.StorID = dbo.Stor.ID

GO
/****** Object:  View [dbo].[AllLogs]    Script Date: 03/02/2020 10:09:48 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AllLogs]
AS
SELECT        dbo.LogTable.ID, dbo.LogTable.Date, dbo.LogTable.Description, dbo.LogTable.UserID, dbo.UserT.UserName
FROM            dbo.LogTable INNER JOIN
                         dbo.UserT ON dbo.LogTable.UserID = dbo.UserT.ID

GO
/****** Object:  View [dbo].[AllPackages]    Script Date: 03/02/2020 10:09:48 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AllPackages]
AS
SELECT        ID, Packege
FROM            dbo.Package

GO
/****** Object:  View [dbo].[AllStors]    Script Date: 03/02/2020 10:09:48 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AllStors]
AS
SELECT        ID, Name
FROM            dbo.Stor

GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Stor] FOREIGN KEY([StorID])
REFERENCES [dbo].[Stor] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Stor]
GO
ALTER TABLE [dbo].[ItemPackage]  WITH CHECK ADD  CONSTRAINT [FK_ItemPackage_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItemPackage] CHECK CONSTRAINT [FK_ItemPackage_Item]
GO
ALTER TABLE [dbo].[ItemPackage]  WITH CHECK ADD  CONSTRAINT [FK_ItemPackage_Package] FOREIGN KEY([PackageID])
REFERENCES [dbo].[Package] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItemPackage] CHECK CONSTRAINT [FK_ItemPackage_Package]
GO
ALTER TABLE [dbo].[LogTable]  WITH CHECK ADD  CONSTRAINT [FK_LogTable_UserT] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserT] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LogTable] CHECK CONSTRAINT [FK_LogTable_UserT]
GO
/****** Object:  StoredProcedure [dbo].[AddNewItem]    Script Date: 03/02/2020 10:09:48 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddNewItem]
 @ID nvarchar(50),@ItemName nvarchar(200),
@Qty decimal(18, 0),@SalePrice money,
@PurchasePrice money,@StorID int,@UnitType int
as
insert into  Item
           (ID
           ,Name
           ,Qty
           ,SalePrice
           ,PurchasePrice
           ,StorID
           ,UnitType)
     values
           (@ID,@ItemName,@Qty, @SalePrice,@PurchasePrice,@StorID,@UnitType)

GO
/****** Object:  StoredProcedure [dbo].[GetItemByID]    Script Date: 03/02/2020 10:09:48 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetItemByID] @ItemID nvarchar(50)
as
select * from Item where  ID=N''+@ItemID+''


GO
/****** Object:  StoredProcedure [dbo].[GetUserByID]    Script Date: 03/02/2020 10:09:48 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[GetUserByID] @UserID int
as
select * from UserT where ID=@UserID

GO
/****** Object:  StoredProcedure [dbo].[InsertIntoItemPackage]    Script Date: 03/02/2020 10:09:48 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertIntoItemPackage] @ItemID nvarchar(50), @PackageID int
as
INSERT INTO ItemPackage(ItemID,PackageID)
values(N''+@ItemID+'',@PackageID)

GO
/****** Object:  StoredProcedure [dbo].[MasterInsertUpdateDelete]    Script Date: 03/02/2020 10:09:48 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MasterInsertUpdateDelete]  
(  
 @ID nvarchar(50)='',@ItemName nvarchar(200)='',
@Qty decimal(18, 0)=0,@SalePrice money=0,
@PurchasePrice money=0,@StorID int=0,@UnitType int=0
,@StatementType nvarchar(20) = '' ,@OldID nvarchar(50)='' 
)  
AS  
BEGIN  
IF @StatementType = 'Insert'  
BEGIN  
insert into  Item
           (ID
           ,Name
           ,Qty
           ,SalePrice
           ,PurchasePrice
           ,StorID
           ,UnitType)
     values
           (@ID,@ItemName,@Qty, @SalePrice,@PurchasePrice,@StorID,@UnitType)
  
END  
IF @StatementType = 'Select'  
BEGIN  
select * from AllItemsData  
END  
IF @StatementType = 'Update'  
BEGIN  
UPDATE Item SET  
ID = @ID, Name = @ItemName, @Qty = @Qty,  
SalePrice = @SalePrice,PurchasePrice=@PurchasePrice,UnitType=@UnitType 
WHERE ID =  N''+@OldID+''  
END  
else IF @StatementType = 'Delete'  
BEGIN  
DELETE FROM Item WHERE ID = N''+@ID+''  
END  
end  

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[32] 4[21] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Item"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stor"
            Begin Extent = 
               Top = 18
               Left = 344
               Bottom = 114
               Right = 514
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2160
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllItemsData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllItemsData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[33] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "LogTable"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UserT"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllLogs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllLogs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Package"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllPackages'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllPackages'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Stor"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllStors'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllStors'
GO
USE [master]
GO
ALTER DATABASE [EvaluationTaskDB] SET  READ_WRITE 
GO
