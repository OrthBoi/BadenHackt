USE TrackmyFood;

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

CREATE TABLE transport_origin 
(
	toID INT PRIMARY KEY IDENTITY (1,1), 
	originID INT,
	transportID INT,

	FOREIGN KEY (originID) REFERENCES origin(originID),
	FOREIGN KEY (transportID) REFERENCES transport (transportID)
);

-- behebung der "falschen" verknüpfung 

ALTER TABLE ingredient 
ADD CONSTRAINT FK_ingredient_origin 
FOREIGN KEY (originID) REFERENCES origin(originID);

