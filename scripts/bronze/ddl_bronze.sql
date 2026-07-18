/*
=======================================================================
DDL Script: Create Bronze Table
=======================================================================
Script Purpose:
This script creates tables in the "bronze" schema, dropping existing tables if they already exists.
Run this script to re-define the DDL Structure of "bronze" tables
=======================================================================
*/


CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	BEGIN TRY 
		SET @start_time=GETDATE();
		TRUNCATE TABLE bronze.crm_cust_info
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\CAN\OneDrive\Desktop\DATA ANALYST\SQL\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		)
		SELECT
		COUNT(*)
		FROM bronze.crm_cust_info

		TRUNCATE TABLE bronze.crm_prd_info
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\CAN\OneDrive\Desktop\DATA ANALYST\SQL\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		)
		SELECT 
		COUNT(*)
		FROM bronze.crm_prd_info

		TRUNCATE TABLE bronze.crm_sales_details
		BULK INSERT bronze.crm_sales_details 
		FROM'C:\Users\CAN\OneDrive\Desktop\DATA ANALYST\SQL\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
			)
		SELECT
		COUNT(*)
		FROM bronze.crm_sales_details

		TRUNCATE TABLE bronze.erp_cust_az12
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\CAN\OneDrive\Desktop\DATA ANALYST\SQL\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
			)
		SELECT
		COUNT(*)
		FROM bronze.erp_cust_az12

		TRUNCATE TABLE bronze.erp_loc_a101
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\CAN\OneDrive\Desktop\DATA ANALYST\SQL\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		)
		SELECT 
		COUNT(*)
		FROM bronze.erp_loc_a101

		TRUNCATE TABLE bronze.erp_px_cat_g1v2
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\CAN\OneDrive\Desktop\DATA ANALYST\SQL\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK)
		SELECT
		COUNT(*)
		FROM bronze.erp_px_cat_g1v2
		SET @end_time=GETDATE()
	END TRY
	BEGIN CATCH 
	PRINT'======================='
	PRINT'ERROR OCCURED DURING BRONZE LAYER'
	PRINT'Error Massage'+ERROR_MESSAGE();
	PRINT'Error Message'+CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message'+ CAST(ERROR_NUMBER() AS NVARCHAR)
	END CATCH
END
