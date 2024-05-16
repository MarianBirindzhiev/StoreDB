
/*
    Products(product_id, product_name, description, price, stock_quantity, category_id)
    Categories(category_id, category_name, category_description)
    Customers(customer_id, email, address, customer_fname, customer_iname, phone)
    Orders(order_id, order_date, total_amount, customer_id)
    Order_Items(order_id, product_id, quantity)
*/

CREATE TABLE Products
(
  product_id INT NOT NULL,
  product_name VARCHAR(30) NOT NULL,
  description VARCHAR(120),
  price INT NOT NULL,
  stock_quantity INT NOT NULL,
  category_id INT NOT NULL
);

CREATE TABLE Categories
(
  category_id INT NOT NULL,
  category_name VARCHAR(30) NOT NULL,
  category_description VARCHAR(120)
);

CREATE TABLE Customers
(
  customer_id INT NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  email VARCHAR(30),
  address VARCHAR(30),
  phone CHAR(10)
);

CREATE TABLE Orders
(
  order_id INT NOT NULL,
  order_date DATE,
  total_amount INT NOT NULL,
  customer_id INT NOT NULL
);

CREATE TABLE Order_Items
(
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL
);
/*
    Primary key
    Products: PK(product_id)
    Categories: PK(category_id)
    Customers: PK(customer_id)
    Orders: PK(order_id)
    Order_Items: PK(order_id, product_id)
*/

ALTER TABLE Products ADD PRIMARY KEY(product_id);
ALTER TABLE Categories ADD PRIMARY KEY(category_id);
ALTER TABLE Customers ADD PRIMARY KEY(customer_id);
ALTER TABLE Orders ADD PRIMARY KEY(order_id);
ALTER TABLE Order_Items ADD PRIMARY KEY(order_id,product_id);

/*
    Foreign keys
    Products: FK(category_id) → Categories(category_id)
    Orders : FK(customer_id) → Customers(customer_id)
    Order_Items: FK(order_id) → Orders(order_id)
    Order_Items: FK(product_id) → Products(product_id)
*/

ALTER TABLE Products ADD FOREIGN KEY(category_id) REFERENCES Categories(category_id);
ALTER TABLE Orders ADD FOREIGN KEY(customer_id) REFERENCES Customers(customer_id);
ALTER TABLE Order_Items ADD FOREIGN KEY(order_id) REFERENCES Orders(order_id);
ALTER TABLE Order_Items ADD FOREIGN KEY(product_id) REFERENCES Products(product_id);

/*
    Check
    Products: CK(price > 0)
    Customers: CK(email - @ .)
    Orders: CK(total_amount > 0)
    Order_Items: CK(quantity > 0)
 */

ALTER TABLE Products ADD CONSTRAINT CK_PRODUCT_PRICE CHECK(price > 0);
ALTER TABLE Customers ADD CONSTRAINT CK_CUSTOMER_EMAIL CHECK(email LIKE '_%@%_.%_');
ALTER TABLE Orders ADD CONSTRAINT CK_ORDER_TOTAL_AMOUNT CHECK(total_amount > 0);
ALTER TABLE Order_Items ADD CONSTRAINT CK_ORDER_ITEMS_QUANTITY CHECK (quantity > 0);
