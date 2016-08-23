
boilit:
	@echo "";	
	@echo "Chmodding boilit.sh and adding it to ~/.bashrc";	
	@chmod u+x,g+x ./boilit.sh;
	@sed -i '/boilitDirectory=/s@.*@boilitDirectory="$(shell pwd)"@' ./boilit.sh
	@echo "alias boilit='`pwd`/boilit.sh'" >> ~/.bashrc;
	# @eval `source ~/.bashrc`;
	@echo "boilit should now be systemwide available!";
	@echo "Try it in your terminal: boilit MyFirstBoilerPlate";
	@echo "";	


