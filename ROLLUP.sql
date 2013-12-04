SELECT cname,account.no,mid,sum(amount)AS amount
FROM account LEFT JOIN movement
ON account.no=movement.no
GROUP BY cname,account.no,mid
WITH ROLLUP;
