import std.stdio;
import std.file;
import std.conv;
import std.string;

struct Movie
{
	string title;
	string director;
	uint yearReleased;
	uint duration;
}

void main()
{
	Movie[] movieList;
	
	//to read data from previous session
	File fileIn = File("moviedata.txt", "r");
	
	while(!fileIn.eof())
	{
		string movtitle 	= chomp(fileIn.readln());
		string movdirector  = chomp(fileIn.readln());
		string yearStr      = chomp(fileIn.readln());
		string durationStr  = chomp(fileIn.readln());

		uint year = to!uint(yearStr);
		uint dur  = to!uint(durationStr);

		Movie movie      = Movie(movtitle, movdirector, year, dur);
		movieList ~= movie; //adds movie to the list
	}
	fileIn.close();

	//to write data to new file after current session (for persistence)
	File fileOut = File("moviedata2.txt", "w");
	
	for(int i; i < movieList.length; i++)
	{
		fileOut.writeln(movieList[i].title);
		fileOut.writeln(movieList[i].director);
		fileOut.writeln(movieList[i].yearReleased);
		fileOut.writeln(movieList[i].duration);
	}
	fileOut.close();

}

