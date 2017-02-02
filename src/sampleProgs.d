import std.stdio;
//Allows the use of string methods like strip()
import std.string;

void main() {

	writeln("Test Push #1");

	//Part 1: Major Data Structures


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
	writeln("There are ", days, " days left for this assignment.");

	//Part 3: Common Control Structures
}