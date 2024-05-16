import mysql.connector

def connect():
    try:
        connection = mysql.connector.connect(
            host = "localhost",
            user = "marianbirindzhiev",
            password = "1333",
            database = "StoreDB"
        )
        print ("Connected to the database")
        return connection
    except mysql.connector.Error as error:
        print ("Connection failed",error)
        return None
    

def execute(connection, query):
    try:
        cursor = connection.cursor()
        cursor.execute(query)

        if cursor.description is not None:  
            rows = cursor.fetchall()
            for row in rows:
                print(row)
        else:
            print("Query executed successfully")

        connection.commit() 

    except mysql.connector.Error as error:
        print("Query failed", error)

    finally:
        if 'cursor' in locals():
            cursor.close()



def main():
    connection = connect()
    if connection is not None:
        query = "SELECT * FROM Products"
        execute(connection, query)

        query = "INSERT INTO Orders (order_id, order_date, customer_id) VALUES (1000, '2024-05-01', 2)"
        execute(connection, query)

        query = "INSERT INTO Order_Items (order_id, product_id, quantity) VALUES (1000, 102, 2)"
        execute (connection, query)

        execute(connection, "SELECT * FROM Products")
        execute(connection, "SELECT * FROM Orders")

        execute(connection, "DELETE FROM Order_Items WHERE order_id = 1000")
        execute(connection, "DELETE FROM Orders WHERE order_id = 1000")

        connection.close()
    else:
        print ("Connection failed")

if __name__ == "__main__":
    main()

