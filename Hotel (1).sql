-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-12-17 12:33:09.31

-- tables
-- Table: Bill
CREATE TABLE Bill (
    Bill_id int  NOT NULL,
    Amount int  NOT NULL,
    Date date  NOT NULL,
    CONSTRAINT Bill_pk PRIMARY KEY (Bill_id)
);

-- Table: Check In_Out
CREATE TABLE "Check In_Out" (
    Date date  NOT NULL,
    Reservation_id int  NOT NULL,
    Guest_id int  NOT NULL
);

-- Table: Guest
CREATE TABLE Guest (
    Guest_id int  NOT NULL,
    Name varchar(50)  NOT NULL,
    Address varchar(100)  NOT NULL,
    Contact_number int  NOT NULL,
    SSN int  NOT NULL,
    CONSTRAINT Guest_pk PRIMARY KEY (Guest_id)
);

-- Table: Hotel
CREATE TABLE Hotel (
    Hotel_id int  NOT NULL,
    Name varchar(50)  NOT NULL,
    Location varchar(100)  NOT NULL,
    Guest_id int  NOT NULL,
    CONSTRAINT Hotel_pk PRIMARY KEY (Hotel_id)
);

-- Table: Manager
CREATE TABLE Manager (
    Manager_id int  NOT NULL,
    Name varchar(50)  NOT NULL,
    Contact_Number int  NOT NULL,
    Hotel_id int  NOT NULL,
    CONSTRAINT Manager_pk PRIMARY KEY (Manager_id)
);

-- Table: Payment
CREATE TABLE Payment (
    Date date  NOT NULL,
    Payment_method varchar(100)  NOT NULL,
    Guest_id int  NOT NULL,
    PaymentID int  NOT NULL,
    CONSTRAINT Payment_pk PRIMARY KEY (PaymentID)
);

-- Table: Price
CREATE TABLE Price (
    price int  NOT NULL,
    Number_of_rooms int  NOT NULL,
    Room_id int  NOT NULL,
    Reservation_id int  NOT NULL
);

-- Table: Reservation
CREATE TABLE Reservation (
    Reservation_id int  NOT NULL,
    Time_frame time  NOT NULL,
    Guest_id int  NOT NULL,
    CONSTRAINT Reservation_pk PRIMARY KEY (Reservation_id)
);

-- Table: Rooms
CREATE TABLE Rooms (
    Room_id int  NOT NULL,
    Room_Type varchar(50)  NOT NULL,
    Guest_id int  NOT NULL,
    Hotel_id int  NOT NULL,
    CONSTRAINT Rooms_pk PRIMARY KEY (Room_id)
);

-- Table: Workers
CREATE TABLE Workers (
    Worker_id int  NOT NULL,
    Name varchar(50)  NOT NULL,
    Type varchar(50)  NOT NULL,
    Contact_Number int  NOT NULL,
    Hotel_id int  NOT NULL,
    CONSTRAINT Workers_pk PRIMARY KEY (Worker_id)
);

-- foreign keys
-- Reference: Bill_Payment (table: Bill)
ALTER TABLE Bill ADD CONSTRAINT Bill_Payment
    FOREIGN KEY ()
    REFERENCES Payment ()  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Check In_Out_Guest (table: Check In_Out)
ALTER TABLE "Check In_Out" ADD CONSTRAINT "Check In_Out_Guest"
    FOREIGN KEY (Guest_id)
    REFERENCES Guest (Guest_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Hotel_Guest (table: Hotel)
ALTER TABLE Hotel ADD CONSTRAINT Hotel_Guest
    FOREIGN KEY (Guest_id)
    REFERENCES Guest (Guest_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Manager_Hotel (table: Manager)
ALTER TABLE Manager ADD CONSTRAINT Manager_Hotel
    FOREIGN KEY (Hotel_id)
    REFERENCES Hotel (Hotel_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Payment_Guest (table: Payment)
ALTER TABLE Payment ADD CONSTRAINT Payment_Guest
    FOREIGN KEY (Guest_id)
    REFERENCES Guest (Guest_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Price_Reservation (table: Price)
ALTER TABLE Price ADD CONSTRAINT Price_Reservation
    FOREIGN KEY (Reservation_id)
    REFERENCES Reservation (Reservation_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Price_Rooms (table: Price)
ALTER TABLE Price ADD CONSTRAINT Price_Rooms
    FOREIGN KEY (Room_id)
    REFERENCES Rooms (Room_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Reservation_Check In_Out (table: Reservation)
ALTER TABLE Reservation ADD CONSTRAINT Reservation_Check In_Out
    FOREIGN KEY ()
    REFERENCES "Check In_Out" ()  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Reservation_Guest (table: Reservation)
ALTER TABLE Reservation ADD CONSTRAINT Reservation_Guest
    FOREIGN KEY (Guest_id)
    REFERENCES Guest (Guest_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Rooms_Hotel (table: Rooms)
ALTER TABLE Rooms ADD CONSTRAINT Rooms_Hotel
    FOREIGN KEY (Hotel_id, Guest_id)
    REFERENCES Hotel (Hotel_id, Guest_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Workers_Hotel (table: Workers)
ALTER TABLE Workers ADD CONSTRAINT Workers_Hotel
    FOREIGN KEY (Hotel_id)
    REFERENCES Hotel (Hotel_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

