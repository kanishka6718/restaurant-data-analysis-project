
-- What were the least and most ordered items? What categories were they in?

WITH T AS (Select * FROM restaurant_db.menu_items
LEFT Join restaurant_db.order_details ON menu_item_id = order_details.item_id)
SELECT COUNT(item_name) AS item_ordered,item_name,category FROM T 
Group BY item_name, category
ORDER BY item_ordered DESC;

-- What were the top 5 orders that spent the most money?

Select order_id, SUM(price) AS money_spent FROM restaurant_db.menu_items
LEFT Join restaurant_db.order_details ON menu_item_id = order_details.item_id
GROUP BY order_id
ORDER BY money_spent DESC
LIMIT 5;

-- View the details of the highest spend order. Which specific items were purchased?

Select category, COUNT(item_id)  FROM restaurant_db.menu_items
LEFT Join restaurant_db.order_details ON menu_item_id = order_details.item_id
WHERE order_id = 440
GROUP BY category;