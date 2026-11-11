SQL
SELECT *
FROM person
JOIN
interview
ON person.id = interview.person_id
JOIN income
ON person.ssn = income.ssn
JOIN 
facebook_event_checkin
ON person.id = facebook_event_checkin.person_id
JOIN get_fit_now_member
ON person.id = get_fit_now_member.person_id
JOIN get_fit_now_check_in
ON get_fit_now_check_in.membership_id = get_fit_now_member.id
JOIN crime_scene_report
ON crime_scene_report.date = facebook_event_checkin.date
WHERE crime_scene_report.date = 20180115
AND crime_scene_report.type = 'murder'
AND crime_scene_report.city = 'SQL City';