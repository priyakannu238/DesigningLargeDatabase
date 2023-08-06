CREATE DATABASE Project_1;
USE Project_1;

--------------------------------Role Table--------------------------------
CREATE TABLE role(
		ID INT,
		Role_Name VARCHAR(100)
		CONSTRAINT Role_Id_PK Primary KEY(ID)
		)

------------------------------User Account Table----------------

CREATE TABLE User_Account(
			ID INT,
			User_Name VARCHAR(100),
			Email VARCHAR(254),
			Password VARCHAR(200),
			Password_Salt VARCHAR(50) NOT NULL,
			Password_Hash_Algorithm VARCHAR(50),
			CONSTRAINT User_Account_PK PRIMARY KEY(ID)
			)

-----------------------------------Status Table-------------------------------

CREATE TABLE Status(
		ID INT,
		status_name varchar(100),
		is_user_working BIT,
		CONSTRAINT Status_ID_PK PRIMARY KEY(ID)
		) 


---------------------------------User Has Role Table-------------------------------


CREATE TABLE User_Has_Role(
		ID INT,
		Role_Start_Time DATETIME,
		Role_End_Time DATETIME NOT NULL,-- A table cannot contain two TimesStamp Columns.
		User_Account_ID INT,
		Role_ID INT,

		CONSTRAINT User_Has_Role_PK PRIMARY KEY(ID),
		CONSTRAINT User_Has_Role_User_Account_ID
						Foreign Key(User_Account_ID) REFERENCES User_Account(ID),
		CONSTRAINT User_Has_Role_User_Role_ID
						Foreign Key(Role_ID) REFERENCES Role(ID),
		)

---------------------------------User Has Status Table-------------------------------

CREATE TABLE User_Has_Status(
		ID INT,
		Status_Start_Time DATETIME,
		Status_End_Time DATETIME NOT NULL,-- A table cannot contain two TimesStamp Columns.
		User_Account_ID INT,
		Status_ID INT,
		CONSTRAINT User_Has_Status_ID_PK PRIMARY KEY(ID),
		CONSTRAINT User_Has_Status_User_Account_ID
						Foreign Key(User_Account_ID) REFERENCES User_Account(ID),
		CONSTRAINT User_Has_Status_User_Status_ID
						Foreign Key(Status_ID) REFERENCES Status(ID),
		)


-- Insert data into Role table
INSERT INTO role (ID, Role_Name) VALUES
(1, 'Admin'),
(2, 'Manager'),
(3, 'Employee');

-- Insert data into User_Account table
INSERT INTO User_Account (ID, User_Name, Email, Password, Password_Salt, Password_Hash_Algorithm) VALUES
(1, 'john', 'john@example.com', 'password', 'salt123', 'SHA256'),
(2, 'jane', 'jane@example.com', 'password', 'salt456', 'SHA512'),
(3, 'jim', 'jim@example.com', 'password', 'salt789', 'SHA1');

-- Insert data into Status table
INSERT INTO Status (ID, status_name, is_user_working) VALUES
(1, 'Active', 1),
(2, 'Inactive', 0),
(3, 'On Leave', 0);

-- Insert data into User_Has_Role table
INSERT INTO User_Has_Role (ID, Role_Start_Time, Role_End_Time, User_Account_ID, Role_ID) VALUES
(1, '2022-01-01 09:00:00', '2022-06-30 18:00:00', 1, 1),
(2, '2022-01-01 09:00:00', '2022-12-31 18:00:00', 2, 2),
(3, '2022-07-01 09:00:00', '2022-12-31 18:00:00', 1, 2);

-- Insert data into User_Has_Status table
INSERT INTO User_Has_Status (ID, Status_Start_Time, Status_End_Time, User_Account_ID, Status_ID) VALUES
(1, '2022-01-01 09:00:00', '2022-06-30 18:00:00', 1, 1),
(2, '2022-01-01 09:00:00', '2022-12-31 18:00:00', 2, 2),
(3, '2022-07-01 09:00:00', '2022-12-31 18:00:00', 1, 2);



SELECT * FROM Role;
SELECT * FROM Status;
SELECT * FROM User_Account;
SELECT * FROM User_Has_Role;
SELECT * FROM User_Has_Status;


------------------------2nd Question---------------------

---------------------------------Truncating User_Has_Status Table--------------------
ALTER TABLE User_Has_Status 
		DROP Constraint
		User_Has_Status_ID_PK,
		User_Has_Status_User_Account_ID,
		User_Has_Status_User_Status_ID
				
TRUNCATE TABLE User_Has_Status;

---------------------------------Truncating User_Has_Role Table--------------------


ALTER TABLE User_Has_Role 
		DROP Constraint
		User_Has_Role_PK,
		User_Has_Role_User_Account_ID,
		User_Has_Role_User_Role_ID;
						
TRUNCATE TABLE User_Has_Role;

---------------------------------Truncating Role Table--------------------
ALTER TABLE Role
		DROP CONSTRAINT
		Role_ID_PK;

TRUNCATE Table Role;

---------------------------------Truncating User_Account Table--------------------
ALTER TABLE User_Account
		DROP CONSTRAINT
		User_Account_PK;

TRUNCATE Table User_Account;

---------------------------------Truncating User_Account Table--------------------
ALTER TABLE Status
		DROP CONSTRAINT
		Status_ID_PK;

TRUNCATE Table Status;
