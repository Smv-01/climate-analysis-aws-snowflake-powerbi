-- =====================================================================
-- Step 4: Add grouping columns (Year_Group and rainfall_groups)
-- =====================================================================

-- ---- Year groups -------------------------------------------------------
ALTER TABLE agriculture
ADD Year_Group STRING;

UPDATE agriculture
SET Year_Group = 'Y1'
WHERE Year >= 2004 AND Year <= 2009;

UPDATE agriculture
SET Year_Group = 'Y2'
WHERE Year >= 2010 AND Year <= 2015;

UPDATE agriculture
SET Year_Group = 'Y3'
WHERE Year >= 2016 AND Year <= 2019;

-- ---- Rainfall groups ---------------------------------------------------
ALTER TABLE agriculture
ADD rainfall_groups STRING;

UPDATE agriculture
SET rainfall_groups = 'Low'
WHERE rainfall >= 255 AND rainfall < 1200;

UPDATE agriculture
SET rainfall_groups = 'Medium'
WHERE rainfall >= 1200 AND rainfall < 2800;

UPDATE agriculture
SET rainfall_groups = 'High'
WHERE rainfall >= 2800;

-- Final table used by Power BI
SELECT * FROM agriculture;
