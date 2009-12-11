% Heuristic 1
% Remove all the found blobs which are very small. This will eliminate
% the noises

function newbounds = h1(I, bounds) 

minWidth = 30;

n = find(not(bounds(:,3) < minWidth & bounds(:,4) < minWidth));

newbounds = bounds(n,:);