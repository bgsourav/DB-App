from flask import Flask,render_template,url_for,session,request,redirect
import mysql.connector

app = Flask(__name__)
app.secret_key = "super secret key"
connection = mysql.connector.connect(user="me",password="1234",host='127.0.0.1',port=3306)
cursor = connection.cursor()
cursor.execute("use EUManagementsystem;")
current_operation = "None"
prev_query = "None"


@app.route('/',methods= ['GET'])
def index():
    return render_template("main.html")


@app.route('/inp', methods=['GET', 'POST'])
def que_exec():
    if request.method == "POST":
        try:
            tempo = request.form["query"]
            query = tempo
            cursor.execute(query)
            values = cursor.fetchall()
            print(type(values))
            head = [i[0] for i in cursor.description]
        except:
            values = []
            tempo = "Invalid Input." \
                    "Please Try again !!!!!"
            head = []
        que = values
        return render_template("input.html", data = que, Qp=tempo,table_headers = head)
    else:
        return render_template("input.html", data = [],Qp = prev_query,table_headers = [])


@app.route('/tab1',methods = ['GET','POST'])
def show_countries():
    session["table"] = "Countries"
    return render_template("countries.html")


@app.route('/tab2',methods = ['GET','POST'])
def show_deps():
    session["table"] = "Departments"
    return render_template("departments.html")


@app.route('/ins',methods = ['GET','POST'])
def show_ins():
    return render_template("insertform.html",count = session["table"])


if __name__ == '__main__':
    app.debug = True
    app.run()
