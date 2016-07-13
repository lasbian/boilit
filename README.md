# boilit
Bash script for initializing a HTML5 ★ BOILERPLATE in any directory.
Using the first command line argument as name **boilit** will create a new directory containing a bare HTML5 ★ BOILERPLATE.

## Example run:
  `~$ bash ./boilit.sh MyFirstBoilerPlate`

# Install with make
Add **boilit** as a systemwide command available to the user installing **boilit**

## Instructions:

Store the **boilit**-directory in a safe location, and don't move it around.

*Deploy makefile* :
  `~$ make boilit`

*Try out boilit and check if it's available:*
  `~$ boilit MyFirstBoilerPlate`

Dependencies: curl, wget, unzip, make
