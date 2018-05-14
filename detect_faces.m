% Face Detection
a = imread('1.jpg');
% Reading Image
facedetect = vision.CascadeObjectDetector();
% Deteting Faces
facedetect.MergeThreshold = 7;
BBOX = step(facedetect , a );
b = insertObjectAnnotation(a , 'rectangle' , BBOX , 'face');
imshow(b) , title('detected faces');
% Showing Detected Faces
n = size(BBOX,1);
str_n = num2str(n);
str = strcat('No. of Faces :  ',str_n);
disp(str);
% Segmentation 
I1 = imtophat(a,strel('disk',100));
% Separate Foreground from Background
level = graythresh(I1);
I2 = im2bw(I1,level);
% Changing image from rgb to black and white
I3=~I2;
I4=-bwdist(I3);
I4(I3)= -Inf;
I5= watershed(I4);
I6=label2rgb(I5,'hot','w');
im=a;
im(I5==0)=0;
figure
subplot(2,3,1)
imshow(b)
subplot(2,3,2)
imshow(I1)
subplot(2,3,3)
imshow(I2)
subplot(2,3,4)
imshow(I3)
subplot(2,3,5)
imshow(I6)
subplot(2,3,6)
imshow(im)
