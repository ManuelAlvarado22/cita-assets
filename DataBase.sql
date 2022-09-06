/*create database citas;
use citas;*/

create table Degree (
	Id int not null primary key identity(1, 1),
	[Name] varchar(150) not null
)
go

create table Users (
	Id int not null primary key identity(1, 1),
	[Name] varchar(100) not null,
	LastName varchar(150),
	Token varchar(max),
	Email varchar(150) not null,
	NormalizedEmail varchar(150) not null,
	UserName varchar(100) not null,
	NormalizedUserName varchar(100) not null,
	[Password] varchar(max) not null,
	BirthDate date,
	[Description] varchar(550),
	Genre varchar(20),
	ImageProfile varchar(500),
	IdDegree int not null foreign key references Degree(Id)
)
go

create table Posts (
	Id int not null primary key identity(1, 1),
	[Description] varchar(550),
	[Date] datetime not null,
	Likes int not null,
	IdUser int not null foreign key references Users(Id)
)
go

create table Comments (
	Id int not null primary key identity(1, 1),
	Comment varchar(550),
	[Date] datetime not null,
	IdUser int not null foreign key references Users(Id),
	IdPost int not null foreign key references Posts(Id)
)
go

create table Hobbies (
	Id int not null primary key identity(1, 1),
	[Name] varchar(100)
)
go

create table UserHobbies (
	Id int not null primary key identity(1, 1),
	IdUser int not null foreign key references Users(Id),
	IdHobbie int not null foreign key references Hobbies(Id)
)
go

create table PostImages (
	Id int not null primary key identity(1, 1),
	ImageUrl varchar(500) not null,
	IdPost int not null foreign key references Posts(Id)
)
go

create table SocialNetworks (
	Id int not null primary key identity(1, 1),
	[Name] varchar(50) not null,
	[Link] varchar(1000) not null,
	IdUser int not null foreign key references Users(Id)
)
go

create table [Messages] (
	Id int not null primary key identity(1, 1),
	[Message] varchar(1200) not null,
	[Date] datetime not null,
	IdUserSend int not null foreign key references Users(Id),
	IdUserRecieve int not null foreign key references Users(Id)
)
go

create table [Dates] (
	Id int not null primary key identity(1, 1),
	[Date] datetime not null,
	Place varchar(1000),
	[Description] varchar(550),
	[Grade] float,
	IdUserFirst int not null foreign key references Users(Id),
	IdUserSecond int not null foreign key references Users(Id)
)
go