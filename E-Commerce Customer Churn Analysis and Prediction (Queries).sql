# DATA DEFINITION LANGUAGE (DDL) QUERIES

SHOW DATABASES

CREATE DATABASE capstone_project_1

USE capstone_project_1

SHOW TABLES

CREATE TABLE ecom_churn(
CustomerID INT,  
Churn INT,
Tenure FLOAT,
PreferredLoginDevice VARCHAR(256), 
CityTier INT,
WarehouseToHome FLOAT,
PreferredPaymentMode VARCHAR(256), 
Gender VARCHAR(256),
HourSpendOnApp FLOAT,
NumberOfDeviceRegistered INT, 
PreferredOrderCategory VARCHAR(256), 
SatisfactionScore INT,
MaritalStatus VARCHAR(256), 
NumberOfAddress INT,
Complain INT,  
OrderCountHikeFromLastYear FLOAT,
CouponUsed FLOAT,
OrderCount FLOAT,
DaySinceLastOrder FLOAT,
CashbackAmount FLOAT
)

SELECT * FROM ecom_churn # after importing csv file

ALTER TABLE ecom_churn
ADD PRIMARY KEY (customerid)

DESCRIBE ecom_churn

CREATE VIEW past_customers AS SELECT * FROM ecom_churn
WHERE churn=1
ORDER BY customerid

SELECT * FROM past_customers

# DATA QUERY LANGUAGE (DQL) QUERIES

SELECT customerid,CASE
WHEN churn=0 THEN 'Existing Customer'
WHEN churn=1 THEN 'Past Customer'
END AS customertype
FROM ecom_churn

SELECT preferredpaymentmode,ROUND(AVG(cashbackamount),2) AS avgcashback FROM ecom_churn
GROUP BY preferredpaymentmode
ORDER BY avgcashback

SELECT customerid FROM ecom_churn
WHERE preferredordercategory='Laptop & Accessory'

SELECT customerid,ordercount FROM ecom_churn
ORDER BY ordercount DESC LIMIT 5

SELECT customerid,preferredpaymentmode FROM ecom_churn
WHERE preferredpaymentmode NOT LIKE '% Card'

SELECT gender,ROUND(AVG(ordercounthikefromlastyear),2) AS avgorderhike FROM ecom_churn
GROUP BY gender

SELECT customerid,preferredpaymentmode,cashbackamount FROM ecom_churn
ORDER BY cashbackamount

SELECT customerid,hourspendonapp FROM ecom_churn
WHERE hourspendonapp<=2
ORDER BY hourspendonapp

SELECT customerid,satisfactionscore FROM ecom_churn
WHERE satisfactionscore<=3
ORDER BY satisfactionscore

SELECT customerid FROM ecom_churn
WHERE complain=1

SELECT customerid,tenure FROM ecom_churn
WHERE churn=1
ORDER BY tenure

SELECT customerid,daysincelastorder FROM ecom_churn
ORDER BY daysincelastorder DESC