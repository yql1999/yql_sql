CREATE TABLE Students
    (Sno CHAR(8) NOT NULL UNIQUE,
     Sname CHAR(20) NOT NULL,
     Semail CHAR(50),
     Scredit FLOAT,
     Ssex CHAR(2),
     CONSTRAINT PK_Students PRIMARY KEY(Sno),
     CONSTRAINT CK_Students_Scredit CHECK(Scredit>=0))
CREATE TABLE Teachers
    (Tno CHAR(8) NOT NULL UNIQUE,
     Tname CHAR(20) NOT NULL,
     Temail CHAR(50),
     Tsalary FLOAT,
     CONSTRAINT PK_Teachers PRIMARY KEY(Tno))
CREATE TABLE Courses
    (Cno CHAR(8) NOT NULL UNIQUE,
     Cname CHAR(20),
     Ccredit FLOAT,
     CONSTRAINT PK_Courses PRIMARY KEY(Cno))
CREATE TABLE Reports
    (Sno CHAR(8) NOT NULL,
     Tno CHAR(8) NOT NULL,
     Cno CHAR(8) NOT NULL,
     Score FLOAT,
     CONSTRAINT PK_Reports PRIMARY KEY(Sno,Tno,Cno),
     CONSTRAINT FK_Reports_Sno FOREIGN KEY(Sno) REFERENCES Students,
     CONSTRAINT FK_Reports_Tno FOREIGN KEY(Tno) REFERENCES Teachers,
     CONSTRAINT FK_Reports_Cno FOREIGN KEY(Cno) REFERENCES Courses)
