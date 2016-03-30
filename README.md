Automagic Revinate Zsh Setup
============================

A prebuilt ZSH environment using sane defaults and some extra aliases to make
the working in Revinate's environment easier. Note that my idea of "sane" may
be different from yours.

Installation
------------

This config will work with the current stock version of zsh packaged with
OS X 10.9.3 (zsh version 5.0.2) but should work with zsh installed using
homebrew. Prezto requires at least version 4.3.11.

  1. UnTar the zsh.tgz to ~/.zsh (which you should have done to even see
     this README).

  2. Run the included setup script (~/.zsh/setup.sh)

  3. Set your default shell to zsh using the instructions at
     http://superuser.com/questions/379725/how-do-i-change-a-users-default-shell-in-osx

Notes
-----

  * The ~/.zsh/env file is not currently in use, but should work fine if sourced.

  * Prezto's github page can be found at https://github.com/sorin-ionescu/prezto.
    You can reference it for further customizations.

  * This environment was designed to work fully independent from any existing
    bash environment, so switching back should be as painless as setting your
    default shell back to bash.


Written by Eric Madar
