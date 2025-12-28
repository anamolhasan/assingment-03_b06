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
join Vehicle v 
    on b.vehicle_id = v.vehicle_id;