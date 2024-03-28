![Img](https://raw.githubusercontent.com/fluid-developer/fluid-developer.github.io/main/logos/AppLauncher-logo.png)

# AppLauncher
AppLauncher is binary file to allow launching apps from Termux in easy way.

# Features
- Favourites (Shortcuts)
- Uses `gum`
- Easy-to-use
- No installation needed / Mainly just one file
- History is allowed
- Very, very fast
- ~~Rootless~~ (soon)

# Why AppLauncher was created?
I love CLIs, Terminals and, I am now using Termux as my launcher. I didnt liked the GUI to start apps (App i used for that is SmartDock) so... I did my own launcher.

# Commands
- `AppLaunch` - list all apps, then it's activities, launch
- `AppLaunch -h` - launch an app (w/activity) from history
- `AppLaunch -d history` - clears the history fild
- `AppLaunch -s` - lists favourite apps
- `AppLaunch -s add` - lists all apps, then it's activities, saves to a file so it can be executed with previous command
- `AppLaunch -d activities` - updates activities database manually

# FAQs
1. Q: Do it needs root?<br>
   A: It does (atleast for now, Shizuku will be supported soon.)
