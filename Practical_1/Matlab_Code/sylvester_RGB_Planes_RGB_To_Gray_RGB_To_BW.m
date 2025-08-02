
img = imread('vin.png'); %Reading the image

%% RGB_PLANES

% Red Plane
Ir = img;
Ir(:,:,2) = 0;  
Ir(:,:,3) = 0;   

% Green Plane
Ig = img;
Ig(:,:,1) = 0; 
Ig(:,:,3) = 0; 

% Blue Plane 
Ib = img;
Ib(:,:,1) = 0;  
Ib(:,:,2) = 0;  

% Displaying All 3 Plane Images
figure;
subplot(1,3,1), imshow(Ir), title('Red Plane');
subplot(1,3,2), imshow(Ig), title('Green Plane');
subplot(1,3,3), imshow(Ib), title('Blue Plane');


%% RGB TO GRAYSCALE 

I = double(img); % For good accuracy converting it into double

% Extract R, G, B 
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
gray = (R + G + B) / 3;
gray_uint8 = uint8(gray);  % Converting it into uint8 to see an image


figure;
imshow(gray_uint8);  % Displaying grayscale image
title('Grayscale Image');

%% RGB TO B&W
gray_norm = gray / 255;     
threshold = 0.5;
bw = gray_norm > threshold;      % Logic (1 for white, 0 for black)


figure;
imshow(bw);  % Displaying BW image
title('B&W Image');
