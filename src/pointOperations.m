function results = pointOperations(I, outDir)
%POINTOPERATIONS Brightness, contrast and negative point transformations.

if ~isa(I,'uint8')
    I = im2uint8(I);
end

results.bright = clipUint8(double(I) + 50);
results.dark = clipUint8(double(I) - 50);
results.highContrast = clipUint8(1.5 * double(I));
results.lowContrast = clipUint8(0.6 * double(I));
results.negative = 255 - I;

f = figure('Name','Task 5 - Point Operations');
tiledlayout(2,3,'Padding','compact','TileSpacing','compact');
nexttile; imshow(I); title('Original');
nexttile; imshow(results.bright); title('Brightness +50');
nexttile; imshow(results.dark); title('Brightness -50');
nexttile; imshow(results.highContrast); title('Contrast gain = 1.5');
nexttile; imshow(results.lowContrast); title('Contrast gain = 0.6');
nexttile; imshow(results.negative); title('Negative');

if nargin > 1 && ~isempty(outDir)
    exportgraphics(f, fullfile(outDir,'matlab_task5_point_operations.png'), 'Resolution', 180);
end
end
