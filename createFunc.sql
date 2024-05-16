DROP PROCEDURE IF EXISTS GetProductsByCategoryName;
CREATE PROCEDURE GetProductsByCategoryName(
    IN categoryName VARCHAR(30))
BEGIN
    SELECT P.product_name AS Product, P.description AS Description, P.price AS Price, P.stock_quantity AS AvailableQuantity
    FROM Products P JOIN Categories C
    ON P.category_id = C.category_id
    WHERE category_name = categoryName;
END ;

call GetProductsByCategoryName('Electronics');

-- ---------------------------------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS GetOrderItemsByOrderID;
CREATE PROCEDURE GetOrderItemsByOrderID(
    IN orderId INT)
BEGIN
    SELECT P.product_name AS Product, P.price as Price, OS.quantity as BoughtQuantity
    FROM Products P JOIN Order_Items OS
    ON P.product_id = OS.product_id
    WHERE order_id = orderId;
END;

call GetOrderItemsByOrderID(101);

-- -------------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS  GetAllCustomerOrderItems;
CREATE PROCEDURE GetAllCustomerOrderItems(
    IN customerId INT
)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE orderId INT;

    -- Declare cursor to fetch order IDs for the given customer
    DECLARE cur CURSOR FOR
        SELECT order_id FROM Orders WHERE customer_id = customerId;

    -- Declare continue handler to exit loop when no more rows
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Open cursor
    OPEN cur;

    -- Start fetching order IDs and calling GetOrderItemsByOrderID for each order
    FETCH cur INTO orderId;

    WHILE NOT done DO
        -- Call GetOrderItemsByOrderID procedure for the current order ID
        CALL GetOrderItemsByOrderID(orderId);

        -- Fetch next order ID
        FETCH cur INTO orderId;
    END WHILE;

    -- Close cursor
    CLOSE cur;
END;

INSERT INTO Orders (order_id, order_date, total_amount, customer_id) VALUES(104, '2024-05-01', 150, 1);
INSERT INTO Orders (order_id, order_date, total_amount, customer_id) VALUES(105, '2024-05-08', 100, 1);

INSERT INTO Order_Items (order_id, product_id, quantity) VALUES
(104, 106, 2),
(104, 104, 1),
(105, 103, 5);

call GetAllCustomerOrderItems(1);





