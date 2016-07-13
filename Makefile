boilit:
	@echo "";	
	@echo "Chmodding boilit.sh and adding it to ~/.bashrc";	
	@chmod u+x,g+x ./boilit.sh;
	@echo "alias boilit='`pwd`/boilit.sh'" >> ~/.bashrc;
	@echo "boilit should now be systemwide available!";
	@echo "Try it in your terminal: boilit MyFirstBoilerPlate";
	@echo "";	


