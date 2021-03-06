-- locations table
DROP TABLE IF EXISTS [locations];

CREATE TABLE [locations] (
ID int NOT NULL IDENTITY(1,1),
locationName varchar(250) NOT NULL
);

INSERT INTO [locations] (locationName)
VALUES ('Houston'), ('Austin'), ('Dallas'), ('Galveston'), ('San Antonio');

--roles table
DROP TABLE IF EXISTS [roles];

CREATE TABLE [roles] (
ID int NOT NULL IDENTITY(1,1),
roleName VARCHAR(250) NOT NULL,
description VARCHAR(250) NOT NULL
);

INSERT INTO [roles] (roleName, description)
VALUES ('owner', 'owner of tavern'),
('manager', 'oversees all aspects of tavern'),
('concierge', 'answering guest inquires'),
('chef', 'head of the kitchen'),
('server', 'serves the guests');

--users table
DROP TABLE IF EXISTS [users];

CREATE TABLE [users] (
ID int NOT NULL IDENTITY(1,1),
userName VARCHAR(250) NOT NULL,
roleId INT NOT NULL
);

INSERT INTO [users] (userName, roleId)
VALUES ('Mandalorian', 1),
('Cara Dune', 3),
('Moff Gideon', 5),
('Grogu', 2),
('Greef Karga', 4);

--taverns table
DROP TABLE IF EXISTS [taverns];

CREATE TABLE [taverns] (
ID int NOT NULL IDENTITY(1,1),
tavernName VARCHAR(250) NOT NULL,
locationId INT NOT NULL,
ownerId INT NOT NULL,
numberOfFloors INT NOT NULL
);

INSERT INTO [taverns] (tavernName, locationId, ownerId, numberOfFloors)
VALUES ('Red Lion', 5, 1, 2),
('Crown', 4, 2, 3),
('Royal Oak', 3, 3, 4),
('White Hart', 2, 4, 2),
('Swan', 1, 5, 2);

--basementRats table
DROP TABLE IF EXISTS [basementRats];

CREATE TABLE [basementRats] (
ID int NOT NULL IDENTITY(1,1),
ratsName varchar(250) NOT NULL,
tavernId INT NOT NULL
);

INSERT INTO [basementRats] (ratsName, tavernId)
VALUES ('Aristorat', 3),
('Cheesewiz', 5),
('Basil Ratbone', 2),
('Catnip', 4),
('Cheeseball', 1),
('Cheesewiz', 5),
('Cheesewiz', 5);

--supplies table
DROP TABLE IF EXISTS [supplies];

CREATE TABLE [supplies] (
ID INT NOT NULL IDENTITY(1,1),
beerName VARCHAR(250) NOT NULL,
unit VARCHAR(250) NOT NULL
);

INSERT INTO [supplies] (beerName, unit)
VALUES ('American Pale Ale', 'Grenade 7oz Bottles'),
('India Pale Ale', 'Stubby 12oz Bottles'),
('Stout', 'Longneck 12oz Bottles'),
('Wheat Beer', 'British 500ml Bottles'),
('Lager', 'Bomber 650ml Bottles')

--suppliesReceived table
DROP TABLE IF EXISTS [supplyReceived];

CREATE TABLE [supplyReceived] (
ID INT NOT NULL IDENTITY(1,1),
supplyId INT NOT NULL,
tavernId INT NOT NULL,
cost MONEY NOT NULL,
amountReceived MONEY NOT NULL,
dateReceived DATE NOT NULL  
);

INSERT INTO [supplyReceived] (supplyId, tavernId, cost, amountReceived, dateReceived)
VALUES (1, 3, $50.00, $25.00, '01/11/2021'),
(3, 2, $60.00, $35.00, '01/10/2021'),
(5, 5, $70.00, $15.00, '01/09/2021'),
(2, 4, $80.00, $55.00, '01/08/2021'),
(4, 1, $90.00, $75.00, '01/07/2021');

--inventory table
DROP TABLE IF EXISTS [inventory];

CREATE TABLE [inventory] (
ID INT NOT NULL IDENTITY(1,1),
supplyId INT NOT NULL,
tavernId INT NOT NULL,
dateUpdated DATE NOT NULL,
currentCount INT NOT NULL
);

INSERT INTO [inventory] (supplyId, tavernId, dateUpdated, currentCount)
VALUES (5, 1, '01/15/2021', 40),
(4, 2, '01/15/2021', 50),
(3, 3, '01/15/2021', 60),
(2, 4, '01/15/2021', 70),
(1, 5, '01/15/2021', 20);

--servicesStatus
DROP TABLE IF EXISTS [servicesStatus]

CREATE TABLE [servicesStatus] (
ID INT NOT NULL IDENTITY(1,1),
status VARCHAR(250) NOT NULL
);

INSERT INTO [servicesStatus] (status)
VALUES ('active'), ('inactive'), ('out of stock'), ('discontinued');

--services table
DROP TABLE IF EXISTS [services]

CREATE TABLE [services] (
ID INT NOT NULL IDENTITY(1,1),
serviceName VARCHAR(250) NOT NULL,
statusId INT NOT NULL,
tavernId INT NOT NULL
);

INSERT INTO [services] (serviceName, statusId, tavernId)
VALUES ('Pool', 2, 4),
('Weapon Sharpening', 1, 3),
('Pet Grooming', 4, 2),
('Gas', 3, 1),
('Drinks', 3, 5)

--sales table
DROP TABLE IF EXISTS [sales]

CREATE TABLE [sales] (
ID INT NOT NULL IDENTITY(1,1),
servicesId INT NOT NULL,
guest VARCHAR(250) NOT NULL,
price MONEY NOT NULL,
purchasedDate DATE NOT NULL,
purchasedAmount MONEY NOT NULL,
tavernId INT NOT NULL
);

INSERT INTO [sales] (servicesId, guest, price, purchasedDate, purchasedAmount, tavernId)
VALUES (1, 'Agnes Doyle', $30.00, '01/02/2021', $45.00, 3),
(3, 'Patti Flores', $10.00, '01/02/2021', $25.00, 1),
(5, 'Marsha Black', $40.00, '01/02/2021', $75.00, 5),
(2, 'Lindsey Robbins ', $60.00, '01/02/2021', $85.00, 4),
(4, 'Albert Vega ', $70.00, '01/02/2021', $95.00, 2);