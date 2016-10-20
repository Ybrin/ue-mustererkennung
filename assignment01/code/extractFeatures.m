% # EFME 1. assignment
% # Koray Koska, 1528624

function [features] = extractFeatures(imgName)
% ## TASK 4.1
img = imread(imgName);
inv = imcomplement(img);

figure, imshow(inv);
% # image([-0.1 0.1], [0.1 -0.1], img);

area = bwarea(inv);
euler = bweuler(inv);

region = regionprops(inv, 'MajorAxisLength', 'MinorAxisLength', 'Perimeter');
% major = getfield(region, 'MajorAxisLength');
major = region.MajorAxisLength;
minor = region.MinorAxisLength;
perimeter = region.Perimeter;

features = [area, major, minor, euler, perimeter];

disp('-----------------');
disp(['Features of ', imgName]);
disp(['Area: ', num2str(area)]);
disp(['Length of major axis: ', num2str(major)]);
disp(['Length of minor axis: ', num2str(minor)]);
disp(['Euler number: ', num2str(euler)]);
disp(['Perimeter: ', num2str(perimeter)]);
disp('-----------------');

% disp(bweuler(inv));
% disp(bwarea(inv));
% disp(regionprops(inv, 'MajorAxisLength', 'MinorAxisLength'));
% disp(getfield(regionprops(inv, 'MajorAxisLength', 'MinorAxisLength'), 'MajorAxisLength'));
% disp(getfield(regionprops(inv, 'MajorAxisLength', 'MinorAxisLength'), 'MinorAxisLength'));
% disp(getfield(regionprops(inv, 'Perimeter'), 'Perimeter'));
end
