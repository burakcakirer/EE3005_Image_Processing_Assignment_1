%% EE3005 Image Processing - Assignment 1
% Fundamentals of Image Representation and Enhancement
% Student: Burak Bekir Cakirer
% Student ID: 2211011008
%
% Run this script from MATLAB. It reads the supplied images from ../data,
% performs all assignment tasks, and writes figures to ../outputs.

clear; close all; clc;

srcDir = fileparts(mfilename('fullpath'));
addpath(srcDir);
rootDir = fileparts(srcDir);
dataDir = fullfile(rootDir, 'data');
outDir  = fullfile(rootDir, 'outputs');
if ~exist(outDir, 'dir'), mkdir(outDir); end

%% Task 1 - Image reading and matrix representation
img1 = imread(fullfile(dataDir, 'image3.jpg'));
if size(img1,3) == 3
    grayImg = rgb2gray(img1);
else
    grayImg = img1;
end

fprintf('Task 1: image size = %d x %d\n', size(grayImg,1), size(grayImg,2));
displayMatrixRepresentation(grayImg, outDir);

f = figure('Name','Task 1 - Grayscale Image');
imshow(grayImg, []);
title(sprintf('Grayscale Biomedical Image (%d x %d)', size(grayImg,1), size(grayImg,2)));
exportgraphics(f, fullfile(outDir,'matlab_task1_grayscale_image.png'), 'Resolution', 180);

%% Task 2 - Separating RGB channels
rgbImg = imread(fullfile(dataDir, 'image_rgb_matlab.png'));
[R,G,B] = separateRGBChannels(rgbImg, outDir);

%% Task 3 - Summary and applications
% This task is mainly discussed in the report. In MATLAB, the important
% concept is that grayscale images are MxN matrices and RGB images are
% MxNx3 arrays. Each channel can therefore be processed independently.

%% Task 4 - DICOM reading, display, and metadata extraction
dicomPath = fullfile(dataDir, 'image4.dcm');
dicomImg = dicomread(dicomPath);
dicomMeta = dicominfo(dicomPath);

f = figure('Name','Task 4 - DICOM');
% DICOM images may contain 12-bit or 16-bit data. imshow(...,[]) scales the
% stored range for display without changing the original pixel matrix.
imshow(dicomImg, []);
title('DICOM MR Image');
exportgraphics(f, fullfile(outDir,'matlab_task4_dicom_image.png'), 'Resolution', 180);

displayDicomMetadata(dicomMeta);

%% Task 5 - Point operations
pointResults = pointOperations(grayImg, outDir);

%% Task 6 - Histogram analysis
f = figure('Name','Task 6 - Grayscale Histogram');
imhist(grayImg, 256);
title('Grayscale Histogram');
xlabel('Intensity value'); ylabel('Number of pixels');
exportgraphics(f, fullfile(outDir,'matlab_task6_grayscale_histogram.png'), 'Resolution', 180);

plotRGBHistograms(rgbImg, outDir);

%% Task 7 - Histogram equalization
% Using 256 bins makes the mapping explicitly cover the full 8-bit range.
equalizedImg = histeq(grayImg, 256);

f = figure('Name','Task 7 - Histogram Equalization');
tiledlayout(2,2,'Padding','compact','TileSpacing','compact');
nexttile; imshow(grayImg, []); title('Original image');
nexttile; imhist(grayImg, 256); title('Original histogram');
nexttile; imshow(equalizedImg, []); title('Histogram-equalized image');
nexttile; imhist(equalizedImg, 256); title('Equalized histogram');
exportgraphics(f, fullfile(outDir,'matlab_task7_histogram_equalization.png'), 'Resolution', 180);

%% Task 8 - Image enhancement comparison
% Point enhancement: gain followed by brightness offset.
pointEnhanced = clipUint8(1.25 * double(grayImg) + 15);

f = figure('Name','Task 8 - Enhancement Comparison');
tiledlayout(1,3,'Padding','compact','TileSpacing','compact');
nexttile; imshow(grayImg,[]); title('Original');
nexttile; imshow(pointEnhanced,[]); title('Point: 1.25x + 15');
nexttile; imshow(equalizedImg,[]); title('Histogram equalization');
exportgraphics(f, fullfile(outDir,'matlab_task8_enhancement_comparison.png'), 'Resolution', 180);

f = figure('Name','Task 8 - Histogram Comparison');
[h0,x0] = imhist(grayImg,256);
[hp,xp] = imhist(pointEnhanced,256);
[he,xe] = imhist(equalizedImg,256);
plot(x0,h0,'LineWidth',1.0); hold on;
plot(xp,hp,'LineWidth',1.0);
plot(xe,he,'LineWidth',1.0);
grid on; xlim([0 255]);
xlabel('Intensity value'); ylabel('Number of pixels');
title('Histogram Comparison');
legend('Original','Point enhancement','Histogram equalization','Location','best');
exportgraphics(f, fullfile(outDir,'matlab_task8_histogram_comparison.png'), 'Resolution', 180);

%% Numerical metrics used in the report
names = {'Original','Brightness +50','Brightness -50','Contrast x1.5', ...
         'Contrast x0.6','Negative','Point enhancement','Histogram equalization'};
imgs = {grayImg,pointResults.bright,pointResults.dark,pointResults.highContrast, ...
        pointResults.lowContrast,pointResults.negative,pointEnhanced,equalizedImg};

fprintf('\nImage metrics (8-bit scale):\n');
fprintf('%-24s %8s %8s %10s %10s\n','Image','Min','Max','Mean','StdDev');
for k = 1:numel(imgs)
    a = double(imgs{k});
    fprintf('%-24s %8.0f %8.0f %10.3f %10.3f\n', names{k}, min(a(:)), max(a(:)), mean(a(:)), std(a(:),1));
end

fprintf('\nAll tasks finished. Outputs saved to:\n%s\n', outDir);
