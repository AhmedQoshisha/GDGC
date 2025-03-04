-- 8
select *
from Customers cross join Orders;

-- 9
select *
from Customers c inner join Orders o
 on c.CustomerID = o.CustomerID;

-- 10
select c.CustomerID, c.Name , o.OrderID 
from Customers c left join Orders o
on c.CustomerID = o.CustomerID;

-- 11
select c.CustomerID, c.Name , o.OrderID 
from Customers c right join Orders o
on c.CustomerID = o.CustomerID;

-- 12
select* 
from Customers c full outer join Orders o
on c.CustomerID = o.CustomerID;

-- 13
select *
from Customers c1 inner join customers c2
on c1.name = c2.name and c1.CustomerID <> c2.CustomerID;

-- 14
select c.name , o.Amount , o.OrderID
from Customers c inner join Orders o
on o.Amount>500;

-- 15
select c.name , o.orderid
from Customers c left join Orders o
on orderid is null;

-- 16
select count (o.orderid)
from orders o;

-- 17
select c.name , o.Amount , c.CustomerID 
from Customers c inner join Orders o
on c.CustomerID= o.OrderID;

-- 18
UPDATE o
SET o.Amount = o.Amount * 1.1
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Name = 'John Doe';

-- 19
DELETE o
FROM Orders o
LEFT JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL;

