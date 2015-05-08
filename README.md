Personal collection of scripts, hacks and configurations to make the command line more productive.
It should make it easy to quickly make the terminal feel familiar on any Linux system.

# To Install

Run: 

    git clone ...
    ./install.sh
    ./install.sh <<some_additional_profile>>

And edit ~/.bashrc to import the profile:

    . ~/.bashrc.base
 
# To extend 

Add to an existing profile or create a new one in "profiles", edit or create the "profile.info"
script. This will be picked up by the install script. Take a look at the base profile for an
example.


# To update

The installation creates symlinks so a git status will show what changed. Just commit the changes.
Make sure that no configuration is created that is not linked.
