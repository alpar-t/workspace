Personal collection of scripts, hacks and configurations to make the command line more productive.
It should make it easy to quickly make the terminal feel familiar on any Linux system.

## Vivaldi Extensions

To quickly install your favorite Vivaldi browser extensions, open this file in your browser:

[additional](./additional.html)

## 🚀 Quick Start: Bootstrap a New Mac

To install everything from this repo on a brand new Mac, just run this command in your terminal:

```sh
bash <(curl -fsSL https://raw.githubusercontent.com/alpar-t/workspace/master/run_comtrya.sh)
```

This will:
- Clone the repository
- Install [Comtrya](https://comtrya.dev/) if needed
- Apply all configuration and packages automatically

If you are prompted to install Git, please accept the prompt to install Xcode Command Line Tools.


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

# Tweaks 

Google Chrome / Chromium. Add to `/usr/share/applications/google-chroem.desktop`
```
--high-dpi-support=1 --force-device-scale-factor=1.2
```

