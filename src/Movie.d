import std.stdio;
import std.conv;
import std.string;


class Movie{

	private string title;
	private string genre;
	private string director ;
	private uint yearReleased;
	private uint duration;
	private float rating;
	private int ratingCount; 
	
 

	//this() is used to define a constructor 
	this(string title, string director, uint yearReleased, uint duration, string genre, float rating, int ratingCount){
		this.title = title;
		this.genre = genre; 
		this.director = director;
		this.yearReleased = yearReleased;
		this.duration = duration;
		this.rating = rating; 
		this.ratingCount = ratingCount; 
	}

	//some getters 
	string getTitle(){
		return title;
	}

	void setTitle(string newTitle){
		this.title = newTitle;
	}

	string getGenre(){
		return genre;
	}

	void setGenre(string newGenre){
		this.genre = newGenre;
	}

	string getDirector(){
		return director;
	}

	void setDirector(string newDirector){
		this.director = newDirector;
	}

	uint getYearReleased(){
		return this.yearReleased;
	}

	void setYearReleased(uint newRelease){
		this.yearReleased = newRelease;
	}

	uint getDuration(){
		return this.duration;
	}

	void setDuration(uint newDuration){
		this.duration = newDuration;
	}
	
	float getRating(){
		return this.rating;
	}
	
	void setRating(float r)
	{
		
		this.rating = this.rating * ratingCount;
		ratingCount++;
		this.rating = (this.rating + r)/ ratingCount;

	}
	
	int getRatingCount()
	{
		return this.ratingCount;
	}
	override bool opEquals(Object o)
	{
		Movie other = cast(Movie)o;
		if(this.getTitle() is other.getTitle()) return true;
		else return false;
	}
	//opCmp overload -- for use with sorting (by title)
	override int opCmp(Object o)
	{
		Movie other = cast(Movie)o;
		if(this.title > other.title)
		{
			return 1;
		} 
		else if(this.title < other.title)
		{
			return -1;
		}
		else
		{
			return 0;
		}
	}

	
	override string toString()
	{
		string movieStr;
		movieStr ~= this.title;
		movieStr ~= "(";
		movieStr ~= to!string(this.yearReleased);
		movieStr ~= ")";
		movieStr ~= " - Directed By ";
		movieStr ~= this.director;
		movieStr ~= " - Genre: ";
		movieStr ~= this.genre; 
		movieStr ~= " - Runtime: ";
		movieStr ~= to!string(this.getDuration());
		movieStr ~= " minutes";
		movieStr ~= " - Rating: ";
		movieStr ~= to!string(this.getRating());
		
		return movieStr;
	}

	//TODO - Destruct?

}