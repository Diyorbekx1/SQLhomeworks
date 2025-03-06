lesson 19 homework 

--EASY Tasks
-- 1. 
SELECT EmployeeID, Salary, 
ROW_NUMBER() OVER (ORDER BY Salary) AS RowNum FROM Employees;
 -- 2. 
SELECT ProductID, Price, RANK() OVER (ORDER BY Price DESC) AS Rank
FROM Products;

-- 3.
SELECT EmployeeID, Salary,  DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees;

-- 4.
SELECT EmployeeID, DepartmentID, Salary, 
LEAD(Salary) OVER (PARTITION BY DepartmentID ORDER BY Salary) AS NextSalary
FROM Employees;

-- 5.
SELECT OrderID,  ROW_NUMBER() OVER (ORDER BY OrderDate) AS OrderNum
FROM Orders;

-- 6.
SELECT EmployeeID, Salary, RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees
WHERE SalaryRank <= 2;

-- 7. 
SELECT EmployeeID, Salary, 
       LAG(Salary) OVER (ORDER BY Salary) AS PreviousSalary
FROM Employees;

-- 8. 
SELECT EmployeeID, Salary, 
       NTILE(4) OVER (ORDER BY Salary) AS SalaryGroup
FROM Employees;

-- 9. 
SELECT EmployeeID, DepartmentID, 
       ROW_NUMBER() OVER (PARTITION BY DepartmentID ORDER BY EmployeeID) AS DeptRowNum
FROM Employees;

-- 10. 
SELECT ProductID, Price, 
       DENSE_RANK() OVER (ORDER BY Price ASC) AS PriceRank
FROM Products;

-- 11.
SELECT ProductID, Price, 
       AVG(Price) OVER (ORDER BY ProductID ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS MovingAvg
FROM Products;

-- 12.
SELECT EmployeeID, Salary, 
       LEAD(Salary) OVER (ORDER BY EmployeeID) AS NextSalary
FROM Employees;

-- 13. 
SELECT SaleID, SalesAmount, 
 SUM(SalesAmount) OVER (ORDER BY SaleID) AS CumulativeSales
FROM Sales;

-- 14.
SELECT ProductID, Price
FROM (SELECT ProductID, Price, 
 ROW_NUMBER() OVER (ORDER BY Price DESC) AS Rank FROM Products) AS SubQuery
WHERE Rank <= 5;

-- 15. 
SELECT CustomerID, SUM(OrderAmount) AS TotalOrderAmount
FROM Orders
GROUP BY CustomerID;

-- 16. 
SELECT OrderID, OrderAmount, 
       RANK() OVER (ORDER BY OrderAmount DESC) AS OrderRank
FROM Orders;

-- 17. 
SELECT ProductCategory, SalesAmount, 
       (SalesAmount * 100.0) / SUM(SalesAmount) OVER (PARTITION BY ProductCategory) AS PercentageContribution
FROM Sales;

-- 18. 
SELECT OrderID, OrderDate, 
 LEAD(OrderDate) OVER (ORDER BY OrderDate) AS NextOrderDate
FROM Orders;

-- 19.
SELECT EmployeeID, Age, 
 NTILE(3) OVER (ORDER BY Age) AS AgeGroup
FROM Employees;

-- 20.
SELECT EmployeeID, HireDate
FROM ( SELECT EmployeeID, HireDate, 
 ROW_NUMBER() OVER (ORDER BY HireDate DESC) AS RecentHireRank
 FROM Employees) AS SubQuery
WHERE RecentHireRank = 1;


--MEDIUM Tasks

-- 1. 
SELECT EmployeeID, Salary, 
AVG(Salary) OVER (ORDER BY Salary ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS CumulativeAvgSalary
FROM Employees;

-- 2.
SELECT ProductID, SUM(SalesAmount) AS TotalSales, 
RANK() OVER (ORDER BY SUM(SalesAmount) DESC) AS SalesRank FROM Sales
GROUP BY ProductID;

-- 3. 
SELECT OrderID, OrderDate, 
LAG(OrderDate) OVER (ORDER BY OrderDate) AS PreviousOrderDate
FROM Orders;

-- 4. 
SELECT ProductID, Price, 
SUM(Price) OVER (ORDER BY ProductID ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS MovingSum
FROM Products;

-- 5. 
SELECT EmployeeID, Salary, 
 NTILE(4) OVER (ORDER BY Salary) AS SalaryRange
FROM Employees;

-- 6. 
SELECT ProductID, SUM(SalesAmount) AS TotalSalesAmount
FROM Sales
GROUP BY ProductID;

-- 7. 
SELECT ProductID, StockQuantity, 
       DENSE_RANK() OVER (ORDER BY StockQuantity DESC) AS StockRank
FROM Products;

-- 8. 
SELECT EmployeeID, DepartmentID, Salary
FROM (SELECT EmployeeID, DepartmentID, Salary, 
 ROW_NUMBER() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS SalaryRank
 FROM Employees) AS SubQuery
WHERE SalaryRank = 2;

-- 9.
SELECT ProductID, SaleID, SalesAmount, 
SUM(SalesAmount) OVER (PARTITION BY ProductID ORDER BY SaleID) AS RunningTotalSales
FROM Sales;

-- 10. 
SELECT EmployeeID, SaleID, SalesAmount, 
LEAD(SalesAmount) OVER (PARTITION BY EmployeeID ORDER BY SaleID) AS NextSalesAmount
FROM Sales;

-- 11. 
SELECT EmployeeID, DepartmentID, Salary, 
       RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS SalaryRank
FROM Employees;



--HARD Tasks

-- 1. 
WITH RankedProducts AS (
SELECT ProductID, SUM(SalesAmount) AS TotalSales, 
 RANK() OVER (ORDER BY SUM(SalesAmount) DESC) AS SalesRank,
 COUNT(*) OVER () AS TotalProducts FROM Sales
    GROUP BY ProductID)
SELECT ProductID, TotalSales, SalesRank
FROM RankedProducts
WHERE SalesRank > TotalProducts * 0.1;

-- 2. 
SELECT EmployeeID, HireDate, 
       ROW_NUMBER() OVER (ORDER BY HireDate) AS RowNum
FROM Employees
WHERE HireDate <= DATEADD(YEAR, -5, GETDATE());

-- 3.
SELECT EmployeeID, Salary,  NTILE(10) OVER (ORDER BY Salary) AS SalaryGroup
FROM Employees;

-- 4. 
SELECT EmployeeID, SaleID, SalesAmount, 
 LEAD(SalesAmount) OVER (PARTITION BY EmployeeID ORDER BY SaleID) AS NextSalesAmount,
  CASE 
  WHEN LEAD(SalesAmount) OVER (PARTITION BY EmployeeID ORDER BY SaleID) > SalesAmount THEN 'Increase'
  WHEN LEAD(SalesAmount) OVER (PARTITION BY EmployeeID ORDER BY SaleID) < SalesAmount THEN 'Decrease'
  ELSE 'Same'
  END AS SalesChange
FROM Sales;

-- 5.
SELECT CategoryID, AVG(Price) AS AvgPrice
FROM Products
GROUP BY CategoryID;

-- 6. 
WITH ProductSales AS (SELECT ProductID, SUM(SalesAmount) AS TotalSales,
 RANK() OVER (ORDER BY SUM(SalesAmount) DESC) AS SalesRank
 FROM Sales
 GROUP BY ProductID)
SELECT ProductID, TotalSales, SalesRank
FROM ProductSales
WHERE SalesRank <= 3;


