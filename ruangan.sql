CREATE DATABASE Peminajaman_ruangan_fakultas;
use Peminajaman_ruangan_fakultas;

create table  rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    type VARCHAR(30),
    capacity INT,
    status VARCHAR(10) DEFAULT 'available' 
);

CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    room_id INT,
    borrower_name VARCHAR(100),
    borrower_type VARCHAR(30), 
    start_time DATETIME,
    end_time DATETIME,
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE waiting_list (
    id INT AUTO_INCREMENT PRIMARY KEY,
    room_id INT,
    name VARCHAR(100),
    request_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(100)
);

INSERT INTO users (username, password) VALUES
('admin', 'admin123');

CREATE TABLE history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    room_id INT,
    borrower_name VARCHAR(100),
    start_time DATETIME,
    end_time DATETIME,
    status VARCHAR(20), 
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

