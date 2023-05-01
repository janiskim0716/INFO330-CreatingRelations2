# INFO330-CreatingRelations2
## Homework

Currently the data is entirely in the CSV file `pokemon.csv`. It's the entire database of known Pokemon, and Professor Oak needs the data in a fully normalized form so that he can continue his data science on the Pokemon. Your job is to take the CSV file, import it into a SQLite database (`pokemon.sqlite`) and fully apply First, Second, and Third Normal Form to the data. Make sure you do not lose any data from the databae as you do your database refactoring! You are, of course, always permitted to make a copy of the database, and apply your changes as you go. (It is common, when doing a database refactoring, to "practice" the changes on a copy of the data before applying it to the system of record.)

What you turn in should be the SQL statements to create the tables, as well as the statements to take the data from the single-table format imported from the CSV and inserted into the tables you've created. (In other words, Professor Oak wants a database script to do the full normalization from the CSV file, in case the interns can't control their Magneton again.) So make sure the SQL script you write has all the statements necessary to go from CSV to normalized database. (**HINT:** Remember that the command in SQLite to import a CSV file is `.mode csv` followed by `.import pokemon.csv imported_pokemon_data`, which will then put all of the data in the CSV into a new table called `imported_pokemon_data`, with each of the columns generally a `TEXT` field.)

You are permitted to use any tool to do the intermediate steps; your final database should be in a SQLite database file called `pokemon.sqlite`, and the SQL code to create it in `pokemon_import.sql`. Make sure to obey the rules of First, Second, and Third Normal Form. You do not need to normalize it beyond that.

## Scoring/Rubric

* **First Normal Form** (1 pt): the solution database is in First Normal Form
* **Second Normal Form** (2 pts): the solution database is in Second Normal Form
* **Third Normal Form** (2 pts): the solution databse is in Third Normal Form

> **Important Note:** there are 801 Pokemon in the CSV file; make sure that your normalized database also has 801 Pokemon in it, or it means you lost some data along the way! We will be counting! **You will lose a point if you lost any Pokemon!** (Abandoning a Pokemon is a violation of the trust between Trainer and Pokemon, and neither Professor Oak nor I will allow it!)

## Extra Credit

* Introduce new Pokemon! (2 pts) 
    * Write a SQL script that adds "Huskichu", a "Mascot"-type Pokemon. You may decide for yourself what attacks it has. It has no evolution form. (Huskichu Pokemon are very good, they rival Mew and Mewtwo in power--make sure your data reflects this!)
    * Write another SQL script that adds "Cougarite", another "Mascot"-type Pokemon. Cougarites have one attack, a "Slow Attack", which does no damage. (Cougarite Pokemon are not very good. They lose to Magikarp in most battles.)
* Support your local Pokemon trainer! (2 pts)
    * Create a new table, `trainer`, which consists of `first_name` and `last_name` (both string types not longer than 80 characters). 
    * Trainers can have multiple `favorite_pokemon_types`, and have Pokemon teams that can have up to ten Pokemon each on them. Make sure you stay in Third Normal Form, and add several trainers to the database: myself, your TA, yourself, and a friend or colleague from the class. You may assign to us any Pokemon you think would be on our team, but beware! Giving me a Cougarite could hurt your grade! (Just kidding.)

