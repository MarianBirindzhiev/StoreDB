-- Inserting data into Categories table
INSERT INTO Categories (category_id, category_name, category_description) VALUES
(1, 'Electronics', 'Electronic gadgets and devices'),
(2, 'Clothing', 'Apparel and fashion items'),
(3, 'Books', 'Books and literary materials');

-- Inserting data into Products table
INSERT INTO Products (product_id, product_name, description, price, stock_quantity, category_id) VALUES
(101, 'Smartphone', 'Latest smartphone model with advanced features', 1000, 50, 1),
(102, 'Laptop', 'High-performance laptop with SSD storage', 1500, 30, 1),
(103, 'T-shirt', 'Casual cotton T-shirt', 20, 100, 2),
(104, 'Jeans', 'Classic denim jeans', 50, 80, 2),
(105, 'Novel', 'Bestselling fiction novel', 15, 200, 3),
(106, 'Textbook', 'Educational textbook for students', 50, 50, 3);

-- Inserting data into Customers table
INSERT INTO Customers (customer_id, first_name, last_name, email, address, phone) VALUES
(1, 'John', 'Doe', 'john@example.com', '123 Main St', '1234567890'),
(2, 'Jane', 'Smith', 'jane@example.com', '456 Elm St', '0987654321'),
(3, 'Alice', 'Johnson', 'alice@example.com', '789 Oak St', '9876543210');

INSERT INTO Orders (order_id, order_date, total_amount, customer_id) VALUES
(101, '2024-05-01', 1040, 1),
(102, '2024-05-02', 15, 2),
(103, '2024-05-03', 1600, 3);

-- Inserting data into Order_Items table
INSERT INTO Order_Items (order_id, product_id, quantity) VALUES
(101, 101, 1),
(101, 103, 2),
(102, 105, 1),
(103, 102, 1),
(103, 104, 2);
