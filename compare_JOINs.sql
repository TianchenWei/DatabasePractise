--account
 no  |  type   |       cname       | rate | sortcode 
-----+---------+-------------------+------+----------
 100 | current | McBrien, P.       |      |       67
 101 | deposit | McBrien, P.       | 5.25 |       67
 103 | current | Boyd, M.          |      |       34
 107 | current | Poulovassilis, A. |      |       56
 119 | deposit | Poulovassilis, A. | 5.50 |       56
 125 | current | Bailey, J.        |      |       56
(6 rows)

--movement
 mid  | no  | amount  |   tdate    
------+-----+---------+------------
 1000 | 100 | 2300.00 | 1999-01-05
 1001 | 101 | 4000.00 | 1999-01-05
 1002 | 100 | -223.45 | 1999-01-08
 1004 | 107 | -100.00 | 1999-01-11
 1005 | 103 |  145.50 | 1999-01-12
 1006 | 100 |   10.23 | 1999-01-15
 1007 | 107 |  345.56 | 1999-01-15
 1008 | 101 | 1230.00 | 1999-01-15
 1009 | 119 | 5600.00 | 1999-01-18
(9 rows)

--branch
 sortcode |   bname   |   cash   
----------+-----------+----------
       56 | Wimbledon | 94340.45
       34 | Goodge St |  8900.67
       67 | Strand    | 34005.00
(3 rows)

SELECT * 
FROM branch NATURAL JOIN account;
 sortcode |   bname   |   cash   | no  |  type   |       cname       | rate 
----------+-----------+----------+-----+---------+-------------------+------
       67 | Strand    | 34005.00 | 100 | current | McBrien, P.       |     
       67 | Strand    | 34005.00 | 101 | deposit | McBrien, P.       | 5.25
       34 | Goodge St |  8900.67 | 103 | current | Boyd, M.          |     
       56 | Wimbledon | 94340.45 | 107 | current | Poulovassilis, A. |     
       56 | Wimbledon | 94340.45 | 119 | deposit | Poulovassilis, A. | 5.50
       56 | Wimbledon | 94340.45 | 125 | current | Bailey, J.        |  
SELECT *             
FROM account NATURAL JOIN branch;
 sortcode | no  |  type   |       cname       | rate |   bname   |   cash   
----------+-----+---------+-------------------+------+-----------+----------
       67 | 100 | current | McBrien, P.       |      | Strand    | 34005.00
       67 | 101 | deposit | McBrien, P.       | 5.25 | Strand    | 34005.00
       34 | 103 | current | Boyd, M.          |      | Goodge St |  8900.67
       56 | 107 | current | Poulovassilis, A. |      | Wimbledon | 94340.45
       56 | 119 | deposit | Poulovassilis, A. | 5.50 | Wimbledon | 94340.45
       56 | 125 | current | Bailey, J.        |      | Wimbledon | 94340.45
(6 rows)

SELECT * 
FROM branch JOIN account USING (sortcode);
 sortcode |   bname   |   cash   | no  |  type   |       cname       | rate 
----------+-----------+----------+-----+---------+-------------------+------
       67 | Strand    | 34005.00 | 100 | current | McBrien, P.       |     
       67 | Strand    | 34005.00 | 101 | deposit | McBrien, P.       | 5.25
       34 | Goodge St |  8900.67 | 103 | current | Boyd, M.          |     
       56 | Wimbledon | 94340.45 | 107 | current | Poulovassilis, A. |     
       56 | Wimbledon | 94340.45 | 119 | deposit | Poulovassilis, A. | 5.50
       56 | Wimbledon | 94340.45 | 125 | current | Bailey, J.        |     
(6 rows)

SELECT * 
FROM account JOIN branch USING (sortcode);
 sortcode | no  |  type   |       cname       | rate |   bname   |   cash   
----------+-----+---------+-------------------+------+-----------+----------
       67 | 100 | current | McBrien, P.       |      | Strand    | 34005.00
       67 | 101 | deposit | McBrien, P.       | 5.25 | Strand    | 34005.00
       34 | 103 | current | Boyd, M.          |      | Goodge St |  8900.67
       56 | 107 | current | Poulovassilis, A. |      | Wimbledon | 94340.45
       56 | 119 | deposit | Poulovassilis, A. | 5.50 | Wimbledon | 94340.45
       56 | 125 | current | Bailey, J.        |      | Wimbledon | 94340.45
(6 rows)

SELECT * 
FROM account JOIN branch ON account.sortcode=branch.sortcode;
 no  |  type   |       cname       | rate | sortcode | sortcode |   bname   |   cash   
-----+---------+-------------------+------+----------+----------+-----------+----------
 100 | current | McBrien, P.       |      |       67 |       67 | Strand    | 34005.00
 101 | deposit | McBrien, P.       | 5.25 |       67 |       67 | Strand    | 34005.00
 103 | current | Boyd, M.          |      |       34 |       34 | Goodge St |  8900.67
 107 | current | Poulovassilis, A. |      |       56 |       56 | Wimbledon | 94340.45
 119 | deposit | Poulovassilis, A. | 5.50 |       56 |       56 | Wimbledon | 94340.45
 125 | current | Bailey, J.        |      |       56 |       56 | Wimbledon | 94340.45
(6 rows)

