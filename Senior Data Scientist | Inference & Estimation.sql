SELECT 
    transaction_date, 
    AVG(sum_transaction_amount) OVER (
        ORDER BY transaction_date 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS rolling_avg
FROM 
    (
        SELECT 
            transaction_time::date AS transaction_date, 
            SUM(transaction_amount) AS sum_transaction_amount
        FROM 
            transactions

        GROUP BY 
            transaction_date
    ) t
ORDER BY 
    transaction_date;
