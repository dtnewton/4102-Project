import std.stdio;
//Allows the use of string methods like strip()
import std.string;

void main() {

	

	//Part 1: Major Data Structures

	//Example of an associative array
	int[string] aaTest ; //array of integers with string keys
	aaTest["one"] = 1 ;
	aaTest["two"] = 2 ;
	aaTest["three"] = 3;
	aaTest["four"] = 4;

	writeln("Here are the values of the keys and values for the associative array: ");
	foreach (element; aaTest.byKey) {
      writeln("key: ", element, ", value: ", aaTest[element]);
    }
    writeln("--------------------"); 

	//Part 2: I/O
	//An array of String type
	char[] state;
	write("How are you doing today?: ");
	readln(state);
	//Removes control characters (space, enter, etc)
	state = strip(state);
	write("You said you are doing ", state, "!");

	int days;
	writeln("\nHow many days until this assignment is due?: ");
	//The space before %s prevents the enter key from holding up output
	readf(" %s", &days);
	
	

	//Part 3: Common Control Structures
	
	//simple if-else using previous days-til-due info
	if (days < 1)
	{
		writeln("\nAssignment is past due!");
	}
	else
	{
		writeln("\nThere are still ", days, " days left for this assignment.");
	}
	
	//random nested loop, not really meaningful just an example.
	char[4] letters = ['a','b','c','d'];
	int i,j;
	writeln("");
	for (i=0; i < 4; i++)
	{
		for (j = 1; j < 3; j ++){
			write(letters[i], " - ", j, " ");
		}
		write("\n");
	}

}