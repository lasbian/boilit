# boilit
Bash script for initializing a HTML5 ★ BOILERPLATE in any directory.
Using the first command line argument as name **boilit** will create a new directory containing a bare HTML5 ★ BOILERPLATE

## Example run:
  ~$ bash ./boilit.sh MyFirstBoilerPlate

# Also included:
A makefile which adds **boilit** as a systemwide command (for current user).

## Install with make

Store the **boilit**-directory in a safe location, and don't move it around.

*Deploy makefile* :
  ~$ make boilit

*Try out boilit and check if it's available:*
  ~$ boilit MyFirstBoilerPlate

Dependencies: curl, wget, unzip, make
