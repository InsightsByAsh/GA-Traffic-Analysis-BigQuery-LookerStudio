SELECT
  PARSE_DATE('%Y%m%d', date) AS Visit_Date,
  device.deviceCategory AS Device_Type,
  device.browser AS Browser_Name,
  geoNetwork.country AS Country,
  geoNetwork.city AS City,
  COUNT(fullVisitorId) AS Total_Visits,
  SUM(totals.pageviews) AS Total_Pageviews
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20160801' AND '20160831'
  AND geoNetwork.city != '(not set)'
GROUP BY
  Visit_Date,
  Device_Type,
  Browser_Name,
  Country,
  City
ORDER BY
  Visit_Date ASC;