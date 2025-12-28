-- ==============================================
-- Queries 
-- ==============================================

-- 1. Retrieve booking information Customer and Vehicle name

select
    b.booking_id,
    u.name as customer_name,
    v.name as vehicle_name,
    b.start_date,
    b.end_date,
    b.booking_status as status
from Bookings b
join Users u
     on b.user_id = u.user_id 
join Vehicles v 
    on b.vehicle_id = v.vehicle_id;




-- 2. Vehicles that have NEVER been booked (NOT EXISTS)

select 
   v.vehicle_id,
   v.name,
   v.type,
   v.model,
   v.registration_number,
   v.rental_price,
   v.status
from Vehicles v 
where not exists (
    select * 
    from Bookings b 
    where b.vehicle_id = v.vehicle_id
);




-- 3. Retrieve all available vehicles of a specific type (e.g. cars).
select 
   v.vehicle_id,
   v.name,
   v.type,
   v.model,
   v,registration_number,
   v.rental_price,
   v.status
from Vehicles v 
where v.status = 'Available'
  and v.type = 'Car'



-- total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.

select 
    v.name as vehicle_name,
    count(b.booking_id) as total_bookings
from Bookings b 
     on b.vehicle_id = v.vehicle_id
group by v.name
having count(b.booking_id) > 2;