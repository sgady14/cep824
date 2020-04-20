% This is an example of a student artifact within the CEP 824 class lesson
% plan

% Written by: Sarah Castle

% ----------------- File Locations -----------------

covidDataFile = 'covid19cases.xlsx';

% ----------------- Data Import -----------------

dataTable = readtable(covidDataFile);


% ----------------- Get Michigan Cases -----------------
michiganCount = 0; % How many cases of COVID confirmed in MI
deleteCount = 0; % How many cases we are deleting from our dataSet
removeRows = []; % Array to keep track of which indices to delete

for i=1:height(dataTable) % Loop through Full Data Set to get only MI cases
    if strcmp(dataTable{i,6}, 'Michigan')    % Data is from Michigan
        michiganCount = michiganCount + 1;  % A way for them to verify if all data from MI kept
    else
        deleteCount = deleteCount + 1;
        removeRows(deleteCount) = i;
    end
end

dataTable(removeRows,:) = [];
% -------------- Summary Statistics --------------
meanNewCase = mean(dataTable{:,2}); % Calculating the mean how many new cases each day in MI (accross Counties)
sdev_meanNewCase = std(dataTable{:,2});  % Calculating the std dev of how many new cases each day in MI (accross Counties)
meanCaseDiff = mean(dataTable{:,3}); % Calculating the mean of the differences between each day
sdev_meanCaseDiff = std(dataTable{:,2});   % Calculating the std dev of the differences between each day


% -------------- Sorting based on total new case count  --------------

dataTable = sortrows(dataTable,'Cases','descend'); % This way we can visually inspect the data table as well