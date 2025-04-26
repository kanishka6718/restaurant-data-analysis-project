

SELECT COUNT(order_details_id) AS item_ordered, order_id FROM restaurant_db.order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-08'
GROUP BY order_id
ORDER BY item_ordered DESC ;

SELECT COUNT(order_id) FROM  restaurant_db.order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-08';

SELECT Order_id FROM (SELECT COUNT(order_details_id) AS item_ordered, order_id FROM restaurant_db.order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-08'
GROUP BY order_id) AS S
WHERE item_ordered>12;
