CREATE TABLE sales_walmart(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_percent FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    g_m_p FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);

SELECT * FROM sales_walmart;


SELECT city,COUNT(city) FROM sales_walmart
GROUP BY city;

SELECT product_line,COUNT(product_line) FROM sales_walmart
GROUP BY product_line;

SELECT product_line,SUM(total) FROM sales_walmart
GROUP BY product_line;

SELECT product_line,SUM(quantity) as "qty." FROM sales_walmart
GROUP BY product_line;

SELECT
	time,
	(CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END) AS time_of_day
FROM sales_walmart;

ALTER TABLE sales_walmart ADD COLUMN time_of_day VARCHAR(20);
UPDATE sales_walmart
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
);
SELECT
	date,
	DAYNAME(date)
FROM sales_walmart;
UPDATE sales_walmart
SET day_name = DAYNAME(date);

ALTER TABLE sales_walmart ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name = DAYNAME(date);

SELECT
	date,
	MONTHNAME(date)
FROM sales_walmart;

ALTER TABLE sales_walmart ADD COLUMN month_name VARCHAR(10);

UPDATE sales_walmart
SET month_name = MONTHNAME(date);


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


