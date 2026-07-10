# Workflow Operations Optimization Analysis

## Project Background

This project analyzes an enterprise workflow operations dataset containing transactional logs across multiple core corporate departments, task types, urgency layers, and resource allocations. The objective was to develop an end-to-end data pipeline and analytical framework that enables stakeholders to monitor Service Level Agreement (SLA) compliance, pinpoint operational bottlenecks, and identify opportunities for resource optimization.

Using Excel for initial data hygiene, PostgreSQL for deep-dive aggregation, and Tableau for data visualization, raw transactional logs were transformed into actionable operational intelligence. The analysis focuses on task-level efficiency, employee workload balance, departmental throughput, and the financial impact of operational delays.

Insights and recommendations are provided across the following key areas:

* **SLA Compliance & Bottleneck Analysis:** Evaluation of delayed tasks to identify which specific task types and approval levels cause the highest frequency of baseline target breaches.
* **Resource Capacity & Workload Balance:** Assessment of how increasing employee task volumes impacts true processing speed, establishing the threshold for peak operational efficiency before performance degrades.
* **Cost-to-Serve Optimization:** Financial tracking of cumulative operational costs by department to identify high-expense workflows and drive process-streamlining strategies.

An interactive Tableau dashboard used to report and explore these operational metrics can be found [here](https://public.tableau.com/app/profile/jett.thor/viz/WorkflowOperationsOptimizationAnalysis/OverallVisual).

The complete SQL script containing the queries used for data aggregation, view creations, and answering key business performance metrics can be found [here](./SQL/queries.sql).



# Data Structure & Initial Checks

The companies main database structure as seen below consists of four tables: Department, Processes, Employees, and Tasks with a total row count of 2,500 records.

<img width="868" height="673" alt="{CC342971-1EC7-443D-859A-6DF1CB06AE6D}" src="https://github.com/user-attachments/assets/ef854cf8-734f-461a-adea-d742c8b41422" />



# Executive Summary

### Overview of Findings

<img width="2118" height="1162" alt="{20C1C1D9-07FC-4E99-8A90-F03323A9F994}" src="https://github.com/user-attachments/assets/500b1dd4-b1a3-45e4-8c97-76f04bc3faae" />

* Systemic Underestimation and Delay Epidemic: An overwhelming 96.5% of all tasks are delayed, with processes taking an average of 48.7 minutes longer than anticipated. This points to a foundational flaw in how project baselines are estimated rather than isolated employee underperformance.
* Critical Bottlenecks in HR & IT: The HR Onboarding and IT Support Ticket workflows are the primary drivers of operational drag, averaging 62.6 and 56.3 minutes of overtime per task respectively, making them the highest priority targets for process automation or restructuring.
* Severe Friction in Critical-Priority Workflows: High-urgency tasks are failing to cut through the noise, with Critical priority assignments experiencing the worst delays of all, averaging 64.4 minutes of overtime. This directly compromises business agility and inflates the operational cost of time-sensitive tasks.



# Insights Deep Dive
### Category 1: SLA Compliance & Bottleneck Analysis

- Q1: SLA Compliance % (Executive KPI)
- Q3: Top Delay-Causing Processes
- Q5: Actual vs. Estimated Time Variance by Approval Level

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 1]


### Category 2: Resource Capacity & Workload Balance

- Q2: Monthly Task Volume / Monthly Delay % Trends
- Q6: Priority Level Efficiency (Task throughput speed)
- Q8: Employee Workload vs. Delay Risk Threshold

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 2]


### Category 3: Cost-to-Serve Optimization

- Q1: Total Operational Cost (Executive KPI)
- Q4: Top High-Cost Departments
- Q7: Average Cost Per Task

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 3]




# Recommendations:

Based on the insights and findings above, we would recommend the [stakeholder team] to consider the following: 

* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  


# Assumptions and Caveats:

Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below:

* Assumption 1 (ex: missing country records were for customers based in the US, and were re-coded to be US citizens)
  
* Assumption 1 (ex: data for December 2021 was missing - this was imputed using a combination of historical trends and December 2020 data)
  
* Assumption 1 (ex: because 3% of the refund date column contained non-sensical dates, these were excluded from the analysis)
