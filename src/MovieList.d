import std.stdio;
import std.conv;
import std.string;
import core.exception : AssertError;
import Movie;
import std.regex;
import std.algorithm;

class MovieList
{

	private Movie[] movieList;
	private uint numMovies;

	this(uint n)
	{
		this.numMovies = n;
	}

	uint getNumMovies()
	{
		return numMovies;

	}



	void add(Movie m)
	{
		this.movieList ~= m;
		movieList.sort();
	}

	Movie get(int i)
	{
		return movieList[i];
	}

	void editMovie(string title)
	{
		int movieIndex = searchExact(title.toLower());
		auto editMovReg = regex("^[1-5]$");

		if (movieIndex != -1) {
			string editChoice;

			do {
				write("What field would you like to alter?\n1) Title\n2) Genre\n3) Director\n4) Release Year\n5) Runtime\n>");
				editChoice = strip(stdin.readln());

				if(!(matchFirst(editChoice, editMovReg))){
					writeln("That input is invalid.");
				}
			} while (!(matchFirst(editChoice, editMovReg)));

			if(editChoice is "1")
			{
				write("Enter the new title: \n>");
				string newTitle;
				newTitle = strip(stdin.readln());
				this.movieList[movieIndex].setTitle(newTitle);

			}
			else if(editChoice is "2")
			{
				write("Enter the new genre: \n>");
				string newGenre;
				newGenre = strip(stdin.readln());
				movieList[movieIndex].setGenre(newGenre);

			}
			else if(editChoice is "3")
			{
				write("Enter the new director: \n>");
				string newDirector;
				newDirector = strip(stdin.readln());
				movieList[movieIndex].setDirector(newDirector);
			}
			else if(editChoice is "4")
			{
				write("Enter the new release year: \n>");
				string newRelease;
				newRelease = strip(stdin.readln()); //TODO - validate or catch
				uint nr = to!uint(newRelease);
				movieList[movieIndex].setYearReleased(nr);
			}
			else if(editChoice is "5")
			{
				write("Enter the new runtime: \n>");
				string newDuration;
				newDuration = strip(stdin.readln());//TODO - validate or catch
				uint nd = to!uint(newDuration);
				movieList[movieIndex].setDuration(nd);

			}
		}
		else
		{
			writeln("Movie not found.\n");
		}
	}

	void addRating()
	{
		
		auto reg = regex(["(\\d)+.?(\\d)?"]);
		write("\nEnter the title you want to rate: \n>");
		string userInput = chomp(readln());
	
		int element = searchExact(userInput); 
		string ratingS; 
		float rating;
		
		if(element == -1)
		{
			writeln("\nTitle not found!\n");
		}
		else
		{
			do
			{
				write("What is your rating?[1.0-5.0] \n>");				
				ratingS = chomp(readln());
				
				if (matchFirst(ratingS, reg))
				{
					rating = to!float(ratingS);
					if(rating > 5 || rating < 0)
					{
						writeln("\nInvalid Rating.\n");
					}
					else
					{
						this.movieList[element].setRating(rating); 			
					}		
				}
				else
				{
					writeln("\nInvalid Rating.\n");
				}
				
			}while(rating > 5 || rating < 0);			
		}
	}
	
	void deleteMovie(int i)
	{
		this.movieList = remove(movieList, i);
	}

	int searchExact(string title)
	{

		Movie temp;

		for(int i; i < movieList.length; i++)
		{
			temp = movieList[i];

			if(temp.getTitle().toLower() == title.toLower()) 
			{
				return i;

			}
		}

		return -1;
	}

	void search(string searchStr, int typeOfSearch)
	{

		auto r = regex(searchStr);
		Movie[] searchRecord;
		Movie temp;
		int count = 0;
		for(int i; i < movieList.length; i++)
		{
			temp = movieList[i];
			if(typeOfSearch == 1)//title
			{
				if((matchFirst(temp.getTitle().toLower(), searchStr))) //ignore case?
				{
					searchRecord ~= temp;
					count++;
				}
			}
			else//genre
			{
				if((matchFirst(temp.getGenre().toLower(), searchStr))) //ignore case?
				{
					searchRecord ~= temp;
					count++;
				}

			}
			//can add more search types
		}

		writeln("\nResults Found: ", count);
		writeln("-----------------------------------------------------");
		for(int i; i < searchRecord.length; i++)
		{
			writeln(searchRecord[i].toString());
		}
		writeln("-----------------------------------------------------\n");
	}

	int getListLength()
	{
		return this.movieList.length;//should equal numMovies - assert later
	}


	void displayMovieList()
	{
		
		
		write("All Movies:\n");
		write("-------------------------------------------------------\n");
		for(int i; i < movieList.length; i++)
		{
			writeln(movieList[i].toString());
		}
		writeln("-----------------------------------------------------\n");
		
	}
}
