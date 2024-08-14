Issue Summary:

Duration: The outage lasted for 3 hours and 45 minutes, starting at 11:30 AM and ending at 3:15 PM UTC on August 12, 2024.
Impact: The payment processing system was down during this period, leading to failed transactions and an inability for users to complete purchases. Approximately 80% of our users were affected, resulting in a significant disruption in service.
Root Cause: The issue was caused by an unplanned memory leak in the payment gateway’s API, which overwhelmed the server resources and led to a system crash.
Timeline:
11:35 AM: Issue detected via automated monitoring alert indicating a spike in payment failures.
11:40 AM: Engineering team receives the alert and begins investigating payment logs for root cause analysis.
12:00 PM: Initial assumption was a network issue; the networking team was contacted to review logs and performance metrics.
12:15 PM: Networking team reports no anomalies; focus shifts to the application layer.
12:30 PM: Application logs reveal increasing memory usage on the payment gateway server.
12:45 PM: Memory leak suspected; the incident is escalated to the DevOps team to analyze memory consumption.
1:15 PM: DevOps confirms the memory leak but mistakenly attributes it to a database connection issue; database team investigates.
2:00 PM: Database team finds no issues; focus returns to the payment gateway.
2:30 PM: Full analysis identifies the memory leak within a recently deployed API update.
2:45 PM: The faulty update is rolled back.
3:00 PM: Payment processing system begins to recover.
3:15 PM: Full service is restored, and transaction processing returns to normal.
Root Cause and Resolution:
Root Cause:
The root cause was a memory leak introduced by a recent update to the payment gateway’s API. The update inadvertently caused persistent memory allocation without proper release, gradually consuming all available server memory. As the memory was exhausted, the server became unresponsive, causing the payment gateway to fail and resulting in widespread transaction failures.

Resolution:
The issue was resolved by rolling back the API update to the previous stable version, which did not exhibit the memory leak. The rollback immediately stabilized the system, allowing memory resources to recover and the payment processing service to resume normal operations.

Corrective and Preventative Measures:
Improvements/Fixes:

API Code Review: Conduct a thorough code review of the payment gateway API, focusing on memory management practices.
Memory Monitoring: Implement enhanced monitoring on server memory usage with alerts for unusual consumption patterns.
Staged Rollouts: Adopt a more gradual deployment process with staged rollouts to catch issues in a controlled environment before full production.
Load Testing: Increase the frequency and scope of load testing, specifically targeting memory utilization under high transaction volumes.
TODO List:

Patch the payment gateway API to address the memory leak.
Add detailed memory usage monitoring and alerting in the production environment.
Implement a rollback plan as part of the deployment process for critical systems.
Schedule regular training sessions for the engineering team on identifying and managing memory-related issues.
Conduct a post-deployment review after every major update to detect potential issues early.
