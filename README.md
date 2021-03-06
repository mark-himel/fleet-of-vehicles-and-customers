# README

1. Upload a CSV files that includes vehicles and customers.
2. Display a table to present the data that we just uploaded.
3. Search by user name or vehicle model
4. CSV report for number of customers by nationality
5. CSV report for average odometer reading by nationality


```
Sample File Format:

Name,Nationality,Email,Model,Year,ChassisNumber,Color,RegistrationDate,OdometerReading
Gemma,Kirke,gemma@kirke.me,Ford Focus,2018,123456789,Black,02/02/2018,30000
Jane Thomas,Australia,jane@thomas.me,Audi A4,2020,999999999,Green,02/01/2019,25000
Sam Johns,Belgium,sam@johns.me,BMW 4 Series,2017,111111111,White,05/01/2020,34000
Mehdi ,Elabd,mehdi@elabd.me,LEXUS IS 3000,2011,222222222,Black,02/01/2019,12300
Gemma,Kirke,gemma@kirke.me,INFINITI JX35,2011,444444444,Black,02/01/2019,12000
Jeni,Mohan,jeni@mohan.me,Audi A4,2018,555555555,White,05/04/2020,123000
Joseph,Sasank,joseph@sasank.me,Ford Focus,2020,888888888,Black,02/11/2019,34000
```

## Installation

* Install the dependencies with `bundle install`
* Create the database with `rake db:create`
* Initialize the database `rake db:schema:load`
* Simply start the server `rails s -p 3000` and start to play around

## RSpec testing

* Run `rspec` in the terminal to run all spec files
* All spec files are located in the `/spec` directory
