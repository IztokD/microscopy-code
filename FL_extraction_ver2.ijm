
//created by Iztok Dogsa Chair of Microbiology Department of Food Science and Technology Biotechnical Faculty University of Ljubljana Večna pot 1111000 Ljubljana lovenia EU
// read also redme.txt
// note that the code bellow automatically closes all open windows in ImageJ as a first step
var image_t;

function Close_All_Windows() { 

      while (nImages>0) { 
          selectImage(nImages); 
          close(); 
      } 
     list = getList("window.titles");
     for (i=0; i<list.length; i++){
     winame = list[i];
      selectWindow(winame);
     run("Close");
     }
}

// yfp channel analysis

function extract_fl_ch0() {
	setBatchMode(true);
	run("Images to Stack", "name=Stack title=C=0 use");
	run("Scale...", "x=0.5 y=0.5 z=1.0 width=500 height=500 depth=32 interpolation=Bilinear average process create");
	imageFL=getImageID();
	run("32-bit");
	run("Duplicate...", "duplicate");
	run("Convert to Mask", "method=Moments background=Dark calculate black");
	run("Invert", "stack");
	run("Divide...", "value=255.000 stack");
	run("Despeckle", "stack");
	imageBIN=getImageID();
	imageCalculator("Multiply create 32-bit stack", imageFL, imageBIN);
	imageFL_ozadje=getImageID();
	run("Set Measurements...", "mean area_fraction limit display redirect=None decimal=4");
	for(i=1; i<=nSlices; i++) {
		selectImage(imageBIN); 
		setSlice(i); 
		setThreshold(1, 255);
		run("Clear Results");
		run("Measure");
		frac=getResult("%Area",0);
		selectImage(imageFL_ozadje);
		setSlice(i); 
		run("Clear Results");
		setThreshold(0, 4294967296);
		run("Measure");
		avg=getResult("Mean",0);
		avg=avg/(frac/100);
		print(avg);
		selectImage(imageFL);
		setSlice(i); 
		run("Subtract...","value="+avg);
	} 
	run("Enhance Contrast", "saturated=0.35");
	run("Duplicate...", "title=Stack-yfp duplicate");
	setBatchMode("exit & display");
	selectWindow("Stack-1");
	run("Threshold...");  
	waitForUser;        
	run("Set Measurements...", "area mean integrated area_fraction limit display redirect=None decimal=3");
	run("Analyze Particles...", "size=3-1000 show=Outlines display clear summarize stack");
	waitForUser;
	selectWindow("Stack-1");
	run("Close");
	selectWindow("Summary of Stack-1");
	saveAs("text", dir_save+"summary_ch0"+image_t+"_"+"_fl.xls");
	run("Close");
	selectWindow("Drawing of Stack-1");
	run("Close");
	selectWindow("Stack-yfp");
	run("Close");
	selectWindow("Result of Stack-1");
	run("Close");
	selectWindow("Stack-1");
	run("Close");
	selectWindow("Stack");
	run("Close");
	selectWindow("Results");
	saveAs("text", dir_save+"results_ch0"+image_t+"_"+"_fl.xls");	
	run("Close");
}

// dapi channel analysis
function extract_fl_ch1(){
	setBatchMode(true);
	run("Images to Stack", "name=Stack title=C=1 use");
	run("Scale...", "x=0.5 y=0.5 z=1.0 width=500 height=500 depth=32 interpolation=Bilinear average process create");
	imageFL_1=getImageID();
	run("32-bit");
	run("Duplicate...", "duplicate");
	run("Convert to Mask", "method=Moments background=Dark calculate black");
	run("Invert", "stack");
	run("Divide...", "value=255.000 stack");
	run("Despeckle", "stack");
	imageBIN_1=getImageID();
	imageCalculator("Multiply create 32-bit stack", imageFL_1, imageBIN_1);
	imageFL_ozadje_1=getImageID();
	run("Set Measurements...", "mean area_fraction limit display redirect=None decimal=4");
	for(i=1; i<=nSlices; i++) {
		selectImage(imageBIN_1); 
		setSlice(i); 
		setThreshold(1, 255);
		run("Clear Results");
		run("Measure");
		frac=getResult("%Area",0);
		selectImage(imageFL_ozadje_1);
		setSlice(i); 
		run("Clear Results");
		setThreshold(0, 4294967296);
		run("Measure");
		avg=getResult("Mean",0);
		avg=avg/(frac/100);
		print(avg);
		selectImage(imageFL_1);
		setSlice(i); 
		run("Subtract...","value="+avg);
	} 
	run("Enhance Contrast", "saturated=0.35");
	run("Duplicate...", "title=Stack-yfp duplicate");
	imageFL_1=getImageID();
	setBatchMode("exit & display");
	selectWindow("Stack-1");
	run("Threshold...");  
	waitForUser;        
	run("Set Measurements...", "area mean integrated area_fraction limit display redirect=None decimal=3");
	run("Analyze Particles...", "size=3-1000 show=Outlines display clear summarize stack");

	selectWindow("Summary of Stack-1");
	saveAs("text", dir_save+"summary_ch1"+image_t+"_"+"_fl.xls");
	selectWindow("Results");
	saveAs("text", dir_save+"results_ch1"+image_t+"_"+"_fl.xls");	
}

//main


dir_save=getDirectory("Choose a Directory to save");
Close_All_Windows();
showMessage("Choose flourescence microscopy image file");
open();
image_t=getInfo("image.filename");


extract_fl_ch0();
extract_fl_ch1();

showMessage("Done.");