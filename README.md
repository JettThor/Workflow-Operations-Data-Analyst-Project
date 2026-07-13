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
<img width="2115" height="1163" alt="{29214C86-032C-4AAA-B891-A71525D49DB9}" src="https://github.com/user-attachments/assets/148830a9-b8b6-4947-b19b-a5c53bf07bfe" />

### Category 1: SLA Compliance & Bottleneck Analysis

* **Main Insight 1 (SLA Performance Crisis):** During the Q1 reporting period, the organization experienced a severe operational bottleneck, resulting in a critical **SLA Compliance rate of just 5.08%**. Out of 2,500 total tasks processed across all workflows, a staggering 2,373 tasks failed to meet their designated timelines, leaving only 127 tasks classified as on-time. This indicates a systemic failure to meet standard operational agreements rather than an isolated departmental issue.

* **Main Insight 2 (Process-Level Friction):** Bottleneck density analysis reveals that operational friction is heavily concentrated in downstream tracking and financial workflows. The single largest driver of administrative drag is the **Review stage of IT Support Tickets**, accounting for 109 delayed tasks (4.59% of all global delays). This is closely followed by **Purchase Order Escalations** at 107 delayed tasks (4.51%) and **Invoice Approval Reviews** at 105 delayed tasks (4.42%), proving that validation and review stages are consistently arresting workflow velocity.

* **Main Insight 3 (Hierarchical Timeline Distortion):** The timeline distortion amplifies as tasks ascend the management hierarchy, revealing an organizational lag in sign-offs. While entry-level tasks face significant delays, **Level 1 approvals** experience an average time variance of **56.40 minutes** past their original estimate across 826 tasks. This variance steadily deteriorates at higher tiers, peaking at **Level 3 approvals** with an average delay of **57.66 minutes** across 853 tasks, showing that executive-level oversight introduces the highest degree of process friction.

* **Main Insight 4 (Systemic Delay Distribution):** Volume distribution across approval layers indicates that the backlog is uniformly distributed, creating equalized friction across the entire business hierarchy. Levels 1, 2, and 3 all handle an almost identical volume of delayed work (ranging between 821 and 853 tasks each) while maintaining a tight, high-variance range of 56.4 to 57.7 minutes per task. This uniformity indicates that the timeline distortion is baked into the baseline operational architecture, requiring structural process re-engineering rather than targeted coaching at a single management tier.




### Category 2: Resource Capacity & Workload Balance

<img width="2120" height="1163" alt="{49091013-0D6D-4120-9041-172290CA7E26}" src="https://github.com/user-attachments/assets/997bcec7-3956-4bee-9682-bf1208921cf3" />

* **Main Insight 1 (Volume-Insensitive Delay Flatline):** Time-series analysis reveals that the organization’s operational friction is completely decoupled from seasonal volume fluctuations. Throughout the 12-month cycle, monthly task volume fluctuated between a low of 183 tasks (April) and a peak of 235 tasks (March). Despite these changes in demand, the delay rate remained alarmingly flat and systemic, tightly constrained within a narrow margin between **92.89% and 96.62%** every single month. This proves the backlog is driven by structural workflow design rather than temporary spikes in business volume.

* **Main Insight 2 (The Overload Capacity Paradox):** Aggregating employee performance into operational capacity tiers reveals a striking paradox: increasing an individual's workload does not degrade their relative performance. Employees classified under the **Medium workload band** (779 total tasks) carried the highest failure rate with a **95.25% delay rate**, while employees pushed into the **Overloaded band** (492 total tasks) actually demonstrated the lowest comparative friction with a **94.31% delay rate**. Because the delay rate stays hovering around 94%–95% across all bands (Low, Medium, High, Overloaded), it is clear that individual worker fatigue is not the root cause; the processes themselves are structurally broken.

* **Main Insight 3 (Granular Resource Equalization):** Individual resource tracking across all 150 active employees further confirms that operational gridlock is fully institutionalized. The company's highest-capacity worker, **EMP_28** (handling the maximum load of 30 tasks), maintained a **90.00% delay rate**. Meanwhile, mid-tier workers like EMP_16, EMP_115, and EMP_25 (handling 23 tasks each) hit absolute failure floors with **100.00% delay rates**. The fact that no single employee out of 150 can achieve a healthy on-time delivery rate proves that personnel changes or individual talent re-allocation will not solve the crisis.

* **Main Insight 4 (Microscopic Efficiency Margins):** A deep dive into individual task efficiency reveals that when a process manages to execute successfully, its positive margin is entirely negligible compared to the scale of the delays. Out of 2,500 total rows processed, the absolute best-performing records in the database (such as TASK_1665 and TASK_2037) only managed to beat their timeline estimates by a microscopic **5 minutes**. When contrasted against the global average delay baseline of roughly 54 to 58 minutes over-schedule, these minor "efficient" outliers fail to provide any meaningful operational offset.





### Category 3: Cost-to-Serve Optimization

<img width="2120" height="1161" alt="{B315EA26-3BF1-419C-B219-9B47FAD3233D}" src="https://github.com/user-attachments/assets/8eca82af-d5ea-4f17-a9a3-d896ee5e36e0" />

* **Main Insight 1 (The Severe Performance-to-Cost Disconnect):** Financial aggregate analysis reveals a massive capital expenditure mismatch. The organization spent a total of **$694,941.77** across the 2,500 processed tasks. Despite this significant financial commitment, the SLA compliance rate sits at an abysmal **5.08%**, with only 127 tasks finishing on time out of the 2,500 total. This proves that high spending is completely failing to drive operational velocity or timely fulfillment.

* **Main Insight 2 (Homogenized Departmental Cost Allocation):** Operational cost structures are almost perfectly flat across the entire company, indicating systemic enterprise-wide cost inflation rather than a single bottleneck department. **Operations** demands the highest capital allocation at **$141,783.76**, tightly followed by **IT** ($140,654.50), **HR** ($139,109.55), and **Finance** ($138,633.01). Even the lowest-cost business unit, **Customer Service**, requires **$134,760.95**. The narrow $7,022 variance between the highest and lowest departments demonstrates that cost-to-serve friction is fully institutionalized.

* **Main Insight 3 (Flat Unit Economics Across Task Categories):** Granular tracking of individual task types confirms that no matter the nature of the work, the cost baseline remains stubbornly high, averaging **$277.98 per task** globally. **Validation** tasks are the most expensive to execute, averaging **$285.44**, with **Review** ($282.72) and **Approval** ($281.41) close behind. Even the least complex task type, **Data Entry**, carries a substantial unit cost of **$268.86**, leaving no room for quick or cheap operational wins under the current system structure.

* **Main Insight 4 (Premium Price for Friction):** Combining the macro operational metrics with unit costs reveals that the organization is effectively paying a premium rate for delays. Because every task type hovers between $268 and $285, and 94.92% of all tasks are delayed, the company is absorbing roughly **$277.98 in overhead per task** for a process that will almost certainly fail its delivery deadline. The lack of cost elasticity across departments or task types confirms that the financial model is completely decoupled from performance outcomes.



## Recommendations

Based on the insights and findings above, we recommend the executive leadership and operational excellence teams consider the following tactical actions:

* **Implement SLA Triaging & Threshold Restructuring:** With a dismal **5.08% global SLA compliance rate**, the current performance windows are fundamentally unrealistic or deeply bottlenecked. **Recommendation:** Audit the baseline time requirements for complex task types like *Validation* and *Review*, and implement automated alerts when a task approaches **80%** of its allotted SLA window to prevent systemic delays.
* **Standardize High-Volume Task Automation:** The organization is absorbing a massive **$268.86 unit cost for Data Entry tasks**, a process traditionally ripe for automation. **Recommendation:** Transition manual input pipelines into an Automated Document Processing (ADP) or Robotic Process Automation (RPA) workflow to slash unit economics by an estimated 40–50% and free up human bandwidth for high-priority bottlenecks.
* **Target Bottlenecks in Highest-Spend Departments:** Capital expenditure is heavily concentrated in **Operations ($141,783.76)** and **IT ($140,654.50)**. **Recommendation:** Conduct a granular time-motion study specifically within these two business units to identify why their processing speeds do not match their high capital allocations.
* **Introduce Performance-Linked Financial Guardrails:** Currently, unit costs remain completely flat (hovering around **$277.98 per task**) regardless of whether a task is delivered on time or delayed. **Recommendation:** Restructure vendor agreements or departmental resource allocation to introduce efficiency incentives, ensuring that premium cost-to-serve structures are only sustained for high-velocity outputs.

---

## Assumptions and Caveats

Throughout the analysis, multiple assumptions were made to manage challenges with the dataset and establish clean definitions. These assumptions and caveats are noted below:

* **Definition of SLA Breach:** It is assumed that any record flagged with `is_delayed = true` represents a clear breach of standard operating agreements, irrespective of the scale of the delay (e.g., a task delayed by 5 minutes is structurally evaluated the same as a task delayed by 5 days due to data constraints).
* **Homogeneous Resource Expenses:** The `cost_per_task` calculation assumes flat resource usage across the lifecycle of a task type. In a live production environment, edge-case escalations would typically incur variable compounding costs, which are not captured in this aggregate view.
* **Static Operational Scale:** The data evaluates a fixed subset of 2,500 processed tasks. The analysis assumes this sample size is a mathematically representative reflection of regular enterprise performance and free from extreme seasonal anomalies or hardware downtimes.
