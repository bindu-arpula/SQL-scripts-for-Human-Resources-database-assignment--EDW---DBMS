CREATE TABLE Department (
		department_id INT auto_increment PRIMARY KEY,
        department_name VARCHAR(100) NOT NULL UNIQUE,
        location VARCHAR(100) NOT NULL
);

CREATE TABLE JobRole (
	job_role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_title VARCHAR(100) NOT NULL UNIQUE,
    role_description TEXT
);

CREATE TABLE Employee (
	employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    hire_date DATE NOT NULL,
    department_id INT NOT NULL,
    job_role_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Department(department_id),
    FOREIGN KEY (job_role_id) REFERENCES JobRole(job_role_id)
);

CREATE TABLE Salary (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    basic_salary DECIMAL(10,2) NOT NULL CHECK (basic_salary > 0),
    effective_date DATE NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

CREATE TABLE PerformanceReview (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    review_date DATE NOT NULL,
    overall_rating DECIMAL(3,2),
    comments TEXT,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

CREATE TABLE TrainingProgram (
    training_id INT AUTO_INCREMENT PRIMARY KEY,
    training_title VARCHAR(100) NOT NULL,
    provider VARCHAR(100),
    duration_hours INT
);

CREATE TABLE EmployeeTraining (
    employee_id INT NOT NULL,
    training_id INT NOT NULL,
    completion_status VARCHAR(30),
    PRIMARY KEY (employee_id, training_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (training_id) REFERENCES TrainingProgram(training_id)
);

CREATE TABLE Project (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE
);

CREATE TABLE EmployeeProject (
    employee_id INT NOT NULL,
    project_id INT NOT NULL,
    assigned_date DATE NOT NULL,
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (project_id) REFERENCES Project(project_id)
);

CREATE TABLE Skill (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE EmployeeSkill (
    employee_id INT NOT NULL,
    skill_id INT NOT NULL,
    proficiency_level VARCHAR(30),
    PRIMARY KEY (employee_id, skill_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (skill_id) REFERENCES Skill(skill_id)
);

CREATE TABLE PerformanceCriterion (
    criterion_id INT AUTO_INCREMENT PRIMARY KEY,
    criterion_name VARCHAR(100) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE EmployeePerformanceCriteria (
    employee_id INT NOT NULL,
    criterion_id INT NOT NULL,
    score DECIMAL(3,2),
    PRIMARY KEY (employee_id, criterion_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (criterion_id) REFERENCES PerformanceCriterion(criterion_id)
);

INSERT INTO Department (department_name, location) VALUES
('Human Resources', 'Berlin'),
('Finance', 'Hamburg'),
('Marketing', 'Berlin'),
('Information Technology', 'Munich'),
('Operations', 'Leipzig');

INSERT INTO JobRole (role_title, role_description) VALUES
('HR Manager', 'Responsible for human resource planning and policy implementation'),
('Software Engineer', 'Designs and maintains organisational software systems'),
('Financial Analyst', 'Performs financial forecasting and reporting'),
('Marketing Executive', 'Develops and manages marketing initiatives'),
('Operations Coordinator', 'Oversees daily operational workflows');

INSERT INTO TrainingProgram (training_title, provider, duration_hours) VALUES
('Leadership Development', 'Internal Training Unit', 40),
('Advanced SQL Techniques', 'External IT Provider', 24),
('Financial Modelling', 'Finance Academy', 32),
('Digital Marketing Strategy', 'Marketing Institute', 25),
('Operational Excellence', 'Operations Council', 20);

INSERT INTO Skill (skill_name) VALUES
('Leadership'),
('SQL'),
('Financial Analysis'),
('Marketing Strategy'),
('Process Improvement');

INSERT INTO Project (project_name, start_date, end_date) VALUES
('HR System Modernisation', '2024-01-15', '2024-07-30'),
('Enterprise Data Warehouse', '2024-02-01', '2024-09-15'),
('Corporate Rebranding', '2024-03-01', '2024-08-01');

INSERT INTO Employee (first_name, last_name, email, hire_date, department_id, job_role_id) VALUES
('Palak', 'Gupta', 'palak.gupta@company.com', '2021-03-15', 1, 1),
('Satya', 'Nadella', 'satya.nadella@company.com', '2020-07-01', 3, 2),
('Sundar', 'Pichai', 'sundar.pichai@company.com', '2019-11-20', 2, 3),
('Bill', 'Gates', 'bills.gates@company.com', '2022-01-10', 4, 4),
('Sophia', 'Edwin', 'sophia.edwin@company.com', '2018-09-05', 5, 5);

INSERT INTO Salary (employee_id, basic_salary, effective_date) VALUES
(1, 46000.00, '2024-01-01'),
(2, 62000.00, '2024-01-01'),
(3, 54000.00, '2024-01-01'),
(4, 49000.00, '2024-01-01'),
(5, 51000.00, '2024-01-01');

INSERT INTO Attendance (employee_id, attendance_date, status) VALUES
(1, '2024-03-01', 'Present'),
(2, '2024-03-01', 'Present'),
(3, '2024-03-01', 'Absent'),
(4, '2024-03-01', 'Present'),
(5, '2024-03-01', 'Present');

INSERT INTO PerformanceReview (employee_id, review_date, overall_rating, comments) VALUES
(1, '2024-06-30', 4.5, 'Strong leadership and team engagement'),
(2, '2024-06-30', 4.7, 'Excellent technical contribution'),
(3, '2024-06-30', 4.2, 'Consistent analytical performance'),
(4, '2024-06-30', 4.0, 'Good campaign execution'),
(5, '2024-06-30', 4.3, 'Effective operational coordination');

INSERT INTO EmployeeTraining (employee_id, training_id, completion_status) VALUES
(1, 1, 'Completed'),
(2, 2, 'Completed'),
(3, 3, 'Completed'),
(4, 4, 'Completed'),
(5, 5, 'Completed');

INSERT INTO EmployeeSkill (employee_id, skill_id, proficiency_level) VALUES
(1, 1, 'Advanced'),
(2, 2, 'Advanced'),
(3, 3, 'Intermediate'),
(4, 4, 'Intermediate'),
(5, 5, 'Advanced');

INSERT INTO EmployeeProject (employee_id, project_id, assigned_date) VALUES
(1, 1, '2024-01-20'),
(2, 2, '2024-02-05'),
(3, 2, '2024-02-10'),
(4, 3, '2024-03-05'),
(5, 1, '2024-01-25');

INSERT INTO PerformanceCriterion (criterion_name, description) VALUES
('Teamwork', 'Ability to collaborate effectively with colleagues'),
('Technical Skills', 'Demonstrated technical competence'),
('Communication', 'Clarity and effectiveness of communication'),
('Problem Solving', 'Ability to resolve operational challenges');

INSERT INTO EmployeePerformanceCriteria (employee_id, criterion_id, score) VALUES
(1, 1, 4.5),
(2, 2, 4.8),
(3, 4, 4.2),
(4, 3, 4.0),
(5, 1, 4.6);

CREATE VIEW DepartmentSalarySummary AS
SELECT 
    d.department_name,
    COUNT(e.employee_id) AS employee_count,
    SUM(s.basic_salary) AS total_department_salary,
    ROUND(AVG(s.basic_salary), 2) AS average_department_salary
FROM Department d
JOIN Employee e 
    ON d.department_id = e.department_id
JOIN Salary s 
    ON e.employee_id = s.employee_id
GROUP BY d.department_name;

CREATE VIEW TrainingCompletionTrend AS
SELECT 
    tp.training_title,
    YEAR(et.completion_date) AS training_year,
    COUNT(et.employee_id) AS completed_participants
FROM TrainingProgram tp
JOIN EmployeeTraining et
    ON tp.training_id = et.training_id
WHERE et.completion_status = 'Completed'
GROUP BY tp.training_title, YEAR(et.completion_date)
ORDER BY training_year;

CREATE VIEW TrainingParticipationSummary AS
SELECT 
    tp.training_title,
    COUNT(et.employee_id) AS total_participants
FROM TrainingProgram tp
JOIN EmployeeTraining et
    ON tp.training_id = et.training_id
GROUP BY tp.training_title;

SELECT * FROM TrainingParticipationSummary;

SELECT * FROM DepartmentSalarySummary;

SELECT 
    d.department_name,
    ROUND(AVG(pr.overall_rating), 2) AS average_performance_rating
FROM Department d
JOIN Employee e 
    ON d.department_id = e.department_id
JOIN PerformanceReview pr 
    ON e.employee_id = pr.employee_id
GROUP BY d.department_name
HAVING AVG(pr.overall_rating) >= 4;

SELECT 
    e.first_name,
    e.last_name,
    pr.overall_rating,
    CASE
        WHEN pr.overall_rating >= 4.5 THEN 'High Performer'
        WHEN pr.overall_rating >= 3.5 THEN 'Satisfactory Performer'
        ELSE 'Performance Improvement Required'
    END AS performance_category
FROM Employee e
JOIN PerformanceReview pr 
    ON e.employee_id = pr.employee_id;

SELECT 
    e.first_name,
    e.last_name,
    s.basic_salary
FROM Employee e
JOIN Salary s 
    ON e.employee_id = s.employee_id
WHERE s.basic_salary >
(
    SELECT AVG(s2.basic_salary)
    FROM Salary s2
    JOIN Employee e2 
        ON s2.employee_id = e2.employee_id
    WHERE e2.department_id = e.department_id
);

SELECT 
    e.first_name,
    e.last_name,
    d.department_name,
    s.basic_salary,
    RANK() OVER (
        PARTITION BY d.department_name 
        ORDER BY s.basic_salary DESC
    ) AS salary_rank
FROM Employee e
JOIN Department d 
    ON e.department_id = d.department_id
JOIN Salary s 
    ON e.employee_id = s.employee_id;

INSERT INTO Salary (employee_id, basic_salary, effective_date) VALUES
(1, 48000.00, '2025-01-01'),
(2, 65000.00, '2025-01-01'),
(3, 56000.00, '2025-01-01'),
(4, 52000.00, '2025-01-01'),
(5, 54000.00, '2025-01-01');

INSERT INTO PerformanceReview (employee_id, review_date, overall_rating, comments) VALUES
(1, '2025-06-30', 4.7, 'Improved leadership effectiveness'),
(2, '2025-06-30', 4.9, 'Outstanding technical innovation'),
(3, '2025-06-30', 3.9, 'Stable but requires development'),
(4, '2025-06-30', 4.4, 'Strong campaign impact'),
(5, '2025-06-30', 4.6, 'Operational efficiency improved');

INSERT INTO Employee 
(first_name, last_name, email, hire_date, department_id, job_role_id)
VALUES
('Daniel', 'Keller', 'daniel.keller@company.com', '2022-04-12', 4, 2),
('Anna', 'Grade', 'anna.grade@company.com', '2021-08-19', 4, 2),
('Liam', 'Foster', 'liam.foster@company.com', '2020-02-10', 1, 1),
('Maria', 'Ferrero', 'maria.conti@company.com', '2023-01-05', 2, 3);


INSERT INTO Salary (employee_id, basic_salary, effective_date)
VALUES
(6, 61000.00, '2025-01-01'),
(7, 58000.00, '2025-01-01'),
(8, 44000.00, '2025-01-01'),
(9, 59000.00, '2025-01-01');

INSERT INTO PerformanceReview
(employee_id, review_date, overall_rating, comments)
VALUES
(6, '2025-06-30', 4.8, 'Outstanding system optimisation'),
(7, '2025-06-30', 3.6, 'Developing technical proficiency'),
(8, '2025-06-30', 3.2, 'Meets expectations but improvement required'),
(9, '2025-06-30', 4.1, 'Strong financial planning contribution');

SELECT 
    d.department_name,
    ROUND(AVG(pr.overall_rating), 2) AS avg_performance_score
FROM Department d
JOIN Employee e 
    ON d.department_id = e.department_id
JOIN PerformanceReview pr 
    ON e.employee_id = pr.employee_id
GROUP BY d.department_name
HAVING AVG(pr.overall_rating) >= 4.0;

SELECT 
    e.first_name,
    e.last_name,
    pr.overall_rating,
    CASE
        WHEN pr.overall_rating >= 4.5 THEN 'High Performer'
        WHEN pr.overall_rating BETWEEN 3.5 AND 4.49 THEN 'Satisfactory Performer'
        ELSE 'Performance Improvement Required'
    END AS performance_category
FROM Employee e
JOIN PerformanceReview pr
    ON e.employee_id = pr.employee_id
WHERE pr.review_date = (
    SELECT MAX(pr2.review_date)
    FROM PerformanceReview pr2
    WHERE pr2.employee_id = e.employee_id
);

SELECT 
    e.first_name,
    e.last_name,
    sk.skill_name,
    es.proficiency_level,
    p.project_name
FROM Employee e
JOIN EmployeeSkill es 
    ON e.employee_id = es.employee_id
JOIN Skill sk 
    ON es.skill_id = sk.skill_id
JOIN EmployeeProject ep 
    ON e.employee_id = ep.employee_id
JOIN Project p 
    ON ep.project_id = p.project_id
WHERE es.proficiency_level IN ('Advanced');


DELIMITER //

CREATE PROCEDURE GetEmployeePayrollSummary(IN emp_id INT)
BEGIN
    SELECT 
        e.employee_id,
        e.first_name,
        e.last_name,
        s.basic_salary,
        s.effective_date
    FROM Employee e
    JOIN Salary s 
        ON e.employee_id = s.employee_id
    WHERE e.employee_id = emp_id
    ORDER BY s.effective_date DESC
    LIMIT 1;
END //

DELIMITER ;

CALL GetEmployeePayrollSummary(1);

DELIMITER //

CREATE FUNCTION GetPerformanceLabel(rating DECIMAL(3,2))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(50);

    IF rating >= 4.5 THEN
        SET result = 'Excellent';
    ELSEIF rating >= 3.5 THEN
        SET result = 'Good';
    ELSE
        SET result = 'Needs Improvement';
    END IF;

    RETURN result;
END //

DELIMITER ;

SELECT 
    e.first_name,
    e.last_name,
    GetPerformanceLabel(pr.overall_rating) AS performance_status,
    pr.overall_rating,
    pr.review_date
FROM Employee e
JOIN PerformanceReview pr 
    ON e.employee_id = pr.employee_id
WHERE pr.review_date = (
    SELECT MAX(pr2.review_date)
    FROM PerformanceReview pr2
    WHERE pr2.employee_id = e.employee_id
);

SELECT *
FROM Employee e, Department d, Salary s
WHERE e.department_id = d.department_id
AND e.employee_id = s.employee_id;

SELECT 
    e.first_name,
    e.last_name,
    d.department_name,
    s.basic_salary
FROM Employee e
JOIN Department d ON e.department_id = d.department_id
JOIN Salary s ON e.employee_id = s.employee_id;

CREATE INDEX idx_employee_department ON Employee(department_id);
CREATE INDEX idx_salary_employee ON Salary(employee_id);

SHOW INDEX FROM Employee;
SHOW INDEX FROM Salary;

EXPLAIN
SELECT 
    e.first_name,
    e.last_name,
    d.department_name,
    s.basic_salary
FROM Employee e
JOIN Department d ON e.department_id = d.department_id
JOIN Salary s ON e.employee_id = s.employee_id;





