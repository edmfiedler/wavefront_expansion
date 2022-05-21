clear
clc
close all

addpath('functions')

% Generate map
map = zeros(10,10);


% Add obstacles
map(1:7,3) = ones(7,1);
map(4:10,8) = ones(7,1);

figure, imshow(map)

% Clone map with obstacles as a reference
obstacles = map;

% Elements
goal = [2 2];
start = [9 9];

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



