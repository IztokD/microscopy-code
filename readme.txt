Macro code written in ImageJ macro language for extraction of fluorescence intensities of biosensor strain B. subtilis PS-216 (∆comQ, PsrfAA-yfp) (no signal production) to the exogenously added signal molecule as described in Dogsa et al. 

It can be used also for any other bacteria.


The macro works well with zeiss .czi images. It was designed for image file constracted so that it contains 4 field of view, two channels (0= yfp, 1= Dapi) images per well of 96 microtiter plate = total 384 series, each series has two images.
Without any modificatins you can use it also for more series, but not less than 32. 
Please contact me,if you need the macro to work with other construction of image file

1. Open FijiImageJ
2. Open FL_extraction.ijm in FijiImageJ
3. run the code (FL_extraction.ijm) 
4. Choose a Directory to save the results and click OK
5. In Bioformats import manu, only tick Split channels
6. When asked how many series? Write 1-32 or 33-64..., so only 32 series at once 
7. When asked to click OK, first check if automatically applied tresholding is OK- only bacteria (eg. individual bacilli) should be visible. By sliding first slider in Treshold window adjust treshold accordinlgy
Once you are satisfied click OK to continue. The treshold is applied to images of channel 0
8. When asked once again to click OK, you should slide throuh and check, if "Drawing of Stack-1" realy represents the individual bacteria. If not, you should start over (after analysis is finished) and next time choose better tresholds!
9. Press OK
10. The steps from 7. to 9. are repeated for channel 1
11. After "Done." message appeares you can check in the folder for the results. 2 files for each channel are created. In the summary files you have mean fl. intesity, area... for all bacteria of individual images (fileds of view) in results the data for imdividual bacteria in certain channel is displayed. 

Iztok Dogsa, Mihael Spacapan, Anna Dragoš, Tjaša Danevčič, Žiga Pandur, Ines Mandic-Mulec: Peptide signaling without feedback in signal production operates as a true quorum sensing communication system. Comm. Biol. https://doi.org/10.1038/s42003-020-01553-5
