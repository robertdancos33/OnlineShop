use mysql;
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';
GRANT ALL ON *.* TO 'admin'@'%';

CREATE DATABASE
IF NOT EXISTS fitnessshopdb;
USE fitnessshopdb;

CREATE TABLE products
(

    productID INT
    AUTO_INCREMENT,
    productName VARCHAR
    (30),
    productPrice DECIMAL
    (4,2),
	productDescription VARCHAR
    (1000),
    productImgPath VARCHAR
    (100),
	
    CONSTRAINT Product_PK PRIMARY KEY
    (productID)
    
);

    CREATE TABLE users
    (
        userID INT
        AUTO_INCREMENT,
	username VARCHAR
        (10) UNIQUE NOT NULL ,
    password VARCHAR
        (10) NOT NULL,
    
    CONSTRAINT users_PK PRIMARY KEY
        (userID)
);

        CREATE TABLE customers
        (
            customerID INT
            AUTO_INCREMENT,
    customerFirstName VARCHAR
            (30) NOT NULL,
    customerLastName VARCHAR
            (30) NOT NULL,
	customerEmail VARCHAR
            (30) NOT NULL,
    customerPhone VARCHAR
            (10) NOT NULL,
    customerBirthdate DATE NOT NULL,
    userID INT,
    
    CONSTRAINT Customer_PK PRIMARY KEY
            (customerID),
    CONSTRAINT Customer_User_FK FOREIGN KEY
            (userID) REFERENCES users
            (userID)
    
);



            CREATE TABLE address
            (

                addressID INT
                AUTO_INCREMENT,
    addressStreet VARCHAR
                (30),
    addressZipCode VARCHAR
                (10),
    addressCity VARCHAR
                (30),
    addressCountry VARCHAR
                (50),
    customerID INT,
    addressStatus VARCHAR
                (10),
    
    CONSTRAINT Address_PK PRIMARY KEY
                (addressID),
    CONSTRAINT Address_Customer_FK FOREIGN KEY
                (customerID) REFERENCES customers
                (customerID)
);

                CREATE TABLE payments
                (
                    paymentID INT
                    AUTO_INCREMENT,
    paymentCardNumber VARCHAR
                    (50),
    paymentCardCV VARCHAR
                    (5),
    paymentCardExpired VARCHAR
                    (10),
    
    CONSTRAINT Payment_PK PRIMARY KEY
                    (paymentID)
    
);

                    CREATE TABLE orders
                    (
                        orderID INT
                        AUTO_INCREMENT,
    addressID INT,
    paymentID INT,
    orderDate DATE NOT NULL,
    
    CONSTRAINT Order_PK PRIMARY KEY
                        (orderID),
    CONSTRAINT Order_Address_FK FOREIGN KEY
                        (addressID) REFERENCES address
                        (addressID),
    CONSTRAINT Order_Payment_FK FOREIGN KEY
                        (paymentID) REFERENCES payments
                        (paymentID)
);

                        CREATE TABLE orderItems
                        (
                            orderItemID INT
                            AUTO_INCREMENT,
    orderID INT,
    productID INT,
    orderItemQuantity INT NOT NULL,
    
    CONSTRAINT OrderItem_PK PRIMARY KEY
                            (orderItemID),
    CONSTRAINT OrderItem_Order_FK FOREIGN KEY
                            (orderID) REFERENCES orders
                            (orderID),
	CONSTRAINT OrderItem_Product_FK FOREIGN KEY
                            (productID) REFERENCES products
                            (productID)
    
);

                            INSERT INTO products
                                (productName, productPrice, productDescription, productImgPath)
                            VALUES('BioHack:Serum Code:PR3', 49.99, 'Our flagship Stimulant pre workout, that will take you to your goals and beyond Formulated with the intricacy of Biohacking in every way. so we will see a greatly increased level of choline in our body and brain',
                                    'biohack-serum-code-pr3.png');

                            INSERT INTO products
                                (productName, productPrice, productDescription, productImgPath)
                            VALUES('BioHack:Serum Code:Pump', 39.99, 'What is Biohack Pharmaceuticals Serum Code Pump?
    Serum Code Pump is a stimulant-free, pump pre-workout just as highly dosed as Biohack’s stimulant pre-workout PR3. The supplement’s primary focus is to enhance muscle pumps while you workout and to help nutrient delivery to your muscles to give you that extra push you really need.',
                                    'biohack-serum-code-pumk.png');

                            INSERT INTO products
                                (productName, productPrice, productDescription, productImgPath)
                            VALUES('Premium Raws: Tudca', 34.99, 'WHAT IS TUDCA?
Tauroursodeoxycholic acid, more commonly referred to as TUDCA, is a bile salt that is found natrually occurring in the body. When regular bile salts reach the intestines, they can be metabolized by bacteria into UDCA and then later bound to a taurine molecule to become TUDCA.',
                                    'premium-raws.jpg');

                            INSERT INTO products
                                (productName, productPrice, productDescription, productImgPath)
                            VALUES('TWP: Salvage', 44.99, 'SALVAGE is the first protein in the UK to completely disclose the entire breakdown of protein content, offering complete transparency and confidence to you our kick ass customers.',
                                    'twp-salvage.jpg');

                            INSERT INTO products
                                (productName, productPrice, productDescription, productImgPath)
                            VALUES('TWP: Ashwagandha', 15.99, 'TWP Ashwagandha includes Bioperine to increase bioavailability.  Also includes AstraGin; The Absorption King!',
                                    'twp-ashwagandha.jpg');

                            INSERT INTO products
                                (productName, productPrice, productDescription, productImgPath)
                            VALUES('TWP: Ashwagandha', 18.99, 'TWP Ashwagandha includes Bioperine to increase bioavailability.  Also includes AstraGin; The Absorption King!',
                                    'twp-ashwagandha.jpg');

                            INSERT INTO products
                                (productName, productPrice, productDescription, productImgPath)
                            VALUES('TWP: Greed', 15.99, 'GREED is the most inclusive and up to date Digestive aid and appetite enhancer on the market.  Whether you’re on “off season” looking to put those influx of calories to good use, or an every day individual that suffers with digestive issues.',
                                    'twp-greed.jpg');

                            INSERT INTO products
                                (productName, productPrice, productDescription, productImgPath)
                            VALUES('MaxxMuscle: Atomic Bomb', 49.99, 'Atomic Bomb delivers the explosive ingredients necessary for combat in the weight room directly to your body. A ferocious blend of performance-enhancing ingredients ensure you buffer lactic acid build-up, sustain endurance, and crush PR’s as you approach your workouts with maximum intensity.',
                                    'maxxmuscle-atomic-bomb.png');

                            INSERT INTO products
                                (productName, productPrice, productDescription, productImgPath)
                            VALUES('MaxxMuscle: EAAmmo', 39.99, 'A powerful combination of Essential Amino Acids & BCAAs designed to amplify training efforts and sustain workout intensity. Further fortified with the powerful Adaptogen Ashwagandah, to help fight off Cortisol and reduce inflammation.',
                                    'maxxmuscle-eaammo.png');

                            INSERT INTO products
                                (productName, productPrice, productDescription, productImgPath)
                            VALUES('OHS: Unleash Hell', 29.99, 'Our pre workout formulation truly is at the very top of the game, no BS.  We have chosen the best ingredients at clinical doses.  Time to get your game face on and UNLEASH HELL!!',
                                    'ohs-unleash-hell.png');