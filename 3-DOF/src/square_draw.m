function square_draw(points)
%SQUARE Summary of this function goes here
%   Detailed explanation goes here
% pause(4);
count = 0;
[rows, ~] = size(points);
theta = [];
A = [];
B = [];
C = [];
for i=1:(rows-1)
   A = [A linspace(points(i,1),points(i+1,1), 40)];
   B = [B linspace(points(i,2),points(i+1,2), 40)];
   C = [C linspace(points(i,3),points(i+1,3), 40)];  
end

A = [A linspace(points(rows,1), points(1,1), 40)];
B = [B linspace(points(rows,2), points(1,2), 40)];
C = [C linspace(points(rows,3), points(1,3), 40)];

[~,cols] = size(A);

for i=1:cols
   if(A(i)< 0 || B(i)<0 || C(i)<0)
       disp('Point not in 1st quadrant');
       count= count + 1;
       break;
   end
   theta = [theta; jaco_sketch_ik(A(1,i),B(1,i),C(1,i))];
end

if count > 0
    return
else
    jaco_vrep(theta);

end