%% Solution for Unsupervised Learning with DBSCAN Clustering Method

alldata = readmatrix('unlabeled_animal_data.csv'); % Loading the data
labels = alldata(:,2); % These only for evaluation
data = alldata(:,4:6); % Remove columns 1, 2, 3, 7, 8, and 9

%% Replace missing values with the median of the corresponding column
data = fillmissing(data,'constant',median(data,'omitnan'));

%% Convert the data into a table
dataTable = array2table(data);
% dataTable.Properties.VariableNames = {'Weight (kg)', 'Lifespan (Years)', 'Body Length (cm)'};

%% Scale the data
dataTableForClustering = varfun(@zscore, dataTable, 'InputVariables', @isnumeric);

%% Apply DBSCAN
epsilon = 0.53; % Determination of the neighborhood size
MinPts = 9; % Minimum number of points in a neighborhood
clusterIdx = dbscan(dataTableForClustering{:,:}, epsilon, MinPts);

%% Remove noise
noiseIdx = (clusterIdx == -1);
clusterIdx(noiseIdx) = [];
dataTableForClustering(noiseIdx,:) = [];
labels(noiseIdx) = [];

%% Create a confusion matrix that compares the true class with the predicted class.
C = confusionmat(labels, clusterIdx);

%% Display the confusion matrix
confusionchart(C);
