/*
 GA 2017 Macro pour quantifier la fluorescence d'une ROI corrigée par le background 
 Version 5.0

 */

macro "Fluoresence Quantification 1 channel Action Tool-C037T0b11FT7b091Tcb09c" {

run("Clear Results");
run("Set Measurements...", "area mean integrated density redirect=None decimal=3");
run("ROI Manager...");
roiManager("reset") ;

/*
Pour demander le répertoire où enregistrer les données :
+ où ouvrir les images
+ boucle pour ouvrir chaque image 
*/

open();

dir = getDirectory("image"); 
  name=getTitle; 
  path = dir+name; 
	
selectWindow(name);
run("8-bit");
run("Grays");



// Background intensities measurements 
setTool("rectangle");
makeRectangle(93, 72, 7, 7);
waitForUser( "First Analysis - Background ","Add to the ROI Manager 3 background \n\nrectangular zones (same size).\n\nPress 'OK' when you are done.");

roiManager("Measure");


/* Récupération des données
backInt 1,2,3 : Intensité des zones de background 1,2,3 */

backInt1=getResult("Mean",0);
backInt2=getResult("Mean",1);
backInt3=getResult("Mean",2);

meanBackInt=(backInt1+backInt2+backInt3)/3;

run("Clear Results");
roiManager("reset");

//Définition de la ROI et mesure de la fluorescence
selectWindow(name);

run("Duplicate...","Threshold");
run("8-bit");
run("Grays");
run("Enhance Contrast", "saturated=2 normalize");
run("Threshold...","background");

waitForUser( "ROI ","Select the ROI by thresholding.\n\nPRESS 'APPLY' THEN 'OK' when you are done.");
run("Analyze Particles...", "size=30-Infinity pixel circularity=00-1.00 show=[Overlay Outlines] add");


selectWindow(name);
roiManager("Measure");


for (row=0; row<nResults; row++){ 
	roiIntDen =getResult("IntDen", row);
	roiArea =getResult("Area", row);

	adjustedFluoROI=((roiIntDen - (roiArea * meanBackInt))/roiArea);  
	
setResult("Adjusted fluoresence",row, adjustedFluoROI);

}

saveAs("Measurements", path+"-Results.xls");

run("Clear Results");
roiManager("reset");

selectWindow(name);
run("8-bit");
saveAs("Tiff", path);
close();

close();

run("Clear Results");
roiManager("reset") ;

print(name);