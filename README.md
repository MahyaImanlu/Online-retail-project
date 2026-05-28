# 📊 Online-retail-project
This project analyses online retail dataset using python, sql and powerbi.

## Dataset
Download online_retail.csv from kaggle then place it in the python folder: 
https://www.kaggle.com/datasets/ulrikthygepedersen/online-retail-dataset/data?select=online_retail.csv

## 🚀 Tools Used 
- Python
- SQL
- PowerBI

## 📂 Project Structure
- Python : main analyses file
- SQL : sql queries
- Power BI : visualizations
- Screenshots: screenshots of visualizations from PowerBI

## 📊 Analysis 
- Total revenue by month-year
- Count of customers, total revenue and total orders by customer segment
- Top 10 customers
- Revenue, quantity and product trends for top 10 products
- Top 5 products by country
- Sum of TotalPrice by Country and Description

## 📈 Insights

November 2011 generated the highest revenue, reaching $1,156,205.61.
38.36% of total revenue comes from high-value customers who spent more than $1,000.
A total of 1,664 customers were identified as high-value customers, purchasing 13,641 products.
The United Kingdom is the top-performing country with 3,920 customers and 18,019 orders.
The top-performing product is DOTCOM POSTAGE, which generates high revenue despite lower sales volume, indicating that it behaves like a luxury product.


After analyzing product revenue and sales quantity, the following patterns were identified:
		High Revenue  + Low Quantity = Luxury product
		High Revenue + High Quantity = Star product 
		Low Revenue + High Quantity = Cheap product



Recommendations:

The UK generates the highest revenue and shows strong demand for the top-selling product (DOTCOM POSTAGE).
Increasing inventory availability and optimizing operational efficiency for this product may help drive additional sales growth.

Star products with both high revenue and high sales volume should be prioritized in inventory planning and promotional campaigns.

High-value customers should be targeted through loyalty programs and personalized marketing strategies to improve customer retention.




## ▶️ How to Run
- Download the project files : download main.py from python folder and online_retail_analysis.sql from sql folder.
- Prepare the dataset: Download the dataset and place it in the project directory.
- Run python file and SQl queries to process and transform the data.
- For running python file with no error install dependencies : pip install pandas numpy sqlalchemy pymysql
- Load data into PowerBI: Import the processed data from SQL into Power BI and finally load the data for visualization and analysis.

## 👨‍💻 Author
Mahya
