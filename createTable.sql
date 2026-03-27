USE TrackmyFood;

--Haupttabellen
CREATE TABLE users
(
	usersID INT PRIMARY KEY IDENTITY(1,1), -- verwaltet Primärschlüssel automatisch
	name VARCHAR (100) NOT NULL, 
	email VARCHAR (200) NOT NULL UNIQUE, -- UNIQUE verhindert d. erstellung doppelte Accounts.
	passwort VARCHAR (200) NOT NULL
);


CREATE TABLE company
(
	companyID INT PRIMARY KEY IDENTITY(1,1),
	usersID INT, 
	name VARCHAR (200) NOT NULL,
	description VARCHAR (200) NOT NULL,
	FOREIGN KEY (usersID) REFERENCES users (usersID)
);


CREATE TABLE product 
(
	productID INT PRIMARY KEY IDENTITY(1,1),
	name VARCHAR (200) NOT NULL,
	expiredate DATE NOT NULL, 
	storage BIT NOT NULL -- BIT anstelle von BOOLEAN verwenden, da dieser nicht unterstützt wird
);


CREATE TABLE transport
(
	transportID INT PRIMARY KEY IDENTITY(1,1),
	mean_of_transport VARCHAR(200) NOT NULL,
	travel_distance_km INT NOT NULL
);


CREATE TABLE origin
(
	originID INT PRIMARY KEY IDENTITY(1,1),
	country VARCHAR(200) NOT NULL, 
	region VARCHAR (200) NOT NULL, 
	producer VARCHAR (200) NOT NULL, 
	date_of_production DATE NOT NULL
);


CREATE TABLE ingredient
(
	ingredientID INT PRIMARY KEY IDENTITY(1,1),
	originID INT,
	name VARCHAR (200) NOT NULL,
	expiredate DATE NOT NULL, 
	storage INT NOT NULL,
	checked BIT NOT NULL,

	FOREIGN KEY (originID) REFERENCES origin (originID)
); 


--Verbindungstabellen 
CREATE TABLE user_product
(
	ipID INT PRIMARY KEY IDENTITY(1,1),
	usersID INT,
	productID INT,

	FOREIGN KEY (usersID) REFERENCES users (usersID),
	FOREIGN KEY (productID) REFERENCES product (productID)
);


CREATE TABLE users_company 
(
	ucID INT PRIMARY KEY IDENTITY(1,1),
	companyID INT, 
	usersID INT,

	FOREIGN KEY (companyID) REFERENCES company (companyID),
	FOREIGN KEY (usersID) REFERENCES users (usersID)
);


CREATE TABLE product_company 
(
	pcID INT PRIMARY KEY IDENTITY(1,1),
	companyID INT,
	productID INT,

	FOREIGN KEY (companyID) REFERENCES company (companyID),
	FOREIGN KEY (productID) REFERENCES product (productID)
);


CREATE TABLE product_ingredient
(
	piID INT PRIMARY KEY IDENTITY(1,1),
	productID INT,
	ingredientID INT,

	FOREIGN KEY (productID) REFERENCES product (productID),
	FOREIGN KEY (ingredientID) REFERENCES ingredient (ingredientID)
);

 
CREATE TABLE transport_origin 
(
	toID INT PRIMARY KEY IDENTITY (1,1), 
	originID INT,
	transportID INT,

	FOREIGN KEY (originID) REFERENCES origin(originID),
	FOREIGN KEY (transportID) REFERENCES transport (transportID)
);