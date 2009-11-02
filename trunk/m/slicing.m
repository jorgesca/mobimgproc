%Question No:10
%IMAGE SLICING WITHOUT BACKGROUND


f=imread('C:\Project\mobimgproc\images\white-1.jpg');
f=f(:,:,1);

L=max(max(f));
%a=input('Enter the lower range, a = ');
a=20;
b=100;
[M,N]=size(f);
        for x = 1:M
            for y = 1:N
                if(f(x,y)>=a && f(x,y)<=b)
                    g(x,y)=L;
                else
                    g(x,y)=0;
                end
            end
        end
imshow(f), figure, imshow(g);

