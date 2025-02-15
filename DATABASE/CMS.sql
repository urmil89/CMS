USE [master]
GO
/****** Object:  Database [EduCamp]    Script Date: 4/12/2021 3:30:15 PM ******/
CREATE DATABASE [EduCamp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EduCamp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\EduCamp.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EduCamp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\EduCamp_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EduCamp] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EduCamp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EduCamp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EduCamp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EduCamp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EduCamp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EduCamp] SET ARITHABORT OFF 
GO
ALTER DATABASE [EduCamp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EduCamp] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EduCamp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EduCamp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EduCamp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EduCamp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EduCamp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EduCamp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EduCamp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EduCamp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EduCamp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EduCamp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EduCamp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EduCamp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EduCamp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EduCamp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EduCamp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EduCamp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EduCamp] SET RECOVERY FULL 
GO
ALTER DATABASE [EduCamp] SET  MULTI_USER 
GO
ALTER DATABASE [EduCamp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EduCamp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EduCamp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EduCamp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EduCamp', N'ON'
GO
USE [EduCamp]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 4/12/2021 3:30:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[admin_username] [nvarchar](50) NOT NULL,
	[admin_password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Admission_Headers]    Script Date: 4/12/2021 3:30:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admission_Headers](
	[ah_id] [int] IDENTITY(1,1) NOT NULL,
	[ah_course] [nvarchar](50) NOT NULL,
	[ah_sem] [int] NOT NULL,
	[ah_fees] [int] NOT NULL,
	[ah_startdate] [date] NOT NULL,
	[ah_enddate] [date] NOT NULL,
	[ah_start_termdate] [date] NOT NULL,
	[ah_end_termdate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ah_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Admissions]    Script Date: 4/12/2021 3:30:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admissions](
	[ad_id] [int] IDENTITY(1,1) NOT NULL,
	[ad_ah] [int] NOT NULL,
	[ad_course] [int] NOT NULL,
	[ad_sem] [int] NOT NULL,
	[ad_student] [int] NOT NULL,
	[ad_rollno] [int] NOT NULL,
	[ad_fees] [int] NOT NULL,
	[ad_payment] [nvarchar](50) NOT NULL,
	[ad_date] [date] NOT NULL,
	[ad_status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[assignments]    Script Date: 4/12/2021 3:30:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assignments](
	[a_id] [int] IDENTITY(1,1) NOT NULL,
	[a_title] [nvarchar](550) NOT NULL,
	[a_file] [nchar](150) NOT NULL,
	[a_sdate] [date] NOT NULL,
	[a_edate] [date] NOT NULL,
	[a_ah_id] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[a_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[courses]    Script Date: 4/12/2021 3:30:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[c_id] [int] IDENTITY(1,1) NOT NULL,
	[c_name] [nvarchar](50) NOT NULL,
	[c_maxsem] [int] NOT NULL,
	[c_fees] [int] NOT NULL,
	[c_status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[faculty]    Script Date: 4/12/2021 3:30:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[faculty](
	[f_id] [int] IDENTITY(1,1) NOT NULL,
	[f_name] [nvarchar](50) NOT NULL,
	[f_dob] [nvarchar](50) NOT NULL,
	[f_gender] [nvarchar](50) NOT NULL,
	[f_mobile] [nvarchar](50) NOT NULL,
	[f_email] [nvarchar](50) NOT NULL,
	[f_address] [nvarchar](150) NOT NULL,
	[f_city] [nvarchar](50) NOT NULL,
	[f_pincode] [nvarchar](50) NOT NULL,
	[f_image] [nvarchar](50) NOT NULL,
	[f_password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[f_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fine]    Script Date: 4/12/2021 3:30:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fine](
	[f_id] [int] IDENTITY(1,1) NOT NULL,
	[f_student] [nvarchar](50) NOT NULL,
	[f_title] [nvarchar](50) NOT NULL,
	[f_amount] [int] NOT NULL,
	[f_status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[f_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[notice]    Script Date: 4/12/2021 3:30:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notice](
	[n_id] [int] IDENTITY(1,1) NOT NULL,
	[n_title] [nvarchar](50) NOT NULL,
	[n_desc] [nvarchar](1200) NOT NULL,
	[n_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[students]    Script Date: 4/12/2021 3:30:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[s_id] [int] IDENTITY(1,1) NOT NULL,
	[s_name] [nvarchar](50) NOT NULL,
	[s_fathername] [nvarchar](50) NOT NULL,
	[s_dob] [date] NOT NULL,
	[s_gender] [nvarchar](50) NOT NULL,
	[s_mobile] [bigint] NOT NULL,
	[s_email] [nvarchar](50) NOT NULL,
	[s_address] [nvarchar](250) NOT NULL,
	[s_city] [nvarchar](50) NOT NULL,
	[s_pincode] [int] NOT NULL,
	[s_image] [nvarchar](50) NOT NULL,
	[s_course] [int] NOT NULL,
	[s_gr] [nvarchar](50) NOT NULL,
	[s_password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[s_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[submissions]    Script Date: 4/12/2021 3:30:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[submissions](
	[sub_id] [int] IDENTITY(1,1) NOT NULL,
	[sub_file] [nvarchar](50) NULL,
	[sub_a_id] [int] NOT NULL,
	[sub_user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sub_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([admin_id], [admin_username], [admin_password]) VALUES (1, N'admin', N'admin')
INSERT [dbo].[admin] ([admin_id], [admin_username], [admin_password]) VALUES (2, N'urmil', N'urmil')
SET IDENTITY_INSERT [dbo].[admin] OFF
SET IDENTITY_INSERT [dbo].[Admission_Headers] ON 

INSERT [dbo].[Admission_Headers] ([ah_id], [ah_course], [ah_sem], [ah_fees], [ah_startdate], [ah_enddate], [ah_start_termdate], [ah_end_termdate]) VALUES (1, N'2', 1, 1500, CAST(0x62420B00 AS Date), CAST(0x6B420B00 AS Date), CAST(0x62420B00 AS Date), CAST(0xF0420B00 AS Date))
INSERT [dbo].[Admission_Headers] ([ah_id], [ah_course], [ah_sem], [ah_fees], [ah_startdate], [ah_enddate], [ah_start_termdate], [ah_end_termdate]) VALUES (2, N'3', 3, 8600, CAST(0x62420B00 AS Date), CAST(0x67420B00 AS Date), CAST(0x68420B00 AS Date), CAST(0xDF420B00 AS Date))
INSERT [dbo].[Admission_Headers] ([ah_id], [ah_course], [ah_sem], [ah_fees], [ah_startdate], [ah_enddate], [ah_start_termdate], [ah_end_termdate]) VALUES (3, N'3', 1, 8600, CAST(0x62420B00 AS Date), CAST(0x75420B00 AS Date), CAST(0x58420B00 AS Date), CAST(0x19430B00 AS Date))
SET IDENTITY_INSERT [dbo].[Admission_Headers] OFF
SET IDENTITY_INSERT [dbo].[Admissions] ON 

INSERT [dbo].[Admissions] ([ad_id], [ad_ah], [ad_course], [ad_sem], [ad_student], [ad_rollno], [ad_fees], [ad_payment], [ad_date], [ad_status]) VALUES (1, 1, 2, 1, 1, 1, 1500, N'Unpaid', CAST(0x62420B00 AS Date), N'pending')
INSERT [dbo].[Admissions] ([ad_id], [ad_ah], [ad_course], [ad_sem], [ad_student], [ad_rollno], [ad_fees], [ad_payment], [ad_date], [ad_status]) VALUES (2, 3, 3, 1, 2, 1, 8600, N'Paid', CAST(0x62420B00 AS Date), N'Approved')
INSERT [dbo].[Admissions] ([ad_id], [ad_ah], [ad_course], [ad_sem], [ad_student], [ad_rollno], [ad_fees], [ad_payment], [ad_date], [ad_status]) VALUES (3, 3, 3, 1, 3, 1, 8600, N'Paid', CAST(0x62420B00 AS Date), N'Approved')
INSERT [dbo].[Admissions] ([ad_id], [ad_ah], [ad_course], [ad_sem], [ad_student], [ad_rollno], [ad_fees], [ad_payment], [ad_date], [ad_status]) VALUES (4, 2, 3, 3, 4, 1, 8600, N'Paid', CAST(0x63420B00 AS Date), N'Approved')
SET IDENTITY_INSERT [dbo].[Admissions] OFF
SET IDENTITY_INSERT [dbo].[assignments] ON 

INSERT [dbo].[assignments] ([a_id], [a_title], [a_file], [a_sdate], [a_edate], [a_ah_id]) VALUES (1, N'HTML and CSS', N'34_Introduction.pdf                                                                                                                                   ', CAST(0x62420B00 AS Date), CAST(0x62420B00 AS Date), N'1')
INSERT [dbo].[assignments] ([a_id], [a_title], [a_file], [a_sdate], [a_edate], [a_ah_id]) VALUES (2, N'New Asignment', N'5_Variables_and_Data_Types.pdf                                                                                                                        ', CAST(0x62420B00 AS Date), CAST(0x62420B00 AS Date), N'3')
SET IDENTITY_INSERT [dbo].[assignments] OFF
SET IDENTITY_INSERT [dbo].[courses] ON 

INSERT [dbo].[courses] ([c_id], [c_name], [c_maxsem], [c_fees], [c_status]) VALUES (2, N'BCA', 6, 1500, 1)
INSERT [dbo].[courses] ([c_id], [c_name], [c_maxsem], [c_fees], [c_status]) VALUES (3, N'MCA', 4, 8600, 1)
INSERT [dbo].[courses] ([c_id], [c_name], [c_maxsem], [c_fees], [c_status]) VALUES (7, N'BBA', 6, 150, 1)
INSERT [dbo].[courses] ([c_id], [c_name], [c_maxsem], [c_fees], [c_status]) VALUES (12, N'Bsc.IT', 6, 2500, 1)
INSERT [dbo].[courses] ([c_id], [c_name], [c_maxsem], [c_fees], [c_status]) VALUES (15, N'M.sc Cyber Security', 1, 5000, 1)
SET IDENTITY_INSERT [dbo].[courses] OFF
SET IDENTITY_INSERT [dbo].[faculty] ON 

INSERT [dbo].[faculty] ([f_id], [f_name], [f_dob], [f_gender], [f_mobile], [f_email], [f_address], [f_city], [f_pincode], [f_image], [f_password]) VALUES (7, N'khushali trivedi', N'2001-11-12', N'Female', N'992555555', N'khushi@gmail.com', N'123', N'amreli', N'456123', N's_7.png', N'123')
INSERT [dbo].[faculty] ([f_id], [f_name], [f_dob], [f_gender], [f_mobile], [f_email], [f_address], [f_city], [f_pincode], [f_image], [f_password]) VALUES (10, N'rushi', N'0201-01-01', N'Male', N'9876543210', N'rushi@gmail.com', N'sample address', N'amreli', N'213234', N's_10.jpg', N'123')
SET IDENTITY_INSERT [dbo].[faculty] OFF
SET IDENTITY_INSERT [dbo].[fine] ON 

INSERT [dbo].[fine] ([f_id], [f_student], [f_title], [f_amount], [f_status]) VALUES (3, N'6', N'HOD missbehave', 5000, N'Approved')
INSERT [dbo].[fine] ([f_id], [f_student], [f_title], [f_amount], [f_status]) VALUES (4, N'23', N'Attendance', 200, N'Approved')
INSERT [dbo].[fine] ([f_id], [f_student], [f_title], [f_amount], [f_status]) VALUES (7, N'19', N'your are sad make smile', 200, N'Approved')
INSERT [dbo].[fine] ([f_id], [f_student], [f_title], [f_amount], [f_status]) VALUES (8, N'6', N'low verbal', 100, N'Approved')
INSERT [dbo].[fine] ([f_id], [f_student], [f_title], [f_amount], [f_status]) VALUES (9, N'19', N'Testing Fine', 5000, N'Pending')
INSERT [dbo].[fine] ([f_id], [f_student], [f_title], [f_amount], [f_status]) VALUES (10, N'21', N'not Give daily test', 100, N'Pending')
INSERT [dbo].[fine] ([f_id], [f_student], [f_title], [f_amount], [f_status]) VALUES (11, N'6', N'don''t add values in class', 200, N'Approved')
INSERT [dbo].[fine] ([f_id], [f_student], [f_title], [f_amount], [f_status]) VALUES (13, N'6', N'misbehave with teacher', 1000, N'Pending')
INSERT [dbo].[fine] ([f_id], [f_student], [f_title], [f_amount], [f_status]) VALUES (14, N'1', N'LATE admission', 100, N'Pending')
INSERT [dbo].[fine] ([f_id], [f_student], [f_title], [f_amount], [f_status]) VALUES (15, N'2', N'Productivity problem', 100, N'Pending')
SET IDENTITY_INSERT [dbo].[fine] OFF
SET IDENTITY_INSERT [dbo].[notice] ON 

INSERT [dbo].[notice] ([n_id], [n_title], [n_desc], [n_date]) VALUES (1, N'CMAT', N'CMAT exam results are declared', CAST(0x62420B00 AS Date))
INSERT [dbo].[notice] ([n_id], [n_title], [n_desc], [n_date]) VALUES (2, N'Project submission after 5 day', N'you should submit your college project after some day', CAST(0x62420B00 AS Date))
INSERT [dbo].[notice] ([n_id], [n_title], [n_desc], [n_date]) VALUES (3, N'demo', N'demo', CAST(0x62420B00 AS Date))
INSERT [dbo].[notice] ([n_id], [n_title], [n_desc], [n_date]) VALUES (4, N'Sunshine Public School', N'The Principal, Sunshine Public School, Dindigul has invited the Inspector of Police (Traffic) to deliver a lecture on ‘Road Safety’ in her school. Draft a notice in about 50 words informing the students to assemble in the school auditorium. (All India 2017).', CAST(0x63420B00 AS Date))
SET IDENTITY_INSERT [dbo].[notice] OFF
SET IDENTITY_INSERT [dbo].[students] ON 

INSERT [dbo].[students] ([s_id], [s_name], [s_fathername], [s_dob], [s_gender], [s_mobile], [s_email], [s_address], [s_city], [s_pincode], [s_image], [s_course], [s_gr], [s_password]) VALUES (1, N'shiva', N'mahadevan', CAST(0x75250B00 AS Date), N'Male', 998877665544, N'shiva@gmail.com', N'kailash', N'kailsh', 0, N's_1.png', 2, N'2021BCA1', N'000')
INSERT [dbo].[students] ([s_id], [s_name], [s_fathername], [s_dob], [s_gender], [s_mobile], [s_email], [s_address], [s_city], [s_pincode], [s_image], [s_course], [s_gr], [s_password]) VALUES (2, N'smit', N'k', CAST(0x75250B00 AS Date), N'Male', 9876543210, N'smtbos@gmail.com', N'damnagar', N'damnagar', 654987, N's_2.jfif', 3, N'2021MCA1', N'000')
INSERT [dbo].[students] ([s_id], [s_name], [s_fathername], [s_dob], [s_gender], [s_mobile], [s_email], [s_address], [s_city], [s_pincode], [s_image], [s_course], [s_gr], [s_password]) VALUES (3, N'rudra', N'mahadevan', CAST(0x75250B00 AS Date), N'Male', 9876543210, N'rudra@gmail.com', N'kailash', N'kailsashpur', 654321, N's_3.png', 3, N'2021MCA2', N'000')
INSERT [dbo].[students] ([s_id], [s_name], [s_fathername], [s_dob], [s_gender], [s_mobile], [s_email], [s_address], [s_city], [s_pincode], [s_image], [s_course], [s_gr], [s_password]) VALUES (4, N'vidhi', N'j', CAST(0x63420B00 AS Date), N'Male', 8976542130, N'vj@gmail.com', N'rampur', N'rampur', 654321, N's_4.png', 3, N'2021MCA3', N'123')
SET IDENTITY_INSERT [dbo].[students] OFF
SET IDENTITY_INSERT [dbo].[submissions] ON 

INSERT [dbo].[submissions] ([sub_id], [sub_file], [sub_a_id], [sub_user_id]) VALUES (1, N'MARKET Ideas.pdf', 1, 1)
INSERT [dbo].[submissions] ([sub_id], [sub_file], [sub_a_id], [sub_user_id]) VALUES (2, N'20_Quiz.pdf', 2, 3)
SET IDENTITY_INSERT [dbo].[submissions] OFF
ALTER TABLE [dbo].[Admissions] ADD  DEFAULT ('Pending') FOR [ad_status]
GO
ALTER TABLE [dbo].[assignments] ADD  DEFAULT ('no assignmets available') FOR [a_title]
GO
ALTER TABLE [dbo].[assignments] ADD  DEFAULT ('no assignmets available') FOR [a_file]
GO
ALTER TABLE [dbo].[assignments] ADD  DEFAULT (getdate()) FOR [a_sdate]
GO
ALTER TABLE [dbo].[assignments] ADD  DEFAULT (getdate()) FOR [a_edate]
GO
ALTER TABLE [dbo].[courses] ADD  DEFAULT ((1)) FOR [c_status]
GO
ALTER TABLE [dbo].[faculty] ADD  DEFAULT ('photo.png') FOR [f_image]
GO
ALTER TABLE [dbo].[faculty] ADD  DEFAULT ('') FOR [f_password]
GO
ALTER TABLE [dbo].[fine] ADD  DEFAULT ('Pending') FOR [f_status]
GO
ALTER TABLE [dbo].[notice] ADD  DEFAULT (getdate()) FOR [n_date]
GO
ALTER TABLE [dbo].[students] ADD  DEFAULT ('photo.png') FOR [s_image]
GO
ALTER TABLE [dbo].[students] ADD  DEFAULT ((0)) FOR [s_course]
GO
ALTER TABLE [dbo].[students] ADD  DEFAULT ('') FOR [s_gr]
GO
ALTER TABLE [dbo].[students] ADD  DEFAULT ('123') FOR [s_password]
GO
USE [master]
GO
ALTER DATABASE [EduCamp] SET  READ_WRITE 
GO
