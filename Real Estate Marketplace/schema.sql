CREATE DATABASE HOUSEAPP;
USE HOUSEAPP;


CREATE TABLE Customers (
    User_ID INT AUTO_INCREMENT PRIMARY KEY,
    Password VARCHAR(255) NOT NULL,
    FName VARCHAR(255),
    LName VARCHAR(255),
    Email VARCHAR(255) NOT NULL UNIQUE,
    AccountType VARCHAR(255)
);


CREATE TABLE Properties (
    Property_ID INT AUTO_INCREMENT PRIMARY KEY,
    Owner VARCHAR(255),
    Description TEXT,
    Address VARCHAR(255) NOT NULL
);


CREATE TABLE RealEstateAgents (
    AgentName VARCHAR(255),
    Agent_ID INT AUTO_INCREMENT PRIMARY KEY,
    Company VARCHAR(255)
);


CREATE TABLE Listings (
    Listing_ID INT AUTO_INCREMENT PRIMARY KEY,
    Price DECIMAL(10, 2),
    Date DATE,
    Status VARCHAR(255),
    PropertyNum INT,
    Agent_ID INT,
    Customer_ID INT,
    FOREIGN KEY (PropertyNum) REFERENCES Properties(Property_ID),
    FOREIGN KEY (Agent_ID) REFERENCES RealEstateAgents(Agent_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(User_ID)
);


CREATE TABLE BuySell (
    Listing_Num INT,
    Customer_Number INT,
    PRIMARY KEY (Listing_Num, Customer_Number),
    FOREIGN KEY (Listing_Num) REFERENCES Listings(Listing_ID),
    FOREIGN KEY (Customer_Number) REFERENCES Customers(User_ID)
);


CREATE TABLE Appointments (
    Time DATETIME,
    Listing_ID INT,
    PRIMARY KEY (Time, Listing_ID),
    FOREIGN KEY (Listing_ID) REFERENCES Listings(Listing_ID)
);


CREATE TABLE Contracts (
    Contract_ID INT AUTO_INCREMENT PRIMARY KEY,
    Price DECIMAL(10, 2),
    InterestRate DECIMAL(5, 2),
    AgentInfo INT,
    PropertyInfo INT,
    CustomerInfo INT,
    Date DATE,
    Mortgage VARCHAR(255),
    FOREIGN KEY (AgentInfo) REFERENCES RealEstateAgents(Agent_ID),
    FOREIGN KEY (PropertyInfo) REFERENCES Properties(Property_ID),
    FOREIGN KEY (CustomerInfo) REFERENCES Customers(User_ID)
);


CREATE TABLE Creations (
    Creation_ID INT AUTO_INCREMENT PRIMARY KEY,
    Property_number INT,
    ContactInfo VARCHAR(255),
    Agent_ID INT,
    Customer_ID INT,
    FOREIGN KEY (Property_number) REFERENCES Properties(Property_ID),
    FOREIGN KEY (Agent_ID) REFERENCES RealEstateAgents(Agent_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(User_ID)
);

