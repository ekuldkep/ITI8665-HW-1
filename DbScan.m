function result = DbScan(data, distFunc, epsilon, minPts)
    point_count = length(data);
    
    cluster_count = 0;
    cluster_matrix = zeros(point_count, 2); % labels, is_core
    
    for index = 1:point_count
        
        neighbours = RangeQuery(data, distFunc, data(index,:), epsilon);
        
        neighbours_count = length(neighbours);

        if neighbours_count >= minPts
            cluster_count = cluster_count + 1;                        
            [index, neighbours_count, neighbours_count >= minPts, cluster_count];
            
            % find all core neighbor labels
            is_core_points = neighbours(cluster_matrix(neighbours, 2) == 1);
            core_point_labels = cluster_matrix(is_core_points, 1);
            
            % all labels that are in core_point_labels must be replaced by
            % the new cluster_count
            cluster_matrix(ismember(cluster_matrix(:,1), core_point_labels), 1) = cluster_count;
            
            % mark this index as core point
            cluster_matrix(index, 2) = 1;
            % mark all neighbours as this cluster label
            cluster_matrix(neighbours, 1) = cluster_count;
        end
    end
    result = cluster_matrix(:,1);
    
    uniq = unique(result);
    for index = 1:length(uniq)
        result(result == uniq(index)) = index;
    end
end

function neighbors = RangeQuery(data, distFunc, current, epsilon)
    neighbors = [];
    point_count = length(data);
    for index = 1:point_count
        if distFunc(current, data(index, :)) <= epsilon
            neighbors = [neighbors; index];
        end
    end    
end

