function score = Hopkins(feature, fraction)
    count = length(feature);
    
    mask = false(count, 1);  % create logical index vector
    mask(1:round(fraction * count)) = true;     
    
    mask = mask(randperm(count));  % randomise order

    feature_sample = feature(mask);
    
    max_value = max(feature);
    min_value = min(feature);
    range = max_value - min_value;
    
    sample_count = length(feature_sample);
    step_size = range/(sample_count - 1);
    syntetic_set = min_value:step_size:max_value;
        
    b = [];
    for grid_point=syntetic_set
        bi = min(abs(feature - grid_point));
        b = [b, bi];
    end
    
    a = [];
    for value=feature_sample.'
        % we need find the minimum distance not to itself,which is always 0
        feature_without_a = feature(:);
        index_of_value = find(feature==value);
        index_of_value = index_of_value(1);
        feature_without_a(index_of_value) = [];
              
        ai = min(abs(feature_without_a - value));
        a = [a, ai];
    end
    
    score = sum(b) / sum(a + b);
end
