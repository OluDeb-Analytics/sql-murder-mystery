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
```

### 2. Joining Tables & Narrowing Suspects
To connect individual records, I used SQL `JOIN` statements linking tables via `person_id`, `ssn`, and membership IDs, starting from the `person` table. Then, I applied `WHERE` and `AND` clauses to isolate the suspect:

```sql
SELECT *
FROM person
JOIN interview ON person.id = interview.person_id
JOIN income ON person.ssn = income.ssn
JOIN facebook_event_checkin ON person.id = facebook_event_checkin.person_id
JOIN get_fit_now_member ON person.id = get_fit_now_member.person_id
JOIN get_fit_now_check_in ON get_fit_now_check_in.membership_id = get_fit_now_member.id
JOIN crime_scene_report ON crime_scene_report.date = facebook_event_checkin.date
WHERE crime_scene_report.date = 20180115
  AND crime_scene_report.type = 'murder'
  AND crime_scene_report.city = 'SQL City';
```

---

## 🏆 Conclusion & Perpetrator Details

The investigation successfully identified **Jeremy Bowers** as the person responsible for the murder. 

* **Person ID:** `67318`
* **Name:** `Jeremy Bowers`
* **License ID:** `423327`
* **Address:** `530 Washington Pl, Apt 3A`
* **SSN:** `871539279`

### Key Eyewitness Transcript & Clues Uncovered:
> *"I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017."*
