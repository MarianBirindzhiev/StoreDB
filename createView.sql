DROP VIEW IF EXISTS ProductsWithCategory;
CREATE VIEW ProductsWithCategory AS
SELECT P.product_name, P.description, P.price, P.stock_quantity, C.category_name
FROM Products P
JOIN Categories C ON P.category_id = C.category_id;

SELECT * FROM ProductsWithCategory;

-- --------------------------------------------------------------------------------------------------------------------------

DROP VIEW IF EXISTS CustomerOrders;
CREATE VIEW CustomerOrders AS
SELECT C.first_name, C.last_name, C.email, O.order_id, O.order_date, O.total_amount
FROM Customers C
JOIN Orders O ON C.customer_id = O.customer_id;

SELECT * FROM CustomerOrders C
WHERE C.first_name = 'John';

-- ---------------------------------------------------------------------------------------------------------------------------------

DROP VIEW IF EXISTS HighStockProducts;
CREATE VIEW HighStockProducts AS
SELECT * FROM Products WHERE stock_quantity > 100;

SELECT * from HighStockProducts;
