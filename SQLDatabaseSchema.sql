CREATE TABLE Locations (
	id INT IDENTITY (1, 1) PRIMARY KEY,
	address VARCHAR (100) NOT NULL,
	city VARCHAR (50)  NOT NULL,
	state VARCHAR (25) NOT NULL,
	zip VARCHAR (25) NOT NULL
	);

CREATE TABLE Hotels (
	id INT IDENTITY (1, 1) PRIMARY KEY,
	name VARCHAR (100) NOT NULL,
	email VARCHAR (100)  UNIQUE NOT NULL,
	phone_number VARCHAR (25) UNIQUE NOT NULL,
	location_id INT NOT NULL,
	FOREIGN KEY (location_id)
	REFERENCES Locations (id)
	ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE RoomType (
	id INT IDENTITY (1, 1) PRIMARY KEY,
	room_name VARCHAR (100) NOT NULL,
	description VARCHAR (255),
	price FLOAT NOT NULL
	);

CREATE TABLE Rooms (
	id INT IDENTITY (1, 1) PRIMARY KEY,
	room_number INT NOT NULL,
	floor_number INT NOT NULL,
	occupied VARCHAR (25) NOT NULL,
	roomtype_id INT NOT NULL,
	FOREIGN KEY (roomtype_id)
	REFERENCES RoomType (id)
	ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE Customers (
	id INT IDENTITY (1, 1) PRIMARY KEY,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	email VARCHAR (255) UNIQUE NOT NULL,
	phone_number VARCHAR (255) UNIQUE NOT NULL,
	);

CREATE TABLE Calendar(
	id INT IDENTITY (1, 1) PRIMARY KEY,
	full_date DATE NOT NULL,
	day_of_week INT NOT NULL,
	day_of_month INT NOT NULL,
	date_month INT NOT NULL,
	date_year INT NOT NULL
	);

DROP TABLE RoomReservations;

CREATE TABLE RoomReservations (
	id INT IDENTITY (1, 1) PRIMARY KEY,
	hotel_id INT NOT NULL,
	room_id INT NOT NULL,
	customer_id INT NOT NULL,
	check_in_date_id INT NOT NULL,
	check_out_date_id INT NOT NULL,
	total_price FLOAT NOT NULL,
	booking_status BIT NOT NULL,
	FOREIGN KEY (hotel_id)
	REFERENCES Hotels (id)
	ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (room_id)
	REFERENCES Rooms (id)
	ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (customer_id)
	REFERENCES Customers (id)
	ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (check_in_date_id)
	REFERENCES Calendar (id)
	ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (check_out_date_id)
	REFERENCES Calendar (id)
	ON DELETE NO ACTION ON UPDATE NO ACTION,
	);