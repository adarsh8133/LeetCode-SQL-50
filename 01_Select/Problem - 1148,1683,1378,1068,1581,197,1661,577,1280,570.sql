-- 1148. Article Views I 

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;


-- 1683. Invalid Tweets 
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;


-- 1378. Replace Employee ID With The Unique Identifier

SELECT 
    EmployeeUNI.unique_id, 
    Employees.name
FROM 
    Employees
LEFT JOIN 
    EmployeeUNI 
ON 
    Employees.id = EmployeeUNI.id;


-- 1068. Product Sales Analysis I

SELECT 
    Product.product_name, 
    Sales.year, 
    Sales.price
FROM 
    Sales
INNER JOIN 
    Product 
ON 
    Sales.product_id = Product.product_id;



-- 1581. Customer Who Visited but Did Not Make Any Transactions

SELECT 
    Visits.customer_id, 
    COUNT(Visits.visit_id) AS count_no_trans
FROM 
    Visits
LEFT JOIN 
    Transactions 
ON 
    Visits.visit_id = Transactions.visit_id
WHERE 
    Transactions.transaction_id IS NULL
GROUP BY 
    Visits.customer_id;


-- 197. Rising Temperature


SELECT 
    w1.id
FROM 
    Weather w1
JOIN 
    Weather w2 
ON 
    DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE 
    w1.temperature > w2.temperature;


-- 1661. Average Time of Process per Machine

SELECT 
    a1.machine_id, 
    ROUND(AVG(a2.timestamp - a1.timestamp), 3) AS processing_time
FROM 
    Activity a1
JOIN 
    Activity a2 
ON 
    a1.machine_id = a2.machine_id 
    AND a1.process_id = a2.process_id 
    AND a1.activity_type = 'start' 
    AND a2.activity_type = 'end'
GROUP BY 
    a1.machine_id;


-- 577. Employee Bonus

SELECT 
    Employee.name, 
    Bonus.bonus
FROM 
    Employee
LEFT JOIN 
    Bonus 
ON 
    Employee.empId = Bonus.empId
WHERE 
    Bonus.bonus < 1000 
    OR Bonus.bonus IS NULL;


-- 1280. Students and Examinations

SELECT 
    s.student_id, 
    s.student_name, 
    sub.subject_name, 
    COUNT(e.subject_name) AS attended_exams
FROM 
    Students s
CROSS JOIN 
    Subjects sub
LEFT JOIN 
    Examinations e 
ON 
    s.student_id = e.student_id 
    AND sub.subject_name = e.subject_name
GROUP BY 
    s.student_id, 
    s.student_name, 
    sub.subject_name
ORDER BY 
    s.student_id, 
    sub.subject_name;

-- 570. Managers with at Least 5 Direct Reports

SELECT 
    m.name
FROM 
    Employee e
JOIN 
    Employee m 
ON 
    e.managerId = m.id
GROUP BY 
    m.id, 
    m.name
HAVING 
    COUNT(e.id) >= 5;
