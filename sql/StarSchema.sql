SELECT
  d.Year, d.Month,
  bu.BusinessUnitName,
  SUM(fs.ExtendedAmount + COALESCE(fs.FreightAllocated,0)) AS MonthlyIncome
FROM FactSales fs
JOIN DimDate d          ON d.DateId = fs.DateId
JOIN DimBusinessUnit bu ON bu.BusinessUnitId = fs.BusinessUnitId
GROUP BY d.Year, d.Month, bu.BusinessUnitName
ORDER BY d.Year, d.Month, bu.BusinessUnitName;