from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)


def connect_to_database():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="password",
        database="HOUSEAPP"
    )


@app.route('/')
def home():
    return render_template('home.html')


@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':

        user_id = request.form['user_id']
        password = request.form['password']
        fname = request.form['fname']
        lname = request.form['lname']
        email = request.form['email']
        account_type = request.form['account_type']

        db_connection = connect_to_database()
        cursor = db_connection.cursor()

        cursor.execute("SELECT * FROM Customers WHERE Email = %s", (email,))
        existing_user = cursor.fetchone()

        if existing_user:
            return "User already exists."
        else:

            cursor.execute("INSERT INTO Customers (User_ID, Password, FName, LName, Email, AccountType) VALUES (%s, %s, %s, %s, %s, %s)",
                           (user_id, password, fname, lname, email, account_type))
            db_connection.commit()
            db_connection.close()
            return "Signup successful"

    return render_template('signup.html')


@app.route('/createlisting', methods=['GET', 'POST'])
def create_listing():
    if request.method == 'POST':

        price = request.form['price']
        date = request.form['date']
        status = request.form['status']
        property_num = request.form['property_num']
        agent_id = request.form['agent_id']
        customer_id = request.form['customer_id']

        db_connection = connect_to_database()
        cursor = db_connection.cursor()

        cursor.execute(
            "SELECT * FROM Properties WHERE Property_ID = %s", (property_num,))
        existing_property = cursor.fetchone()

        if not existing_property:
            db_connection.close()
            return "Property does not exist. Please enter a valid property number."

        cursor.execute("INSERT INTO Listings (Price, Date, Status, PropertyNum, Agent_ID, Customer_ID) VALUES (%s, %s, %s, %s, %s, %s)",
                       (price, date, status, property_num, agent_id, customer_id))
        db_connection.commit()
        db_connection.close()

        return "Listing created successfully."

    return render_template('createlisting.html')


@app.route('/purchaselisting', methods=['GET', 'POST'])
def purchase_listing():
    if request.method == 'POST':

        listing_num = request.form['listing_num']
        customer_num = request.form['customer_num']

        db_connection = connect_to_database()
        cursor = db_connection.cursor()

        cursor.execute(
            "UPDATE Listings SET Status = 'Sold' WHERE Listing_ID = %s", (listing_num,))
        db_connection.commit()

        cursor.execute(
            "INSERT INTO BuySell (Listing_Num, Customer_Number) VALUES (%s, %s)", (listing_num, customer_num))
        db_connection.commit()
        db_connection.close()

        return "purchased successfully."

    return render_template('purchaselisting.html')


@app.route('/createcontract', methods=['GET', 'POST'])
def create_contract():
    if request.method == 'POST':
        price = request.form['price']
        interest_rate = request.form['interest_rate']
        agent_info = request.form['agent_info']
        property_info = request.form['property_info']
        customer_info = request.form['customer_info']
        date = request.form['date']
        mortgage = request.form['mortgage']

        db_connection = connect_to_database()
        cursor = db_connection.cursor()

        cursor.execute("INSERT INTO Contracts (Price, InterestRate, AgentInfo, PropertyInfo, CustomerInfo, Date, Mortgage) VALUES (%s, %s, %s, %s, %s, %s, %s)",
                       (price, interest_rate, agent_info, property_info, customer_info, date, mortgage))
        db_connection.commit()
        db_connection.close()

        return "Contract created."

    return render_template('createcontract.html')


if __name__ == '__main__':
    app.run(debug=True)
