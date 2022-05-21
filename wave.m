function wavemap = wave(goal,start,map,obstacles)
% Generates the populated map with distances info from the goal to the
% start point

% Initial point
map(goal(1),goal(2)) = 2;
% Initialise the queue with the goal point
queue = goal;
% Run loop until the next neighbour is the start point
while 1
    % Empty the newqueue
    newqueue = [];
    % Loop through the queue
    for i = 1:size(queue,1)
        % Check neighbour of queue point
        nbors = checknbors(queue(i,:),map,obstacles,goal);
        % Loop through the neighbours of the queue point
        for j = 1:size(nbors,1)
            % Check if the neighbour point has distance info
            if map(nbors(j,1),nbors(j,2)) == 0
                % Calculate distance to the queue point
                if nbors(j,1) ~= queue(i,1) && nbors(j,2) ~= queue(i,2)
                    map(nbors(j,1),nbors(j,2)) = map(queue(i,1),queue(i,2)) + 1.41;
                else
                    map(nbors(j,1),nbors(j,2)) = map(queue(i,1),queue(i,2)) + 1;
                end
                % Add 0 point to queue
                newqueue = [newqueue;nbors(j,:)];
            else
                % Calculate distance to queue point and only update if 
                % the new distance is lower than the previous entry 
                if nbors(j,1) ~= queue(i,1) && nbors(j,2) ~= queue(i,2)
                    if map(nbors(j,1),nbors(j,2)) > map(queue(i,1),queue(i,2))+1.41
                        map(nbors(j,1),nbors(j,2)) = map(queue(i,1),queue(i,2))+1.41;
                    end
                else
                    if map(nbors(j,1),nbors(j,2)) > map(queue(i,1),queue(i,2))+1
                        map(nbors(j,1),nbors(j,2)) = map(queue(i,1),queue(i,2)) + 1;
                    end
                end
            end
        end
    end
    
    % Check if the queue contains the start point
    if any(queue(:,1) == start(1)) == 1
        idx = find(queue(:,1) == start(1));
        if any(queue(idx,2) == start(2)) == 1
            wavemap = map;
            break
        end
    end
    % Update the queue
    queue = newqueue;
end

end
