# 🕵️‍♂️ SQL Murder Mystery - Investigation and Solution

## 📌 Project Overview
The objective of this SQL investigation was to identify the person responsible for a murder that occurred in SQL City on **15 January 2018**. 

The investigation involved querying a SQLite database containing several core tables: `crime_scene_report`, `drivers_license`, `facebook_event_checkin`, `get_fit_now_check_in`, `get_fit_now_member`, `income`, `interview`, and `person`.

---

## 🔍 Investigation Process

### 1. Initial Crime Scene Report
I first queried the `crime_scene_report` table to establish the details of the crime based on initial parameters:
```sql
SELECT *
FROM crime_scene_report
WHERE date = 20180115
  AND type = 'murder'
  AND city = 'SQL City';