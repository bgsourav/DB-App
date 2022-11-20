from flask import Flask,render_template,url_for,session,request,redirect,flash
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
        error = ""
        try:
            tempo = request.form["query"]
            query = tempo
            cursor.execute(query)
            values = cursor.fetchall()
            print(type(values))
            head = [i[0] for i in cursor.description]
        except mysql.connector.Error as e:
            values = []
            tempo = "Invalid Input."
            flash(e,"info")
            error = e
            head = []
        que = values
        return render_template("input.html", data = que, Qp=tempo,table_headers = head,err = error)
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
    statement = ""
    if request.method == "POST":
        country_name = request.form["country_name"]
        country_id = request.form["country_id"]
        date_of_join = request.form["date"]
        capital = request.form["capital"]
        hog = request.form["HOG"]
        gdppc = request.form["GDPPC"]
        statement = ""
        try:
            cursor.execute(f'insert into Countries values("{country_name}",{country_id},"{date_of_join}","{capital}","{hog}",{gdppc});')
            statement = "Successfully inserted values into the table"
            connection.commit()
        except mysql.connector.Error as e:
            statement = "Error " + e
        return render_template("insertform.html", count=statement)
    else:
        return render_template("insertform.html",count = statement)


@app.route('/upd',methods = ['GET','POST'])
def update_tabs():
    statement = ""
    if request.method == "POST":
        country_name = request.form["country_name"]
        country_id_old = request.form["country_id_old"]
        date_of_join = request.form["date"]
        capital = request.form["capital"]
        hog = request.form["HOG"]
        gdppc = request.form["GDPPC"]
        try:
            cursor.execute(f'update Countries set CountryName = "{country_name}",JoinDate = "{date_of_join}",Capital ="{capital}",HeadOfGovernment="{hog}",GDPpercapita = {gdppc} where CountryID = {country_id_old}')
            statement = "Successfully Inserted."
            connection.commit()
        except mysql.connector.Error as e:
            statement = e
        return render_template("updateform.html",flag = statement)
    else:
        return render_template("updateform.html",flag = statement)


@app.route('/del',methods = ['GET','POST'])
def show_del():
    status = ""
    if request.method == "POST":
        render_template("deleteform.html",flag = status)
    else:
        render_template("deleteform.html", flag=status)


if __name__ == '__main__':
    app.debug = True
    app.run()
