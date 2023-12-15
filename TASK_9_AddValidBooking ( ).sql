use littlelemondm;
#create table addbookingrecord (Date date, TableNo int, BookingStatus varchar(100));
#create trigger addbking after insert on Bookings for each row
	#insert into addbookingrecord (Date, TableNo, BookingStatus)
	#values (new.Date, new.TableNo, concat('Table ',new.TableNo,' is reserved on ',new.Date,' successfully'));
delimiter //
create procedure AddValidBooking(in booking_date date, in table_number int)
begin
    declare table_count INT;
    declare booking_status varchar(100) default concat('Table ',table_number,' is already booked - booking cancelled');
    
    start transaction;
    select count(*) into table_count
    from Bookings
    where booking_date = Date and table_number = TableNo;
    if table_count > 0 then
        rollback;
		select booking_status as 'Booking Status';
    else
        insert into Bookings (Date, TableNo)
        values (booking_date, table_number);
        commit;
	select BookingStatus as 'Booking Status' from  addbookingrecord
    where booking_date = Date and table_number = TableNo;
    end if;
end//
delimiter ;
call AddValidBooking('2022-10-14',6);