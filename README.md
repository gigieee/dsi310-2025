# DSI310_2025 – Data Warehouse Project

## Diagrams

### 1. Chinook (Original ER/Class Diagram)
<img src="images/chinook.png" alt="Chinook Diagram" width="600"/>

### 2. Northwind (Original ER/Class Diagram)
<img src="images/northwind.png" alt="Northwind Diagram" width="600"/>

### 3. Unified Kimball-style Star Schema
<img src="images/starschema.png" alt="Star Schema" width="600"/>

---

## Business Questions (1–3)

### 1). What is the monthly income for each business unit?  
> รายได้รายเดือนของแต่ละ Business Unit คือเท่าไร (รวมค่าส่งแบบ allocate ถ้ามี)

```sql
SELECT
  d.Year,
  d.Month,
  bu.BusinessUnitName,
  SUM(fs.ExtendedAmount + COALESCE(fs.FreightAllocated,0)) AS MonthlyIncome
FROM FactSales fs
JOIN DimDate d           ON fs.DateId = d.DateId
JOIN DimBusinessUnit bu  ON fs.BusinessUnitId = bu.BusinessUnitId
GROUP BY d.Year, d.Month, bu.BusinessUnitName
ORDER BY d.Year, d.Month, bu.BusinessUnitName;
### Results
<img src="images/Q1-result.png" alt="Q1 Result" width="400"/>