🚲 Local Bike – dbt Project
Welcome to the Local Bike dbt project! This repository was developed as part of the final case study for the DataBird Analytics Engineer training program. The objective was to transform raw CSV data into clean, structured models using dbt, facilitating the creation of self-service dashboards in Metabase.

📦 Project Overview
This project demonstrates how to:

Clean and transform raw data from multiple CSV files.

Implement a medallion architecture using dbt:

Staging: Clean, normalize, and standardize raw data to ensure consistency and quality.

Intermediate: Perform calculations, aggregations, and advanced transformations.

Mart: Aggregate data ready for consumption by BI tools, enabling precise reporting and analysis.

Create interactive, self-service dashboards in Metabase, allowing end-users to explore data autonomously and gain valuable insights.

🧱 Project Structure
The repository follows a standard dbt structure:

models/

staging/: Contains staging models for initial data cleaning.

intermediate/: Contains intermediate models for complex transformations.

mart/: Contains mart models ready for BI consumption.

seeds/: Contains static reference data loaded into the warehouse.

snapshots/: Tracks slowly changing dimensions over time.

macros/: Contains reusable SQL snippets.

tests/: Contains custom tests for data validation.

🧪 Testing & Documentation
Testing is implemented using:

Generic tests: Uniqueness, not null, accepted values.

Custom tests: Business-specific rules (e.g., revenue > 0).

Documentation is generated via the dbt docs site, including model-level and column-level descriptions.

🚀 Getting Started
To get started with this project:

Clone the repository:

bash
Copier
Modifier
git clone https://github.com/Databirdie/local_bike.git
cd local_bike
Install dependencies:

bash
Copier
Modifier
dbt deps
Set up your profile in ~/.dbt/profiles.yml.

Run the full dbt pipeline:

bash
Copier
Modifier
dbt build
Generate and view documentation:

bash
Copier
Modifier
dbt docs generate
dbt docs serve
🛠️ Tools & Technologies
dbt: For data transformation and modeling.

Metabase: For data visualization and analysis.

Git: For version control and collaboration.

SQL: For querying and advanced transformations.

📊 Dashboards
Interactive dashboards were created in Metabase to monitor Local Bike's performance, including:

Sales tracking over time.

Customer purchasing behavior analysis.

Inventory and stock management.

Performance of different store locations.

🧩 Challenges Encountered
Handling missing values and anomalies in raw data.

Optimizing SQL queries to reduce computation time.

Designing data models tailored to diverse end-user needs.

Feel free to customize this README further to match your project's specifics. If you need assistance generating a dbt_project.yml file or example models with documentation and tests, let me know!
