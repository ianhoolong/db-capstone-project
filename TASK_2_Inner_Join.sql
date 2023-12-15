use littlelemondm;
select CustomerDetails.CustomerID, CustomerDetails.CustomerName,
Orders.OrderID, Orders.Cost,
Menu.Cuisine, Menu.Course, Menu.Starter
from Orders
inner join Bookings on Orders.BookingID = Bookings.BookingID
inner join CustomerDetails on Bookings.CustomerID = CustomerDetails.CustomerID
inner join Menu on Orders.MenuID = Menu.MenuID
where Orders.Cost > 150;