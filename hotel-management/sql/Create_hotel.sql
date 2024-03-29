USE Hotel;

GO
CREATE SCHEMA Hotel;
GO

USE Hotel;

--TABLICA GO�CI
CREATE TABLE Hotel.Guest(
GuestID INT IDENTITY PRIMARY KEY, --PK
R_FirstName NVARCHAR (50) NOT NULL,
R_LastName NVARCHAR (50) NOT NULL,
R_Phone NVARCHAR (30) NOT NULL,
G_FirstName NVARCHAR (50) NOT NULL,
G_LastName NVARCHAR (50) NOT NULL,
G_Phone NVARCHAR (30) NOT NULL,
Email NVARCHAR (50),
Street NVARCHAR (50),
City NVARCHAR (50),
Country NVARCHAR (50) DEFAULT 'Polska',
Comments NVARCHAR (255)
);

GO

-- TABLICA REZERWACJI
CREATE TABLE Hotel.Booking (
BookingID INT IDENTITY PRIMARY KEY, --PK
GuestID INT, --FK
Room NVARCHAR(30), --FK
Hotel NVARCHAR(30) DEFAULT 'A' NOT NULL,
CheckInDate DATETIME NOT NULL,
CheckOutDate DATETIME NOT NULL,
BookingType NVARCHAR (50) NOT NULL,
BookingStatus NVARCHAR (100) DEFAULT 'Rezerwacja nieop�acona' NOT NULL,
BookingDate DATE DEFAULT GETDATE() NOT NULL,
Meal NVARCHAR (255) DEFAULT 'Bez �niadania',
StaffID INT, --FK
Comments NVARCHAR (255)
);

GO

-- TABLICA Payment
CREATE TABLE Hotel.Payment(
PaymentID INT IDENTITY PRIMARY KEY, --PK
BookingID INT, --FK
TotalPrice BIGINT NOT NULL,
CommissionPercent SMALLINT,
Commission BIGINT,
Revenue BIGINT,
VATPercent INT DEFAULT (8) NOT NULL,
VAT BIGINT NOT NULL,
Income BIGINT NOT NULL,
PaymentStatus NVARCHAR DEFAULT 'Nieop�acona' NOT NULL,
PaymentDate DATE,
PaymentMethod NVARCHAR (50)
);
GO

-- TABLICA Staff
CREATE TABLE Hotel.Staff(
StaffID INT IDENTITY PRIMARY KEY, --PK
FirstName NVARCHAR (50) NOT NULL,
LastName NVARCHAR (50) NOT NULL,
Position NVARCHAR (50),
Phone NVARCHAR (30),
Email NVARCHAR (50),
Salary INT,
DateOfBirth DATE,
HireDate NVARCHAR (50),
Street NVARCHAR (50),
City NVARCHAR (50),
Country NVARCHAR (50) DEFAULT 'Polska',
Comments NVARCHAR (255)
);
GO

--TABLICA Pokoi
CREATE TABLE Hotel.Room(
Room NVARCHAR(30) PRIMARY KEY, --PK
Capacity SMALLINT NOT NULL,
RoomStatus NVARCHAR (50)
);

----OGRANICZENIA----
--Dodawanie klucza obcego do Booking
ALTER TABLE Hotel.Booking
ADD CONSTRAINT FK_Booking_Guest_ID FOREIGN KEY (GuestID) REFERENCES Hotel.Guest (GuestID);

ALTER TABLE Hotel.Booking
ADD CONSTRAINT FK_Booking_Room_Room FOREIGN KEY (Room) REFERENCES Hotel.Room (Room);

ALTER TABLE Hotel.Booking
ADD CONSTRAINT FK_Booking_Staff_ID FOREIGN KEY (StaffID) REFERENCES Hotel.Staff (StaffID);

ALTER TABLE Hotel.Payment 
ADD CONSTRAINT FK_Payment_Booking_ID FOREIGN KEY (BookingID) REFERENCES Hotel.Booking (BookingID);