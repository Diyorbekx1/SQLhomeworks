--Merge practice

--Task 1
MERGE INTO Employees AS e
USING NewEmployees AS ne
ON e.EmployeeID = ne.EmployeeID
WHEN MATCHED THEN 
    UPDATE SET e.Name = ne.Name, e.Position = ne.Position, e.Salary = ne.Salary
WHEN NOT MATCHED THEN 
    INSERT (EmployeeID, Name, Position, Salary) 
    VALUES (ne.EmployeeID, ne.Name, ne.Position, ne.Salary);


	--Task 2  delete records merge
	MERGE INTO OldProducts AS op
USING CurrentProducts AS cp
ON op.ProductID = cp.ProductID
WHEN NOT MATCHED BY SOURCE THEN 
    DELETE;

	-- Task 3 
	MERGE INTO Employees AS e
USING NewSalaryDetails AS ns
ON e.EmployeeID = ns.EmployeeID
WHEN MATCHED AND ns.Salary > e.Salary THEN 
    UPDATE SET e.Salary = ns.Salary;


	--Task 4
	MERGE INTO Orders AS o
USING NewOrders AS no
ON o.OrderID = no.OrderID AND o.CustomerID = no.CustomerID
WHEN MATCHED AND no.OrderAmount > o.OrderAmount THEN 
    UPDATE SET o.OrderAmount = no.OrderAmount
WHEN NOT MATCHED THEN 
    INSERT (OrderID, CustomerID, OrderAmount, OrderDate) 
    VALUES (no.OrderID, no.CustomerID, no.OrderAmount, no.OrderDate);

	--Task 5
	MERGE INTO StudentRecords AS sr
USING (SELECT * FROM NewStudentRecords WHERE Age > 18) AS nsr
ON sr.StudentID = nsr.StudentID
WHEN MATCHED THEN 
    UPDATE SET sr.Name = nsr.Name, sr.Age = nsr.Age
WHEN NOT MATCHED THEN 
    INSERT (StudentID, Name, Age) 
    VALUES (nsr.StudentID, nsr.Name, nsr.Age);

INSERT INTO MergeLog (ActionType, StudentID, Timestamp)
SELECT 'Inserted', StudentID, GETDATE()
FROM NewStudentRecords WHERE Age > 18;

--View and Function Practice

--Task 1
CREATE VIEW SalesSummary 
SELECT  CustomerID, 
    SUM(SalesAmount) AS TotalSales, 
    COUNT(OrderID) AS OrderCount
FROM Sales
GROUP BY CustomerID;

--Task2
CREATE VIEW EmployeeDepartmentDetails AS
SELECT 
    e.EmployeeID, 
    e.Name, 
    e.Position, 
    d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;


--Task 4
CREATE FUNCTION fn_GetFullName (@FirstName VARCHAR(50), @LastName VARCHAR(50))
RETURNS VARCHAR(100)
AS
BEGIN
    RETURN (@FirstName + ' ' + @LastName);
END;

--Window Functions in SQL

--Task 2
-- Cumulative Sales using SUM()
SELECT 
    CustomerID, 
    OrderID, 
    OrderAmount, 
    SUM(OrderAmount) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS CumulativeSales
FROM Orders;

-- Average salary per department using window functions
SELECT 
    EmployeeID, 
    DepartmentID, 
    Salary, 
    AVG(Salary) OVER (PARTITION BY DepartmentID) AS AvgSalaryPerDept
FROM Employees;


--Task 3
-- Using PARTITION BY
SELECT 
    ProductCategory, 
    ProductID, 
    SaleDate, 
    SalesAmount, 
    SUM(SalesAmount) OVER (PARTITION BY ProductCategory ORDER BY SaleDate) AS CumulativeRevenue
FROM Sales;

-- Using GROUP BY (loses row-level detail)
SELECT 
    ProductCategory, 
    SUM(SalesAmount) AS TotalRevenue
FROM Sales
GROUP BY ProductCategory;



