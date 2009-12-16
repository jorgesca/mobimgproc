% Heuristic 3
% Remove all the blobs which contain more than 3 colors.
% I -> labeled image

function newbounds = h3(I, maxobjects, bounds) 

count = 0;
for i = 1: length(bounds)
    y = bounds(i,1);
    x = bounds(i,2);
    w = bounds(i,3); 
    h = bounds(i,4); 
    
    cropped = imcrop(I, [y x w h]);
    %figure, imshow(cropped), title('cropped');
    cid = 0;
    
    for j = 0: maxobjects + 1
        cj = find(cropped == j);
        if not(isempty(cj))
            cid = cid + 1;
        end
    end
    
    if cid < 5 % check whether the number of colors found in the cropped blob is less than 4
        count = count + 1;
        idx(count) = i;
    end   
end

newbounds = bounds(idx, :);

