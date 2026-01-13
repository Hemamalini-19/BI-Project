-- 1. SETUP: Create the Landing Table (Simulating Snowflake/Informix)
CREATE TABLE raw_loan_data (
    loan_id INT,
    car_model VARCHAR(50),
    loan_value INT,
    payment_status VARCHAR(20)
);

-- 2. INSERT: Add the sample data
INSERT INTO raw_loan_data (loan_id, car_model, loan_value, payment_status) VALUES 
(1001, 'Toyota Yaris', 15000, 'Active'),
(1002, 'Toyota Corolla', 22000, 'Late'),
(1003, 'Toyota RAV4', 35000, 'Active'),
(1004, 'Toyota Mirai', 60000, 'Late');

-- 3. TRANSFORMATION: Generate the Month-End Results for Excel

SELECT 
    car_model AS Car_Model,
    COUNT(loan_id) AS Total_Loans,
    SUM(loan_value) AS Total_Value,
    SUM(CASE WHEN payment_status = 'Late' THEN loan_value ELSE 0 END) AS At_Risk_Value
FROM raw_loan_data
GROUP BY car_model
ORDER BY Total_Value ASC;