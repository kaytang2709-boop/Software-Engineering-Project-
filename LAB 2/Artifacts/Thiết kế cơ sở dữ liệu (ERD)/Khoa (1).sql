

-- Bảng Guest
CREATE TABLE Guest (
    GuestID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(255)
);

-- Bảng Staff
CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Role VARCHAR(50),
    Username VARCHAR(50) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL
);

-- Bảng RoomType
CREATE TABLE RoomType (
    TypeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Capacity INT NOT NULL,
    Description TEXT
);

-- Bảng Room
CREATE TABLE Room (
    RoomID INT AUTO_INCREMENT PRIMARY KEY,
    TypeID INT NOT NULL,
    Status ENUM('Available', 'Occupied', 'Maintenance') DEFAULT 'Available',
    Floor INT,
    FOREIGN KEY (TypeID) REFERENCES RoomType(TypeID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- Bảng Reservation
CREATE TABLE Reservation (
    ResvID INT AUTO_INCREMENT PRIMARY KEY,
    GuestID INT NOT NULL,
    RoomID INT NOT NULL,
    StaffID INT,
    CheckInDate DATETIME NOT NULL,
    CheckOutDate DATETIME NOT NULL,
    Status ENUM('Booked', 'CheckedIn', 'CheckedOut', 'Cancelled') DEFAULT 'Booked',
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- Bảng Payment
CREATE TABLE Payment (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    ResvID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Method ENUM('Cash', 'Credit Card', 'Bank Transfer', 'Online') NOT NULL,
    Status ENUM('Pending', 'Completed', 'Failed', 'Refunded') DEFAULT 'Pending',
    Date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ResvID) REFERENCES Reservation(ResvID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
