
--- Healthcare Project

-- 1. Top 5 Medical_Conditions for Admission
SELECT TOP 5 [Medical Condition], COUNT(*) AS Count
FROM [dbo].[Patient_Overview] 
GROUP BY [Medical Condition]
ORDER BY Count DESC;


--2. Top 5 Medical_Conditions for Males vs. Females
-- For Males:
SELECT TOP 5 [Medical Condition], COUNT(*) AS Count
FROM [dbo].[Patient_Overview]
WHERE Gender = 'Male'
GROUP BY [Medical Condition]
ORDER BY Count DESC;

-- For Females:
SELECT TOP 5 [Medical Condition], COUNT(*) AS Count
FROM [dbo].[Patient_Overview]
WHERE Gender = 'Female'
GROUP BY [Medical Condition]
ORDER BY Count DESC;


-- 3. Average Billing_Amount Overall
SELECT cast (AVG( [Billing Amount]) as decimal (18, 2))  AS AverageBilling
FROM [dbo].[Patient_Overview];

-- 4. Hospitals with the Highest and Lowest Medical Charges
-- Highest:
SELECT TOP 1 Hospital, SUM([Billing Amount]) AS TotalBilling
FROM [dbo].[Patient_Overview]
GROUP BY Hospital
ORDER BY TotalBilling DESC;

-- Lowest:
SELECT TOP 1 Hospital, SUM([Billing Amount]) AS TotalBilling
FROM [dbo].[Patient_Overview]
GROUP BY Hospital
ORDER BY TotalBilling ASC;

-- 5. Admission_Types with the Highest and Lowest Average Charges
-- Highest:
SELECT TOP 1 [Admission Type], AVG([Billing Amount]) AS AverageBilling
FROM [dbo].[Patient_Overview]
GROUP BY [Admission Type]
ORDER BY AverageBilling DESC;

-- Lowest:
SELECT TOP 1 [Admission Type], AVG([Billing Amount]) AS AverageBilling
FROM [dbo].[Patient_Overview]
GROUP BY [Admission Type]
ORDER BY AverageBilling ASC;

-- 6. Average Length of Stay Overall
SELECT AVG(DATEDIFF(day, [Date of Admission], [Discharge Date])) AS AverageLengthOfStay
FROM [dbo].[Patient_Overview];

-- 7. Average Length of Stay per Hospital
SELECT Hospital, AVG(DATEDIFF(day, [Date of Admission], [Discharge Date])) AS AverageLengthOfStay
FROM [dbo].[Patient_Overview]
GROUP BY Hospital;

-- 8. Most and Least Popular Insurances
-- Most Popular:
SELECT TOP 1 [Insurance Provider], COUNT(*) AS Count
FROM [dbo].[Patient_Overview]
GROUP BY [Insurance Provider]
ORDER BY Count DESC;

-- Least Popular:
SELECT TOP 1 [Insurance Provider], COUNT(*) AS Count
FROM [dbo].[Patient_Overview]
GROUP BY [Insurance Provider]
ORDER BY Count ASC;

-- 9. Top 5 Administered Medications
SELECT TOP 5 Medication, COUNT(*) AS Count
FROM [dbo].[Patient_Overview]
GROUP BY Medication
ORDER BY Count DESC;

-- 10. Age Distribution of the Patients
SELECT Age, COUNT(*) AS Count
FROM [dbo].[Patient_Overview]
GROUP BY Age
ORDER BY Age;