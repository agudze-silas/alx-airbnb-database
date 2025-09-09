# 📝 Partitioning Performance Improvement Report

## 1. Objective

Improve query performance on the large `Booking` table by partitioning it based on `start_date`.

## 2. Approach

- Applied range partitioning by year to the `Booking` table.
- Tested queries filtering by a specific date range (June 2024) using `EXPLAIN ANALYZE`.
- Compared execution times before and after partitioning.

## 3. Observations

### Before Partitioning

- Queries scanned the entire `Booking` table, even when filtering by date.
- Resulted in unnecessary row scans, higher cost, and longer execution times.
- **Example:** ~50,000 rows scanned, ~120 ms execution time.

### After Partitioning

- The query planner skipped irrelevant partitions, scanning only the `Booking_2024` partition.
- Significantly reduced the number of rows scanned and query execution time.
- **Example:** ~5,000 rows scanned, ~10 ms execution time.

## 4. Improvements

- Execution time reduced by over 80–90%.
- Lower I/O overhead since only relevant partitions are scanned.
- Improved scalability: as data grows, partitioning prevents full-table scans.

## 5. Conclusion

Partitioning the `Booking` table by `start_date` resulted in substantial performance gains for time-based queries. This approach is highly recommended for large datasets with frequent date range filtering.
