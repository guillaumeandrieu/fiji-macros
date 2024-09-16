/*
 GA 2015
 Version 5.0
 NO Z-STACK VERSION
 2-channels version
 EMT specialization (signal list)
 */

macro "EMT Fluoresence Quantification 2 channels Action Tool-C037T0b11FT7b092Tcb09c" {

run("Clear Results");
run("Set Measurements...", "area mean integrated density redirect=None decimal=3");
run("ROI Manager...");

/*
Pour demander le répertoire où enregistrer les données :
+ où ouvrir les images
+ boucle pour ouvrir chaque image 
*/

open();
fileName=getInfo("image.filename");
fileDest=getDirectory("Where to save the results ?");
	
/* Définir le nom du signal à analyser */

var c1Signal = "E-cadherin"; 
var c2Signal = "N-cadherin";
var c3Signal = "vimentin";
var c4Signal = "active beta-catenin";
var c5Signal = "beta-catenin";
var c6Signal = "Keratin 8-18";
var c7Signal = "Keratin 14";
var c8Signal = "DAPI";

rename("stack");
run("Split Channels");	


choiceC1 = newArray(c1Signal, c2Signal, c3Signal, c4Signal, c5Signal, c6Signal, c7Signal, c8Signal);
  Dialog.create("C1"); 
        Dialog.addChoice("Signal name", choiceC1); 
        Dialog.show(); 
       C1 = Dialog.getChoice(); 	


choiceC2 = newArray(c1Signal, c2Signal, c3Signal, c4Signal, c5Signal, c6Signal, c7Signal, c8Signal);
  Dialog.create("C2"); 
        Dialog.addChoice("Signal name", choiceC2); 
        Dialog.show(); 
       C2 = Dialog.getChoice(); 	



singleAnalysis=getBoolean("Do you want to do a single analysis? ");


if (singleAnalysis==true)

{ 

// Sélection du canal à analyser
channelChoice = newArray(C1, C2);
  Dialog.create("Chosen Signal"); 
        Dialog.addChoice("Choose the signal to analyze", channelChoice); 
        Dialog.show(); 
        chosenSignal = Dialog.getChoice(); 	

//Renaming des fenêtres
selectWindow("C1-stack");
rename(C1);

selectWindow("C2-stack");
rename(C2);


// Background intensities measurements 
selectWindow(chosenSignal);
setTool("rectangle");
makeRectangle(93, 72, 7, 7);
waitForUser( "First Analysis - Background ","Add to the ROI Manager 3 background \n\nrectangular zones (same size).\n\nPress OK when you are done.");

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
selectWindow(chosenSignal);

run("Duplicate...","Threshold");
run("8-bit");
run("Grays");
run("Enhance Contrast", "saturated=2 normalize");
run("Threshold...","background");

waitForUser( "First Analysis - ROI ","Select the ROI by thresholding.\n\nPress OK when you are done.");

run("Analyze Particles...", "size=30-Infinity circularity=00-1.00 show=[Overlay Outlines] add");
selectWindow("Threshold");
saveAs("Tiff",fichier+ listeImages[n]+"_"+chosenSignal+"-ROI");
close();

selectWindow(chosenSignal);
roiManager("Measure");


for (row=0; row<nResults; row++){ 
	roiIntDen =getResult("IntDen", row);
	roiArea =getResult("Area", row);

	adjustedFluoROI=((roiIntDen - (roiArea * meanBackInt))/roiArea);  
	
setResult("Adjusted fluoresence",row, adjustedFluoROI);

}


saveAs("Measurements", fichier+ listeImages[n]+"_"+chosenSignal+"-Results.xls");

run("Clear Results");
roiManager("reset");


selectWindow(C1);
run("8-bit");
saveAs("Tiff", fichier+ listeImages[n]+"_"+C1);
close();

selectWindow(C2);
run("8-bit");
saveAs("Tiff", fichier+ listeImages[n]+"_"+C2);
close();

}



if (singleAnalysis==false)

{ 

// Sélection du canal à analyser
channelChoice1 = newArray(C1, C2);
  Dialog.create("First Analysis"); 
        Dialog.addChoice("Choose the first signal to analyze", channelChoice1); 
        Dialog.show(); 
        chosenSignal1 = Dialog.getChoice(); 	


channelChoice2 = newArray(C1, C2);
  Dialog.create("Second Analysis"); 
        Dialog.addChoice("Choose the second signal to analyze", channelChoice2); 
        Dialog.show(); 
        chosenSignal2 = Dialog.getChoice(); 	

//Renaming des fenêtres
selectWindow("C1-stack");
rename(C1);

selectWindow("C2-stack");
rename(C2);



//FIRST ANALYSIS

// Background intensities measurements 
selectWindow(chosenSignal1);
setTool("rectangle");
makeRectangle(93, 72, 7, 7);
waitForUser( "First Analysis - Background ","Add to the ROI Manager 3 background \n\nrectangular zones (same size).\n\nPress OK when you are done.");

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
selectWindow(chosenSignal1);

run("Duplicate...","Threshold");
run("8-bit");
run("Grays");
run("Enhance Contrast", "saturated=2 normalize");
run("Threshold...","background");

waitForUser( "First Analysis - ROI ","Select the ROI by thresholding.\n\nPress OK when you are done.");

run("Analyze Particles...", "size=30-Infinity circularity=00-1.00 show=[Overlay Outlines] add");
selectWindow("Threshold");
saveAs("Tiff",fichier+ listeImages[n]+"_"+chosenSignal1+"-ROI");
close();
selectWindow(chosenSignal1);
roiManager("Measure");


for (row=0; row<nResults; row++){ 
	roiIntDen =getResult("IntDen", row);
	roiArea =getResult("Area", row);

	adjustedFluoROI=((roiIntDen - (roiArea * meanBackInt))/roiArea);  
	
setResult("Adjusted fluoresence",row, adjustedFluoROI);

}


saveAs("Measurements", fichier+ listeImages[n]+"_"+chosenSignal1+"-Results.xls");

run("Clear Results");
roiManager("reset");



//SECOND ANALYSIS


// Background intensities measurements 
selectWindow(chosenSignal2);
setTool("rectangle");
makeRectangle(93, 72, 7, 7);
waitForUser( "Second Analysis - Background ","Add to the ROI Manager 3 background \n\nrectangular zones (same size).\n\nPress OK when you are done.");

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
selectWindow(chosenSignal2);

run("Duplicate...","Threshold");
run("8-bit");
run("Grays");
run("Enhance Contrast", "saturated=2 normalize");
run("Threshold...","background");

waitForUser( "Second Analysis - ROI ","Select the ROI by thresholding.\n\nPress OK when you are done.");

run("Analyze Particles...", "size=30-Infinity circularity=00-1.00 show=[Overlay Outlines] add");
selectWindow("Threshold");
saveAs("Tiff",fichier+ listeImages[n]+"_"+chosenSignal2+"-ROI");
close();

selectWindow(chosenSignal2);
roiManager("Measure");


for (row=0; row<nResults; row++){ 
	roiIntDen =getResult("IntDen", row);
	roiArea =getResult("Area", row);

	adjustedFluoROI=((roiIntDen - (roiArea * meanBackInt))/roiArea);  
	
setResult("Adjusted fluoresence",row, adjustedFluoROI);

}


saveAs("Measurements", fichier+ listeImages[n]+"_"+chosenSignal2+"-Results.xls");

run("Clear Results");
roiManager("reset");



//Save final files and close
selectWindow(C1);
run("8-bit");
saveAs("Tiff", fichier+ listeImages[n]+"_"+C1);
close();

selectWindow(C2);
run("8-bit");
saveAs("Tiff", fichier+ listeImages[n]+"_"+C2);
close();


run("Clear Results");
roiManager("reset") ;


}

print(fichier + listeImages[n]);

}