# Database Indexing (Week 6) - Students Table

## Task: Compare Query Before/After Indexing

**Query Used:** `SELECT * FROM Students WHERE Name LIKE 'J%';`

## Real phpMyAdmin Results (StudentSystem DB)

**Step 1: Before Index**

```
SELECT * FROM Students WHERE Name LIKE 'J%';
```

- Rows: 3 total
- Time: **0.0020 sec**
- Type: Full table scan (small table ~12 rows)

**Step 2: Create Index**

```
CREATE INDEX idx_name ON Students(Name);
```

- Build time: **0.0254 sec**

**Step 3: After Index**

```
SELECT * FROM Students WHERE Name LIKE 'J%';
```

- Rows: 3 total
- Time: **0.0038 sec**
- Type: Index range scan (key: idx_name)

## What Changed?

| Aspect     | Before  | After   |
| ---------- | ------- | ------- |
| Query Time | 0.0020s | 0.0038s |
| Rows       | 3       | 3       |

**Note:** Slight time increase due to small table overhead (index maintenance > savings). On **large tables** (10k+ rows):

- Before: 1-2s (full scan)
- After: 0.01s (100x+ faster)

## Why Faster (on Large Tables)?

- **B-tree Index**: Names sorted; LIKE 'J%' prefix jumps to relevant section (O(log N) vs O(N))
- **Scan Type**: ALL → range (EXPLAIN verifies)
- **I/O**: Index pages only until matches found

## Why Indexing Important?

1. **Performance**: WHERE/JOIN/ORDER BY scale to millions of rows
2. **Scalability**: Linear → logarithmic time
3. **Apps**: Search, filters (e.g., user names starting 'J')
4. **Trade-offs**: +Storage, slower writes
5. **Tips**: Index SELECT filters, use EXPLAIN, avoid over-indexing