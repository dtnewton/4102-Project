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

**Compiling and Running Code**

To compile your code, you must navigate to the folder you have the .d file using the
command "cd DIRECTORYNAME". If you're using cmder, it should default to your 
default "C:/Users/Name" directory. If you need to orient yourself with where you
are in your computer, you can use "ls" to list the files and folders in your
current directory.

Once you are in the directory with your saved .d file, you can compile it with the
command "dmd filename.d". This will compile your code into an executable file
located in the same directory. You can then run the .exe by typing the filename
along with the .exe extension.

**Working through Git**

We will be using Git to collaborate on the project. To begin, you need to clone
the current repository to your machine. Be sure you are currently in the 
directory you wish to clone the project and use the command

"git clone https://github.com/mjohn365/4102-Project" 

This will copy the current repo into your working directory. You now have the
folder we will use for the project. 

You then need to set your git configuartion. Do this with

"git config --global user.name "Your name" "
and
"git config --global user.email "email associated with your GitHub account" "

**Before you begin to change anything be sure to run "git fetch" to pull changes
other people may have made!**

Our .d files will be located in the src/ directory. You should now be able to open
them with your text editor. 

To keep it simple, we won't use branches since we only have one program. Doing this,
we run the risk of overwriting each other's changes. Just send a message in Slack
if you are about to work, then again to say when you are finished and have pushed
your changes.

Once you have made any changes, be sure you can compile and execute the code you
added. If everything is good to go, you can run

"git add ." 

To add any changes you have made. Followed by

"git commit -m "Say what you did""

Once you have done this, you can push your changes with

```
git push origin master
```

It should ask for your username and password for GitHub. After entering your
credentials, it will push your changes to GitHub where others can see and
pull your changes. 