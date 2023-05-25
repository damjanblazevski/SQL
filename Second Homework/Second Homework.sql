-- Delete previous data
DROP TABLE IF EXISTS BusinessEntity;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS "Order";
DROP TABLE IF EXISTS OrderDetails;

-- Create tables

CREATE TABLE IF NOT EXISTS BusinessEntity (
Id serial PRIMARY KEY NOT NULL,
Name varchar(100) NULL,
Region varchar(1000) NULL,
Zipcode varchar(10) NULL,
Size varchar(10) NULL);

CREATE TABLE IF NOT EXISTS Employee (
Id serial PRIMARY KEY NOT NULL,
FirstName varchar(100) NOT NULL,
LastName varchar(100) NOT NULL,
DateOfBirth date NULL,
Gender nchar(1) NULL,
HireDate date NULL,
NationalIdNumber varchar(20) NULL);

CREATE TABLE IF NOT EXISTS Product (
Id serial PRIMARY KEY NOT NULL,
Code varchar(50) NULL,
Name varchar(100) NULL,
Description varchar(5000) NULL,
Weight float(2) NULL,
Price float(2) NULL,
Cost float(2) NULL);

CREATE TABLE IF NOT EXISTS Customer (
Id serial PRIMARY KEY NOT NULL,
Name varchar(100) NULL,
AccountNumber varchar(50) NULL,
City varchar(50) NULL,
RegionName varchar(50) NULL,
PhoneNumber varchar(20) NULL,
IsActive boolean NULL);

CREATE TABLE IF NOT EXISTS "Order" (
Id serial PRIMARY KEY NOT NULL,
OrderDate date NULL,
Status smallint NULL,
BusinessEntityId integer NULL,
CustomerId integer NULL,
EmployeeId integer NULL,
TotalPrice float(2) NULL,
Comment varchar(500) NULL);

CREATE TABLE IF NOT EXISTS OrderDetails (
Id serial PRIMARY KEY NOT NULL,
OrderId integer NULL,
ProductId integer NULL,
Quantity integer NULL,
Price float(2) NULL);

-- Business Entity
INSERT INTO BusinessEntity (Name, Region, Zipcode, Size)
VALUES ('Vitalia Skopje', 'Skopski', '1000', 'Large');

INSERT INTO BusinessEntity (Name, Region, Zipcode, Size)
VALUES ('Vitalia Bitola', 'Bitolski', '2000', 'Large');

INSERT INTO BusinessEntity (Name, Region, Zipcode, Size)
VALUES ('Vitalia Strumica', 'Strumicki', '987', 'Medium');

INSERT INTO BusinessEntity (Name, Region, Zipcode, Size)
VALUES ('Vitalia Kumanovo', 'Kumanovski', '500', 'Medium');

INSERT INTO BusinessEntity (Name, Region, Zipcode, Size)
VALUES ('Vitalia Tetovo', 'Polog', '700', 'Small');

INSERT INTO BusinessEntity (Name, Region, Zipcode, Size)
VALUES ('Vitalia Stip', 'Stipski', '300', 'Small');

INSERT INTO BusinessEntity (Name, Region, Zipcode, Size)
VALUES ('Vitalia Ohrid', 'Ohridski', '100', 'Small');

-- Employees
INSERT INTO Employee (FirstName, LastName, DateOfBirth, Gender, HireDate, NationalIdNumber)
VALUES (
	'Aleksandar', 
	'Stojanovski', 
	(SELECT timestamp '1970-01-10 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1970-01-10 10:00:00')), 
	'M',
	(SELECT timestamp '2010-01-10 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1985-01-10 10:00:00')),
	((FLOOR (random() * (999999 - 100000))) + (FLOOR (random() * (999999 - 100000)))));
	
INSERT INTO Employee (FirstName, LastName, DateOfBirth, Gender, HireDate, NationalIdNumber)
VALUES (
	'Ana', 
	'Nikolovska', 
	(SELECT timestamp '1970-01-10 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1970-01-10 10:00:00')), 
	'F',
	(SELECT timestamp '2010-01-10 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1985-01-10 10:00:00')),
	((FLOOR (random() * (999999 - 100000))) + (FLOOR (random() * (999999 - 100000)))));
	
INSERT INTO Employee (FirstName, LastName, DateOfBirth, Gender, HireDate, NationalIdNumber)
VALUES (
	'Borce', 
	'Zdravevski', 
	(SELECT timestamp '1970-01-10 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1970-01-10 10:00:00')), 
	'M',
	(SELECT timestamp '2010-01-10 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1985-01-10 10:00:00')),
	((FLOOR (random() * (999999 - 100000))) + (FLOOR (random() * (999999 - 100000)))));
	
INSERT INTO Employee (FirstName, LastName, DateOfBirth, Gender, HireDate, NationalIdNumber)
VALUES (
	'Biljana', 
	'Ivanovska', 
	(SELECT timestamp '1970-01-10 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1970-01-10 10:00:00')), 
	'F',
	(SELECT timestamp '2010-01-10 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1985-01-10 10:00:00')),
	((FLOOR (random() * (999999 - 100000))) + (FLOOR (random() * (999999 - 100000)))));
	
INSERT INTO Employee (FirstName, LastName, DateOfBirth, Gender, HireDate, NationalIdNumber)
VALUES (
	'Viktor', 
	'Popovski', 
	(SELECT timestamp '1970-01-10 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1970-01-10 10:00:00')), 
	'M',
	(SELECT timestamp '2010-01-10 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1985-01-10 10:00:00')),
	((FLOOR (random() * (999999 - 100000))) + (FLOOR (random() * (999999 - 100000)))));
	
INSERT INTO Employee (FirstName, LastName, DateOfBirth, Gender, HireDate, NationalIdNumber)
VALUES (
	'Valentina', 
	'Mitrevska', 
	(SELECT timestamp '1970-01-10 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1970-01-10 10:00:00')), 
	'F',
	(SELECT timestamp '2010-01-10 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1985-01-10 10:00:00')),
	((FLOOR (random() * (999999 - 100000))) + (FLOOR (random() * (999999 - 100000)))));
	
INSERT INTO Employee (FirstName, LastName, DateOfBirth, Gender, HireDate, NationalIdNumber)
VALUES (
	'Goran', 
	'Stoilov', 
	(SELECT timestamp '1970-01-10 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1970-01-10 10:00:00')), 
	'M',
	(SELECT timestamp '2010-01-10 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1985-01-10 10:00:00')),
	((FLOOR (random() * (999999 - 100000))) + (FLOOR (random() * (999999 - 100000)))));
	
INSERT INTO Employee (FirstName, LastName, DateOfBirth, Gender, HireDate, NationalIdNumber)
VALUES (
	'Gordana', 
	'Pandeva', 
	(SELECT timestamp '1970-01-10 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1970-01-10 10:00:00')), 
	'F',
	(SELECT timestamp '2010-01-10 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1985-01-10 10:00:00')),
	((FLOOR (random() * (999999 - 100000))) + (FLOOR (random() * (999999 - 100000)))));
	
INSERT INTO Employee (FirstName, LastName, DateOfBirth, Gender, HireDate, NationalIdNumber)
VALUES (
	'Maja', 
	'Todorovska', 
	(SELECT timestamp '1970-01-10 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1970-01-10 10:00:00')), 
	'F',
	(SELECT timestamp '2010-01-10 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1985-01-10 10:00:00')),
	((FLOOR (random() * (999999 - 100000))) + (FLOOR (random() * (999999 - 100000)))));
	
INSERT INTO Employee (FirstName, LastName, DateOfBirth, Gender, HireDate, NationalIdNumber)
VALUES (
	'Marko', 
	'Trajanov', 
	(SELECT timestamp '1970-01-10 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1970-01-10 10:00:00')), 
	'M',
	(SELECT timestamp '2010-01-10 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1985-01-10 10:00:00')),
	((FLOOR (random() * (999999 - 100000))) + (FLOOR (random() * (999999 - 100000)))));

-- Products
INSERT INTO Product (Name)
VALUES 
('Crunchy'), ('Granola'), ('Regular/soft'), ('Gluten Free'), ('Multigrain'), ('Take away'), ('Cornflakes'), ('Cereals'), ('Protein Bar'), ('Raw bars'), ('No Sugar Added'), ('Multigrain'),
('Gluten Free'), ('Kids Bar'), ('Fruit, Nuts & Seeds'), ('Protein balls'), ('Rice Cakes'), ('Mini cereal bites'), ('Dried Fruits'), ('Crackers'), ('Cookies'), ('Unrefined sugars'),
('Natural Sweeteners'), ('Diabetic'), ('Plant-based drinks'), ('Smoothie drinks'), ('Natural Juices'), ('Green Teas'), ('Functional Teas'), ('Fruit Teas'), ('Seeds'), ('Oils & Vinegars'),
('Gluten Free Pasta'), ('Flours'), ('Superfoods'), ('Sport Supplements'), ('Honey Syrup'), ('Sweet Spreads'), ('Spices'), ('Soups'), ('Salty Spreads'), ('Soy Pates'), ('Soy milks');

UPDATE Product 
SET Weight = random() * id * 10,
Cost = random() * id,
Price = random() * id * 20,
Code = (SUBSTRING (Name, 0, 3) || id::text),
Description = Name || ' description'
WHERE 
Code IS NULL;

-- Customer
INSERT INTO Customer (name, accountNumber, city, regionName, phoneNumber, isActive)
VALUES (
	'Vero',
	FLOOR (random() * (999999 - 100000)),
	'Skopje',
	'Skopski',
	FLOOR (random() * (999999 - 100000)),
	(random() > 0.5));

INSERT INTO Customer (name, accountNumber, city, regionName, phoneNumber, isActive)
VALUES (
	'Tinex',
	FLOOR (random() * (999999 - 100000)),
	'Bitola',
	'Bitolski',
	FLOOR (random() * (999999 - 100000)),
	(random() > 0.5));

INSERT INTO Customer (name, accountNumber, city, regionName, phoneNumber, isActive)
VALUES (
	'Ramstore',
	FLOOR (random() * (999999 - 100000)),
	'Strumica',
	'Strumicki',
	FLOOR (random() * (999999 - 100000)),
	(random() > 0.5));

INSERT INTO Customer (name, accountNumber, city, regionName, phoneNumber, isActive)
VALUES (
	'Kam',
	FLOOR (random() * (999999 - 100000)),
	'Kumanovo',
	'Kumanovski',
	FLOOR (random() * (999999 - 100000)),
	(random() > 0.5));

INSERT INTO Customer (name, accountNumber, city, regionName, phoneNumber, isActive)
VALUES (
	'Zito',
	FLOOR (random() * (999999 - 100000)),
	'Tetovo',
	'Tetovski',
	FLOOR (random() * (999999 - 100000)),
	(random() > 0.5));

INSERT INTO Customer (name, accountNumber, city, regionName, phoneNumber, isActive)
VALUES (
	'Zegin',
	FLOOR (random() * (999999 - 100000)),
	'Stip',
	'Stipski',
	FLOOR (random() * (999999 - 100000)),
	(random() > 0.5));

INSERT INTO Customer (name, accountNumber, city, regionName, phoneNumber, isActive)
VALUES (
	'Eurofarm',
	FLOOR (random() * (999999 - 100000)),
	'Ohrid',
	'Ohridski',
	FLOOR (random() * (999999 - 100000)),
	(random() > 0.5));
	
INSERT INTO Customer (name, accountNumber, city, regionName, phoneNumber, isActive)
VALUES (
	'Makpetrol',
	FLOOR (random() * (999999 - 100000)),
	'Bitola',
	'Bitolski',
	FLOOR (random() * (999999 - 100000)),
	(random() > 0.5));
	
INSERT INTO Customer (name, accountNumber, city, regionName, phoneNumber, isActive)
VALUES (
	'Lukoil',
	FLOOR (random() * (999999 - 100000)),
	'Kumanovo',
	'Kumanovski',
	FLOOR (random() * (999999 - 100000)),
	(random() > 0.5));
	
INSERT INTO Customer (name, accountNumber, city, regionName, phoneNumber, isActive)
VALUES (
	'Seavus',
	FLOOR (random() * (999999 - 100000)),
	'Skopje',
	'Skopski',
	FLOOR (random() * (999999 - 100000)),
	(random() > 0.5));
	
-- Orders
do $$
begin 
	for counter in 1..100 by 1 loop
		INSERT INTO "Order" (orderDate, status, businessEntityId, customerId, employeeId, totalPrice, comment)
			VALUES (
				(SELECT timestamp '2018-01-01 20:00:00' + random() * (timestamp '1990-01-20 20:00:00' - timestamp '1988-01-10 10:00:00')),
				0,
				(SELECT Id FROM businessentity OFFSET floor(random() * (
					SELECT COUNT(*) FROM businessentity))
				LIMIT 1),
				(SELECT Id FROM customer OFFSET floor(random() * (
					SELECT COUNT(*) FROM customer))
				LIMIT 1),
				(SELECT Id FROM employee OFFSET floor(random() * (
					SELECT COUNT(*) FROM employee))
				LIMIT 1),
				(random() * 100),
				'');
	end loop;
end; $$;

-- Order details
do $$
declare
    orderRecord record;
begin
    for orderRecord in select Id, totalprice 
	       from "Order" 
	       order by Id
    loop 
		INSERT INTO orderDetails (orderId, productId, quantity, price)
		VALUES (
			orderRecord.Id,
			(SELECT Id FROM product OFFSET floor(random() * (
				SELECT COUNT(*) FROM product))
			LIMIT 1),
			floor(random() * 100), 
			orderRecord.totalPrice);
    end loop;
end; $$

-- Tasks 1/6

SELECT * FROM employee
WHERE FirstName = 'Antonio' -- Antonio doesn't exist in the script

SELECT * FROM employee
WHERE DateOfBirth > '01.01.1979'

SELECT * FROM employee
WHERE Gender = 'M'

SELECT * FROM employee
WHERE LastName LIKE 'T%'

SELECT * FROM employee
WHERE HireDate BETWEEN '01.01.1988' AND '01.25.1988' -- None have been found

SELECT * FROM employee
WHERE LastName LIKE 'J%' AND HireDate BETWEEN '01.01.1988' AND '01.25.1988' -- No employees with the letter J

-- Tasks 2/6

SELECT * FROM employee
WHERE FirstName = 'Antonio' -- Antonio doesn't exist
ORDER BY LastName

SELECT * FROM employee
ORDER BY LastName

SELECT * FROM employee
WHERE Gender = 'M' ORDER BY HireDate DESC

-- Tasks 3/6

SELECT Region
FROM businessentity
UNION ALL
SELECT RegionName
FROM Customer

SELECT Region
FROM businessentity
UNION
SELECT RegionName
FROM Customer

SELECT Region
FROM businessentity
INTERSECT
SELECT RegionName
FROM Customer

-- Tasks 4/6

CREATE TABLE Orders (
  orderID INT PRIMARY KEY,
  orderDate DATE CHECK (orderDate >= '01.01.2010'),
  customerID INT
);

CREATE TABLE Products (
  productID INT PRIMARY KEY,
  productName VARCHAR(255),
  cost DECIMAL(10, 2),
  price DECIMAL(10, 2) CHECK (price >= cost * 1.2)
);

CREATE TABLE ProductUnique (
  productID INT PRIMARY KEY,
  productName VARCHAR(255),
  description VARCHAR(255) UNIQUE,
  cost DECIMAL(10, 2),
  price DECIMAL(10, 2)
);

-- Tasks 5/6

-- Empty :/

-- Tasks 6/6

CREATE TABLE businessentities
(
	business_entity_id serial primary key,
	business_entity_name varchar(50),
	region varchar(50),
	zipcode varchar(10),
	size varchar(10)
);

CREATE TABLE "OrdersTwo"
(
	order_id serial primary key,
	orderDate date CHECK(orderDate>='2010-01-01')
);

CREATE TABLE businessentity_order (
	order_id int,
	business_entity_id int,
	primary key (order_id, business_entity_id),
	foreign key (order_id) references "OrdersTwo" (order_id),
	foreign key (business_entity_id) references businessentities (business_entity_id)
);

SELECT * FROM "OrdersTwo"
SELECT * FROM businessentities
SELECT * FROM customer
SELECT * FROM employee
SELECT * FROM orderdetails
SELECT * FROM product

SELECT b.business_entity_name
FROM businessentities b
LEFT JOIN businessentity_order bo ON b.business_entity_id = bo.business_entity_id
WHERE bo.business_entity_id IS NOT NULL;

SELECT b.business_entity_name
FROM businessentities b
LEFT JOIN businessentity_order bo ON b.business_entity_id = bo.business_entity_id
WHERE bo.business_entity_id IS NULL;