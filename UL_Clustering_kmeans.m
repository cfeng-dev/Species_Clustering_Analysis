%% Solution for Unsupervised Learning with k-means Clustering Method

alldata = readmatrix('unlabeled_animal_data.csv'); % Loading the data
labels = alldata(:,2); % These only for evaluation
data = alldata(:,4:6); % Remove columns 1, 2, 3, 7, 8, and 9
numOfClusters = 3; % 3 animal classes

%% Replace missing values with the median of the corresponding column
data = fillmissing(data,'constant',median(data,'omitnan'));

%% Convert the data into a table
dataTable = array2table(data);
% dataTable.Properties.VariableNames = {'Weight (kg)', 'Lifespan (Years)', 'Body Length (cm)'};

%% Scale the data
dataTableForClustering = varfun(@zscore, dataTable, 'InputVariables', @isnumeric);

%% Apply kmeans
[clusterIdx, centroid] = kmeans(dataTableForClustering{:,:}, numOfClusters, 'Distance', 'sqEuclidean');
% [clusterIdx, centroid] = kmeans(dataTableForClustering{:,:}, numOfClusters, 'Distance', 'cityblock');

%% Create a mapping from the original cluster IDs to the new labels
mapping = zeros(numOfClusters, 1);
for i = 1:numOfClusters
    mapping(i) = mode(labels(clusterIdx == i));
end

%% Apply the mapping to the cluster IDs
mappedClusterIdx = arrayfun(@(x) mapping(x), clusterIdx);

%% Create a confusion matrix that compares the true class with the predicted class
C = confusionmat(labels, mappedClusterIdx);

%% Display the confusion matrix
confusionchart(C)
