
--EASY TASKS
-- 1. 
SELECT 
    ProductID, 
    SaleDate, 
    SalesAmount, 
    SUM(SalesAmount) OVER (PARTITION BY ProductID ORDER BY SaleDate) AS RunningTotal
FROM Sales;

-- 2. 
SELECT 
    CustomerID, 
    OrderID, 
    Amount, 
    SUM(Amount) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS CumulativeSum
FROM Orders;

-- 3.
SELECT 
    CustomerID, 
    OrderID, 
    OrderAmount, 
    SUM(OrderAmount) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS RunningTotal
FROM Orders;

-- 4.
SELECT 
    ProductID, 
    SaleDate, 
    SalesAmount, 
    AVG(SalesAmount) OVER (PARTITION BY ProductID ORDER BY SaleDate) AS AvgSales
FROM Sales;

-- 5.
SELECT 
    OrderID, 
    OrderAmount, 
    RANK() OVER (ORDER BY OrderAmount DESC) AS OrderRank
FROM Orders;

-- 6.
SELECT 
    ProductID, 
    SaleDate, 
    SalesAmount, 
    LEAD(SalesAmount) OVER (PARTITION BY ProductID ORDER BY SaleDate) AS NextAmount
FROM Sales;

-- 7. 
SELECT 
    CustomerID, 
    OrderID, 
    OrderAmount, 
    SUM(OrderAmount) OVER (PARTITION BY CustomerID) AS TotalSales
FROM Orders;

-- 8. 
SELECT 
    OrderID, 
    CustomerID, 
    COUNT(*) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS OrderCount
FROM Orders;

-- 9.
SELECT 
    ProductCategory, 
    ProductID, 
    SaleDate, 
    SalesAmount, 
    SUM(SalesAmount) OVER (PARTITION BY ProductCategory ORDER BY SaleDate) AS RunningTotal
FROM Sales;

-- 10.
SELECT 
    OrderID, 
    CustomerID, 
    OrderDate, 
    ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS RowNum
FROM Orders;

-- 11. 
SELECT 
    OrderID, 
    CustomerID, 
    OrderAmount, 
    LAG(OrderAmount) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS PreviousOrderAmount
FROM Orders;

-- 12. 
SELECT 
    ProductID, 
    ProductName, 
    Price, 
    NTILE(4) OVER (ORDER BY Price) AS PriceGroup
FROM Products;

-- 13.
SELECT 
    SalespersonID, 
    SaleDate, 
    SalesAmount, 
    SUM(SalesAmount) OVER (PARTITION BY SalespersonID ORDER BY SaleDate) AS CumulativeTotal
FROM Sales;

-- 14.
SELECT 
    ProductID, 
    ProductName, 
    StockQuantity, 
    DENSE_RANK() OVER (ORDER BY StockQuantity DESC) AS StockRank
FROM Products;

-- 15. 
SELECT 
    OrderID, 
    CustomerID, 
    OrderAmount, 
    OrderAmount - LEAD(OrderAmount) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS AmountDifference
FROM Orders;


--MEDIUM TASKS

-- 1. 
SELECT 
    EmployeeID, 
    SaleDate, 
    SalesAmount, 
    SUM(SalesAmount) OVER (PARTITION BY EmployeeID ORDER BY SaleDate) AS CumulativeSales
FROM Sales;

-- 2.
SELECT 
    OrderID, 
    CustomerID, 
    OrderAmount, 
    OrderAmount - LEAD(OrderAmount) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS AmountDifference
FROM Orders;

-- 3. 
SELECT * FROM (SELECT 
        ProductID, 
        ProductName, 
        SUM(SalesAmount) AS TotalSales, 
        ROW_NUMBER() OVER (ORDER BY SUM(SalesAmount) DESC) AS SalesRank
    FROM Sales
    GROUP BY ProductID, ProductName) AS RankedProducts
WHERE SalesRank <= 5;

-- 4. 
SELECT * FROM ( SELECT 
        ProductID, 
        ProductName, 
        SUM(SalesAmount) AS TotalSales, 
        RANK() OVER (ORDER BY SUM(SalesAmount) DESC) AS SalesRank
    FROM Products
    GROUP BY ProductID, ProductName) AS RankedProducts
WHERE SalesRank <= 10;

-- 5.
SELECT 
    ProductID, 
    COUNT(*) AS OrderCount
FROM Sales
GROUP BY ProductID;

-- 6.
SELECT 
    ProductCategory, 
    ProductID, 
    SaleDate, 
    SalesAmount, 
    SUM(SalesAmount) OVER (PARTITION BY ProductCategory ORDER BY SaleDate) AS RunningTotal
FROM Sales;

-- 7. 
SELECT 
    EmployeeID, 
    DepartmentID, 
    Salary, 
    DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS SalaryRank
FROM Employees;

-- 8. 
SELECT 
    ProductID, 
    SaleDate, 
    SalesAmount, 
    AVG(SalesAmount) OVER (PARTITION BY ProductID ORDER BY SaleDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS MovingAvg
FROM Sales;

-- 9. 
SELECT 
    ProductID, 
    ProductName, 
    Price, 
    NTILE(3) OVER (ORDER BY Price) AS PriceGroup
FROM Products;

-- 10. 
SELECT 
    EmployeeID, 
    SaleDate, 
    SalesAmount, 
    LAG(SalesAmount) OVER (PARTITION BY EmployeeID ORDER BY SaleDate) AS PreviousSalesAmount
FROM Sales;

--HARD TASKS

-- 1. 
SELECT 
    ProductID, 
    StoreID, 
    SaleDate, 
    SalesAmount, 
    SUM(SalesAmount) OVER (PARTITION BY ProductID, StoreID ORDER BY SaleDate) AS RunningTotal
FROM Sales;

-- 2.
SELECT 
    OrderID, 
    CustomerID, 
    OrderAmount, 
    LEAD(OrderAmount) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS NextOrderAmount,
    (LEAD(OrderAmount) OVER (PARTITION BY CustomerID ORDER BY OrderDate) - OrderAmount) * 100.0 / NULLIF(OrderAmount, 0) AS PercentageChange
FROM Orders;

-- 4. 
SELECT 
    EmployeeID, 
    DepartmentID, 
    Salary, 
    RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS SalaryRank
FROM Employees;

-- 5.
SELECT * FROM ( SELECT 
        OrderID, 
        CustomerID, 
        OrderAmount, 
        NTILE(10) OVER (ORDER BY OrderAmount DESC) AS OrderGroup
    FROM Orders) AS RankedOrders
WHERE OrderGroup = 1;

-- 6. 
SELECT 
    ProductID, 
    SaleDate, 
    SalesAmount, 
    SalesAmount - LAG(SalesAmount) OVER (PARTITION BY ProductID ORDER BY SaleDate) AS SalesChange
FROM Sales;

