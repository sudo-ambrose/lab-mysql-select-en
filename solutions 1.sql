###Challenge 1 

SELECT authors.au_id AS "Author ID", 
authors.au_lname AS "Last name", 
authors.au_fname AS "First name",
titles.title AS "Title",
publishers.pub_name as "Publisher"

FROM
authors, titleauthor, titles, publishers
WHERE
	authors.au_id == titleauthor.au_id AND
	titleauthor.title_id == titles.title_id AND
	titles.pub_id == publishers.pub_id;


###Challenge 2

SELECT
authors.au_id AS "Author ID", 
authors.au_lname AS "Last name", 
authors.au_fname AS "First name",
publishers.pub_name AS "Publisher",
COUNT(*) AS "Title_count"
FROM
authors, titleauthor, titles, publishers
WHERE
	authors.au_id == titleauthor.au_id AND
	titleauthor.title_id == titles.title_id AND
	titles.pub_id == publishers.pub_id
GROUP BY 
  authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name;




  ###Challenge 3

 SELECT
  authors.au_id AS "Author ID", 
authors.au_lname AS "Last name", 
authors.au_fname AS "First name",
COUNT(sales.title_id) AS "Total" 
FROM authors, titleauthor, titles, sales
WHERE
	authors.au_id == titleauthor.au_id AND
	titleauthor.title_id == titles.title_id AND
	titles.title_id == sales.title_id 
GROUP BY 
  authors.au_id, authors.au_lname, authors.au_fname
ORDER BY 
     COUNT(sales.title_id) DESC
LIMIT 3;


###Challenge 4

 SELECT
  authors.au_id AS "Author ID", 
authors.au_lname AS "Last name", 
authors.au_fname AS "First name",
COUNT(sales.title_id) AS "Total" 
FROM authors

	LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
	LEFT JOIN titles ON titleauthor.title_id = titles.title_id
	LEFT JOIN sales ON titles.title_id = sales.title_id
	
GROUP BY 
  authors.au_id, authors.au_lname, authors.au_fname
ORDER BY 
     COUNT(sales.title_id) DESC;




