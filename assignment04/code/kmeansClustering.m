% EFME 4. assignment
% Koray Koska, 1528624

function [result] = kmeansClustering(data, noc)
% Input
% data ... input data
% noc ... number of clusters

% Output
% result ... cluster labels

% Task 1.2

clusters = zeros(noc, size(data, 2));
% disp(clusters);

rng(1234567890);
rands = rand(1,noc);

% disp(data);
% disp(size(data));

for i = 1:noc
   index = int64((size(data, 1) * rands(i)));
   % disp(index);
   
   randPoint = data(index, :);
   % disp(randPoint);
   % disp(clusters(i, :));
   
   clusters(i, :) = randPoint;
end

% disp(clusters);

% disp('******* RUNNING ALGORITHM *******');

% clusterPoints = zeros(size(clusters, 1), 0, 2);
% disp(clusterPoints);

while 1
    for i = 1:size(data, 1)
        minDist = Inf;
        minCluster = 0;
        
        for j = 1:size(clusters, 1)
            dist = euclidianDistance(data(i, :), clusters(j, :));
            % disp(dist);
            
            if dist < minDist
               minDist = dist;
               minCluster = j;
            end
        end
        
        % clusterPoints(minCluster, end + 1, :) = data(i, :);
        data(i, 3) = minCluster;
    end
    
    maxDelta = -Inf;
    
    for i = 1:size(clusters, 1)
        pps = zeros(0, 2);
        for dpp = 1:size(data, 1)
           if data(dpp, 3) == i
              pps(end + 1, :) = data(dpp, 2); 
           end
        end
        % disp(pps);
        % [newCenter, distMoved] = recenter(clusters(i, :), clusterPoints(i, :));
        [newCenter, distMoved] = recenter(clusters(i, :), pps);
        clusters(i, :) = newCenter;
        
        if distMoved > maxDelta
            maxDelta = distMoved;
        end
    end
    
    if maxDelta < 1.5
       break; 
    end
    
    % Reset cluster points for new clean iteration
    % clusterPoints = zeros(size(clusters, 1), 0, 2);
    data = data(:, 1:2);
end

% disp('******* CLUSTERS *******');
% disp(clusters);
% disp('******* CLUSTER POINTS *******');
% disp(clusterPoints);
% disp(data(:, 3));
result = data(:, 3);
end

function [distance] = euclidianDistance(point1, point2)
xs = (point1(1) - point2(1))^2;
ys = (point1(2) - point2(2))^2;
distance = sqrt(xs + ys);
end

function [newCenter, distMov] = recenter(oldCenter, points)
xa = 0;
ya = 0;

if size(points, 1) == 0
   newCenter = oldCenter;
   distMov = -Inf;
   return;
end

for i = 1:size(points, 1)
   xa = xa + points(i, 1);
   ya = ya + points(i, 2);
end

xa = xa / size(points, 1);
ya = ya / size(points, 1);

newCenter = [xa, ya];
distMov = euclidianDistance(oldCenter, newCenter);
end
