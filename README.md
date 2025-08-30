Cloak
=====
Sometimes the best way to hide things are in plain sight. Cloak your files so that others will not use or stumble upon them during typical use of your Mac. With a simple command, mask your files or folders from being displayed on macOS or higher. Finder and Spotlight will not display them. 

This makes it easier to mark files as hidden system files. Warning: This does not encrypt, employ steganography, or any other file protecting feature. Instead, it merely tells MacOS to pretend that those files at certain locations are not there. The result is it acts like those files do not exist; and, since they are marked *hidden* it will not display them in Finder or Spotlight because it omits them from their index as a flag to ignore.

What is able to see them? Terminal apps, servers, etc. Basicly if an app does not use Finder to see the filesystem, then they find it.

Who is this meant for?
=====
If you want to hide things without having to worry about important data being seen or deleted by accident then this might be for you. From adding a safegaurd for encryption keys to having sensetive data that you only want a server to see/access (not Finder) or maybe you only want data visible during certain times during the day.


Examples
======
Cloaking the *test* folder looks like this

    bash-3.2$ cloak -c ./test/
     Cloaking ./test/ ...
     Removing ./test/ location from Spotlight's index...
    bash-3.2$ 

<img src="https://raw.github.com/xeoron/cloak/master/images/cloak.png"/>

Uncloaking the *test* folder looks like this

    bash-3.2$ cloak -u ./test/
     Uncloaking ./test/ ...
     Adding ./test/ location to Spotlight's index...
    bash-3.2$ 

<img src="https://raw.github.com/xeoron/cloak/master/images/uncloak.png"/>

Usage
=====

    cloak <option> /location/to/file-OR-folder
    -c --cloak location from Finder and Spotlight
    -u --uncloak location from Finder and Spotlight
    -s --show hidden system files
    -i --invisible hides those system files
    -v --version
    -h --help

How to access hiden locations?
=====
Any terminal programs can, which include the following:

    cloak
    ls
    lsof
    find
    cd
    mv
    pwd
    rm

Servers, such as, Media Servers, Apache, and Nginx.

Warning: If you hook the drive up to another machine it may be able to see those hidden locations without a terminal.

Automate when things are findable
=====
Set the task scheduler, known as, <a href="https://medium.com/@justin_ng/how-to-run-your-script-on-a-schedule-using-crontab-on-macos-a-step-by-step-guide-a7ba539acf76" title="Crontab scripts">crontab</a> to cloak and uncloak files and locations for set periods of time.

Once Cloak is installed, in a terminal create a new task

	crontab -e 
	
Choose when you would like the job to run. Every job is a line in your crontab file. The first 5 arguments specify the time to run the job, and the 6th argument is the command to run. 

	Argument 1: Minute (0 - 59)
	Argument 2: Hour (0 - 23)
	Argument 3: Day of Month (1 - 31)
	Argument 4: Month (1-12)
	Argument 5: Day of Week (0 - 6) Sunday = 0
	Argument 6: Command

Lets say you want to cloak your *project* folder that is on your Desktop while at work from 8:25am to 6pm Monday through Friday.

	25/8/**/1-5 cloak -c /Users/your-account-name/Desktop/project

This means, *cloak* your *project* folder 25 minutes after the hour, on the 8th hr of the day, every day, every month, monday through friday

	0/18/**/1-5 cloak -u /Users/your-account-name/Desktop/project

This means, *uncloak* your *project* folder 0 minutes after 6pm, every day, every month, Monday through Friday.

Save your crontab task file and it will be set. 
If you want to check to see what tasks are set to run and when type into a terminal

	crontab -l

Requirements
=====
Software:

    Cloak
	Terminal
    macOS X.5 or higher 

Setup
=====
Automated command:

	sudo ./install_cloak.sh

Manual commands:

    cd ./cloak/
    chmod +x ./cloak.sh
    sudo cp ./cloak.sh /usr/bin/cloak


License
=====
Cloak is copyleft 2013 under the <a href="http://www.gnu.org/licenses/gpl-2.0.html">GPL v2</a> or higher.
