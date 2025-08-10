close all;
clc;

%  Read image
img = imread('vin.png'); 

%  Convert to grayscale
if size(img, 3) == 3
    img = uint8(mean(img, 3));
end

% 3. Get dimensions
[rows, cols] = size(img);

% 4. Initialize bit planes
bit_planes = zeros(rows, cols, 8, 'uint8');

% 5. Extract bits
for k = 1:8
    bit_planes(:, :, k) = bitget(img, k);  
end

% 6. Displaying all bit planes
figure;
for k = 8:-1:1
    subplot(2, 4, 9 - k);
    imshow(logical(bit_planes(:, :, k))); 
    title(['Bit Plane ', num2str(k)]);
end
