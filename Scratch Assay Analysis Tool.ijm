/* GA 2015 Scratch Assay Analysis Tool for ImageJ / Fiji

Measure the area of a scracth within a cell culture or a tissue

*/


macro 'Measure Scratch Assay Action Tool - C037T0b11ST7b09cTcb09r' {

var varianceFilterRadius = 10;
var threshold = 50;
var radiusOpen = 4;
var minSize = 10000;
var methods = newArray("variance", "find edges");
var method = "variance";
var name;
var extraZones;


run("Clear Results");
roiManager("reset") ;
roiManager("Show All with labels");
run("Set Measurements...", "area  decimal=3");


open();
dir = getDirectory("image"); 
name=getTitle;


	
    setForegroundColor(0, 0, 0);
    setBackgroundColor(255, 255, 255);
    roiManager("reset")
    roiManager("Associate", "true");
    if (method=="variance") 
        thresholdVariance();
    else 
        thresholdFindEdges();
        
        
    run("Convert to Mask", " black");
    resetThreshold();
    run("Invert", "stack");
    for (i=0; i<radiusOpen; i++) {
        run("Dilate", "stack");
    }
    for (i=0; i<radiusOpen; i++) {
        run("Erode", "stack");
    }
    run("Select All");
    run("Enlarge...", "enlarge=-" + radiusOpen);
    run("Invert", "stack");
    run("Analyze Particles...", "size="+minSize+"-Infinity circularity=0.00-1.00 show=Nothing add stack");
    run("Clear Results");

extraZones = getBoolean("Is there any unselected area?");

if (extraZones ==true) {
	
	run("Select None");
	run("Analyze Particles...", "size=100-Infinity add");

}

	run("Select All");
    roiManager("Measure"); 
	saveAs("Measurements", dir+name+"-Results.xls");
	//close();
 }
   
  
    
}

macro 'Measure Scratch Assay Action Tool Options' {
     Dialog.create("Scratch Assay Tool Options");
     Dialog.addChoice("method", methods, method);
     Dialog.addNumber("variance filter radius", varianceFilterRadius);
     Dialog.addNumber("threshold", threshold);
     Dialog.addNumber("radius open", radiusOpen);
     Dialog.addNumber("min. size", minSize);
     Dialog.show();
     
     method = Dialog.getChoice();
     varianceFilterRadius= Dialog.getNumber();
     threshold= Dialog.getNumber();
     radiusOpen = Dialog.getNumber();
     minSize = Dialog.getNumber();
}

function thresholdVariance() {
    run("Variance...", "radius=" + varianceFilterRadius + " stack");
    run("8-bit");
    setThreshold(0,threshold);
}

function thresholdFindEdges() {
    run("Find Edges", "stack");
    run("Invert", "stack");
    setAutoThreshold("Percentile dark");
}

