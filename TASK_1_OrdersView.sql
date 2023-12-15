use littlelemondm;
create view OrdersView as
select OrderID, Quantity, Cost
from Orders
where Quantity >2;
select * from OrdersVIew;