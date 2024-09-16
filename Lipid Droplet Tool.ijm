/*
 GA 2017 Lipid Droplet Numbering and Sizing 
 Version 2.1
 */

macro "Lipid Droplets Action Tool - C000Db7C000C111D56C111De9C111D89C111D57C111Da8C111D14D16C111D78C111C222D2aC222D06C222D38D72D7aDb8C222D63C222DeaC222D7bD88DebC222D37D55C222D0bC222C333D27D54Dc5C333Db6C333DecC333DceC333Db4Dd4C333D2bD3bD79De8C333D33C444D64C444D67Db5C444D15C444De4C444D3cD4cC444D9eC444D29C444D47C444D8dDf5C444D41Df8C555D98DaeC555DddC555Df7C555D0cD42C555Da3C555D7cD92Da7C555Da2Db2C555D1aDc4C555Dd8Dd9C555D8eDc8C666DafDb3C666D28DedC666D8aC666D73C666DfbC666D23D5cD99C666DdeC666D17D61DfcC666D50C666D43D48D6cDd1C666D13D1bD2eD6bD83C777D68Dd3C777D3dDbeC777D71C777D03D39D53C777D60C777D0dC777D3aDc7C777D1eC777Df4C777C888D8cDe2C888Df6C888D32D82Db1C888D9fC888D22D3eC888De3C888D91C888Df9C888D0eC888Dc1C888C999DbfC999D9dC999D05Dc0De1C999D8bC999D7dD93DcfC999D66D77C999D0aC999D5dC999D2dD65C999DeeC999D2fC999D26D40C999D4bDc9C999Dd2CaaaDe5CaaaD07D24D46CaaaD02DdfCaaaD44Dd0CaaaD31D34CaaaDf0CaaaD7fCaaaD80CaaaD4dDfdCaaaD81CbbbD7eCbbbD70Da4DbdDf1CbbbD04D1fD8fCbbbD62Da1De0CbbbD3fDc6Df2CbbbD6fD97CbbbD6dD90Dd5CbbbD58Db9DdaCbbbD11D21D4fDa0CbbbD51D5bDfeCcccD5fDefCcccD01D30DfaCcccDdcDf3CcccDb0DcdCcccD4eCcccD10CcccD20D5eDadCcccD12Dd7DffCcccD6eCcccDc2CdddD00CdddD2cCdddD52CdddDa9Dc3CdddDbbCdddD69CeeeD25CeeeD94CeeeD74CeeeD9cCeeeD87CeeeD1dCeeeD18D1cDacCeeeD84CfffD09D0fDa6CfffDe7CfffDabCfffD85CfffD36DaaCfffD45CfffD86DdbCfffD49D5aCfffD6aDa5CfffD96CfffD08D75DcbCfffD19D35D4aD59D76D95D9aD9bDbaDbcDcaDccDd6De6" {

run("Clear Results");
run("Set Measurements...", "area redirect=None decimal=3");
run("ROI Manager...");
roiManager("reset") ;
roiManager("Show all with labels");

var cellCounter=1;
var areaAdipo;

//Open images

open();

dir = getDirectory("image"); 
  name=getTitle; 
  path = dir+name; 
  
//Calibration
run("Properties...", "channels=1 slices=1 frames=1 unit=µm pixel_width=0.4860000 pixel_height=0.4860000 voxel_depth=0.4860000");
run("Duplicate...", "title=[working copy]");

selectWindow(name);
run("8-bit");
run("Grays");

selectWindow("working copy");
run("8-bit");
run("Grays");
	
//Image LUT optimization

run("Brightness/Contrast...");
waitForUser( "Brightness/Contrast","Adjust brightness and contrast.\n\nPress OK when you are done.");
run("Apply LUT");

//Thresolding

run("Threshold...");
setOption("BlackBackground", false);

waitForUser("Threshold ","Threshold the lipid droplets.\n\nPress OK when you are done.");

run("Convert to Mask");
run("Fill Holes");
run("Dilate");

//Cell selection
selectWindow(name);
setTool("freehand");
waitForUser("Cell selection","Select cells and add to ROI Manager.\n\nPress OK when you are done.");

//Lipid Droplet Sizing and Numbering

count = roiManager("count");
var cellCounter=1;

for (i = 0; i < count; i++) {
	selectWindow("working copy");
	run("Select None");
	roiManager("Select", i);
	run("Duplicate...", "title=cell#"+cellCounter);
	run("Analyze Particles...", "size=0-Infinity circularity=0.80-1.00 show=Nothing display exclude clear");

	var n=nResults;
	
	setResult("N",0, n);
	
	saveAs("Measurements", path+"-cell#"+cellCounter+"-Results.xls");
	selectWindow("cell#"+cellCounter);
	close();
	
	run("Clear Results");
	cellCounter++;
}
	selectWindow("working copy");
	close();
	selectWindow(name);
	close();

run("Clear Results");
roiManager("reset") ;

	
}
