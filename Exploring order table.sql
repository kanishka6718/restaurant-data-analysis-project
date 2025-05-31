
# how many items (not unique orders) were ordered in total within this date range? 

SELECT COUNT(order_id) FROM  restaurant_db.order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-08';


# which orders had the most items during that week.
  
SELECT COUNT(order_details_id) AS item_ordered, order_id FROM restaurant_db.order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-08'
GROUP BY order_id
ORDER BY item_ordered DESC ;


# How many orders had more than 12 items?
  
SELECT Order_id FROM (SELECT COUNT(order_details_id) AS item_ordered, order_id FROM restaurant_db.order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-08'
GROUP BY order_id) AS S
WHERE item_ordered>12;
