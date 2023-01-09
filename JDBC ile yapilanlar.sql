--//1. Örnek: companies tablosundan en yüksek ikinci number_of_employees değeri olan company ve number_of_employees değerlerini çağırın.

--1. YOL OFFSET ve FETCH NEXT kullanarak
SELECT company, number_of_employees
FROM companies 
ORDER BY number_of_employees DESC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY


SELECT company, number_of_employees
FROM companies 
WHERE number_of_employees = (SELECT MAX(number_of_employees)
                             FROM companies
                             WHERE number_of_employees < (SELECT MAX(number_of_employees)
                             FROM companies))



-- 1. Örnek: number_of_employees değeri ortalama çalışan sayısından az olan number_of_employees değerlerini 16000 olarak UPDATE edin.
UPDATE companies
SET number_of_employes = 16000
WHERE number_of_employees < (SELECT AVG(number_of_employes) 
                            FROM companies)


SELECT AVG(number_of_employes) 
FROM companies


--//1. Örnek: Prepared statement kullanarak company adı IBM olan number_of_employees değerini 9999 olarak güncelleyin.
UPDATE companies SET number_of_employees = 9999 WHERE company = 'IBM' 



SELECT * FROM companies








