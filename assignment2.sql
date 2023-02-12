drop database if exists testing_system;
create database if not exists testing_system;
use testing_system;
drop table if exists deparment;
create table deparment(
DeparmentID tinyint primary key auto_increment,
DeparmentName varchar(50) not null unique
);

-- table 2 
create table `position`(
PositionID tinyint primary key auto_increment,
PositionName enum('Dev' , 'Test' , 'Scrum Master' , 'PM')
);

-- table 3
create table `account`(
AccountID int primary key auto_increment,
Email varchar(50) not null unique,
Username varchar(50) not null,
Fullname varchar(50),
DepartmentID tinyint,
PositionID tinyint,
CreateDate date,
 constraint account_deparment_fk foreign key(DepartmentID) references deparment(DeparmentID),
 constraint account_position_fk foreign key(PositionID) references `position`(PositionID)
);

-- table 4
create table `group`(
 GroupID tinyint primary key auto_increment,
 GroupName varchar(50) not null unique,
 CreatorID int,
 CreateDate date,
 constraint group_account_fk foreign key(creatorID) references `account`(AccountID)
);

-- table 5
create table groupaccount(
GroupID tinyint,
AccountID int,
Joindate date,
constraint groupaccount_group_fk foreign key(groupID) references `group`(groupID),
constraint groupaccount_account_fk foreign key(accountID) references `account`(accountID)
);

-- table 6
drop table typequestion;
create table typequestion(
TypeID tinyint primary key auto_increment,
TypeName enum( 'essay' , 'multiple-choice' )
);

-- table 7
create table categoryquestion(
CategoryID tinyint primary key auto_increment,
CategoryName varchar(50) not null unique
);

-- table 8

create table question(
QuestionID tinyint primary key auto_increment,
Content varchar(500) not null unique,
CategoryID tinyint,
constraint question_categoryquestion_pk foreign key (CategoryID) references categoryquestion(CategoryID),
TypeID tinyint,
constraint question_typequestion foreign key (TypeID) references typequestion(TypeID),
CreatorID int not null unique,
Creatdate date
);

-- table 9

Create table answer(
AnswerID tinyint primary key auto_increment,
Content varchar(1000) not null,
QuestionID tinyint,
constraint answer_question foreign key(QuestionID) references question(QuestionID),
isCorrect enum( 'true' , 'faild' )
);

-- table 10
Create table exam(
ExamID tinyint primary key auto_increment,
`Code` tinyint not null,
Title varchar(100),
CategoryID tinyint,
constraint exam_categoryquestion_fk foreign key(CategoryID) references categoryquestion(CategoryID),
Duration datetime,
CreatorID int,
constraint exam_question_fk foreign key(CreatorID) references question(creatorID),
CreateDate date
);
 -- table 11
 
 Create table examquestion(
 ExamID tinyint,
 QuestionID tinyint,
 constraint examquestion_examID_fk foreign key(ExamID) references exam(ExamID),
 constraint examquestion_question_fk foreign key(QuestionID) references question(QuestionID)
 );





