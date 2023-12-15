use littlelemondm;
#create table ordercancelrecord (OrderID INT, Confirmation varchar(255));
#create trigger ordercancel after delete on Orders for each row
	#insert into ordercancelrecord (OrderID, Confirmation)
	#values (old.OrderID, concat('Order ',old.OrderID,' is cancelled'));
delimiter //
create procedure CancelOrder(order_id int)
begin  
delete from Orders where order_id = OrderID;
select Confirmation from ordercancelrecord where order_id = OrderID;
end//
delimiter ;
call CancelOrder(156630481);