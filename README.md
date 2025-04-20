# local_bike – dbt Project
[![Beautiful image of a bike.](https://media.theradavist.com/uploads/2015/02/Santa_Cruz_Highball_29-17.jpg?fit=2000,2000&quality=75)
## Overview

This repository contains the dbt transformation logic for the **Local Bike** project, which aims to provide analytics-ready datasets to support business decisions for a retail bike company.

The first outcome of this work is a Tableau dashboard available here:  
👉 [Local Bike Cockpit Dashboard](https://public.tableau.com/app/profile/evelyne.rouquet/viz/Localbikecockpitdash/Localbikecockpit)

This dashboard is the **first step of a broader study**. It highlights potential issues related to **product stock availability across different stores**. These findings will guide the **next phase of the project**, focused on a detailed **stock-level analysis per store**.

## Tech Stack

- **dbt-core**
- **PostgreSQL** (or specify your warehouse: BigQuery, Snowflake, etc.)
- **Tableau** (for visualization)

## Project Structure

The dbt project follows a modular and layered architecture:

- `models/staging`: Standardized staging models, one per source table.
- `models/marts`: Final models used for analytics and dashboards.
- `models/intermediate`: Intermediate transformations used for modularity and reusability.

## How to Run This Project

### Prerequisites

- Python 3.8+
- dbt-core installed (`pip install dbt-core` or via a specific adapter like `dbt-postgres`)
- A properly configured `profiles.yml` file to connect to your data warehouse

### Setup

```bash
git clone https://github.com/Databirdie/local_bike.git
cd local_bike
dbt deps
dbt seed
dbt run
dbt test
Next Steps
```
Following the initial insights surfaced by the dashboard, the next stage of the project will include:

- **In-depth analysis** of stock availability per store

- **Identification of recurring patterns** or inefficiencies in inventory management

- **Recommendations** for improving stock distribution and availability

Contact
For more details or questions, feel free to reach out via GitHub Issues.
