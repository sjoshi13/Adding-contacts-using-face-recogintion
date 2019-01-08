
%%input image

[fname path]=uigetfile('.jpg','open a face for input');
fname=strcat(path,fname);
im=imread(fname);
imshow(im);
title('input face')
c=input('enter the class');
%%feature extraction
f=FeatureStatistical(im);
try 
    load db;
   
    f=[f c ];
    db=[db;f]
    save db.mat db
catch
    db=[f c ];
    save db.mat db
end