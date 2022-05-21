clear
clc
close all

addpath('functions')

% in cm
grid_height = 3.75;
grid_width = 3.75;

% how many gridpoints per cm
resolution = 20;

% Generate map
map = zeros(grid_height*resolution,grid_width*resolution);

% Add obstacles
map(1:end,1) = ones(grid_height*resolution,1);
map(1:end,end) = ones(grid_height*resolution,1);
map(1,1:end) = ones(grid_width*resolution,1)';
map(end,1:end) = ones(grid_width*resolution,1)';

div1 = grid_width*resolution/5;
div2 = div1*2;
div3 = div1*3;
div4 = div1*4;

map(div1,1:div2) = ones(1,div2);
map(div3,1:div1) = ones(1,div1);
map(div4,div1:div2) = ones(1,div1+1);
map(div2,div1:div3) = ones(1,div2+1);
map(div3,div2:div4) = ones(1,div2+1);
map(div4,div3:end) = ones(1,div2+1);

map(1:div2,div3) = ones(div2,1);
map(div1:div3,div4) = ones(div2+1,1);
map(div3:div4,div2) = ones(div1+1,1);

figure, imshow(map)

map = imdilate(map,strel('disk',6));

figure, imshow(map)

% Clone map with obstacles as a reference
obstacles = map;

% Elements
goal = [floor(div1/2) floor(div1/2)];
start = [div4+floor(div1/2) div4+floor(div1/2)];

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



