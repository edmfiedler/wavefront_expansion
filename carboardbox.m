clear
clc
close all

addpath('functions')

% in cm
grid_height = 6;
grid_width = 4.8;

% how many gridpoints per cm
resolution = 20;

% Generate map
map = zeros(grid_height*resolution,grid_width*resolution);

% Add obstacles
map(12:end-13,21:end-20) = ones(96,56);

figure, imshow(map)

map = imdilate(map,strel('disk',6));

figure, imshow(map)

% Clone map with obstacles as a reference
obstacles = map;

% Elements
goal = [60 1];
start = [60 96];

if map(goal(1),goal(2)) == 0
    if map(start(1),start(2)) == 0
        disp('path planning possible')
    end
else
    disp('path planning not possible')
    return
end

% Find populated map with distance info
wavemap = wave(goal,start,map,obstacles)
% Identify the route
route = findroute(goal,start,wavemap,obstacles)

smrscript(route,resolution)



