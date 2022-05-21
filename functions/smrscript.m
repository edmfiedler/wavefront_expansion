function smrscript(route,resolution)
% Write the smr script based on the route identified
clc

% Identify how far each waypoint is to each other
dist = 1/resolution;

% Initialise
point_row = route(1,1);
point_col = route(1,2);

x = 0; y = 0; th = 0;
for i = 2:size(route,1)
    
    disp('ignoreobstacles')
    % Check if point is to the right
    if route(i,1) == point_row && route(i,2)-point_col == 1
        x = x + dist; y = y; th = 0;
        disp(['drive ',num2str(x),' ',num2str(y),' ',num2str(th),' :($targetdist<0)'])
    end
    
    % Check if point is to the left
    if route(i,1) == point_row && route(i,2)-point_col == -1
        x = x - dist; y = y; th = 180;
        if i == 2
            disp(['turn ',num2str(th)])
            disp('ignoreobstacles')
        end
        disp(['drive ',num2str(x),' ',num2str(y),' ',num2str(th),' :($targetdist<0)'])
    end
    
    % Check if point is above
    if route(i,1)-point_row == -1 && route(i,2) == point_col
        x = x; y = y + dist; th = 90;
        if i == 2
            disp(['turn ',num2str(th)])
            disp('ignoreobstacles')
        end
        disp(['drive ',num2str(x),' ',num2str(y),' ',num2str(th),' :($targetdist<0)'])
    end
    
    % Check if point is below
    if route(i,1)-point_row == 1 && route(i,2) == point_col
        x = x; y = y-dist; th = -90;
        if i == 2
            disp(['turn ',num2str(th)])
            disp('ignoreobstacles')
        end
        disp(['drive ',num2str(x),' ',num2str(y),' ',num2str(th),' :($targetdist<0)'])
    end
    
    % Check if point is above and to the right
    if route(i,1)-point_row == -1 && route(i,2)-point_col == 1
        x = x + dist; y = y + dist; th = 45;
        if i == 2
            disp(['turn ',num2str(th)])
            disp('ignoreobstacles')
        end
        disp(['drive ',num2str(x),' ',num2str(y),' ',num2str(th),' :($targetdist<0)'])
    end
    
    % Check if point is below and to the right
    if route(i,1)-point_row == 1 && route(i,2)-point_col == 1
        x = x + dist; y = y - dist; th = -45;
        if i == 2
            disp(['turn ',num2str(th)])
            disp('ignoreobstacles')
        end
        disp(['drive ',num2str(x),' ',num2str(y),' ',num2str(th),' :($targetdist<0)'])
    end
    
    % Check if point is below and to the left
    if route(i,1)-point_row == 1 && route(i,2)-point_col == -1
        x = x - dist; y = y - dist; th = -135;
        if i == 2
            disp(['turn ',num2str(th)])
            disp('ignoreobstacles')
        end
        disp(['drive ',num2str(x),' ',num2str(y),' ',num2str(th),' :($targetdist<0)'])
    end
    
    % Check if point is above and to the left
    if route(i,1)-point_row == -1 && route(i,2)-point_col == -1
        x = x - dist; y = y + dist; th = 135;
        if i == 2
            disp(['turn ',num2str(th)])
            disp('ignoreobstacles')
        end
        disp(['drive ',num2str(x),' ',num2str(y),' ',num2str(th),' :($targetdist<0)'])
    end
    
    point_row = route(i,1);
    point_col = route(i,2);
end

disp('stop')
end

