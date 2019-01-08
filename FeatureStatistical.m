function [f]=FeatureStatistical(im)
%  im=double(im);
%  m=mean(im(:));
%  s=std(im(:));
%  f=[m s];
im=imresize(im,[400 400]);
g=extractHOGFeatures(im);
f=num2cell(g,[1 2])  ;

end