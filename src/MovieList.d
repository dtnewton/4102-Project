import std.stdio;
import std.conv;
import std.string;
import core.exception : AssertError;
import Movie;
import std.regex;
import std.algorithm;

class MovieList{
private:
	Movie[] movieList;
	uint numMovies;
public:
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

		if (movieIndex != -1) 
		{
			string editChoice;

			do {
				write("\nWhat field would you like to alter?\n1) Title\n2) Genre\n3) Director\n4) Release Year\n5) Runtime\n>");
				editChoice = strip(stdin.readln());

				if(!(matchFirst(editChoice, editMovReg)))
				{
					writeln("\nThat input is invalid.\n");
				}

			} while (!(matchFirst(editChoice, editMovReg)));

			if(editChoice == "1")
			{
				write("\nEnter the new title: \n>");
				string newTitle;
				newTitle = strip(stdin.readln());
				newTitle = formatInput(newTitle);
				movieList[movieIndex].setTitle(newTitle);
				write("\n");

			}
			else if(editChoice == "2")
			{
				write("\nEnter the new genre: \n>");
				string newGenre;
				newGenre = strip(stdin.readln());
				newGenre = formatInput(newGenre);
				movieList[movieIndex].setGenre(newGenre);
				write("\n");

			}
			else if(editChoice == "3")
			{
				write("\nEnter the new director: \n>");
				string newDirector;
				newDirector = strip(stdin.readln());
				newDirector = formatInput(newDirector);
				movieList[movieIndex].setDirector(newDirector);
				write("\n");
			}
			else if(editChoice == "4")
			{
				int yearReleased;			
				do
				{
					write("\nEnter the updated release year: \n>");
					string yearReleasedStr = chomp(stdin.readln());
					yearReleasedStr = replaceAll(yearReleasedStr, regex([`\D`]), "");
					if (yearReleasedStr != "")
					{
						yearReleased = to!int(yearReleasedStr);
						movieList[movieIndex].setYearReleased(yearReleased);
					}
					else
					{
						write("\nInvalid Input.\n");
						yearReleased = 0;
					}
			
				}while(yearReleased <= 0);
				
				write("\n");
			}
			else if(editChoice == "5")
			{
				int duration;
				do
				{
					write("\nEnter the updated runtime: \n>");
					string runtimeStr = chomp(stdin.readln());
					runtimeStr = replaceAll(runtimeStr, regex([`\D`]), "");
					if (runtimeStr != "")
					{
						duration = to!int(runtimeStr);
						movieList[movieIndex].setDuration(duration);
					}
					else
					{
						write("\nInvalid Input.\n");
						duration = 0;
					}
			
				}while(duration <= 0);

				write("\n");
			}
			write("Successfully Updated: ", movieList[movieIndex].toString(), "\n\n");	
		}
		else
		{
			writeln("\nMovie not found.\n");
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
				if((matchFirst(temp.getTitle().toLower(), searchStr))) 
				{
					searchRecord ~= temp;
					count++;
				}
			}
			else//genre
			{
				if((matchFirst(temp.getGenre().toLower(), searchStr))) 
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

	//formats strings for consistency
	string formatInput(string s)
	{
		string formattedStr;
		
		auto splitStr = split(s);
		for(int i = 0; i < splitStr.length; i++)
		{
			formattedStr ~= capitalize(splitStr[i].toLower());
			if(i < splitStr.length - 1)
			{
				formattedStr ~= " ";
			}			
		}
		
		return formattedStr;	
	}
}
