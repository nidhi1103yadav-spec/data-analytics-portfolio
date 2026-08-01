SELECT
TO_CHAR(
TO_TIMESTAMP("InvoiceDate", 'DD-MM-YYYY HH24:MI'),
'Day'
) AS weekday,
ROUND(SUM(("Quantity" * "UnitPrice")::numeric), 2) AS total_sales
FROM public.online_retail
WHERE "Quantity" > 0
AND "UnitPrice" > 0
GROUP BY weekday
ORDER BY total_sales DESC;