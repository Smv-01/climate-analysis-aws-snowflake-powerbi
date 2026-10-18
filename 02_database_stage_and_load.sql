-- =====================================================================
-- Step 2: Create database, table and stage, then load the CSV from S3
-- =====================================================================

-- DROP DATABASE PowerBI;
CREATE DATABASE PowerBI;

CREATE SCHEMA PBI_Data;

CREATE TABLE PBI_Dataset (
    Year         INT,
    Location     STRING,
    Area         INT,
    Rainfall     FLOAT,
    Temperature  FLOAT,
    Soil_type    STRING,
    Irrigation   STRING,
    yeilds       INT,
    Humidity     FLOAT,
    Crops        STRING,
    price        INT,
    Season       STRING
);

SELECT * FROM PBI_Dataset;

-- External stage pointing at the S3 bucket, using the storage integration
CREATE STAGE PowerBI.PBI_Data.pbi_stage
    URL = 's3://powerbi.1stproject'
    STORAGE_INTEGRATION = PBI_Integration;

-- Check that Snowflake can see the file(s) in the bucket
LIST @pbi_stage;

-- Load the data
COPY INTO PBI_Dataset
FROM @pbi_stage
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
ON_ERROR = 'continue';

-- Sanity check: row count per year
SELECT Year, COUNT(*) AS Count
FROM PBI_Dataset
GROUP BY Year
ORDER BY Year;
