CREATE DATABASE [Shopping]

USE DATABASE [Shopping]

ALTER DATABASE [Shopping] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shopping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shopping] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Shopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shopping] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Shopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shopping] SET RECOVERY FULL 
GO
ALTER DATABASE [Shopping] SET  MULTI_USER 
GO
ALTER DATABASE [Shopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shopping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [Shopping]
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 10/22/2022 1:26:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategories](
	[categoryID] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblCategories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblGoogleAccount]    Script Date: 10/22/2022 1:26:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGoogleAccount](
	[username] [nvarchar](30) NOT NULL,
	[email] [nvarchar](200) NULL,
	[password] [nvarchar](200) NULL,
	[firstname] [nvarchar](300) NULL,
	[lastname] [nvarchar](300) NULL,
	[picture] [nvarchar](800) NULL,
	[role] [nvarchar](200) NULL,
	[DOB] [date] NULL,
	[address] [nvarchar](200) NULL,
	[organization] [nvarchar](200) NULL,
	[phone] [nvarchar](200) NULL,
	[status] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 10/22/2022 1:26:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [nvarchar](30) NOT NULL,
	[userID] [nvarchar](30) NOT NULL,
	[date] [date] NULL,
	[total] [money] NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 10/22/2022 1:26:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [nvarchar](30) NOT NULL,
	[orderID] [nvarchar](30) NULL,
	[productID] [nvarchar](30) NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 10/22/2022 1:26:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [nvarchar](30) NOT NULL,
	[name] [nvarchar](50) NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
	[images] [nvarchar](200) NULL,
	[categoryID] [int] NOT NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 10/22/2022 1:26:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userID] [nvarchar](30) NOT NULL,
	[name] [nvarchar](50) NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[password] [nvarchar](10) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblCategories] ([categoryID], [name]) VALUES (1, N'Bubble Tea')
INSERT [dbo].[tblCategories] ([categoryID], [name]) VALUES (2, N'Iced Tea')
INSERT [dbo].[tblCategories] ([categoryID], [name]) VALUES (3, N'Black Sugar Tea')
INSERT [dbo].[tblGoogleAccount] ([username], [email], [password], [firstname], [lastname], [picture], [role], [DOB], [address], [organization], [phone], [status]) VALUES (N'110851084900636816894', N'thien25078@gmail.com', NULL, N'Văn', N'Thiện', N'https://lh3.googleusercontent.com/a/ALm5wu1sA14wdPzB6xSbF168n4j3z9JHmU84WoMTCrSfHQ=s96-c', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblGoogleAccount] ([username], [email], [password], [firstname], [lastname], [picture], [role], [DOB], [address], [organization], [phone], [status]) VALUES (N'110851084900636816894', N'thien25078@gmail.com', NULL, N'Văn', N'Thiện', N'https://lh3.googleusercontent.com/a/ALm5wu1sA14wdPzB6xSbF168n4j3z9JHmU84WoMTCrSfHQ=s96-c', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblGoogleAccount] ([username], [email], [password], [firstname], [lastname], [picture], [role], [DOB], [address], [organization], [phone], [status]) VALUES (N'110851084900636816894', N'thien25078@gmail.com', NULL, N'Văn', N'Thiện', N'https://lh3.googleusercontent.com/a/ALm5wu1sA14wdPzB6xSbF168n4j3z9JHmU84WoMTCrSfHQ=s96-c', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblGoogleAccount] ([username], [email], [password], [firstname], [lastname], [picture], [role], [DOB], [address], [organization], [phone], [status]) VALUES (N'104281754472766761057', N'thiendvse160654@fpt.edu.vn', NULL, N'Dang Van Thien', N'(K16 HCM)', N'https://lh3.googleusercontent.com/a/ALm5wu0sJPBWsUp2Rwyv3tWs5DSDGdB3D_6IASCvTbRi=s96-c', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblGoogleAccount] ([username], [email], [password], [firstname], [lastname], [picture], [role], [DOB], [address], [organization], [phone], [status]) VALUES (N'104281754472766761057', N'thiendvse160654@fpt.edu.vn', NULL, N'Dang Van Thien', N'(K16 HCM)', N'https://lh3.googleusercontent.com/a/ALm5wu0sJPBWsUp2Rwyv3tWs5DSDGdB3D_6IASCvTbRi=s96-c', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblGoogleAccount] ([username], [email], [password], [firstname], [lastname], [picture], [role], [DOB], [address], [organization], [phone], [status]) VALUES (N'104281754472766761057', N'thiendvse160654@fpt.edu.vn', NULL, N'Dang Van Thien', N'(K16 HCM)', N'https://lh3.googleusercontent.com/a/ALm5wu0sJPBWsUp2Rwyv3tWs5DSDGdB3D_6IASCvTbRi=s96-c', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblGoogleAccount] ([username], [email], [password], [firstname], [lastname], [picture], [role], [DOB], [address], [organization], [phone], [status]) VALUES (N'110851084900636816894', N'thien25078@gmail.com', NULL, N'Văn', N'Thiện', N'https://lh3.googleusercontent.com/a/ALm5wu1sA14wdPzB6xSbF168n4j3z9JHmU84WoMTCrSfHQ=s96-c', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblGoogleAccount] ([username], [email], [password], [firstname], [lastname], [picture], [role], [DOB], [address], [organization], [phone], [status]) VALUES (N'104622362766131436005', N'vanthien120102@gmail.com', NULL, N'Thiện', N'Văn', N'https://lh3.googleusercontent.com/a/ALm5wu2rgyxRZlgE7eM2p-IwDOlVZbCKED76AsWHZPl8-g=s96-c', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblGoogleAccount] ([username], [email], [password], [firstname], [lastname], [picture], [role], [DOB], [address], [organization], [phone], [status]) VALUES (N'110851084900636816894', N'thien25078@gmail.com', NULL, N'Văn', N'Thiện', N'https://lh3.googleusercontent.com/a/ALm5wu1sA14wdPzB6xSbF168n4j3z9JHmU84WoMTCrSfHQ=s96-c', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblGoogleAccount] ([username], [email], [password], [firstname], [lastname], [picture], [role], [DOB], [address], [organization], [phone], [status]) VALUES (N'110851084900636816894', N'thien25078@gmail.com', NULL, N'Văn', N'Thiện', N'https://lh3.googleusercontent.com/a/ALm5wu1sA14wdPzB6xSbF168n4j3z9JHmU84WoMTCrSfHQ=s96-c', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblGoogleAccount] ([username], [email], [password], [firstname], [lastname], [picture], [role], [DOB], [address], [organization], [phone], [status]) VALUES (N'103919099525611320965', N'thanhldse170144@fpt.edu.vn', NULL, N'Le Duc Thanh', N'(K17 HCM)', N'https://lh3.googleusercontent.com/a/ALm5wu1UQDwVtQU2yrUUVGcaAonnUix3GQih4Ph2Uhhp=s96-c', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblGoogleAccount] ([username], [email], [password], [firstname], [lastname], [picture], [role], [DOB], [address], [organization], [phone], [status]) VALUES (N'110851084900636816894', N'thien25078@gmail.com', NULL, N'Văn', N'Thiện', N'https://lh3.googleusercontent.com/a/ALm5wu1sA14wdPzB6xSbF168n4j3z9JHmU84WoMTCrSfHQ=s96-c', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblGoogleAccount] ([username], [email], [password], [firstname], [lastname], [picture], [role], [DOB], [address], [organization], [phone], [status]) VALUES (N'104281754472766761057', N'thiendvse160654@fpt.edu.vn', NULL, N'Dang Van Thien', N'(K16 HCM)', N'https://lh3.googleusercontent.com/a/ALm5wu0sJPBWsUp2Rwyv3tWs5DSDGdB3D_6IASCvTbRi=s96-c', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblGoogleAccount] ([username], [email], [password], [firstname], [lastname], [picture], [role], [DOB], [address], [organization], [phone], [status]) VALUES (N'103919099525611320965', N'thanhldse170144@fpt.edu.vn', NULL, N'Le Duc Thanh', N'(K17 HCM)', N'https://lh3.googleusercontent.com/a/ALm5wu1UQDwVtQU2yrUUVGcaAonnUix3GQih4Ph2Uhhp=s96-c', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrder] ([orderID], [userID], [date], [total]) VALUES (N'P001', N'SE140103', CAST(N'2022-09-14' AS Date), 90.0000)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [price], [quantity]) VALUES (N'D001', N'P001', N'T002', 30.0000, 3)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'T001', N'Orange Juice', 35.0000, 20, N'img/4.jpg', 3)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'T002', N'Black Sugar Tea', 30.0000, 20, N'img/GJ.jpg', 2)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'T003', N'Dark Blue Tea', 35.0000, 20, N'img/BM.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'T004', N'Honey Lemon', 35.0000, 20, N'img/HL.png', 3)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'T005', N'Carrot Smoothies', 35.0000, 20, N'img/MA.jpg', 3)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'T006', N'Green Tea', 40.0000, 20, N'img/GR.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'T007', N'Matcha Sugar', 30.0000, 20, N'img/5.jpg', 2)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'T008', N'Banana Smoothies', 35.0000, 20, N'img/BA.jpg', 3)
INSERT [dbo].[tblUser] ([userID], [name], [phone], [address], [email], [roleID], [password]) VALUES (N'admin', N'Van Thien', N'025024', N'HCM', N'thien25078@gmail.com', N'AD', N'1')
INSERT [dbo].[tblUser] ([userID], [name], [phone], [address], [email], [roleID], [password]) VALUES (N'admin2', N'Thien Van', N'0585027864', N'HCM', N'thien25078@gmail.com', N'US', N'1')
INSERT [dbo].[tblUser] ([userID], [name], [phone], [address], [email], [roleID], [password]) VALUES (N'hoanth', N'Hoan The', N'058283', N'HCM', N'thedh@ueh.edu.vn', N'US', N'1')
INSERT [dbo].[tblUser] ([userID], [name], [phone], [address], [email], [roleID], [password]) VALUES (N'SE130363', N'Ngo Ha Tri Bao', N'012482', N'HN', N'baoht@fu.edu.vn', N'US', N'1')
INSERT [dbo].[tblUser] ([userID], [name], [phone], [address], [email], [roleID], [password]) VALUES (N'SE140103', N'Phuoc Long', N'046723', N'HN', N'longt5@fu.edu.vn', N'US', N'1')
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUser]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategories] ([categoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategories]
GO
USE [master]
GO
ALTER DATABASE [Shopping] SET  READ_WRITE 
GO
