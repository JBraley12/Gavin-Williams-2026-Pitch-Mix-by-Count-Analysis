SELECT
    balls, strikes, pitch_type, pitch_name,
    COUNT(*) AS pitch_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY balls, strikes), 1) AS pct_of_count
FROM statcast
WHERE pitcher = 668909
GROUP BY balls, strikes, pitch_type, pitch_name
ORDER BY balls, strikes, pitch_count DESC;
