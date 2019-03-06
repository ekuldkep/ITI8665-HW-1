function result = kmeans(data, distFunc, k)
    [rows, columns] = size(data);
    
    % SAMPLE THE DATA for CENTROIDS
    numberOfRows = size(data,1);  % total number of rows 
    mask = false(numberOfRows, 1);   % create logical index vector
    mask(1:k) = true;
    mask = mask(randperm(numberOfRows));% randomise order
    centroids = data(mask,:);
    
    data(:, columns + 1) = 0;
    for iteration = 1:20
        
        for row_index = 1:rows
            point = data(row_index, 1:columns);
            min_distance = Inf;
        
            for centroid_index = 1:k
                centroid = centroids(centroid_index, :);
                distance = distFunc(point, centroid);
            
                if distance < min_distance
                    min_distance = distance;
                    data(row_index, columns + 1) = centroid_index;
                end
            end
        end
        
        for centroid_index = 1:k
            cluster_indexes = find(data(:,columns + 1) == centroid_index);
            
            if cluster_indexes
                for centroid_dimension = 1:columns
                    
                    cluster_dimension_mean = mean(data(cluster_indexes, centroid_dimension));
                    centroids(centroid_index, centroid_dimension) = cluster_dimension_mean;
                end
            end
        end
    end
    result = data(:,columns + 1);
end