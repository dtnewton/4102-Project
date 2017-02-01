#**Setup for D**

1. Go to http://dlang.org/ and install the compiler.
	*it will ask for Visual Studio and SDK, you do not need these
2. If you do not have a bash, download cmder at http://cmder.net/
	*be sure to download the full download
3. If you need a text editor, Sublime Text will format D nicely. https://www.sublimetext.com/
4. Post your GitHub username in Slack so Matt can add you a collaborator.

#**Workflow with D**

	After you install the D compiler, you can begin creating files using Sublime Text or
	any other text editor. D language files use the suffix ".d". Once you have saved the
	file, you can then use your command line interface (cmder) to compile the code. 

	##**Compiling Code**

	To compile your code, you must navigate to the folder you have the .d file using the
	command ```cd DIRECTORYNAME```. If you're using cmder, it should default to your 
	default ```C:/Users/Name``` directory. If you need to orient yourself with where you
	are in your computer, you can use ```ls``` to list the files and folders in your
	current directory.

	Once you are in the directory with your saved .d file, you can compile it with the
	command ```dmd filename.d```. This will compile your code into an executable file
	located in the same directory. You can then run the .exe by typing the filename
	along with the .exe extension.