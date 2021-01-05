from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField,TextAreaField,SelectField,IntegerField
from wtforms.validators import DataRequired, Email, EqualTo,Length
from wtforms import ValidationError
from flask_wtf.file import FileField,FileAllowed,FileRequired



class Login(FlaskForm):
	email = StringField("",validators=[DataRequired(),Email()],render_kw={"placeholder":"E-mail","id":"ip"})
	password= PasswordField("",validators=[DataRequired(),Length(min=8,max=32)],render_kw={"placeholder":"Password","id":"ip"})
	submit = SubmitField("Login",render_kw={"placeholder":"Log In","id":"login","class":"btn btn-success"})

class Admin_login(FlaskForm):
	email = StringField("",validators=[DataRequired(),Email()],render_kw={"placeholder":"E-mail","id":"ip"})
	password= PasswordField("",validators=[DataRequired(),Length(min=8,max=32)],render_kw={"placeholder":"Password","id":"ip"})
	key=IntegerField("",validators=[DataRequired()],render_kw={"placeholder":"KEY:"})

	submit = SubmitField("Login",render_kw={"placeholder":"Log In","id":"login","class":"btn btn-success"})


class SignUp(FlaskForm):
	email = StringField("",validators=[DataRequired(),Email()],render_kw={"placeholder":"E-mail","id":"ip"})
	username = StringField("",validators=[DataRequired()],render_kw={"placeholder":"Username","id":"ip"})
	password= PasswordField("",validators=[DataRequired(),EqualTo('confirm',message=('Must be equal to Confirm')),Length(min=8,max=32,message=('Password length must be min of 8 characters and maximum of 32 characters and must contain minimum of 1 Upeer case,1 digit and must include special characters'))],render_kw={"placeholder":"Password","id":"ip"})
	confirm= PasswordField("",validators=[DataRequired()],render_kw={"placeholder":"Confirm Password","id":"ip"})
	submit = SubmitField("Sign Up",render_kw={"placeholder":"Sign Up","id":"su","class":"btn btn-primary"})

	def check_email(self,field):
		if Farmer.query.filter_by(email=field.data).first():
			raise ValidationError('Your email is already registered!')

	def check_username(self,field):
		if Farmer.query.filter_by(username=field.data).first():
			raise ValidationError('the entered username is taken.Please use another!')



class cropsinput(FlaskForm):
	name=StringField('Username')
	district=SelectField("Select the district:",validators=[DataRequired()],render_kw={"placeholder":"District"},choices=[('BAGALKOT','BAGALKOT'),('BENGALURU URBAN','BENGALURU URBAN'),('BENGALURU RURAL','BENGALURU RURAL'),
	('BELAGAVI','BELAGAVI'),
	('BALLARI','BALLARI'),
	('BIDAR','BIDAR'),
	('BIJAPUR','BIJAPUR'),
	('CHAMARAJANAGAR','CHAMARAJANAGAR' ),
	('CHIKBALLAPUR','CHIKBALLAPUR'),
	('CHIKKAMAGALURU','CHIKKAMAGALURU'),
	('CHITRADURGA','CHITRADURGA'),
	('DAKSHINA KANNADA','DAKSHINA KANNADA'),
	('DAVANAGERE','DAVANAGERE'),
	('DHARWAD','DHARWAD'),
	('GADAG','GADAG'),
	('KALABURUGI','KALABURUGI'),
	('HASSAN','HASSAN'),
	('HAVERI','HAVERI'),
	('KODAGU','KODAGU'),
	('KOLAR','KOLAR'),
	('KOPPAL','KOPPAL'),
	('MANDYA','MANDYA'),
	('MYSURU','MYSURU'),
	('RAICHUR','RAICHUR'),
	('RAMANAGARA','RAMANAGARA'),
	('SHIVAMOGGA','SHIVAMOGGA'),
	('TUMAKURU','TUMAKURU'),
	('UDUPI','UDUPI'),
	('UTTARA KARNATAKA','UTTARA KARNATAKA'),
	('YADAGIR','YADAGIR')])
	crop=SelectField("Select the crop:",choices=[("Groundnut","Groundnut"),
	("Mustard","Mustard"),
	("Ragi","Ragi"),
	("Paddy","Paddy"),
	("Mango","Mango"),
	("Sunflower","Sunflower"),
	("Sugarcane","Sugarcane"),
	("Blackgram","Blackgram"),
	("Jowar","Jowar"),
	("Wheat","Wheat"),
	("Oilseeds","Oilseeds"),
	("Coffee","Coffee"),
	("Field Bean","Field Bean"),
	("Maize","Maize"),
	("Arecanut","Arecanut"),
	("Sorghum","Sorghum"),
	("Bengalgram","Bengalgram"),
	("Pulses","Pulses"),
	("Horsegram","Horsegram"),
	("Cotton","Cotton"),
	("Chickpea","Chickpea"),
	("Pepper","Pepper"),
	("Coconut","Coconut"),
	("Redgram","Redgram"),
	("Pigeonpea","Pigeonpea"),
	("Chilli","Chilli"),
	("Greengram","Greengram"),
	("Banana","Banana"),
	("Citrus","Citrus"),
	("Cashew","Cashew"),
	("Soyabean","Soyabean"),
	("Grapes","Grapes"),
	("Rose","Rose"),
	("Tobacco","Tobacco"),
	("Onions","Onions"),
	("Tea","Tea"),
	("Cucumber","Cucumber")])
	season=SelectField("Season",validators=[DataRequired()],choices=[('summer','summer'),('winter','winter'),('rainy','rainy')])
	investment=IntegerField("INVESTMENT",validators=[DataRequired()])
	profit=IntegerField("RETURN",validators=[DataRequired()])
	submit=SubmitField("Submit",render_kw={"placeholder":"Submit"})




class CropPrice(FlaskForm):
	district=SelectField("Select the district:",choices=[('BAGALKOT','BAGALKOT'),
	('BENGALURU URBAN','BENGALURU URBAN'),
	('BENGALURU RURAL','BENGALURU RURAL'),
	('BELAGAVI','BELAGAVI'),
	('BALLARI','BALLARI'),
	('BIDAR','BIDAR'),
	('BIJAPUR','BIJAPUR'),
	('CHAMARAJANAGAR','CHAMARAJANAGAR' ),
	('CHIKBALLAPUR','CHIKBALLAPUR'),
	('CHIKKAMAGALURU','CHIKKAMAGALURU'),
	('CHITRADURGA','CHITRADURGA'),
	('DAKSHINA KANNADA','DAKSHINA KANNADA'),
	('DAVANAGERE','DAVANAGERE'),
	('DHARWAD','DHARWAD'),
	('GADAG','GADAG'),
	('KALABURUGI','KALABURUGI'),
	('HASSAN','HASSAN'),
	('HAVERI','HAVERI'),
	('KODAGU','KODAGU'),
	('KOLAR','KOLAR'),
	('KOPPAL','KOPPAL'),
	('MANDYA','MANDYA'),
	('MYSURU','MYSURU'),
	('RAICHUR','RAICHUR'),
	('RAMANAGARA','RAMANAGARA'),
	('SHIVAMOGGA','SHIVAMOGGA'),
	('TUMAKURU','TUMAKURU'),
	('UDUPI','UDUPI'),
	('UTTARA KARNATAKA','UTTARA KARNATAKA'),
	('YADAGIR','YADAGIR')])
	crop=SelectField("Select CROP:",choices=[("Groundnut","Groundnut"),
	("Mustard","Mustard"),
	("Ragi","Ragi"),
	("Paddy","Paddy"),
	("Mango","Mango"),
	("Sunflower","Sunflower"),
	("Sugarcane","Sugarcane"),
	("Blackgram","Blackgram"),
	("Jowar","Jowar"),
	("Wheat","Wheat"),
	("Oilseeds","Oilseeds"),
	("Coffee","Coffee"),
	("Field Bean","Field Bean"),
	("Maize","Maize"),
	("Arecanut","Arecanut"),
	("Sorghum","Sorghum"),
	("Bengalgram","Bengalgram"),
	("Pulses","Pulses"),
	("Horsegram","Horsegram"),
	("Cotton","Cotton"),
	("Chickpea","Chickpea"),
	("Pepper","Pepper"),
	("Coconut","Coconut"),
	("Redgram","Redgram"),
	("Pigeonpea","Pigeonpea"),
	("Chilli","Chilli"),
	("Greengram","Greengram"),
	("Banana","Banana"),
	("Citrus","Citrus"),
	("Cashew","Cashew"),
	("Soyabean","Soyabean"),
	("Grapes","Grapes"),
	("Rose","Rose"),
	("Tobacco","Tobacco"),
	("Onions","Onions"),
	("Tea","Tea"),
	("Cucumber","Cucumber")])
	submit=SubmitField("submit")



class climate_crop(FlaskForm):
	district=SelectField("Select the district:",choices=[('BAGALKOT','BAGALKOT'),
	('BENGALURU URBAN','BENGALURU URBAN'),
	('BENGALURU RURAL','BENGALURU RURAL'),
	('BELAGAVI','BELAGAVI'),
	('BALLARI','BALLARI'),
	('BIDAR','BIDAR'),
	('BIJAPUR','BIJAPUR'),
	('CHAMARAJANAGAR','CHAMARAJANAGAR' ),
	('CHIKBALLAPUR','CHIKBALLAPUR'),
	('CHIKKAMAGALURU','CHIKKAMAGALURU'),
	('CHITRADURGA','CHITRADURGA'),
	('DAKSHINA KANNADA','DAKSHINA KANNADA'),
	('DAVANAGERE','DAVANAGERE'),
	('DHARWAD','DHARWAD'),
	('GADAG','GADAG'),
	('KALABURUGI','KALABURUGI'),
	('HASSAN','HASSAN'),
	('HAVERI','HAVERI'),
	('KODAGU','KODAGU'),
	('KOLAR','KOLAR'),
	('KOPPAL','KOPPAL'),
	('MANDYA','MANDYA'),
	('MYSURU','MYSURU'),
	('RAICHUR','RAICHUR'),
	('RAMANAGARA','RAMANAGARA'),
	('SHIVAMOGGA','SHIVAMOGGA'),
	('TUMAKURU','TUMAKURU'),
	('UDUPI','UDUPI'),
	('UTTARA KARNATAKA','UTTARA KARNATAKA'),
	('YADAGIR','YADAGIR')])
	season=SelectField("Select the season:",choices=[('summer','summer'),('winter','winter'),('rainy','rainy')])
	submit=SubmitField("Submit")


class reviews(FlaskForm):
	username=StringField("Username",validators=[DataRequired()])
	review=TextAreaField('Enter here')
	submit=SubmitField('Submit')

class districtinfo(FlaskForm):
	district=SelectField("District",choices=[('BAGALKOT','BAGALKOT'),
	('BENGALURU URBAN','BENGALURU URBAN'),
	('BENGALURU RURAL','BENGALURU RURAL'),
	('BELAGAVI','BELAGAVI'),
	('BALLARI','BALLARI'),
	('BIDAR','BIDAR'),
	('BIJAPUR','BIJAPUR'),
	('CHAMARAJANAGAR','CHAMARAJANAGAR' ),
	('CHIKBALLAPUR','CHIKBALLAPUR'),
	('CHIKKAMAGALURU','CHIKKAMAGALURU'),
	('CHITRADURGA','CHITRADURGA'),
	('DAKSHINA KANNADA','DAKSHINA KANNADA'),
	('DAVANAGERE','DAVANAGERE'),
	('DHARWAD','DHARWAD'),
	('GADAG','GADAG'),
	('KALABURUGI','KALABURUGI'),
	('HASSAN','HASSAN'),
	('HAVERI','HAVERI'),
	('KODAGU','KODAGU'),
	('KOLAR','KOLAR'),
	('KOPPAL','KOPPAL'),
	('MANDYA','MANDYA'),
	('MYSURU','MYSURU'),
	('RAICHUR','RAICHUR'),
	('RAMANAGARA','RAMANAGARA'),
	('SHIVAMOGGA','SHIVAMOGGA'),
	('TUMAKURU','TUMAKURU'),
	('UDUPI','UDUPI'),
	('UTTARA KARNATAKA','UTTARA KARNATAKA'),
	('YADAGIR','YADAGIR')])
	submit=SubmitField("Submit")
