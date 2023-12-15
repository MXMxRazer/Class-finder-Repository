    CREATE TABLE Customer (
        CustomerID INTEGER PRIMARY KEY, 
        CustomerName VARCHAR(255) NOT NULL, 
        CustomerPhone VARCHAR(255) UNIQUE NOT NULL, 
        CustomerEmail VARCHAR(255) UNIQUE
    );

    CREATE TABLE Location (
        LocationID INTEGER PRIMARY KEY, 
        LocationName VARCHAR(255) NOT NULL, 
        LocationAddress VARCHAR(255),
        Telephone VARCHAR(180) UNIQUE NOT NULL,
        NumberOfVisits INTEGER,
        Email VARCHAR(255) UNIQUE
    );

    CREATE TABLE Amenities (
        AmenityID INTEGER PRIMARY KEY, 
        AmenityName VARCHAR(255) NOT NULL, 
        LocationID INTEGER, 
        FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
    ); 

    CREATE TABLE Coach (
        CoachID INTEGER PRIMARY KEY, 
        CoachName VARCHAR(255) NOT NULL,
        CoachLevel INTEGER NOT NULL, 
        TrainingDescription TEXT,
        Rating Decimal(3, 2)
    ); 

    CREATE TABLE Reviews (
        ReviewID INTEGER NOT NULL PRIMARY KEY, 
        CustomerID INTEGER NOT NULL, 
        CoachID INTEGER NOT NULL, 
        Date DATE NOT NULL, 
        CommunicationRating INTEGER, 
        EnthusiasmRating INTEGER,
        PunctualityRating INTEGER,
        ReviewMessage TEXT, 
        FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
        FOREIGN KEY (CoachID) REFERENCES Coach(CoachID)
    ); 

    CREATE TABLE Class (
        ClassID INTEGER PRIMARY KEY, 
        ClassName VARCHAR(255) NOT NULL, 
        Price DECIMAL(10, 2),
        Time VARCHAR(255) NOT NULL, 
        Room VARCHAR(80) NOT NULL,
        LocationID INTEGER, 
        FOREIGN KEY (LocationID) REFERENCES Location(LocationID) 
    );

    CREATE TABLE Certificate (
        CertificateID INTEGER PRIMARY KEY, 
        CoachID INTEGER, 
        CertificateName VARCHAR(255) NOT NULL,
        FOREIGN KEY (CoachID) REFERENCES Coach(CoachID)
    );


    CREATE TABLE WorkingLocation (
        WorkLocationID INTEGER PRIMARY KEY, 
        CoachID INTEGER, 
        LocationID INTEGER, 
        FOREIGN KEY (CoachID) REFERENCES Coach(CoachID),
        FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
    ); 

    CREATE TABLE TimesVisited (
        VisitedID INTEGER PRIMARY KEY, 
        LocationID INTEGER, 
        CustomerID INTEGER, 
        FOREIGN KEY (LocationID) REFERENCES Location(LocationID),
        FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
    ); 

    CREATE TABLE Reference (
        CoachID INTEGER, 
        CustomerID INTEGER, 
        ReferenceID INTEGER PRIMARY KEY, 
        FOREIGN KEY (CoachID) REFERENCES Coach(CoachID),
        FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
    ); 

