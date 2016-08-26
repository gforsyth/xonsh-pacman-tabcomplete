# Don't use this!

Bash completion for `pacman` now works in `xonsh` without this `xontrib`.  You don't need to install this anymore.  Leaving it up for the sake of... laziness?  History?  Something.

# xonsh-pacman-tabcomplete
Better tab completion for pacman in xonsh

<hr>

This provides better tab completion for `pacman` for `xonsh` users on Arch Linux.  
It properly filters package names based on a given prefix and will only show installed packages when trying to remove a package, etc...

## Installation
Just do a 
```console
pip install xonsh-pacman-tabcomplete
```

or you can clone the repo and do
```console
python setup.py install
```

## Configuration
To automatically load pacman completion at startup, put 
```console
xontrib load pacman_tabcomplete
```

in your `.xonshrc`
