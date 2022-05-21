function nbors = checknbors(point,map,obstacles,goal)
  % Finds neighbours to point in map and filtering out the goal and the
  % obstacles

  % Identify the size of the map
  [row_max col_max] = size(map);

  % Point above
  p_above = [point(1)-1 point(2)-1; point(1)-1 point(2); point(1)-1 point(2)+1];
  % Point below
  p_below = [point(1)+1 point(2)-1; point(1)+1 point(2); point(1)+1 point(2)+1];
  % Point on left
  p_left = [point(1) point(2)-1];
  % Point on right
  p_right = [point(1) point(2)+1];

  % Collect initial possible neighbours
  ini_nbors = [p_above;p_below;p_left;p_right];

  % Remove points out of bounds or which are the goal
  pre_nbors =[];
  for i = 1:size(ini_nbors,1)
      if ini_nbors(i,1) >= 1 && ini_nbors(i,1) <= row_max
          if ini_nbors(i,2) >= 1 && ini_nbors(i,2) <= col_max
              if ini_nbors(i,1) ~= goal(1) || ini_nbors(i,2) ~= goal(1)
                  pre_nbors = [pre_nbors;ini_nbors(i,:)];
              end
          end
      end
  end



  % Identify which neighbour is part of an obstacle
  rem = [];
  for i = 1:size(pre_nbors,1)
      if obstacles(pre_nbors(i,1),pre_nbors(i,2)) == 1
          rem = [rem;i];
      end
  end

  % Remove neighbours which are obstacles
  nbors = [];
  for i = 1:size(pre_nbors,1)
      if any(rem == i) ~= 1
          nbors = [nbors;pre_nbors(i,:)];
      end
  end

end
