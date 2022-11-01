from flask import Flask,render_template,url_for,session,request,redirect
import mysql.connector

app = Flask(__name__)

connection = mysql.connector.connect(user="me",
                                         password="1234",
                                         host='127.0.0.1',
                                         port=3306)
cursor = connection.cursor()
cursor.execute("use EUManagementsystem;")
current_operation = "None"
prev_query = "None"


@app.route('/',methods= ['GET'])
def index():  # put application's code here

    # cursor.execute("select * from fare_details;")
    # values = cursor.fetchall(
    return render_template("main.html")


@app.route('/inp', methods=['GET', 'POST'])
def que_exec():
    if request.method == "POST":
        tempo = request.form["query"]
        query = tempo
        cursor.execute(query)
        values = cursor.fetchall()
        que = values
        que = str(que)
        x = que.split("), (")
        return render_template("input.html", data = x, Qp=tempo)
    else:
        return render_template("input.html", data = [],Qp = prev_query)


@app.route('/tab1',methods = ['GET','POST'])
def show_countries():
    return render_template("countries.html")


@app.route('/tab2',methods = ['GET','POST'])
def show_deps():
    return render_template("departments.html")


if __name__ == '__main__':
    app.run(DEBUG=True)
