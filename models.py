import os,datetime
import re
from flask import Flask,render_template,redirect,url_for,session,flash,abort,request,send_file,send_from_directory,safe_join
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_login import LoginManager,UserMixin,login_required,login_user
from forms import SignUp,Login,climate_crop,reviews,districtinfo,reviews,cropsinput,CropPrice,Admin_login
from werkzeug.security import generate_password_hash,check_password_hash
from g1 import build_graph1
from graph import build_graph

#login_manager=LoginManager()
app=Flask(__name__)
app.config['SECRET_KEY']='key'
basedir=os.path.abspath(os.path.dirname(__file__))
app.config['SQLALCHEMY_DATABASE_URI']='sqlite:///'+os.path.join(basedir,'agriculture.sqlite')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=False
db=SQLAlchemy(app)
Migrate(app,db)
count=0


class Farmer(db.Model):
    #__tablename__='farmer'
    id=db.Column(db.Integer,autoincrement=True)
    username=db.Column(db.String(30),primary_key=True,nullable=False,unique=True)
    email=db.Column(db.String(50),nullable=False,unique=True)
    password=db.Column(db.String(50),unique=True,nullable=False)
    


    def __init__(self,username,email,password):
        self.username=username
        self.email=email
        self.password=generate_password_hash(password)

    def check_password(self,password):
        return check_password_hash(self.password,password)


    def __repr__(self):
        return f"The current user is :{self.username}"

class Zone(db.Model):
    #__tablename__='zone'

    zone_id=db.Column(db.Integer,autoincrement=True)
    zone=db.Column(db.String(20),primary_key=True,unique=True)
    nor=db.Column(db.Integer)

    def __init_(self,zname,nor):
        self.zone_name=zname
        self.nor=nor

    def __repr__(self):
        return f"Selected zone is :{self.zname} and has {self.nor} number of regions."

    districts = db.relationship('Districts',backref='Districts.zone',lazy=True)

class Districts(db.Model):
    #__tablename__="districts"
    #zone=db.relationship(Zone)
    did=db.Column(db.String(10),unique=True)
    dname=db.Column(db.String(20),primary_key=True,unique=True)
    area=db.Column(db.Float,nullable=False)
    zone=db.Column(db.String(20),db.ForeignKey(Zone.zone))
    soil=db.Column(db.String(30))
    rainfall=db.Column(db.Integer)
    info=db.Column(db.Text)

    zzone = db.relationship('Zone',foreign_keys='Districts.zone')

    def __init__(self,dname,area,zone,soil,rainfall,info):
        self.dname=dname
        self.area=area
        self.zone=zone
        self.soil=soil
        self.rainfall=rainfall
        self.info=info

    def __repr__(self):
        return f"Selected district is {self.dname}"


class Crops(db.Model):
    #__tablename__="crops"
    id=db.Column(db.Integer)
    crop_name=db.Column(db.String(50),primary_key=True,unique=True)
    temp=db.Column(db.Float)
    rainfall=db.Column(db.Float)
    soil=db.Column(db.String(20))

    def __init__(self,crop_name,summer,winter,rainy):
        self.crop_name=crop_name
        self.temp=temp
        self.rainfall=rainfall
        self.soil=soil




class ClimateCrops(db.Model):
    #__tablename__="climate"
    id=db.Column(db.String(30),primary_key=True)
    district=db.Column(db.String(20))
    summer=db.Column(db.String(50),db.ForeignKey(Crops.crop_name))
    winter=db.Column(db.String(50),db.ForeignKey(Crops.crop_name))
    rainy=db.Column(db.String(50),db.ForeignKey(Crops.crop_name))
    cash_crop=db.Column(db.String(50),db.ForeignKey(Crops.crop_name))


    def __init__(self,district,summer,rainy,winter,cash_crop):
        self.district=district
        self.summer=summer
        self.rainy=rainy
        self.winter=winter
        self.cash_crop=cash_crop






class CropsInput(db.Model):
    #__tablename__="crops_input"
    id=db.Column(db.Integer,autoincrement=True,primary_key=True)
    username=db.Column(db.String(50))
    dist=db.Column(db.String(50))
    crop_name=db.Column(db.String(50))
    season=db.Column(db.String(50))
    investment=db.Column(db.Integer,nullable=False)
    profit=db.Column(db.Integer,nullable=False)

    def __init_(self,username,dist,crop_name,season,investment,profit):
        self.username=username
        self.dist=dist
        self.crop_name=crop_name
        self.season=season
        self.investment=investment
        self.profit=profit

class Price(db.Model):
    #__tablename__="price"
    id=db.Column(db.Integer,autoincrement=True)
    crop_name=db.Column(db.String(50),primary_key=True)
    price=db.Column(db.Float)

    def __init__(self,crop_name,price):
        self.crop_name=crop_name
        self.price=price

class Reviews(db.Model):
    #__tablename__="reviews"
    id=db.Column(db.Integer,primary_key=True,autoincrement=True)
    username=db.Column(db.String(50))
    date=db.Column(db.DateTime,default=datetime.datetime.now())
    review=db.Column(db.Text)

    def __init_(self,email,date,review):

        self.username=username
        self.date=date
        self.review=review

# class Admins(db.Model):
#     id=db.Column(db.Integer,autoincrement=True)
#     username=db.Column(db.String(30),primary_key=True,nullable=False,unique=True)
#     email=db.Column(db.String(50),nullable=False,unique=True)
#     password=db.Column(db.String(50),unique=True,nullable=False)
#
#
#     def __init__(self,username,email,password):
#         self.username=username
#         self.email=email
#         self.password=generate_password_hash(password)
#
#     def check_password(self,password):
#         return check_password_hash(self.password,password)
#
#
#     def __repr__(self):
#         return f"The current user is :{self.username}"


#########################################################VIEWS##############################################################


@app.route("/")
def welcome():
    return render_template("welcome.html")


@app.route("/signup",methods=['GET','POST'])
def signup():
    form=SignUp()
    if form.validate_on_submit():
        result=Farmer.query.all()
        for res in result:
            if res.email==form.email.data:
                flash("E-mail already exists!!")
                return redirect(url_for('signup'))
            if res.username==form.username.data:
                flash("Username already exists!!!")
                return redirect(url_for('signup'))
        if not re.match(r"^(?=.*[\d])(?=.*[A-Z])(?=.*[a-z])(?=.*[@#$])[\w\d@#$]{6,12}$",form.password.data):
            flash("Password must contain 1 Upper case letter,atleast 1 numerical digit and a special character")
            return redirect(url_for('signup'))
        farmer=Farmer(email=form.email.data,username=form.username.data,password=form.password.data)
        db.session.add(farmer)
        db.session.commit()
        flash('Thanks for signing up,You can login now!')
        return redirect(url_for('login'))
    return render_template("signup.html",form=form)


@app.route("/login",methods=['GET','POST'])
def login():
    form=Login()

    if form.validate_on_submit():
        farmer=Farmer.query.filter_by(email=form.email.data).first()
        if farmer.check_password(form.password.data) and farmer is not None:
            #login_user(farmer)
            flash("LOGIN SUCCESSFUL")
            #next=request.args.get('next')
            #if next==None or not next[0]=='/':
            next=url_for('home')
            return redirect(next)
        else:
            flash("Enter valid credentials!!")
            return redirect(url_for('login'))
    return render_template("login.html",form=form)



@app.route("/home",methods=['GET','POST'])
#@login_required
def home():
    return render_template("home.html")

@app.route("/crop_info",methods=['GET','POST'])
def crop_info():
    form=climate_crop()
    if form.validate_on_submit():
        result=ClimateCrops.query.filter_by(district=form.district.data).first()
        d=form.district.data
        s=form.season.data
        if s=='summer':
            c=result.summer
        if s=='winter':
            c=result.winter
        if s=='rainy':
            c=result.rainy
        name=str(form.district.data)
        image=name.lower()+".jpg"
        p1=Price.query.filter_by(crop_name=c).first()
        p2=Price.query.filter_by(crop_name=result.cash_crop).first()
        info1=Crops.query.filter_by(crop_name=c).first()
        info2=Crops.query.filter_by(crop_name=result.cash_crop).first()
        return render_template('crop_info.html',p1=p1,p2=p2,result=result,form=form,d=d,s=s,info1=info1,info2=info2,image=image)
    return render_template("crop_info.html",form=form)

@app.route("/crop_input",methods=['GET','POST'])
def crops_input():
    form=cropsinput()
    if form.validate_on_submit():
        p=CropsInput(username=form.name.data,dist=form.district.data,crop_name=form.crop.data,investment=form.investment.data,profit=form.profit.data)
        db.session.add(p)
        db.session.commit()
        result=CropsInput.query.filter_by(crop_name=form.crop.data,dist=form.district.data)
        x=[]
        y=[]
        i=0
        r=0
        for res in result:
            i+=res.investment
            r+=res.profit
        avg=(r/i)*100000
        avg=round(avg,2)
        for res in result:
            x.append(res.investment)
            y.append(res.profit)
        res = {}
        for i in x:
            for j in y:
                res[i] = j
                y.remove(j)
                break


        graph1_url = build_graph1(res,form.crop.data,form.district.data);
        graph2_url=build_graph(res,form.crop.data,form.district.data)
        return render_template('crop_input.html',form=form,graph1=graph1_url,graph2=graph2_url,avg=avg)

    return render_template("crop_input.html",form=form)

@app.route("/district_info",methods=['GET','POST'])
def district_info():
    form=districtinfo()
    if form.validate_on_submit():
        result=Districts.query.filter_by(dname=form.district.data)
        #print(d)
        name=str(form.district.data)
        image=name.lower()+".jpg"
        return render_template("district_info.html",result=result,form=form,image=image)
    return render_template("district_info.html",form=form)



@app.route('/crop_price',methods=['GET','POST'])
def crop_price():
    form=CropPrice()
    if form.validate_on_submit():
        result=Price.query.filter_by(crop_name=form.crop.data)
        #s=result is None
        crop=ClimateCrops.query.filter_by(district=form.district.data).first()

        name=str(form.crop.data)
        image=name.lower()+".jpg"

        return render_template('crop_price.html',form=form,result=result,image=image,crop=crop)
    return render_template("crop_price.html",form=form)


@app.route("/info",methods=['GET','POST'])
def info():
    zone=Zone.query.all()
    dist=Districts.query.all()
    return render_template("info.html",zone=zone,dist=dist)

@app.route("/contact",methods=['GET','POST'])
def contact():
    return render_template("contact.html")

@app.route("/reviews",methods=['GET','POST'])
def review():
    form=reviews()
    result=Reviews.query.all()
    if form.validate_on_submit():
        d=datetime.datetime.now
        r=Reviews(username=form.username.data,review=form.review.data)
        db.session.add(r)
        db.session.commit()
        result=Reviews.query.all()
        return render_template('review.html',form=form,result=result)
    return render_template("review.html",form=form,result=result)



#################################ADMIN PREVILEGES##########################################3
@app.route("/admin_login",methods=['GET','POST'])
def admin_login():
    form=Admin_login()
    if form.validate_on_submit():
        return render_template("admin_home.html")
    return render_template("admin_login.html",form=form)
