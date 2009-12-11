% Heuristic 2
% Remove all the blobs which contain fully any other blob

function newbounds = h2(I, bounds) 

count = 0;
for i = 1: length(bounds)
    y11 = bounds(i,1);
    x11 = bounds(i,2);
    x12 = x11 + bounds(i,3); % x + w
    y12 = y11 + bounds(i,4); % y + h
    
    for j = i + 1: length(bounds)
        y21 = bounds(j,1);
        x21 = bounds(j,2);
        x22 = x21 + bounds(j,3); % x + w
        y22 = y21 + bounds(j,4); % y + h
        
        if (x11 > x21 && y11 > y21 && x12 < x22 && y12 < y22)
            count = count + 1;
            idx(count) = j;            
            continue;
        end

        if (x11 < x21 && y11 < y21 && x12 > x22 && y12 > y22)
            count = count + 1;
            idx(count) = i;     
            continue;
        end
    end
end

newbounds = bounds;
newbounds(idx) = [];
