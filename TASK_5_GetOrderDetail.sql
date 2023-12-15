use littlelemondm;
Prepare GetOrderDetail from'
select OrderID, Quantity, Cost
from Orders
inner join Bookings on Bookings.BookingID = Orders.BookingID
where Orders.OrderID = ?';
set @id = 156630481;
execute GetOrderDetail using @id;