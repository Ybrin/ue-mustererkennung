% EFME 4. assignment
% firstname lastname, student id

function [result] = kmedianClustering(data, noc)
% Input
% data ... input data
% noc ... number of clusters

% Output
% result ... cluster labels

% Task 2.1

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
            dist = euclidianMedianDistance(data(i, :), clusters(j, :));
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
        % [newCenter, distMoved] = recenterMedian(clusters(i, :), clusterPoints(i, :));
        [newCenter, distMoved] = recenterMedian(clusters(i, :), pps);
        clusters(i, :) = newCenter;
        
        if distMoved > maxDelta
            maxDelta = distMoved;
        end
    end
    
    if maxDelta < 5
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

function [distance] = euclidianMedianDistance(point1, point2)
xs = (point1(1) - point2(1))^2;
ys = (point1(2) - point2(2))^2;
distance = sqrt(xs + ys);
end

function [newCenter, distMov] = recenterMedian(oldCenter, points)
if size(points, 1) == 0
   newCenter = oldCenter;
   distMov = -Inf;
   return;
end

newCenter = median(points);
distMov = euclidianMedianDistance(oldCenter, newCenter);
end