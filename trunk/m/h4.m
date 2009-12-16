% Heuristic 4
% Remove all the blobs which their height is bigger than their width
% Basically it removes all the vertical rectangles!


function newbounds = h4(I, bounds) 

count = 0;
for i = 1: length(bounds)
    y = bounds(i,1);
    x = bounds(i,2);
    w = bounds(i,3); 
    h = bounds(i,4); 
    
    if (w > (h * 80 / 100))
        count = count + 1;
        idx(count) = i;
    end
end

newbounds = bounds(idx, :);

