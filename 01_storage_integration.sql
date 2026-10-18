-- =====================================================================
-- Step 1: Storage integration (lets Snowflake read from the S3 bucket)
-- =====================================================================
-- Replace the <PLACEHOLDERS> with your own values before running.
-- <AWS_ACCOUNT_ID> = your 12-digit AWS account number
-- <ROLE_NAME>      = the IAM role you created for Snowflake

CREATE OR REPLACE STORAGE INTEGRATION PBI_Integration
    TYPE = EXTERNAL_STAGE
    STORAGE_PROVIDER = 'S3'
    ENABLED = TRUE
    STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::<AWS_ACCOUNT_ID>:role/<ROLE_NAME>'
    STORAGE_ALLOWED_LOCATIONS = ('s3://powerbi.1stproject/')
    COMMENT = 'Integration between Snowflake and the rainfall S3 bucket';

-- Describe the integration object.
-- Copy STORAGE_AWS_IAM_USER_ARN and STORAGE_AWS_EXTERNAL_ID from the output
-- into the IAM role's trust policy in AWS (see aws/trust_policy.example.json).
DESC INTEGRATION PBI_Integration;

-- DROP INTEGRATION PBI_Integration;
