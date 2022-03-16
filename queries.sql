--Which customer made an order

SELECT customer.customer_id, customer.f_name, customer.l_name, order_product.order_id FROM `customer` 
INNER JOIN order_product ON customer.customer_id = order_product.fk_customer_id;

--Products in Cart

SELECT products.product_id, products.name, cart.cart_id FROM `products` 
INNER JOIN cart ON products.product_id = cart.fk_product_id;

--Which customer made an order

SELECT order_product.order_id, order_product.fk_customer_id, cart.fk_product_id FROM `order_product`
INNER JOIN cart ON order_product.order_id = cart.fk_order_id;

--How many Female has an account

SELECT c.customer_id, c.f_name, c.l_name, c.gender FROM customer c 
WHERE c.gender = "F";

--How many male has an acount

SELECT c.customer_id, c.f_name, c.l_name, c.gender FROM customer c 
WHERE c.gender = "M";

--ordered by

SELECT cu.f_name, cu.l_name FROM customer cu WHERE cu.customer_id IN ( SELECT o.fk_customer_id FROM order_product o WHERE o.order_date BETWEEN "2022-03-06" AND "2022-03-13");

--Special products

SELECT * FROM `products` 
WHERE product_id IN (10002, 10007);

-- 2 extra joins with 3 tables

SELECT co.name, cu.f_name, cu.l_name, cu.city, us.name, us.password, us.e_mail FROM company co
JOIN customer cu ON co.name = cu.fk_name
JOIN user_account us ON cu.customer_id = us.fk_customer_id;


