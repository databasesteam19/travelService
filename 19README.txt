{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red163\green21\blue21;}
{\*\expandedcolortbl;;\csgenericrgb\c63922\c8235\c8235;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 README for Team 19 AirportServerV\
\
EC2 Login Page URL: http://ec2-18-206-227-255.compute-1.amazonaws.com:8080/AirportServerV/login.html\
\
Equal contribution\
\
Database Credentials\
\pard\pardeftab720\partightenfactor0

\f1 \cf2 jdbc:mysql://npd-sql.cd761n4w5ihc.us-east-1.rds.amazonaws.com:3306/airport
\f0 \cf0 \
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf0 Username: darthneel\
Password: 112797NPD\
\
Website Credentials\
Customer\
Username: azzy\
Password 13579\
\
Customer Rep.\
Username: bob\
Password:2468\
\
Admin\
Username: admin\
Password: admin}


Our program have three type of users: an Admin, a customer representative and a customer. 

customers 
They can make reservation for flights. However, if a the number of tickets bought for a particular flight is greater than the 
capacity of the aircraft used for that particular flight, it will ask the user wether they want to go to waiting list. If choose to 
go to the waiting list, they get added to the waiting list of that flight otherwise, they have to go back and look for other flight. They can look for flight wether it is a one-way, a round-trip flight and filter by take-off time, landing-time, price,and airline. They can also view both past reservation and upcoming reservations.

Customer representatives
Besides having all of the functionality of the customer type, they can  make reservation for a given customer. They can also add, edit, delete information for aircrafts, airports and flights and retrieve waiting list of a particular flight.
Admin
The admin has more control over the other users since they can change data about the other users. 


