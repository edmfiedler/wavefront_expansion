function route = findroute(goal,start,map,obstacles)
% The optimal route is the one that takes the neighbouring point from the
% start point with the largest discrepancy from that point

% Initialise the route
point = start;
route = [point];
while 1
    % Check neighbours
    nbors = checknbors(point,map,obstacles,goal);
    % Identify difference to neighbours
    diffs = [];
    for i = 1:size(nbors,1)
        if map(nbors(i,1),nbors(i,2)) == 0
            diffs = [diffs;0];
        else
            diffs = [diffs;map(point(1),point(2))-map(nbors(i,1),nbors(i,2))];
        end
    end
    % Find that maximum difference
    idx = find(diffs == max(diffs));
    
    % Update point and add to route
    point = nbors(idx,:);
    route = [route;point];
    
    % If the latest point in the route is a neighbour to the goal, the
    % function is ended
    if abs(point(1)-goal(1)) <= 1 && abs(point(2)-goal(2)) <= 1
        route = [route;goal];
        break
    end
end

end