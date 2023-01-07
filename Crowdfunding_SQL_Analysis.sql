-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

SELECT cf_id,
		backers_count,
		outcome
	FROM campaign
	WHERE outcome = ('live')
	ORDER BY backers_count DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT DISTINCT (b.cf_id),
		ca.backers_count,
		ca.outcome
	FROM campaign AS ca
	LEFT JOIN backers AS b
	ON b.cf_id = ca.cf_id
	WHERE ca.outcome = ('live')
	ORDER BY ca.backers_count DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT ct.first_name, ct.last_name, ct.email, 
	ca.goal - ca.pledged AS remaining_goal_amount
	INTO email_contacts_remaining_goal_amount
	FROM contacts AS ct
	LEFT JOIN campaign AS ca
	ON ct.contact_id = ca.contact_id
	WHERE ca.outcome = ('live')
	ORDER BY remaining_goal_amount DESC;




-- Check the table


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT b.email,
	b.first_name,
	b.last_name,
	b.cf_id,
	ca.company_name,
	ca.description,
	ca.goal - ca.pledged AS Left_of_Goal
INTO email_backers_remaining_goal_amount
FROM backers AS b
LEFT JOIN campaign AS ca
ON (ca.cf_id = b.cf_id)
WHERE ca.outcome = ('live')
ORDER BY b.email DESC;



-- Check the table


