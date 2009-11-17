% creates a plot by framing an image into rectangular sections with
% specified width and height

function IF = frame_plot(I, w, h) 

s = size(I);

for row = 1:h:s(1)
    hold on
    plot([1 s(2)], [row row],'LineStyle','-', 'Color',[.8 .8 .8]);
end
    
for col = 1:h:s(2)
    hold on
    plot([col col], [1 s(2)],'LineStyle','-', 'Color',[.8 .8 .8]);
end
