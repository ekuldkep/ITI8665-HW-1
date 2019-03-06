% clear everything
clc
clear

rng(3);

load("data.mat")

% SAMPLE THE DATA
proportion = .2;      % proportion of rows to select for training
numberOfRows = size(finalMatrixsorted,1);  % total number of rows 
mask = false(numberOfRows, 1);   % create logical index vector
mask(1:round(proportion*numberOfRows)) = true;
mask = mask(randperm(numberOfRows));% randomise order

dataTraining = finalMatrixsorted(mask,:);

data = dataTraining(:,1:2);

idx = DbScan(data, @Chebyshev, 2, 33);

%draw the silhoutte
silhouette(data, idx);
%same function returns values for every data point
s = silhouette(data, idx);
% save the silhoutte values mean value
disp(mean(s));

% PLOT THE DATA
fh(1) = figure(1);
clf(fh(1));

pointSize = 220;

subplot(1,2,1);
scatter(data(: , 1), data(: , 2), pointSize, '.');

subplot(1,2,2);
scatter(data(: , 1), data(: , 2), pointSize, idx,'.');
