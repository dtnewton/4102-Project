import std.stdio;
//simple struc example using random movie information
struct MovieData
{
	char[] title;
	char[] director;
	uint yearReleased;
	uint duration;
};

void displayMovie(MovieData movie)
{
	writeln("\n", movie.title, "\nDirected By: ", movie.director);
	writeln("Released: ", movie.yearReleased, "\n", movie.duration, " minutes.");
}

void main()
{
	MovieData movie1;
	MovieData movie2;

	//movie1 info
	//.dup creates a dynamic array of the same size and copies the contents of the array into it. 
	movie1.title	     = "Interstellar".dup;
	movie1.director 	 = "Christopher Nolan".dup;
	movie1.yearReleased  = 2014;
	movie1.duration 	 = 169;

	//movie2 info
	movie2.title         = "2001: A Space Odyssey".dup;
	movie2.director      = "Stanley Kubrick".dup;
	movie2.yearReleased  = 1968;
	movie2.duration      = 142;


	displayMovie(movie1);
	displayMovie(movie2);
}