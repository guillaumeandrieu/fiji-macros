/*
 GA 2024 LC3 quantitation
 Version 1.1
 */

macro "LC3 quantitation Action Tool - N33CfffD00CfffD01CfffD02CfffD03CfffD04CfffD05CfffD06CcccD07C777D08C666D09C555D0aC544D0bC555D0cC666D0dC777D0eCcccD0fCfffD0gCfffD0hCfffD0iCfffD0jCfffD0kCfffD0lCfffD0mCfffD10CfffD11CfffD12CfffD13CfffD14CbbbD15C655D16C433D17C433D18C433D19C433D1aC433D1bC433D1cC433D1dC433D1eC433D1fC655D1gCbbbD1hCfffD1iCfffD1jCfffD1kCfffD1lCfffD1mCfffD20CfffD21CfffD22CfffD23C777D24C444D25C433D26C433D27C433D28C433D29C443D2aC382D2bC382D2cC372D2dC443D2eC433D2fC433D2gC433D2hC877D2iCfffD2jCfffD2kCfffD2lCfffD2mCfffD30CfffD31CfffD32C666D33C363D34C392D35C392D36C363D37C433D38C443D39C3a2D3aC3a2D3bC3a2D3cC3a2D3dC382D3eC433D3fC433D3gC433D3hC433D3iC666D3jCfffD3kCfffD3lCfffD3mCfffD40CfffD41C877D42C343D43C3a2D44C3a2D45C3a2D46C3a2D47C443D48C363D49C3a2D4aC3a2D4bC3a2D4cC3a2D4dC3a2D4eC343D4fC433D4gC433D4hC433D4iC433D4jC877D4kCfffD4lCfffD4mCfffD50CbbbD51C433D52C363D53C3a2D54C3a2D55C3a2D56C3a2D57C363D58C373D59C3a2D5aC3a2D5bC3a2D5cC3a2D5dC3a2D5eC353D5fC433D5gC443D5hC353D5iC433D5jC433D5kCbbbD5lCfffD5mCfffD60C655D61C433D62C443D63C3a2D64C3a2D65C3a2D66C3a2D67C443D68C443D69C3a2D6aC3a2D6bC3a2D6cC3a2D6dC392D6eC433D6fC433D6gC382D6hC3a2D6iC453D6jC433D6kC655D6lCfffD6mCcccD70C433D71C433D72C433D73C353D74C382D75C382D76C353D77C433D78C433D79C353D7aC392D7bC3a2D7cC382D7dC443D7eC433D7fC433D7gC363D7hC382D7iC443D7jC433D7kC433D7lCcccD7mC777D80C433D81C433D82C433D83C433D84C433D85C433D86C433D87C433D88C433D89C433D8aC433D8bC433D8cC433D8dC433D8eC433D8fC433D8gC433D8hC433D8iC433D8jC433D8kC433D8lC777D8mC666D90C433D91C382D92C392D93C433D94C433D95C433D96C433D97C433D98C353D99C392D9aC373D9bC433D9cC433D9dC433D9eC433D9fC433D9gC433D9hC433D9iC433D9jC433D9kC433D9lC666D9mC555Da0C433Da1C392Da2C3a2Da3C443Da4C433Da5C433Da6C433Da7C433Da8C363Da9C3a2DaaC392DabC433DacC433DadC443DaeC372DafC392DagC392DahC363DaiC433DajC433DakC433DalC555DamC544Db0C433Db1C433Db2C443Db3C433Db4C353Db5C363Db6C353Db7C433Db8C433Db9C363DbaC443DbbC433DbcC443DbdC392DbeC3a2DbfC3a2DbgC3a2DbhC3a2DbiC372DbjC433DbkC433DblC544DbmC555Dc0C433Dc1C433Dc2C433Dc3C372Dc4C3a2Dc5C3a2Dc6C3a2Dc7C372Dc8C433Dc9C433DcaC433DcbC433DccC363DcdC3a2DceC3a2DcfC3a2DcgC3a2DchC3a2DciC3a2DcjC443DckC433DclC555DcmC666Dd0C433Dd1C433Dd2C343Dd3C3a2Dd4C3a2Dd5C3a2Dd6C3a2Dd7C3a2Dd8C443Dd9C433DdaC433DdbC433DdcC372DddC3a2DdeC3a2DdfC3a2DdgC3a2DdhC3a2DdiC3a2DdjC353DdkC433DdlC666DdmC777De0C433De1C433De2C363De3C3a2De4C3a2De5C3a2De6C3a2De7C3a2De8C353De9C433DeaC433DebC433DecC363DedC3a2DeeC3a2DefC3a2DegC3a2DehC3a2DeiC3a2DejC443DekC433DelC777DemCcccDf0C433Df1C433Df2C443Df3C3a2Df4C3a2Df5C3a2Df6C3a2Df7C3a2Df8C443Df9C433DfaC382DfbC363DfcC433DfdC392DfeC3a2DffC3a2DfgC3a2DfhC3a2DfiC372DfjC433DfkC433DflCcccDfmCfffDg0C655Dg1C433Dg2C433Dg3C363Dg4C3a2Dg5C3a2Dg6C3a2Dg7C363Dg8C433Dg9C433DgaC443DgbC433DgcC433DgdC443DgeC372DgfC392DggC382DghC363DgiC433DgjC433DgkC655DglCfffDgmCfffDh0CbbbDh1C433Dh2C433Dh3C433Dh4C443Dh5C353Dh6C443Dh7C433Dh8C433Dh9C363DhaC382DhbC363DhcC433DhdC433DheC433DhfC433DhgC433DhhC433DhiC433DhjC433DhkCbbbDhlCfffDhmCfffDi0CfffDi1C877Di2C433Di3C433Di4C433Di5C433Di6C433Di7C433Di8C443Di9C3a2DiaC3a2DibC3a2DicC443DidC353DieC372DifC443DigC433DihC433DiiC433DijC888DikCfffDilCfffDimCfffDj0CfffDj1CfffDj2C666Dj3C433Dj4C433Dj5C433Dj6C433Dj7C433Dj8C353Dj9C3a2DjaC3a2DjbC3a2DjcC353DjdC382DjeC3a2DjfC353DjgC433DjhC433DjiC666DjjCfffDjkCfffDjlCfffDjmCfffDk0CfffDk1CfffDk2CfffDk3C877Dk4C433Dk5C433Dk6C433Dk7C433Dk8C433Dk9C372DkaC392DkbC372DkcC433DkdC443DkeC363DkfC433DkgC433DkhC877DkiCfffDkjCfffDkkCfffDklCfffDkmCfffDl0CfffDl1CfffDl2CfffDl3CfffDl4CbbbDl5C655Dl6C433Dl7C433Dl8C433Dl9C433DlaC433DlbC433DlcC433DldC433DleC433DlfC655DlgCbbbDlhCfffDliCfffDljCfffDlkCfffDllCfffDlmCfffDm0CfffDm1CfffDm2CfffDm3CfffDm4CfffDm5CfffDm6CcccDm7C877Dm8C666Dm9C555DmaC544DmbC555DmcC666DmdC877DmeCcccDmfCfffDmgCfffDmhCfffDmiCfffDmjCfffDmkCfffDmlCfffDmm"{


// Initialize
run("Clear Results");
run("Set Measurements...", "area integrated redirect=None decimal=3");
run("ROI Manager...");
roiManager("reset") ;
roiManager("Show all with labels");


/*
Pour demander le répertoire où enregistrer les données :
+ où ouvrir les images
+ boucle pour ouvrir chaque image 
*/

open();
fileName=getInfo("image.filename");
fileDest=getDirectory("Where to save the results ?");
	
/* Définir le nom du signal à analyser */

var c1Signal = "DAPI"; 
var c2Signal = "LC3";
var chosenSignal;

rename("stack");
run("Split Channels");	

choiceC1 = newArray(c1Signal, c2Signal);
  Dialog.create("C1"); 
        Dialog.addChoice("Signal name", choiceC1); 
        Dialog.show(); 
       C1 = Dialog.getChoice(); 	


choiceC2 = newArray(c2Signal, c1Signal);
  Dialog.create("C2"); 
        Dialog.addChoice("Signal name", choiceC2); 
        Dialog.show(); 
       C2 = Dialog.getChoice();
       
//Renaming des fenêtres
selectWindow("C1-stack");
rename(C1);
selectWindow("C2-stack");
rename(C2);

// Sélection du canal à analyser
channelChoice = newArray(C2, C1);
  Dialog.create("Chosen Signal"); 
        Dialog.addChoice("Choose the signal to analyze", channelChoice); 
        Dialog.show(); 
        chosenSignal = Dialog.getChoice();
        

stackChoice = getBoolean("Is the file a z-stack? ");


if (stackChoice==true)

{ 
	selectWindow(chosenSignal); 
	run("Z Project...", "projection=[Sum Slices]");
	run("8-bit");
	
	run("Duplicate...", "title=[duplicated]");
	selectWindow("duplicated");
	saveAs("Tiff", fileDest+ fileName+ "_"+chosenSignal+ "-SUM");
	close();
	selectWindow("SUM_"+chosenSignal);
	rename(chosenSignal + "-working copy");
}

if (stackChoice==false)
{
	selectWindow(chosenSignal); 
	rename(chosenSignal + "-working copy");
}

// Background intensities measurements 
selectWindow(chosenSignal + "-working copy");
setTool("rectangle");
makeRectangle(93, 72, 14, 14);
waitForUser("Background signal","Add to the ROI Manager 3 background \n\nrectangular zones (same size).\n\nPress OK when you are done.");

roiManager("Measure");


/* Récupération des données
backInt 1,2,3 : Intensité des zones de background 1,2,3 */

backInt1=getResult("IntDen",0);
backInt2=getResult("IntDen",1);
backInt3=getResult("IntDen",2);

meanBackInt=(backInt1+backInt2+backInt3)/3;

run("Clear Results");
roiManager("reset");

//Définition de la ROI et mesure de la fluorescence
selectWindow(chosenSignal + "-working copy");

run("Duplicate...", "Threshold");
run("8-bit");
run("Grays");
run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=2 normalize");
run("Threshold...", "background");

waitForUser("ROI definition","Select the ROI by thresholding.\n\nPro-tip: adjust brightness/contrast\nto visualize whole cell areas.\n\nPress OK when you are done.");

run("Analyze Particles...", "size=30-Infinity circularity=00-1.00 show=[Overlay Outlines] add");
selectWindow("Threshold");
saveAs("Tiff", fileDest+ fileName + "_"+chosenSignal+"-ROI");
close();

selectWindow(chosenSignal + "-working copy");
roiManager("Measure");


for (row=0; row<nResults; row++){ 
	roiIntDen =getResult("IntDen", row);
	roiArea =getResult("Area", row);

	adjustedFluoROI=((roiIntDen - (roiArea * meanBackInt))/roiArea);  
	
setResult("Adjusted fluoresence",row, adjustedFluoROI);

}

saveAs("Measurements", fileDest+fileName + "_"+chosenSignal+"-Results.xls");

run("Clear Results");
roiManager("reset");

selectWindow(chosenSignal + "-working copy");
close();

selectWindow(C1);
close();

selectWindow(C2);
close();
}
