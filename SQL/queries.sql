-- Executive KPI Cards
-- Query below shows SLA Compliance % & Total Operational Cost Q1

CREATE VIEW vw_SLA_Performance AS
SELECT 
    -- 1. query to get the On-Time count
    (SELECT COUNT(*) FROM workflow_operations WHERE is_delayed = false) AS on_time_tasks,
    
    -- 2. query to get the Total count
    (SELECT COUNT(*) FROM workflow_operations) AS total_tasks,
    
    -- 3. The exact same queries divided by each other
    (
        (SELECT COUNT(*) FROM workflow_operations WHERE is_delayed = false) * 100.0 
        / 
        (SELECT COUNT(*) FROM workflow_operations)
    ) AS sla_compliance_percentage;



-- Query below shows Average Cost Per Task Q7
CREATE VIEW vw_Average_Cost_Per_Task AS
SELECT
    avg(cost_per_task) as average_cost_per_task
FROM
    workflow_Operations


-- Query below shows Average Cost Per Task type

CREATE VIEW vw_average_cost_per_task_Type AS
SELECT
	distinct (task_type),
	avg(cost_per_task) as average_cost
FROM
	workflow_Operations
GROUP BY task_type

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Operational & Delay Trends
-- Monthly Task Volume / Monthly Delay % Trends Q2
CREATE VIEW vw_monthly_task_stats AS
SELECT 
    start_year, 
    start_month, 
    COUNT(task_id) AS monthly_task_volume, -- This is the montly task volume
    SUM(CASE WHEN is_delayed = 'true' THEN 1 ELSE 0 END) * 100.0 / COUNT(task_id) AS delay_percentage
FROM 
    workflow_operations
GROUP BY 
    start_year, 
    start_month;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Bottleneck & Process Analysis
-- Query below shows Top Delay-Causing Processes Q3 

CREATE VIEW vw_Top_delays AS
SELECT 
    task_type,
    process_name,
    COUNT(*) AS total_delayed_tasks,
    (COUNT(*) * 100.0 / SUM(COUNT(*)) OVER()) AS percent_of_total_delays
FROM 
    workflow_operations
WHERE 
    is_delayed = True
GROUP BY 
    task_type,
    process_name
ORDER BY 
    total_delayed_tasks DESC;



-- Query below shows Actual vs. Estimated Time Variance by Approval Level Q5

CREATE VIEW vw_time_variance_by_approval AS
select
	AVG(actual_time_minutes - estimated_time_minutes) AS AVG_time_difference,
	approval_level,
	COUNT(*) as Total_tasks
FROM
	workflow_operations
GROUP BY 
	approval_level
ORDER BY
	AVG_time_difference DESC


-- Query below shows Priority Level Efficiency Q6

CREATE VIEW vw_Priority_Level_Efficiency AS
SELECT
	task_id,
	priority_level,
	estimated_time_minutes,
	actual_time_minutes,
	(estimated_time_minutes - actual_time_minutes) as "time difference per task",
case 
	when (estimated_time_minutes - actual_time_minutes)<= -1 THEN 'Inefficient'
	when (estimated_time_minutes - actual_time_minutes)>= 1 THEN 'Efficient'
	ELSE 'Neutral' END AS efficiency_category
FROM
	workflow_Operations
ORDER BY "time difference per task" DESC;



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Departmental Cost Allocation
-- Query below shows Top High-Cost Departments Q4

CREATE VIEW vw_departmental_cost_summary AS
SELECT
	distinct (department),
	sum(cost_per_task) as total_cost
FROM
	workflow_Operations
GROUP BY 
    department
ORDER BY 
    total_cost DESC
	


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Capacity & Resource Planning
-- Query below shows Employee Workload vs. Delay Risk Threshold Q8


-- Delay Risk Threshold query

CREATE VIEW vw_Delay_Risk_Threshold AS
SELECT 
    workload_band, 
    COUNT(task_id) AS total_tasks_in_band,
    (SUM(CASE WHEN is_delayed = TRUE THEN 1 ELSE 0 END) * 1.0 / COUNT(task_id)) AS delay_rate
FROM 
    workflow_operations
GROUP BY 
    workload_band
ORDER BY 
    delay_rate DESC;


-- Employee Workload query

CREATE VIEW Employee_Workload AS
SELECT 
    (SUM(CASE WHEN is_delayed = TRUE THEN 1 ELSE 0 END) * 1.0 / COUNT(task_id)) AS delay_rate
FROM 
    workflow_operations;

SELECT 
    assigned_employee_id, 
    COUNT(task_id) AS employee_workload,
    (SUM(CASE WHEN is_delayed = TRUE THEN 1 ELSE 0 END) * 1.0 / COUNT(task_id)) AS delay_rate
FROM 
    workflow_operations
GROUP BY 
    assigned_employee_id
ORDER BY 
    employee_workload DESC;




/* 
Executive KPI Cards: Q1 (SLA Compliance % & Total Operational Cost) & Q7 (Average Cost Per Task) DONE

Operational & Delay Trends: Q2 (Monthly Task Volume / Monthly Delay % Trends)

Bottleneck & Process Analysis: Q3 (Top Delay-Causing Processes), Q5 (Actual vs. Estimated Time Variance by Approval Level), & Q6 (Priority Level Efficiency)

Departmental Cost Allocation: Q4 (Top High-Cost Departments)

Capacity & Resource Planning: Q8 (Employee Workload vs. Delay Risk Threshold)
*/
