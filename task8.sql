-- Creating a sample table for demonstration
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    salary DECIMAL(10, 2)
);

-- Stored Procedure: Increases salary by percentage for a given employee
DELIMITER //

CREATE PROCEDURE IncreaseSalary (
    IN p_emp_id INT,
    IN p_percentage DECIMAL(5,2)
)
BEGIN
    UPDATE employees
    SET salary = salary + (salary * p_percentage / 100)
    WHERE emp_id = p_emp_id;
END //

DELIMITER ;

-- Function: Calculate annual salary of an employee
DELIMITER //

CREATE FUNCTION GetAnnualSalary (
    p_salary DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN p_salary * 12;
END //

DELIMITER ;