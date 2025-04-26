#  find the number of items on the menu
SELECT count(Distinct item_name) FROM restaurant_db.menu_items;

#What are the least and most expensive items on the menu?
(
  SELECT item_name, price
  FROM restaurant_db.menu_items
  ORDER BY price ASC
  LIMIT 1
)
UNION
(
  SELECT item_name, price
  FROM restaurant_db.menu_items
  ORDER BY price DESC
  LIMIT 1
);


# How many Italian dishes are on the menu? What are the least and most expensive Italian dishes on the menu?

WITH Italian AS (SELECT item_name,PRICE FROM restaurant_db.menu_items
WHERE category = 'Italian')

(SELECT item_name,price FROM Italian 
ORDER BY price ASC
Limit 1)
UNION
(SELECT item_name, price FROM Italian 
ORDER BY price DESC
Limit 1);

# How many dishes are in each category? What is the average dish price within each category?

SELECT 
  category, 
  COUNT(*) AS dish_count,round(AVG(price),2) AS Average
FROM 
  restaurant_db.menu_items
GROUP BY 
  category;