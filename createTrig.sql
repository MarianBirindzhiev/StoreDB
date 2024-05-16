DROP TRIGGER IF EXISTS UpdateStockQuantity;
CREATE TRIGGER UpdateStockQuantity AFTER INSERT ON Order_Items
    FOR EACH ROW
    BEGIN
        DECLARE quantityToUpdate INT;

        SELECT stock_quantity INTO quantityToUpdate
        FROM Products
        WHERE product_id = NEW.product_id;

        UPDATE Products
        SET stock_quantity = stock_quantity - NEW.quantity
        WHERE product_id = NEW.product_id;
    END;

INSERT INTO Orders (order_id, order_date, total_amount, customer_id) VALUES(106, '2024-05-01', 2500, 2);
INSERT INTO Order_Items (order_id, product_id, quantity) VALUES
(106, 101, 1),
(106, 102, 1);

SELECT * FROM Products;

-- ------------------------------------------------------------------------------------------------------------------------------------------

DROP TRIGGER IF EXISTS UpdateOrderTotalAmount;
CREATE TRIGGER UpdateOrderTotalAmount AFTER INSERT ON Order_Items
FOR EACH ROW
BEGIN
    DECLARE orderTotal DECIMAL(10, 2);

    -- Calculate the total amount for the order
    SELECT SUM(P.price * NEW.quantity) INTO orderTotal
    FROM Products P
    WHERE P.product_id = NEW.product_id;

    UPDATE Orders
    SET total_amount = total_amount + orderTotal
    WHERE order_id = NEW.order_id;
END ;

DELETE FROM Orders WHERE order_id = 107;
INSERT INTO Orders(order_id, order_date, customer_id) VALUES(107,'2024-05-10',3);

DELETE FROM Order_Items WHERE order_id = 107;
INSERT INTO Order_Items(order_id,product_id,quantity) VALUES(107,103,2);
INSERT INTO Order_Items(order_id,product_id,quantity) VALUES(107,104,1);

SELECT * FROM Orders;
