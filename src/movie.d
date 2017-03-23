import std.string; 

class Movie{

	private string title;
	private string genre;
	private string director ;
	private uint yearReleased;
	private Movie leftChild;  //will be used if the movies are stored in a binary search tree 
	private Movie rightChild; //
 

	//this() is used to define a constructor 
	this(string title, string genre, string director, uint yearReleased){
		this.title = title;
		this.genre = genre; 
		this.director = director;
		this.yearReleased = yearReleased;
	}

	//some getters 
	string getTitle(){
		return title;
	}

	string getGenre(){
		return genre;
	}

	string getDirector(){
		return director;
	}

	uint getYearReleased(){
		return yearReleased;
	}



}