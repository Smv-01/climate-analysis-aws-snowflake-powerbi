-- =====================================================================
-- Step 3: Transformations
-- =====================================================================
-- The raw table (PBI_Dataset) is kept as-is. All changes are made on a copy.
-- NOTE: run the two UPDATE statements only ONCE, otherwise the scaling
-- is applied twice. To start over, re-run the CREATE OR REPLACE below.

CREATE OR REPLACE TABLE agriculture AS
SELECT * FROM PBI_Dataset;

SELECT * FROM agriculture;

-- Scale rainfall up by 10%
UPDATE agriculture
SET rainfall = 1.1 * rainfall;

-- Scale area down by 10%
UPDATE agriculture
SET area = 0.9 * area;
