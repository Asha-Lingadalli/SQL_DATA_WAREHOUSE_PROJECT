
/*****************************************************************************************
 PostgreSQL CSV Data Loading Script
 -----------------------------------------------------------------------------------------
 Author   : Your Name
 Purpose  : Load CSV datasets into PostgreSQL bronze tables
 Usage    : This script is designed to be run in the PostgreSQL terminal (psql).
 
 IMPORTANT:
 1. This script uses `\copy` which is a **psql command**, not plain SQL.
    - That means it MUST be run inside the terminal using `psql`.
    - It will NOT work directly in GUI tools like DBeaver, PgAdmin, or DataGrip.
 
 2. Before running this script:
    - Make sure the target tables (bronze.*) already exist in your database.
    - Update the file paths if your CSV files are stored in a different location.
 
 -----------------------------------------------------------------------------------------
 HOW TO RUN:
 -----------------------------------------------------------------------------------------
 Step 1: Open your terminal on Mac.
 Step 2: Connect to PostgreSQL with:
         psql -U yourusername -d yourdatabase
 Step 3: Inside the psql shell, run this script with:
         \i /full/path/to/load_all_data.sql
         (example: \i /Users/Ashalingadalli/Downloads/sql-data-warehouse-project/load_all_data.sql)
 Step 4: The script will:
         - Truncate each table
         - Load data from CSV files into the table
         - Show row counts or sample records
 *****************************************************************************************/


-- =====================================================================
-- CRM Customer Info
-- =====================================================================
TRUNCATE TABLE bronze.crm_cust_info;
\copy bronze.crm_cust_info 
FROM '/Users/Ashalingadalli/Downloads/sql-data-warehouse-project/datasets/source_crm/cust_info.csv' 
DELIMITER ',' CSV HEADER;
SELECT COUNT(*) AS cust_info_count FROM bronze.crm_cust_info;


-- =====================================================================
-- CRM Product Info
-- =====================================================================
TRUNCATE TABLE bronze.crm_prd_info;
\copy bronze.crm_prd_info 
FROM '/Users/Ashalingadalli/Downloads/sql-data-warehouse-project/datasets/source_crm/prd_info.csv' 
DELIMITER ',' CSV HEADER;
SELECT COUNT(*) AS prd_info_count FROM bronze.crm_prd_info;
SELECT * FROM bronze.crm_prd_info LIMIT 10;


-- =====================================================================
-- CRM Sales Details
-- =====================================================================
TRUNCATE TABLE bronze.crm_sales_details;
\copy bronze.crm_sales_details 
FROM '/Users/Ashalingadalli/Downloads/sql-data-warehouse-project/datasets/source_crm/sales_details.csv' 
DELIMITER ',' CSV HEADER;
SELECT * FROM bronze.crm_sales_details LIMIT 10;


-- =====================================================================
-- ERP Customer Info
-- =====================================================================
TRUNCATE TABLE bronze.erp_cust_az12;
\copy bronze.erp_cust_az12 
FROM '/Users/Ashalingadalli/Downloads/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv' 
DELIMITER ',' CSV HEADER;
SELECT * FROM bronze.erp_cust_az12 LIMIT 10;


-- =====================================================================
-- ERP Location Info
-- =====================================================================
TRUNCATE TABLE bronze.erp_loc_a101;
\copy bronze.erp_loc_a101 
FROM '/Users/Ashalingadalli/Downloads/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv' 
DELIMITER ',' CSV HEADER;
SELECT * FROM bronze.erp_loc_a101 LIMIT 10;


-- =====================================================================
-- ERP Product Category Info
-- =====================================================================
TRUNCATE TABLE bronze.erp_px_cat_g1v2;
\copy bronze.erp_px_cat_g1v2 
FROM '/Users/Ashalingadalli/Downloads/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv' 
DELIMITER ',' CSV HEADER;
SELECT * FROM bronze.erp_px_cat_g1v2 LIMIT 10;

-- =====================================================================
-- END OF SCRIPT
-- =====================================================================
