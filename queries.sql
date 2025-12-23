-------------JOINT--------
SELECT 
  b.booking_id,
  u.name AS customer_name,
  v.name AS vehicle_name,
  b.start_date,
  b.end_date,
  b.status
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id;


-------------EXISTS------------

SELECT *
FROM vehicles v
WHERE NOT EXISTS (
  SELECT 1
  FROM bookings b
  WHERE b.vehicle_id = v.vehicle_id
);


--------------WHERE-------------
SELECT *
FROM vehicles
WHERE status = 'available'
AND type = 'car';





