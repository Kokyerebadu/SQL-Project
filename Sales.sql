/*This is an exploratory Data Analysis of Sales by a company.
In this analysis, we consider the products, sales made and customers that we may have*/

#Let us try to find who our customers (retailers) are
SELECT * FROM sales.customers;

#How many customers does we have on board?
select count(*) as Number_of_Customers from sales.customers;

#Check the transactions of the Chennai Market
select * from transactions
where market_code = 'Mark001';

#find out the unique products sold at the Chennai Market, market by some Labels
select distinct product_code from transactions
where market_code = 'Mark001';

#Reviewing transactions that were done in the United States Dollars
select * from transactions
where currency = 'USD';

#Check the transactions that were made in the year 2020, by joining the transactions and date table
Select transactions.*, date.*
from transactions
join date on transactions.order_date = date.date
where date.year =2020;

#Sales/ Revenue Generated in 2020
select sum(transactions.sales_amount) as Revenue
from transactions
join date on transactions.order_date = date.date
where date.year=2020
and transactions.currency="INR" or transactions.currency="USD\r";

#Revenue Generated in January 2020
select sum(transactions.sales_amount) as Revenue_In_January_2020
from transactions
join date on transactions.order_date = date.date
where date.year =2020 and date.month_name='January';

#Revenue generated in 2020 from the Chennai market
SELECT SUM(transactions.sales_amount) 
FROM transactions 
INNER JOIN date ON transactions.order_date=date.date 
where date.year=2020 and transactions.market_code="Mark001";