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

* **Main Insight 1 (SLA Performance Crisis):** During the Q1 reporting period, the organization experienced a severe operational bottleneck, resulting in a critical **SLA Compliance rate of just 5.08%**. Out of 2,500 total tasks processed across all workflows, a staggering 2,373 tasks failed to meet their designated timelines, leaving only 127 tasks classified as on-time. This indicates a systemic failure to meet standard operational agreements rather than an isolated departmental issue.

* **Main Insight 2 (Process-Level Friction):** Bottleneck density analysis reveals that operational friction is heavily concentrated in downstream tracking and financial workflows. The single largest driver of administrative drag is the **Review stage of IT Support Tickets**, accounting for 109 delayed tasks (4.59% of all global delays). This is closely followed by **Purchase Order Escalations** at 107 delayed tasks (4.51%) and **Invoice Approval Reviews** at 105 delayed tasks (4.42%), proving that validation and review stages are consistently arresting workflow velocity.

* **Main Insight 3 (Hierarchical Timeline Distortion):** The timeline distortion amplifies as tasks ascend the management hierarchy, revealing an organizational lag in sign-offs. While entry-level tasks face significant delays, **Level 1 approvals** experience an average time variance of **56.40 minutes** past their original estimate across 826 tasks. This variance steadily deteriorates at higher tiers, peaking at **Level 3 approvals** with an average delay of **57.66 minutes** across 853 tasks, showing that executive-level oversight introduces the highest degree of process friction.

* **Main Insight 4 (Systemic Delay Distribution):** Volume distribution across approval layers indicates that the backlog is uniformly distributed, creating equalized friction across the entire business hierarchy. Levels 1, 2, and 3 all handle an almost identical volume of delayed work (ranging between 821 and 853 tasks each) while maintaining a tight, high-variance range of 56.4 to 57.7 minutes per task. This uniformity indicates that the timeline distortion is baked into the baseline operational architecture, requiring structural process re-engineering rather than targeted coaching at a single management tier.
<img width="2115" height="1163" alt="{29214C86-032C-4AAA-B891-A71525D49DB9}" src="https://github.com/user-attachments/assets/148830a9-b8b6-4947-b19b-a5c53bf07bfe" />



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
