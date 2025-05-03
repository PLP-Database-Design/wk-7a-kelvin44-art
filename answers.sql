--Question 1
CREATE TABLE productsNormalized (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Insert each product as a separate row
INSERT INTO productNormalized VALUES (101, 'John Doe', 'Laptop');
INSERT INTO productNormalized VALUES (101, 'John Doe', 'Mouse');
INSERT INTO productNormalized VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO productNormalized VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO productNormalized VALUES (102, 'Jane Smith', 'Mouse');
INSERT INTO productNormalized VALUES (103, 'Emily Clark', 'Phone');
-- View the normalized data
SELECT * FROM productsNormalized;

--Question 2


-- Create Orders table to store order information
CREATE TABLE Orders (
    orderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Create OrderProducts table to store product details for each order
CREATE TABLE orderProducts (
    orderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (orderID, Product),
    FOREIGN KEY (orderID) REFERENCES orders(orderID)
);

-- Insert data into Orders table (distinct order information)
INSERT INTO orders (orderID, CustomerName)
SELECT DISTINCT orderID, CustomerName
FROM orderDetails;

-- Insert data into OrderProducts table (product details)
INSERT INTO orderProducts (orderID, Product, Quantity)
SELECT orderID, Product, Quantity
FROM orderDetails;