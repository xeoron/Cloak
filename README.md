Cloak
=====
Sometimes the best way to hide things are in plain sight. Cloak your files so that others will not use or stumble upon them during typical use of your Mac. With a simple command, mask your files or folders from being displayed on OS X. Finder and Spotlight will not display them. 

This does not encrypt, employ steganography, or any other file protecting feature. Instead, it merely tells OS X to pretend that those certain locations are not there. The result is it acts like those files and folders do not exist; and, since they are marked *hidden* it will not display them.

who is this meant for?
=====
If you want to hide things from non-tech savvy people without having to worry about loosing access by forgetting a password or keeping safe encryption keys, then this program might be right for you. 

I can not stress this enough: Cloak merely marks files and folders as hidden system files so that Finder (OS X's file manager) and Spotlight (the system search), omits them. Nothing more. This means that if your browse or search for a file or location you will not find it.

examples
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

usage
=====

    cloak <option> /location/to/file-OR-folder
    -c --cloak location from Finder and Spotlight
    -u --uncloak location from Finder and Spotlight
    -v --version
    -h --help

how to access hiden locations?
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

Severs, such as, *Plex Media Server*, *Apache*, and *Nginx* can find and use locations, too.

If you hook the drive up to another machine it may be able to see those hidden locations without a terminal.


requirements
=====
software:

    Terminal
    Mac OS X.5 or higher  

manual setup
=====
commands:

    cd ./cloak/
    chmod +x ./cloak.sh
    sudo cp ./cloak.sh /usr/bin/cloak


License
=====
Cloak is copyleft 2013 under the <a href="http://www.gnu.org/licenses/gpl-2.0.html">GPL v2</a> or higher.
