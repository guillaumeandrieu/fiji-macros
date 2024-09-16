/*
GA 2015
Semi-automatic macro to analyze Transwell Migration Assays with Fiji
It is a surface-based analysis.
The macro saves the results in an Excel file and the drawing of the analyzed area.
Open Excel file and make the ratio (100*"SUM Areas")/Total Area to obtain the percentage of area of the insert occupied by migrating cells.
*/
macro "Transwell Migration Analysis Action Tool-C037T0b11TT7b09rTcb09w" {
	
run("Clear Results");
roiManager("reset") ;
run("Set Measurements...", "area redirect=None decimal=3");

/*
Open the files and where to save the data
*/

open();
fileName=getInfo("image.filename");
fileDest=getDirectory("Where to save the results ?");


/*
Isolation of the insert
Determination of the total area
*/


run("Select None");
run("Duplicate..."," ");
run("8-bit");
setTool("oval");
makeOval(108, 312, 3102, 3096);
waitForUser("Insert","Add the ROI to the ROI Manager by pressing T.\n\nClick OK when finished.");
run("Make Inverse");
setBackgroundColor(255, 255, 255);
run("Clear", "slice");
run("Make Inverse");

run("Measure");
roiArea=getResult("Area",0);
run("Clear Results");


// Manual Threshold
run("Brightness/Contrast...");
run("Threshold...");
waitForUser("Manual Threshold", "Threshold all the migratory cells. \n \nApply then click OK when finished.");


// Counting of the surface occupied by migrating cells and saving the results.
run("Analyze Particles...", "size=100-Infinity circularity=0.0-1.00  show=Nothing display clear add");

number=nResults

setResult("Total Area",0,roiArea);
setResult("Number",0,number);


saveAs("Measurements", fileDest + fileName +" - Results.xls");

selectWindow(fileName);
run("From ROI Manager");
saveAs("Tiff", fileDest + fileName +" - Overlay.tiff");
close();
close();
run("Clear Results");
roiManager("reset") ;

print(fileDest + fileName);


}






