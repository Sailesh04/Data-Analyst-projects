Use New;
SELECT * FROM sales_walmart;

SELECT city,COUNT(city) FROM sales_walmart
GROUP BY city;

SELECT product_line,COUNT(product_line) FROM sales_walmart
GROUP BY product_line;

SELECT product_line,SUM(total) FROM sales_walmart
GROUP BY product_line;

SELECT product_line,SUM(quantity) as "qty." FROM sales_walmart
GROUP BY product_line;

SELECT time_of_day,SUM(total) FROM sales_walmart
GROUP BY time_of_day
ORDER BY SUM(total) DESC;

SELECT city , SUM(tax), AVG(tax) FROM sales_walmart
GROUP BY city
ORDER BY AVG(tax);

SELECT product_line, SUM(tax) FROM sales_walmart
GROUP BY product_line;

SELECT month_name,SUM(total) FROM sales_walmart
GROUP BY month_name
ORDER BY SUM(total);

SELECT customer, COUNT(customer) FROM sales_walmart
GROUP BY customer;

SELECT branch, gender, COUNT(*) AS count
FROM sales_walmart
GROUP BY branch, gender
ORDER BY branch;

