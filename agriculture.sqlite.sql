BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "districts" (
	"did"	VARCHAR(10) UNIQUE,
	"dname"	VARCHAR(20) NOT NULL UNIQUE,
	"area"	FLOAT NOT NULL,
	"zone"	VARCHAR(20),
	"soil"	VARCHAR(30),
	"rainfall"	INTEGER,
	"info"	TEXT,
	PRIMARY KEY("dname"),
	FOREIGN KEY("zone") REFERENCES "zone"("zone")
);
CREATE TABLE IF NOT EXISTS "climate_crops" (
	"id"	VARCHAR(30) NOT NULL,
	"district"	VARCHAR(20),
	"summer"	VARCHAR(50),
	"winter"	VARCHAR(50),
	"rainy"	VARCHAR(50),
	"cash_crop"	VARCHAR(50),
	PRIMARY KEY("id"),
	FOREIGN KEY("cash_crop") REFERENCES "crops"("crop_name"),
	FOREIGN KEY("winter") REFERENCES "crops"("crop_name"),
	FOREIGN KEY("rainy") REFERENCES "crops"("crop_name"),
	FOREIGN KEY("summer") REFERENCES "crops"("crop_name")
);
CREATE TABLE IF NOT EXISTS "zone" (
	"zone_id"	INTEGER,
	"zone"	VARCHAR(20) NOT NULL UNIQUE,
	"nor"	INTEGER,
	PRIMARY KEY("zone")
);
CREATE TABLE IF NOT EXISTS "reviews" (
	"id"	INTEGER NOT NULL,
	"username"	VARCHAR(50),
	"date"	DATETIME,
	"review"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "price" (
	"id"	INTEGER,
	"crop_name"	VARCHAR(50) NOT NULL,
	"price"	FLOAT,
	PRIMARY KEY("crop_name")
);
CREATE TABLE IF NOT EXISTS "farmer" (
	"id"	INTEGER,
	"username"	VARCHAR(30) NOT NULL UNIQUE,
	"email"	VARCHAR(50) NOT NULL UNIQUE,
	"password"	VARCHAR(50) NOT NULL UNIQUE,
	"admin"	INTEGER,
	PRIMARY KEY("username")
);
CREATE TABLE IF NOT EXISTS "crops_input" (
	"id"	INTEGER NOT NULL,
	"username"	VARCHAR(50),
	"dist"	VARCHAR(50),
	"crop_name"	VARCHAR(50),
	"season"	VARCHAR(50),
	"investment"	INTEGER NOT NULL,
	"profit"	INTEGER NOT NULL,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "crops" (
	"id"	INTEGER,
	"crop_name"	VARCHAR(50) NOT NULL UNIQUE,
	"temp"	FLOAT,
	"rainfall"	FLOAT,
	"soil"	VARCHAR(20),
	PRIMARY KEY("crop_name")
);
CREATE TABLE IF NOT EXISTS "alembic_version" (
	"version_num"	VARCHAR(32) NOT NULL,
	CONSTRAINT "alembic_version_pkc" PRIMARY KEY("version_num")
);
INSERT INTO "districts" VALUES ('BK','BAGALKOT',6572.0,'BELAGAVI DIV','589','RED,LOAMY','The major crops grown are Sorghum, Maize, Wheat, Groundnut, Sunflower, Greengram, Redgram, Bengalgram, Sugarcane and Cotton. Horticultural crops like Sapota, Pomegranate, Banana, Grapes, Lime and Papaya are also cultivated extensively in the district. The allied Agricultural enterprises like Dairy, Poultry, Farm Forestry, Sheep and Goat Rearing, Inland Fisheries, Sericulture are also practiced.');
INSERT INTO "districts" VALUES ('BU','BENGALURU URBAN',2190.0,'BENGALURU DIV','810','RED,LATERITE','Bengaluru is the capital city of Karnataka, located on Deccan Plateau in the south- eastern part of Karnataka and spread across four Taluks namely, Bengaluru North, Bengaluru East, Bengaluru South and Anekal. Anekal Taluk is called as Ragi Bowl in the State. The district has 649 milk co-operatives and produced annually 119 million litres of milk, 34.7 million eggs, 5880 tons of meat.');
INSERT INTO "districts" VALUES ('BR','BENGALURU RURAL',2259.0,'BENGALURU DIV','805','RED,LATERITE','The district is endowed with agricultural and horticultural crops such as ragi, rice, groundnut, sugarcane, castor, grapes, mulberry, etc. There are adequate infrastructural facilities such as transportation, communication, banking, credit, and marketing. Since many years, weaving has also been a major occupation for a large section of the population. The soil and climatic conditions are congenial for the cultivation of mulberry, rearing of silkworms, and production of silk, besides other agro-based industries. There are a number of wineries and quantity of production of wine has been increasing.');
INSERT INTO "districts" VALUES ('BG','BELAGAVI',13415.0,'BELAGAVI DIV','824','BLACK,RED','Belagavi district is located midway between Bengaluru and Mumbai at approximately 500 Km. It is Spread across 10 taluks – Athani, Bailhongal, Belagavi, Chikkodi, Gokak, Hukkeri, Khanapur, Ramdurg, Raibhag and Saundatti.');
INSERT INTO "districts" VALUES ('BA','BALLARI',8450.0,'KALABURAGI DIV','631','RED,BLACK','Food Crops:Paddy, Jowar, Cereals, Maize, Bengal Gram and Ground nut.Onion, Chillies, Papaya, Grapes, Guava, Coriander, Pomegranate, Mosambi, Sapota, Banana, Mango, Fig and Coconut');
INSERT INTO "districts" VALUES ('BD','BIDAR',5448.0,'KALABURAGI DIV','848','RED,CLAYEY','Food crops:
Maize, Ragi, Rice ,Tur, Horse gram, Green gram, Groundnut, and Mustard
Horticulture crops:
Potato, Tomato, Onion, Beans, Green Chillies, Khol Crops, Carrot, Radish, Beetroot, Mango, Banana, Guava, Sapota, Grapes, Marigold, Jasmine, Chrysanthamum and Rose
Cash crops:
Sugarcane and Cashew');
INSERT INTO "districts" VALUES ('BJ','BIJAPUR',10494.0,'BELAGAVI DIV','595','MEDIUM BLACK','Food crops:
Paddy, Maize, Ragi, Jowar, Groundnut and Pulses.
Horticultural crops:
Coconut, Turmeric, Onion, Banana, Chilies, Mango and Marigold.
Cash crops:
Cotton, Sunflower, Sugarcane');
INSERT INTO "districts" VALUES ('CJ','CHAMARAJANAGAR',5101.0,'MYSURU DIV','703','MEDIUM BLACK','Food crops:
Paddy, Maize, Ragi, Jowar, Groundnut and Pulses.
Horticultural crops:
Coconut, Turmeric, Onion, Banana, Chilies, Mango and Marigold.
Cash crops:
Cotton, Sunflower, Sugarcane');
INSERT INTO "districts" VALUES ('CH','CHIKBALLAPUR',4524.0,'MYSURU DIV','743','RED LOAMY AND SANDY','Major food crops:
Ragi, Paddy, Maize, Ground nut
Horticulture crops:
Potato, Tomato, Tamarind, Mango and grapes
Cash crops:
Coconut, Cashew');
INSERT INTO "districts" VALUES ('CK','CHIKKAMAGALURU',7201.0,'MYSURU DIV','1903','RED,LATERITE','Cereals:
Paddy, ragi, maize, jowar
Pulses:
Red gram, horse gram, green gram, black gram and bengal gram
Oil Seeds:
Sunflower and groundnut
Vegetables:
Potato, chilli, tomato and onion
Flowers:
Rose, anthuriums, chrysanthemum and  mariegold

Fruits

Banana, mango, mandarins and sapota

Commercial crops

Sugarcane and cotton

Plantation crops

Coffee, tea, coco, beetal leaf

Horticultural crops

Coconut and  arecanut

Spices

Pepper, cardamom, ginger and turmeric');
INSERT INTO "districts" VALUES ('CT','CHITRADURGA',8440.0,'BENGALURU DIV','487','BLACK AND RED','Food crops:
Paddy, Ragi, Jowar and Maize
Pulses:
Red gram, Horse gram, Green gram, Black gram, Bengal gram and Tur
Commercial crops:
Groundnut, Sunflower, Cotton and Tobacco');
INSERT INTO "districts" VALUES ('DK','DAKSHINA KANNADA',4560.0,'MYSURU DIV','3559','RED,LATERITE,SANDY','The main food crops is Paddy and pulses like Greengram, Blackgram and Horsegram are grown in small pockets in paddy fallows under residual soil moisture conditions.  Horticulture crops like Arecanut, Coconut, Pepper, Cashew, Banana, Vegetables, and Flower crops like Jasmine are grown in large scale and sustained the economy of the District. Subsidiary enterprises like Dairy, Poultry, Piggery, Goat farming, and inland fisheries are practiced by the farmers to enhance their existing income.

');
INSERT INTO "districts" VALUES ('DA','DAVANAGERE',5924.0,'BENGALURU DIV','650','RED AND BLACK','Major cereals
Paddy and Maize
Pulses
Red gram, Green gram and black gram
Oil seeds
Groundnut and Sunflower
Commercial crops
Sugar Cane and Cotton
Fruits
Mango, Sapota, Banana, Papaya, Pomegranate and Mozambique

Vegetables

Tomato, Onion, Brinjal, Gherkin, Drum sticks, Chilli, Ginger and Tamarind

Flowers

Jasmine, Chrysanthamum, Marigold and Crossandra');
INSERT INTO "districts" VALUES ('DH','DHARWAD',4260.0,'BELAGAVI DIV','786','BLACK AND SANDY LOAM','Major crops:
Jowar, Wheat, Bengal Gram and Tur,
Commercial crops:
Ground nut, Onions, Maize and Cotton and Sunflower
Horticultural crops:
Mango, Sapota, Banana, Guava, Coconut and Cashew and Chilli
Vegetables:
Potato, chilly and onion');
INSERT INTO "districts" VALUES ('GA','GADAG',4656.0,'BELAGAVI DIV','630','MEDIUM AND DEEP BLACK','Cereals:
Wheat, Jowar and Maize
Pulses:
Bengal Gram and Green Gram
Oil Seeds:
Groundnut and Sunflower
Commercial crops:
Sugarcane and Cotton
Fruits:
Mango, Sapota, Banana, Grapes and Pomegranate
Vegetables:
Tomato, Onion, Brinjal and Chilli');
INSERT INTO "districts" VALUES ('GU','KALABURAGI',10951.0,'KALABURAGI DIV','842','BLACK CLAYEY','Cereals:
Jowar,  Bajra and  Paddy
Pulses:
Red Gram and Tur
Oilseeds:
Sunflower
Vegetables:
Leafy Vegetables, Chilli, Tomato, Onion and  Brinjal
Flower:
Rose, Marigold, Jasmine and Aster');
INSERT INTO "districts" VALUES ('HS','HASSAN',6814.0,'MYSURU DIV','1031','RED','Cereals:
Ragi, Paddy, Maize, Jowar
Pulses:
Tur, Bengalgram, Greengram, Horsegram, Cowpea, Avare
Oilseeds:
Sunflower, Groundnut , Sesamum, Castor, Mustard, Soyabean
Commercial crops:
Cotton and Sugarcane, Tobacco');
INSERT INTO "districts" VALUES ('HV','HAVERI',4823.0,'BELAGAVI DIV','777','BLACK AND RED SANDY','Food crops:
Maize, Paddy, Jowar, Hybrid Cotton, Ground nut, Chilly, Ragi and Pulses');
INSERT INTO "districts" VALUES ('KD','KODAGU',4102.0,'MYSURU DIV','3562','BLACK','Cereals:
Paddy, Ragi, Maize
Vegetables and Oil seeds:
Sweet Potato, Potato, Radish, Tapioca, Knol-Knol, Ginger, Sunflower, Groundnut
Flower:
Anthuriums
Cash crops (Plantations):
Coffee, Tea, Rubber, Teak, Arecanut, Tapioca');
INSERT INTO "districts" VALUES ('KL','KOLAR',3969.0,'BENGALURU DIV','643','RED LOAMY AND SANDY','Food crops:
Maize, Ragi, Rice ,Tur, Horse gram, Green gram, Groundnut, and Mustard
Horticulture crops:
Potato, Tomato, Onion, Beans, Green chillies, Khol crops, Carrot, Radish, Beetroot, Mango, Banana, Guava, Sapota, Grapes, Marigold, Jasmine, Chrysanthamum and Rose
Cash crops:
Sugarcane and Cashew');
INSERT INTO "districts" VALUES ('KP','KOPPAL',7189.0,'KALABURAGI DIV','612','RED AND BLACK','Cereals:
Paddy, maize, jowar and bajra
Pulses:
Green gram, black gram and tur
Oil Seeds:
Sunflower and groundnut
Vegetables:
Brinjal, tomato, onion, green chili and ridge-gourd');
INSERT INTO "districts" VALUES ('MA','MANDYA',4961.0,'MYSURU DIV','699','RED','Cereals:
Ragi, Paddy, Maize and Jowar
Pulses:
Cowpea, Green gram, Red gram
Oilseeds:
Groundnut, Sesamum, Castor and Soybean
Commercial crops:
Sugarcane');
INSERT INTO "districts" VALUES ('MY','MYSURU',6854.0,'MYSURU DIV','782','RED SANDY LOAM','Cereals:
Ragi, Paddy, Maize, Jowar, Bajra and Wheat
Pulses:
Cowpea, Green gram,Horse gram, Black Gram, Bengal Gram and Tur
Oilseeds:
Sunflower, Groundnut, Sesamum and Castor  
Commercial crops:
Sugarcane, Cotton and Tobacco');
INSERT INTO "districts" VALUES ('RA','RAICHUR',6827.0,'KALABURAGI DIV','643','DEEP BLACK AND RED','Cereals:
Paddy, Bajra and Sorghum
Pulses:
Red Gram, Horse gram, Bengal Gram, Green Gram and Cowpea
Oil Seeds:
Sunflower, Groundnut, Castor and Sesame');
INSERT INTO "districts" VALUES ('RM','RAMANAGARA',3556.0,'BENGALURU DIV','823','RED','Fruits:
Mango, Banana, Sapota, Guava and Grapes
Vegetables:
Tomato, Potato, Beans, Chilies, Brinjal, Cabbage, Cauliflower and Gourds
Flower:
Rose, Jasmine, Marigold, Chrysanthemum and Crossandra');
INSERT INTO "districts" VALUES ('SH','SHIVAMOGGA',8477.0,'BENGALURU DIV','1812','LATERITE AND RED LOAMY','Cereals:
Paddy,  Maize, Ragi and Jowar
Pulses:
Redgram
Oilseeds:
Groundnut and Sunflower
Commercial crops:
Sugarcane and Cotton');
INSERT INTO "districts" VALUES ('TU','TUMAKURU',10597.0,'BENGALURU DIV','592','BLACK,RED','Food Crops:
Maize, Ragi, Groundnut
Fruits:
Mango, Banana, Pomegranate
Vegetables:
Tomato, Brinjal, Cucumber, Tamarind, Ginger');
INSERT INTO "districts" VALUES ('UD','UDUPI',3880.0,'MYSURU DIV','3728','COASTAL ALLUVIAL','Cereals:
Paddy
Pulses:
Black Gram, Horse Gram, Green Gram and Cowpea
Oil Seeds:
Groundnut , Sesame and Sugar Cane');
INSERT INTO "districts" VALUES ('UK','UTTARA KARNATAKA',10291.0,'BELAGAVI DIV','2830','RED,LATERITE','Cereals:
Paddy, Maize and Jowar
Pulses:
Bengal gram, Green gram and Cowpea
Oilseeds:
Groundnut and Soy bean
Commercial crops:
Sugar Cane');
INSERT INTO "districts" VALUES ('YG','YADAGIR',5273.0,'KALABURAGI DIV','1592','RED AND ALLUVIAL','Cereals:
Jowar and  Paddy
Pulses:
Red Gram
Oil Seeds:
Sunflower and Groundnut');
INSERT INTO "climate_crops" VALUES ('BK','BAGALKOT','Groundnut','Sorghum','Sugarcane','Cotton');
INSERT INTO "climate_crops" VALUES ('BU','BENGALURU URBAN','Ragi','Bengalgram','Paddy','Grapes');
INSERT INTO "climate_crops" VALUES ('BR','BENGALURU RURAL','Ragi','Bengalgram','Paddy','Rose');
INSERT INTO "climate_crops" VALUES ('BG','BELAGAVI','Groundnut','Maize','Sugarcane','Oilseeds');
INSERT INTO "climate_crops" VALUES ('BA','BALLARI','Paddy','Sunflower','Paddy','Sunflower');
INSERT INTO "climate_crops" VALUES ('BD','BIDAR','Mango','Bengalgram','Redgram','Cashew');
INSERT INTO "climate_crops" VALUES ('BJ','BIJAPUR','Sunflower','Sorghum','Pigeonpea','Sugarcane');
INSERT INTO "climate_crops" VALUES ('CJ','CHAMARAJANAGAR','Paddy','Pulses','Jowar','Cotton');
INSERT INTO "climate_crops" VALUES ('CK','CHIKKAMAGALURU','Paddy','Horsegram','Ragi','Coffee');
INSERT INTO "climate_crops" VALUES ('CT','CHITRADURGA','Groundnut','Jowar','Groundnut','Tobacco');
INSERT INTO "climate_crops" VALUES ('DK','DAKSHINA KANNADA','Blackgram','Paddy','Paddy','Sugarcane');
INSERT INTO "climate_crops" VALUES ('DA','DAVANAGERE','Jowar','Jowar','Maize','Cotton');
INSERT INTO "climate_crops" VALUES ('DH','DHARWAD','Wheat','Cotton','Chilli','Onions');
INSERT INTO "climate_crops" VALUES ('GA','GADAG','Groundnut','Chickpea','Greengram','Cotton');
INSERT INTO "climate_crops" VALUES ('HS','HASSAN','Paddy','Horsegram','Paddy','Tobacco');
INSERT INTO "climate_crops" VALUES ('HV','HAVERI','Oilseeds','Sorghum','Maize','Cotton');
INSERT INTO "climate_crops" VALUES ('KD','KODAGU','Coffee','Pepper','Banana','Tea');
INSERT INTO "climate_crops" VALUES ('KL','KOLAR','Mango','Mango','Ragi','Cashew');
INSERT INTO "climate_crops" VALUES ('KP','KOPPAL','Paddy','Jowar','Paddy','Sugarcane');
INSERT INTO "climate_crops" VALUES ('MA','MANDYA','Paddy','Ragi','Sugarcane','Arecanut');
INSERT INTO "climate_crops" VALUES ('MY','MYSURU','Ragi','Finger millet','Pulses','Tobacco');
INSERT INTO "climate_crops" VALUES ('RA','RAICHUR','Wheat','Chickpea','Citrus','Cucumber');
INSERT INTO "climate_crops" VALUES ('RM','RAMANAGARA','Field Bean','Mango','Ragi','Rose');
INSERT INTO "climate_crops" VALUES ('SH','SHIVAMOGGA','Maize','Finger millet','Paddy','Coconut');
INSERT INTO "climate_crops" VALUES ('UD','UDUPI','pearl millet','Blackgram','Paddy','Cashew');
INSERT INTO "climate_crops" VALUES ('UK','UTTARA KARNATAKA','Arecanut','Coconut','Cashew','Sugarcane');
INSERT INTO "climate_crops" VALUES ('YG','YADAGIR','Mustard','Groundnut','Soyabean','Cotton');
INSERT INTO "climate_crops" VALUES ('CH','CHIKBALLAPUR','pearl millet','Pulses','Ragi','Cashew');
INSERT INTO "climate_crops" VALUES ('TU','TUMAKURU','Paddy','Horsegram','Ragi','Tamarind');
INSERT INTO "climate_crops" VALUES ('GU','KALABURAGI','Sunflower','Sorghum','Redgram','Tamarind');
INSERT INTO "zone" VALUES (1,'BELAGAVI DIV',7);
INSERT INTO "zone" VALUES (2,'BENGALURU DIV',9);
INSERT INTO "zone" VALUES (3,'KALABURAGI DIV',6);
INSERT INTO "zone" VALUES (4,'MYSURU DIV',8);
INSERT INTO "reviews" VALUES (1,'Akhilesh','2019-11-04 12:41:24.392363','This is my experience of using agriculture management system.
');
INSERT INTO "price" VALUES (1,'Groundnut',4890.0);
INSERT INTO "price" VALUES (2,'Mustard',4200.0);
INSERT INTO "price" VALUES (3,'Ragi',2897.0);
INSERT INTO "price" VALUES (4,'Paddy',1770.0);
INSERT INTO "price" VALUES (5,'Mango',2500.0);
INSERT INTO "price" VALUES (6,'Sunflower',5338.0);
INSERT INTO "price" VALUES (7,'Sugarcane',275.0);
INSERT INTO "price" VALUES (8,'Blackgram',4190.0);
INSERT INTO "price" VALUES (9,'Jowar',2450.0);
INSERT INTO "price" VALUES (10,'Wheat',1840.0);
INSERT INTO "price" VALUES (11,'Oilseeds',4200.0);
INSERT INTO "price" VALUES (12,'Coffee',3500.0);
INSERT INTO "price" VALUES (13,'Field Bean',6249.0);
INSERT INTO "price" VALUES (14,'Maize',1700.0);
INSERT INTO "price" VALUES (15,'Arecanut',4190.0);
INSERT INTO "price" VALUES (16,'Sorghum',4959.0);
INSERT INTO "price" VALUES (17,'Bengalgram',4875.0);
INSERT INTO "price" VALUES (18,'Pulses',4800.0);
INSERT INTO "price" VALUES (19,'Horsegram',4875.0);
INSERT INTO "price" VALUES (20,'Cotton',5225.0);
INSERT INTO "price" VALUES (21,'Chickpea',5800.0);
INSERT INTO "price" VALUES (22,'Pepper',2000.0);
INSERT INTO "price" VALUES (23,'Coconut',2030.0);
INSERT INTO "price" VALUES (24,'Redgram',4800.0);
INSERT INTO "price" VALUES (25,'Pigeonpea',3952.0);
INSERT INTO "price" VALUES (26,'Chilli',5700.0);
INSERT INTO "price" VALUES (27,'Greengram',4500.0);
INSERT INTO "price" VALUES (28,'Banana',3120.0);
INSERT INTO "price" VALUES (29,'Citrus',1525.0);
INSERT INTO "price" VALUES (30,'Cashew',5980.0);
INSERT INTO "price" VALUES (31,'Soyabean',3710.0);
INSERT INTO "price" VALUES (32,'Grapes',3560.0);
INSERT INTO "price" VALUES (33,'Rose',4000.0);
INSERT INTO "price" VALUES (34,'Tobacco',150.0);
INSERT INTO "price" VALUES (35,'Onions',500.0);
INSERT INTO "price" VALUES (36,'Tea',3000.0);
INSERT INTO "price" VALUES (37,'Cucumber',1573.0);
INSERT INTO "price" VALUES (38,'pearl millet',5000.0);
INSERT INTO "price" VALUES (39,'Finger millet',2600.0);
INSERT INTO "price" VALUES (40,'Tamarind',3100.0);
INSERT INTO "farmer" VALUES (1,'Akhilesh','akhiyellow99@gmail.com','pbkdf2:sha256:150000$gMC8SIga$24e5a79b177ab1897934ff5725c63c071e627d4062a963df0a54326fbc400880',NULL);
INSERT INTO "farmer" VALUES (2,'Akhi','akhileshudayashankar@gmail.com','pbkdf2:sha256:150000$Oev8LWTk$dd35429eadb1a763e07ff7dccfa819605dad48d8d1b647f7fc61e19788ad4b5f',NULL);
INSERT INTO "farmer" VALUES (3,'Akhil_uday','akhileshu.cs17@rvce.edu.in','pbkdf2:sha256:150000$BjLALugg$90c598e32d57e2a9e37c9b7de4378f04cc2b81b91ecfd6c26b917dfe06dcef6f',NULL);
INSERT INTO "farmer" VALUES (4,'subhash_the_farmer','subhashthefarmer@gmail.com','pbkdf2:sha256:150000$D8y2NPKw$500353f1d1b48c38fd2f6b1b8f3fc6876c16b2691a0ab8df999d2bbbf6a8ec6d',NULL);
INSERT INTO "farmer" VALUES (NULL,'Akhilesh12','akhithe@gmail.com','pbkdf2:sha256:150000$7x8F5xjJ$e49e33e71c77c9c8f39c59ef772953f500829e97ed228027be8a928628168109',NULL);
INSERT INTO "farmer" VALUES (NULL,'Akhilesh1212','akhileshudayashankar@gmaasasil.com','pbkdf2:sha256:150000$9KFBQZeQ$8f3fc9b355c4cbce06c1cf54ca3e9844f943cdf72d739361a700a1d19f037ae7',NULL);
INSERT INTO "crops_input" VALUES (1,'Akhilesh Uday','BAGALKOT','Groundnut',NULL,500000,400000);
INSERT INTO "crops_input" VALUES (2,'Akhilesh Uday','BAGALKOT','Groundnut',NULL,60000,40000);
INSERT INTO "crops_input" VALUES (3,'Akhilesh Uday','BAGALKOT','Groundnut',NULL,200000,50000);
INSERT INTO "crops_input" VALUES (4,'','BAGALKOT','Groundnut',NULL,500000,30000);
INSERT INTO "crops_input" VALUES (5,'','BAGALKOT','Groundnut',NULL,500000,30000);
INSERT INTO "crops_input" VALUES (6,'Akhilesh Uday','BAGALKOT','Groundnut',NULL,500000,100000);
INSERT INTO "crops_input" VALUES (7,'Akhilesh Uday','BENGALURU URBAN','Ragi',NULL,300000,100000);
INSERT INTO "crops_input" VALUES (8,'Akhilesh Uday','BENGALURU URBAN','Ragi',NULL,500000,200000);
INSERT INTO "crops_input" VALUES (9,'','BAGALKOT','Ragi',NULL,500000,250000);
INSERT INTO "crops_input" VALUES (10,'','BAGALKOT','Ragi',NULL,400000,250000);
INSERT INTO "crops_input" VALUES (11,'Akhilesh Uday','BAGALKOT','Ragi',NULL,300000,100000);
INSERT INTO "crops_input" VALUES (12,'Akhilesh Uday','BAGALKOT','Ragi',NULL,300000,100000);
INSERT INTO "crops_input" VALUES (13,'Akhilesh Uday','BENGALURU RURAL','Mustard',NULL,500000,300000);
INSERT INTO "crops_input" VALUES (14,'Akhilesh Uday','BENGALURU RURAL','Mustard',NULL,600000,150000);
INSERT INTO "crops_input" VALUES (15,'Akhilesh Uday','BENGALURU RURAL','Mustard',NULL,50000,10000);
INSERT INTO "crops_input" VALUES (16,'Akhilesh Uday','BENGALURU RURAL','Mustard',NULL,50000,10000);
INSERT INTO "crops_input" VALUES (17,'Akhilesh Uday','BENGALURU RURAL','Mustard',NULL,50000,10000);
INSERT INTO "crops_input" VALUES (18,'Akhilesh Uday','BENGALURU RURAL','Mustard',NULL,100000,10000);
INSERT INTO "crops_input" VALUES (19,'Akhilesh Uday','BELAGAVI','Paddy',NULL,200000,10000);
INSERT INTO "crops_input" VALUES (20,'Akhilesh Uday','BELAGAVI','Paddy',NULL,300000,100000);
INSERT INTO "crops_input" VALUES (21,'Akhilesh Uday','BELAGAVI','Paddy',NULL,300000,100000);
INSERT INTO "crops_input" VALUES (22,'Akhilesh Uday','BELAGAVI','Paddy',NULL,400000,40000);
INSERT INTO "crops_input" VALUES (23,'Akhilesh Uday','BELAGAVI','Paddy',NULL,300000,100000);
INSERT INTO "crops_input" VALUES (24,'','BELAGAVI','Paddy',NULL,300000,20000);
INSERT INTO "crops_input" VALUES (25,'','BAGALKOT','Groundnut',NULL,300000,20000);
INSERT INTO "crops_input" VALUES (26,'Akhi_uday','BELAGAVI','Ragi',NULL,400000,30000);
INSERT INTO "crops_input" VALUES (27,'Akhi_uday','BELAGAVI','Ragi',NULL,500000,20000);
INSERT INTO "crops_input" VALUES (28,'Akhi_uday','BELAGAVI','Ragi',NULL,300000,70000);
INSERT INTO "crops_input" VALUES (29,'Akhi_uday','BELAGAVI','Ragi',NULL,300000,70000);
INSERT INTO "crops_input" VALUES (30,'Akhilesh Uday','BELAGAVI','Paddy',NULL,300000,80000);
INSERT INTO "crops_input" VALUES (31,'Akhilesh Uday','BELAGAVI','Paddy',NULL,100000,150000);
INSERT INTO "crops_input" VALUES (32,'Akhilesh Uday','BELAGAVI','Paddy',NULL,200000,150000);
INSERT INTO "crops_input" VALUES (33,'Akhilesh Uday','BELAGAVI','Paddy',NULL,300000,350000);
INSERT INTO "crops_input" VALUES (34,'Akhilesh Uday','BENGALURU URBAN','Mustard',NULL,300000,350000);
INSERT INTO "crops_input" VALUES (35,'Akhilesh Uday','BENGALURU URBAN','Mustard',NULL,300000,200000);
INSERT INTO "crops_input" VALUES (36,'Akhilesh Uday','BENGALURU URBAN','Mustard',NULL,300000,250000);
INSERT INTO "crops_input" VALUES (37,'Akhilesh Uday','BENGALURU URBAN','Mustard',NULL,200000,250000);
INSERT INTO "crops_input" VALUES (38,'Akhilesh Uday','BAGALKOT','Groundnut',NULL,200000,250000);
INSERT INTO "crops_input" VALUES (39,'Akhilesh Uday','BELAGAVI','Mustard',NULL,100000,250000);
INSERT INTO "crops_input" VALUES (40,'Akhilesh Uday','BELAGAVI','Mustard',NULL,200000,250000);
INSERT INTO "crops_input" VALUES (41,'Akhilesh Uday','BELAGAVI','Paddy',NULL,500000,100000);
INSERT INTO "crops_input" VALUES (42,'Akhilesh Uday','BELAGAVI','Paddy',NULL,100000,50000);
INSERT INTO "crops_input" VALUES (43,'Akhilesh Uday','BELAGAVI','Paddy',NULL,500000,600000);
INSERT INTO "crops_input" VALUES (44,'subhash_the_farmer','BENGALURU URBAN','Coffee',NULL,5000000,10000000);
INSERT INTO "crops_input" VALUES (45,'subhash_the_farmer','BELAGAVI','Paddy',NULL,500000,1000000);
INSERT INTO "crops_input" VALUES (46,'Akhilesh','CHIKKAMAGALURU','Groundnut',NULL,50000,100000);
INSERT INTO "crops_input" VALUES (47,'Akhilesh Uday','BENGALURU URBAN','Mustard',NULL,500000,750000);
INSERT INTO "crops_input" VALUES (48,'Akhi_uday','BENGALURU RURAL','Ragi',NULL,300000,450000);
INSERT INTO "crops_input" VALUES (49,'Akhi_uday','BENGALURU RURAL','Ragi',NULL,300000,450000);
INSERT INTO "crops_input" VALUES (50,'Akhi_uday','BENGALURU RURAL','Ragi',NULL,300000,450000);
INSERT INTO "crops_input" VALUES (51,'Akhi_uday','BELAGAVI','Paddy',NULL,300000,450000);
INSERT INTO "crops_input" VALUES (52,'Akhi_uday','BELAGAVI','Paddy',NULL,300000,450000);
INSERT INTO "crops_input" VALUES (53,'Akhi_uday','BELAGAVI','Paddy',NULL,300000,450000);
INSERT INTO "crops_input" VALUES (54,'Akhilesh Uday','BENGALURU URBAN','Mustard',NULL,500000,750000);
INSERT INTO "crops_input" VALUES (55,'Akhilesh Uday','BAGALKOT','Groundnut',NULL,300000,400000);
INSERT INTO "crops_input" VALUES (56,'Akhilesh Uday','BAGALKOT','Groundnut',NULL,600000,750000);
INSERT INTO "crops_input" VALUES (57,'Akhilesh Uday','BENGALURU URBAN','Mustard',NULL,500000,600000);
INSERT INTO "crops" VALUES (1,'Groundnut',30.0,'600-1500','RED,LOAMY');
INSERT INTO "crops" VALUES (2,'Mustard',25.0,625.0,'LOAMY');
INSERT INTO "crops" VALUES (3,'Ragi',28.0,750.0,'BLACK,RED');
INSERT INTO "crops" VALUES (4,'Paddy',25.0,500.0,'ALLUVIAL');
INSERT INTO "crops" VALUES (5,'Mango','>30',300.0,'RED');
INSERT INTO "crops" VALUES (6,'Sunflower',25.0,600.0,'SANDY,LOAM');
INSERT INTO "crops" VALUES (7,'Sugarcane',27.0,200.0,'RED');
INSERT INTO "crops" VALUES (8,'Blackgram',35.0,250.0,'BLACK,SANDY LOAM');
INSERT INTO "crops" VALUES (9,'Jowar',32.0,40.0,'SANDY LOAM');
INSERT INTO "crops" VALUES (10,'Wheat',24.0,400.0,'BLACK,SANDY LOAM');
INSERT INTO "crops" VALUES (11,'Oilseeds','20-30','50-75','BLACK,RED');
INSERT INTO "crops" VALUES (12,'Coffee','16-24','100-200','RED,LATERITE');
INSERT INTO "crops" VALUES (13,'Field Bean','10-27',350.0,'RED');
INSERT INTO "crops" VALUES (14,'Maize','18-27','60-110','RED,LATERITE');
INSERT INTO "crops" VALUES (15,'Arecanut','14-36',750.0,'LOAMY, CLAYEY');
INSERT INTO "crops" VALUES (16,'Sorghum',32.0,40.0,'SANDY,LOAM');
INSERT INTO "crops" VALUES (17,'Bengalgram',24.0,'60-90','RED,LATERITE');
INSERT INTO "crops" VALUES (18,'Pulses','15-25','100-200','BLACK,ALLUVIAL');
INSERT INTO "crops" VALUES (19,'Horsegram','25-30',800.0,'RED');
INSERT INTO "crops" VALUES (20,'Cotton',24.0,'60-110','BLACK LOAMY');
INSERT INTO "crops" VALUES (21,'Chickpea','24-30','65-95','DEEP BLACK');
INSERT INTO "crops" VALUES (22,'Pepper',25.0,500.0,'BLACK');
INSERT INTO "crops" VALUES (23,'Coconut','25-30',400.0,'RED,LATERITE');
INSERT INTO "crops" VALUES (24,'Redgram','35-40',150.0,'RED,CLAYEY');
INSERT INTO "crops" VALUES (25,'Pigeonpea',35.0,200.0,'RED,CLAYEY');
INSERT INTO "crops" VALUES (26,'Chilli','20-25',150.0,'BLACK');
INSERT INTO "crops" VALUES (27,'Greengram','25-35','85-100','DEEP BLACK');
INSERT INTO "crops" VALUES (28,'Banana',23.0,320.0,'SANDY,LOAM');
INSERT INTO "crops" VALUES (29,'Citrus',25.0,300.0,'BLACK,LATERITE');
INSERT INTO "crops" VALUES (30,'Cashew','24-28','650-800','RED,SANDY');
INSERT INTO "crops" VALUES (31,'Soyabean','15-32','600-650','RED ND ALLUVIAL');
INSERT INTO "crops" VALUES (32,'Grapes','12-40','200-900','RED AND LATERITE');
INSERT INTO "crops" VALUES (33,'Rose','25-30','450-600','LOAMY');
INSERT INTO "crops" VALUES (34,'Tobacco','15-20','<100','LOAMY AND SANDY');
INSERT INTO "crops" VALUES (35,'Onions','15-30','<100','LOAMY AND ALLUVIAL');
INSERT INTO "crops" VALUES (36,'Tea','16-32','250-900','BLACK');
INSERT INTO "crops" VALUES (37,'Cucumber','18-24',500.0,'DEEP BLACK');
INSERT INTO "crops" VALUES (38,'pearl millet','28-30','350-500','CLAYEY LOAM');
INSERT INTO "crops" VALUES (39,'Finger millet','11-27','350-500','SANDY,LOAM');
INSERT INTO "crops" VALUES (40,'Tamarind',NULL,'500-750','ALLUVIAL');
INSERT INTO "alembic_version" VALUES ('f96912c52147');
COMMIT;
