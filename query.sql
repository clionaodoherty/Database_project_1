
 SELECT Equipment.EquipmentID, Equipment.Make, Equipment.Model, Equipment.Description FROM Equipment LEFT JOIN codoherty18.EquipmentLoan ON Equipment.EquipmentID = EquipmentLoan.EquipmentID WHERE ((Equipment.Description LIKE '%video%') OR (Equipment.Type like '%video%')) AND ((Equipment.Damaged = '0') AND (EquipmentLoan.Current = '0')) OR EquipmentLoan.EquipmentID IS NULL AND ((Equipment.Description LIKE '%video%') OR (Equipment.Type like '%video%')) AND ((Equipment.Damaged = '0'))

SELECT Employee.EmployeeID, Employee.FirstName, Employee.LastName FROM Employee LEFT JOIN codoherty18.Contract ON Employee.EmployeeID = Contract.EmployeeID WHERE Employee.Current = '1' AND Contract.DueFinish BETWEEN '2019-01-01' AND '2020-01-01' 

SELECT Project.Title, SUM(Expense.Amount) AS Expenses FROM Project LEFT JOIN codoherty18.Expense ON Project.ProjectID = Expense.ProjectID GROUP BY Project.ProjectID 

SELECT DISTINCT Employee.FirstName, Employee.LastName, Employee.Email, Grade.Title FROM Employee 
LEFT JOIN codoherty18.Grade ON Employee.GradeID =Grade.GradeID 
LEFT JOIN codoherty18.EmployeeSkill ON Employee.EmployeeID = EmployeeSkill.EmployeeID 
LEFT JOIN codoherty18.Skill on EmployeeSkill.SkillID = Skill.SkillID 
WHERE Skill.Title LIKE '%video%'

SELECT Project.Title, COUNT(Assignment.EmployeeID) AS "Number Of Employees" FROM Assignment INNER JOIN codoherty18.Project ON Assignment.ProjectID = Project.ProjectID INNER JOIN codoherty18.Employee ON Assignment.EmployeeID = Employee.EmployeeID WHERE Project.Internal ='0' AND Employee.Left < CURRENT_TIMESTAMP OR Employee.Left IS NULL GROUP BY Assignment.ProjectID HAVING COUNT(Assignment.ProjectID)>=2

SELECT Employee.EmployeeID, Employee.FirstName, Employee.LastName FROM Employee
LEFT JOIN codoherty18.Assignment ON Employee.EmployeeID = Assignment.EmployeeID 
LEFT JOIN codoherty18.Assignment ON Project.ProjectID = Assignment.ProjectID 
WHERE Project.Ended IS NOT NULL and Employee.Left IS NOT NULL 


SELECT Skill.Title, 
COUNT(EmployeeSkill.EmployeeID) AS "Number of Skilled Employees" FROM 
codoherty18.Skill 
LEFT JOIN codoherty18.EmployeeSkill ON Skill.SkillID = EmployeeSkill.SkillID WHERE 
"Number of Skilled Employees" >= '1' GROUP BY 
EmployeeSkill.EmployeeID; 



SELECT Employee.EmployeeID, 
COUNT(EquipmentLoan.EquipmentID) AS 'Equipment Loans' FROM 
Employee 
LEFT JOIN codoherty18.EquipmentLoan ON Employee.EmployeeID = EquipmentLoan.EmployeeID
WHERE EquipmentLoan.Current = '1' 
AND EquipmentLoan.EmployeeID IS NOT NULL GROUP BY 
Employee.EmployeeID 


Select Employee.EmployeeID, COUNT(EquipmentLoan.StartDate) AS "All Time Loans" FROM Employee
LEFT JOIN codoherty18.EquipmentLoan ON Employee.EmployeeID = EquipmentLoan.EmployeeID WHERE EquipmentLoan.EmployeeID IS NOT NULL GROUP BY Employee.EmployeeID


SELECT Employee.EmployeeID, Payslip.PayslipID FROM Payslip INNER JOIN codoherty18.Employee ON Payslip.EmployeeID = Employee.EmployeeID INNER JOIN codoherty18.Contract ON Employee.EmployeeID = Contract.EmployeeID WHERE Contract.DueFinish NOT BETWEEN 01/01/2017 AND 31/12/2017
