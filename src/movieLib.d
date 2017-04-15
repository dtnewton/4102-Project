import std.stdio;
import std.file;
import std.conv;
import std.string;
import std.algorithm;
import std.container; 
import std.regex;
import Movie;
import MovieList;

void main()
{
	MovieList movieList = new MovieList(0);
	
	try
	{
		File splashDisp = File("splash", "r");
		while(!splashDisp.eof())
		{
			string s 	= chomp(splashDisp.readln());
			writeln(s);
		}
		splashDisp.close();
		writeln("v0.95 2017");
		writeln("---------------------------------------------");
	}
	catch(Exception e)
	{
		writeln(e.msg, "\n");
		
	}
	
	try
	{	
		//to read data from previous session
		File fileIn = File("movie_data.dat", "r");
		
		while(!fileIn.eof())
		{
			string movtitle 		= chomp(fileIn.readln());
			string movdirector  	= chomp(fileIn.readln());
			string yearStr     	    = chomp(fileIn.readln());
			string durationStr 		= chomp(fileIn.readln());
			string genre 			= chomp(fileIn.readln());
			string ratingStr		= chomp(fileIn.readln());
			string ratingCountStr   = chomp(fileIn.readln());
			
			//Trusted conversions - regex if time.
			uint year 		= to!uint(yearStr);
			uint dur 	    = to!uint(durationStr);
			float rating    = to!float(ratingStr);
			int ratingCount = to!int(ratingCountStr);
	
			Movie movie = new Movie(movtitle, movdirector, year, dur, genre, rating, ratingCount);
			movieList.add(movie); //adds movie to the list
		}
		fileIn.close();
	}
	catch(Exception e)
	{
		writeln(e.msg, "\n");
	}
	string userChoice;
	string userInput;
	auto continueRunning = 1;
	auto reg = regex("^[1-7]$"); //regex for input validation
	do{
		do
		{
			write("What would you like to do?\n");
			write("1) Display Full List of Movies\n2) Search for a Movie\n3) Add a New Movie\n4) Add Rating\n5) Update a Movie's Info\n6) Delete a Movie\n7) Exit\n"); 
			write("Enter Choice: \n>");
			userChoice = strip(stdin.readln());

			if(!(matchFirst(userChoice, reg)))
			{
				writeln("\nInvalid Choice!"); 
			}		

		}while(!(matchFirst(userChoice, reg))); 


		if(userChoice == "1")//READ
		{
			writeln("\n");
			movieList.displayMovieList();
		}
		else if(userChoice == "2")
		{
			write("\nSearch by:\n");
			write("1) By title\n2) By genre\n>");
			userChoice = strip(stdin.readln());

			write("\nSearch For: \n>");
			userInput = strip(stdin.readln());

			if(userChoice == "1")
			{
				movieList.search(userInput.toLower(),1);

			}
			else if(userChoice == "2")
			{		
				movieList.search(userInput.toLower(),2);
			}
		}
		else if(userChoice == "3")//CREATE
		{
			string title;
			string genre;
			string director;
			uint yearReleased;
			uint duration;
	
			write("\nEnter the title: \n>");
			readf("%s\n", &title);
			title = strip(title);			
			title = movieList.formatInput(title);
			
			write("\nEnter the director: \n>");
			readf("%s\n", &director);
			director = strip(director);
			director = movieList.formatInput(director);
		
			do
			{
				write("\nEnter the release year: \n>");
				string yearReleasedStr = chomp(readln());
				yearReleasedStr = replaceAll(yearReleasedStr, regex([`\D`]), "");
				if (yearReleasedStr != "")
				{
					yearReleased = to!int(yearReleasedStr);
				}
				else
				{
					write("\nInvalid Input.\n");
					yearReleased = 0;
				}
		
			}while(yearReleased <= 0);
		
			do
			{
				write("\nEnter the runtime: \n>");
				string runtimeStr = chomp(readln());
				runtimeStr = replaceAll(runtimeStr, regex([`\D`]), "");
				if (runtimeStr != "")
				{
					duration = to!int(runtimeStr);
				}
				else
				{
					write("\nInvalid Input.\n");
					duration = 0;
				}
		
			}while(duration <= 0);
	
			write("\nEnter the genre: \n>");
			readf("%s\n", &genre);
			genre = strip(genre);
			genre = movieList.formatInput(genre);
			
			Movie newMovie = new Movie(title, director, yearReleased, duration, genre,0,0);
			
			if(movieList.searchExact(title) == -1)
			{
				movieList.add(newMovie);
				writeln("\nSuccessfully Added: ", newMovie.toString(), "\n");
			} 
			else 
			{
				//duplicates only based on title at this point
				writeln("\nDuplicate Entry Detected --- Failed to add movie.\n");
			}			
		}
		else if(userChoice == "4")
		{
			movieList.addRating();
			write("\n");
		}
		else if(userChoice == "5")//update
		{
			write("\nEnter exact title of movie to edit: \n>");
			readf("%s\n", &userInput);
			userInput = strip(userInput); 
			movieList.editMovie(userInput.toLower()); 
		}
		else if(userChoice == "6")//delete
		{
			write("\nEnter the title you want to delete: \n>");
			userInput = strip(stdin.readln());
			int loc = movieList.searchExact(userInput.toLower());

			if(loc != -1)
			{
				Movie m = movieList.get(loc);//temp record of deleted entry
				movieList.deleteMovie(loc);
				writeln("\nDeleted: ", m.toString(), "\n");
			}
			else
			{
				writeln("\n", userInput, " not found.\n");
			}
		}
		else if(userChoice == "7")
		{

		}

		if(userChoice == "7") continueRunning = 0;
		
	}while(continueRunning == 1);	
	
	writeln("Updating Libary and Shutting down...");
	
	try
	{
		//to write data to new file after current session (for persistence)
		File fileOut = File("movie_data.dat", "w");//TODO - probably rewrite to same file
		Movie temp;
		for(int i; i < movieList.getListLength(); i++)
		{
			temp = movieList.get(i);
					
			fileOut.writeln(temp.getTitle());
			fileOut.writeln(temp.getDirector());
			fileOut.writeln(temp.getYearReleased());
			fileOut.writeln(temp.getDuration());
			fileOut.writeln(temp.getGenre());
			fileOut.writeln(temp.getRating());
			if(i < movieList.getListLength() - 1)
			{
				fileOut.writeln(temp.getRatingCount());
			}
			else
			{
				fileOut.write(temp.getRatingCount());
			}		
		}
		fileOut.close();
	}
	catch(Exception e)
	{
		writeln(e.msg, "\n");
	}
	
	writeln("Press any key to exit.");
	stdin.readln();
}

