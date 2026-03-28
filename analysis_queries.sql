/* =====================================================
   SQL SALES ANALYSIS PROJECT
   Author: Hamim Shafin
   Tool: SQL Server (SSMS)
   Dataset: Superstore Sales
===================================================== */

USE SalesDB;
GO

/* =====================================================
   1. DATA PREVIEW
===================================================== */

-- View sample data
SELECT TOP 10 *
FROM dbo.Superstore_clean;


/* =====================================================
   2. OVERALL PERFORMANCE
===================================================== */

-- Total Sales and Total Profit
SELECT 
    SUM([Sales]) AS total_sales,
    SUM([Profit]) AS total_profit
FROM dbo.Superstore_clean;


/* =====================================================
   3. CATEGORY ANALYSIS
===================================================== */

-- Sales by Category
SELECT 
    [Category],
    SUM([Sales]) AS total_sales
FROM dbo.superstore_clean
GROUP BY [Category]
ORDER BY total_sales DESC;

-- Profit by Sub-Category
SELECT 
    [Sub_Category],
    SUM([Profit]) AS total_profit
FROM dbo.superstore_clean
GROUP BY [Sub_Category]
ORDER BY total_profit DESC;


/* =====================================================
   4. REGIONAL ANALYSIS
===================================================== */

-- Profit by Region
SELECT 
    [Region],
    SUM([Profit]) AS total_profit
FROM dbo.superstore_clean
GROUP BY [Region]
ORDER BY total_profit DESC;


/* =====================================================
   5. PRODUCT PERFORMANCE
===================================================== */

-- Top 5 Products by Sales
SELECT TOP 5
    [Product_Name],
    SUM([Sales]) AS total_sales
FROM dbo.superstore_clean
GROUP BY [Product_Name]
ORDER BY total_sales DESC;

-- Loss-Making Products
SELECT TOP 10
    [Product_Name],
    SUM([Profit]) AS total_profit
FROM dbo.superstore_clean
GROUP BY [Product_Name]
HAVING SUM([Profit]) < 0
ORDER BY total_profit ASC;


/* =====================================================
   6. CUSTOMER ANALYSIS
===================================================== */

-- Top 10 Customers by Sales
SELECT TOP 10
    [Customer_Name],
    SUM([Sales]) AS total_sales
FROM dbo.superstore_clean
GROUP BY [Customer_Name]
ORDER BY total_sales DESC;


/* =====================================================
   7. TIME ANALYSIS (OPTIONAL)
===================================================== */

-- Monthly Sales Trend (if Order Date works)
SELECT 
    FORMAT([Order_Date], 'yyyy-MM') AS sales_month,
    SUM([Sales]) AS monthly_sales
FROM dbo.superstore_clean
GROUP BY FORMAT([Order_Date], 'yyyy-MM')
ORDER BY sales_month;