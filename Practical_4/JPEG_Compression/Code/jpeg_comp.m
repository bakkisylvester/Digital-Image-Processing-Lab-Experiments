% --- JPEG Logic Demonstration using DCT and Quantization ---

% Step 1: Prepare the Image Block
% ---------------------------------
% Load a standard 8-bit grayscale image (0-255 pixel values)
originalImage = imread('vin.png'); 
if size(originalImage,3)==3
    originalImage = rgb2gray(originalImage);
end

% Select a sample 8x8 block from the image. 
% Let's take a block from the cameraman's coat (a relatively smooth area).
% Row 141-148, Column 61-68
originalBlock = double(originalImage(141:148, 61:68));

% In JPEG, pixel values are shifted from [0, 255] to [-128, 127]
shiftedBlock = originalBlock - 128;

% Step 2: Apply the Discrete Cosine Transform (DCT)
% ----------------------------------------------------
dctBlock = dct2(shiftedBlock);

% Step 3: Quantization (The Lossy Compression Step)
% ---------------------------------------------------
quantizationTable = [
    16  11  10  16  24  40  51  61;
    12  12  14  19  26  58  60  55;
    14  13  16  24  40  57  69  56;
    14  17  22  29  51  87  80  62;
    18  22  37  56  68 109 103  77;
    24  35  55  64  81 104 113  92;
    49  64  78  87 103 121 120 101;
    72  92  95  98 112 100 103  99
];

% Divide the DCT coefficients by the table and round.
quantizedBlock = round(dctBlock ./ quantizationTable);

% --- DECOMPRESSION PROCESS ---

% Step 4: De-quantization
dequantizedBlock = quantizedBlock .* quantizationTable;

% Step 5: Inverse DCT
reconstructedShiftedBlock = idct2(dequantizedBlock);

% Step 6: Rescale the Reconstructed Block
reconstructedBlock = round(reconstructedShiftedBlock + 128);

% Embed the 8x8 reconstructed Block back into original image 
Compresses_originalImage = originalImage;
Compresses_originalImage(141:148,61:68) = reconstructedBlock;

% --- Step 7: Calculate and Compare Sizes ---
originalSizeBits = numel(originalBlock) * 8;
nonZeroCoeffs = nnz(quantizedBlock); 
estimatedCompressedBits = nonZeroCoeffs * 16; 

if nonZeroCoeffs < 64
    estimatedCompressedBits = estimatedCompressedBits + 4; 
end

compressionRatio = originalSizeBits / estimatedCompressedBits;

% --- Display Results ---
figure;
sgtitle('JPEG DCT Logic on an 8x8 Block');

% Original Block
subplot(2, 3, 1);
imshow(uint8(originalBlock));
title('Original Block');
xlabel(sprintf('Size: %d bits (%d bytes)', originalSizeBits, originalSizeBits/8));

% Original image
subplot(2,3,4);
imshow(originalImage);
title(sprintf('Original Image\n %.2f bytes',originalSizeBits/8));

% Quantized DCT Coefficients
subplot(2, 3, 2);
imagesc(quantizedBlock);
colormap(gca, 'parula');
colorbar;
title('Quantized DCT Coefficients');
xlabel(sprintf('%d non-zero values', nonZeroCoeffs));

% Reconstructed Block
subplot(2, 3, 3);
imshow(uint8(reconstructedBlock));
title('Reconstructed Block');
xlabel('Visually Similar');

% Compressed Image
subplot(2,3,6);
imshow(Compresses_originalImage);
title(sprintf('Compressed Image\n %.2f bytes',estimatedCompressedBits/8));

% --- Print Detailed Size Info to Command Window ---
fprintf('\n--- Size Comparison for the 8x8 Block ---\n');
fprintf('Original Size      : %d pixels * 8 bits/pixel = %d bits (%d bytes)\n', ...
    numel(originalBlock), originalSizeBits, originalSizeBits/8);
fprintf('Compressed Estimate: %d non-zero coeffs * ~16 bits/coeff = %d bits (%.1f bytes)\n', ...
    nonZeroCoeffs, estimatedCompressedBits, estimatedCompressedBits/8);
fprintf('Compression Ratio  : %.1f : 1\n', compressionRatio);
