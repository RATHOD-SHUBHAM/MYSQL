/*

SQL Schema
Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.
 

Write an SQL query to report all the duplicate emails.

Return the result table in any order.

The query result format is in the following example.

 

Example 1:

Input: 
Person table:
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
Output: 
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
Explanation: a@b.com is repeated two times.

*/

--  Method One: Self Join --> second best solution
SELECT DISTINCT p1.email
FROM Person p1
JOIN Person p2
ON p1.email = p2.email and p1.id != p2.id;

-- Method Two: Having  --> best solution
SELECT email
From Person
Group BY email
Having COUNT(email) > 1;

-- Method Three: Using Subquery --> this is brute force method
SELECT email 
FROM (SELECT email, Count(email) AS c
FROM Person
Group By email) as temp
WHERE temp.c > 1;