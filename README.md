**README: Walmart Sales Analysis**

Overview

This project analyzes sales data from the walmart table within the walmart_db database. The analysis covers various business insights such as payment methods, busiest days, revenue trends, and profit calculations.

Dataset Description

The walmart table contains sales transaction data with the following key columns:

date - Transaction date (Format: DD/MM/YYYY or DD-MM-YYYY)

branch - Branch identifier

category - Product category

quantity - Number of units sold

payment_method - Type of payment used (Cash, Credit Card, etc.)

rating - Customer rating for the transaction

unit_price - Price per unit of product

profit_margin - Profit percentage for the product

total - Total sales amount

time - Transaction time

Data Cleaning & Preprocessing

Importing Dependencies

Data cleaning is performed using Python in VS Code with the following libraries:
#importing dependencies
import pandas as pd
import pymysql
from sqlalchemy import create_engine

Data Cleaning Steps

Load Data from MySQL Database
Handle Missing Values
Remove Duplicates

Queries and Business Insights

Q1: Payment Method Analysis
Find different payment methods, number of transactions, and quantity sold:
Q2: Highest Rated Category per Branch
Q3: Busiest Day for Each Branch

Determine which day of the week has the highest number of transactions for each branch:

Q4: Total Quantity Sold per Payment Method

Q5: Category Rating Analysis per City

Compute the average, minimum, and maximum ratings of categories for each city:

Q6: Total Profit per Category

Determine the total profit generated for each category:


Q7: Most Common Payment Method per Branch

Find the most frequently used payment method at each branch:

Q8: Categorizing Sales by Shift

Categorize sales transactions into morning, afternoon, and evening shifts:


Q9: Branches with the Highest Revenue Decrease


Assumptions & Considerations

The date column is stored in DD/MM/YYYY or DD-MM-YYYY format and is converted using STR_TO_DATE().

The time column is assumed to be in a valid TIME format.

The profit_margin is a decimal representing the percentage profit per unit price.

Transactions where a branch has revenue in one year but not the other are handled using COALESCE().

Revenue decrease calculations consider only branches where revenue has declined.

Conclusion

This analysis provides valuable insights into transaction trends, customer preferences, peak business hours, and revenue performance. The results can help Walmart optimize operations, improve customer experience, and enhance profitability.

