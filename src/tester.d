import std.stdio;
import std.string; 

void main(){

	int userChoice; //the user's selection 
	string userInput; //the string that the user enters 

	do{
		writeln("What would you like to do?\n");
		writeln("1) Search for a movie\n2) Add a new movie\n3) Leave a review\n4) Update a movie's information"); 

		readf("%d\n", &userChoice);

		if(userChoice < 1 || userChoice > 4){
			writeln("That input is invalid."); 
		}

	} while(userChoice < 1 || userChoice > 4); 

	switch(userChoice){
		case(1):{
			writeln("\nSearch by:\n");
			writeln("1) By title\n2) By genre");

			readf("%d\n", &userChoice);

			writeln("\nEnter what you want to search for: ");
			readf("%s\n", &userInput);
			userInput = strip(userInput); 

			switch(userChoice){
				case(1): searchByTitle(userInput);
				case(2): searchByGenre(userInput);
				default: break;  
			}
		}

		case(2):{
			addNewMovie(); 
		}

		case(3):{
			addNewReview();
		}

		case(4):{
			writeln("\nEnter what you want to search for: ");
			readf("%s\n", &userInput);
			userInput = strip(userInput); 

			editMovie(userInput); 
		}

		default: break; 
	}//end of switch

}

void searchByTitle(string title){

}

void searchByGenre(string genre){

}

void addNewMovie(){
	string title;
	string genre;
	string director;
	int yearReleased; 

	writeln("\nEnter the title: ");
	readf("%s\n", &title);
	title = strip(title); 

	writeln("\nEnter the genre: ");
	readf("%s\n", &genre);
	genre = strip(genre);

	writeln("\nEnter the director: ");
	readf("%s\n", &director);
	director = strip(director);  

	writeln("\nEnter the release year: ");
	readf("%d\n", &yearReleased); 

	Movie newMovie = new Movie(title, genre, director, yearReleased);
}

void addNewReview(){
	writeln("\nEnter what movie you want to review: ");
	readf("%s\n", &userInput);
	userInput = strip(userInput);  

}

void editMovie(string title){

}

class Movie{

	private string title;
	private string genre; 
	private string director ;
	private int yearReleased;
	private Movie leftChild;  //will be used if the movies are stored in a binary search tree 
	private Movie rightChild; //
 

	//this() is used to define a constructor 
	this(string title, string genre, string director, int yearReleased){
		this.title = title;
		this.genre = genre; 
		this.director = director;
		this.yearReleased = yearReleased;
	}

	//some getters and setters 
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