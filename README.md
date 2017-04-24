# Movie Library

	Our group's Movie Library program allows a user to 
	view details for various saved movies, add new
	movies to the database, and delete movies from the
	database. Our program offers data persistence by
	saving the state of the database when the user 
	closes the program. The library will read the 
	saved details on startup. 

	Additionally, the user can search for a movie by
	either title or by genre. 

	Our Movie Library also allows the user to enter
	a rating from 1 to 5 on each movie and the library
	will aggregate it with past ratings.

## Running the Program
	
	Our program can be run in console by just running
	the .exe file included. Source code files can be
	compiled using the DMD compiler which can be
	downloaded at dlang.org if you wish to compile
	the source code yourself. 

## Menu
	
	The user is greeting by several menu options on 
	startup.

	1. Display Full List of Movies.
		This will show all movies currently saved in 
		the text file.
	2. Search for a Movie
		This will ask the user to search by title or
		genre and will return movies that fit 
		whatever data the user provides.
	3. Add a new movie
		This will allow the user to enter a new movie
		to the database and provide it various details
		like director, release year, etc.
	4. Add Rating
		This allows the user to provide a score from 1
		to 5 that is then averaged with past scores. 
		Ratings default to 0.
	5. Update a Movie's Info
		This allows the user to alter any information
		about a movie, such as change the director, 
		change the runtime, etc.
	6. Delete a Movie
		This will allow the user to enter the title of
		a movie that they wish to delete. It will be 
		removed from the text file when the program
		ends.
	7. Exit
		This exits the program and saves the state of
		the library with the various changes the user
		has added/removed.

### Prompts
	
	Each menu option provides clear prompts that tell
	the user exactly what information to provide. If
	the user provides invalid characters or values, 
	the program will re-prompt the user.