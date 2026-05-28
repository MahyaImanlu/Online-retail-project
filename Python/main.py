# Online Retail Project
# Author: Mahya

# -----------------------Imports ----------------------
import pandas as pd
from sqlalchemy import create_engine


# ---------------- Connecting to MYSQL ----------------
password = input('Please enter your MYSQL password : ')
engine = create_engine(f"mysql+pymysql://root:{password}@localhost/online_retail")


# -------------- Reading File with pandas -------------
# Download online_retail.csv file from kaggle and place it in the project folder
try:
    df = pd.read_csv('online_retail.csv')
except FileNotFoundError:
    raise FileNotFoundError('Dataset file not found. Please download the dataset and place it in the project folder.')


# ------------------- Data Cleaning -------------------

df = df.drop_duplicates()
df = df.dropna(subset=['Description'])

df['InvoiceDate'] = pd.to_datetime(df['InvoiceDate'])
df['InvoiceNo'] = df['InvoiceNo'].astype(str)
df['StockCode'] = df['StockCode'].astype(str)
df['CustomerID'] = df['CustomerID'].astype('Int64')
df['Country'] = df['Country'].astype('category')

print("Cleaned DF nulls:")
print(df.isnull().sum())


# remove cancelled invoices
df = df[~df['InvoiceNo'].str.startswith('C')]

# remove invalid UnitPrice and Quantity
df = df[df['UnitPrice'] > 0]
df = df[df['Quantity'] > 0]


df['TotalPrice'] = df['Quantity'] * df['UnitPrice']


print("Shape:", df.shape)
print("\nNulls:")
print(df.isnull().sum())

# Create another DataFrame to analyse behavior of customers
customer_df = df.dropna(subset=['CustomerID'])

print("\nCustomer DF shape:", customer_df.shape)
print(customer_df.isnull().sum())


# ---------------- Connect Data to MYSQL --------------

df.to_sql(
    'online_retail_clean',
    con=engine,
    if_exists='replace',
    index=False
)


customer_df.to_sql(
    'customer_clean',
    con=engine,
    if_exists='replace',
    index=False
)




















