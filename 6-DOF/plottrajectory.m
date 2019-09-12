clc 
clear all

syms x y;
%A=[400 -100 320;400 100 320;400 100 420;400 -100 420]; %rectangle
%A=[680 -100 320;600 100 320;600 100 420;680 -100 420]; %slant rectangle
A=[680 -100 320;680 100 320;680 0 420];  %triangle
[row,col]=size(A);
%diving the line segments into multiple points
C=linspace(A(1,1),A(2,1),30);
D=linspace(A(1,2),A(2,2),30);
E=linspace(A(1,3),A(2,3),30);
for i=2:1:row-1
    
F=linspace(A(i,1),A(i+1,1),30);
G=linspace(A(i,2),A(i+1,2),30);
H=linspace(A(i,3),A(i+1,3),30);

C=cat(2,C,F);
D=cat(2,D,G);
E=cat(2,E,H);

end

F=linspace(A(row,1),A(1,1),30);
G=linspace(A(row,2),A(1,2),30);
H=linspace(A(row,3),A(1,3),30);

C=cat(2,C,F);
D=cat(2,D,G);
E=cat(2,E,H);

[row,col]=size(C);

for i=1:1:col
    
    points(i,1)=C(i);
    points(i,2)=D(i);
    points(i,3)=E(i);
    %disp("hello");
    
end

prevangles=[0,0,0,0,0,0]

for i=1:1:col
  
   %anglestoplot=[jacoinverseplot(prevangles(1),prevangles(2),prevangles(3),prevangles(4),prevangles(5),prevangles(6),points(i,1),points(i,2),points(i,3))];
   anglestoplot=[jacoinverseplot(0,0,0,0,0,0,points(i,1),points(i,2),points(i,3))]
    anglestore=transpose(anglestoplot);
   %jacofwdplot(anglestoplot(1), anglestoplot(2), anglestoplot(3), anglestoplot(4),anglestoplot(5),anglestoplot(6));
   prevangles=cat(1,prevangles,anglestore);
   
end

for i=1:1:col
    
    
    jacofwdplot(prevangles(i,1),prevangles(i,2),prevangles(i,3), prevangles(i,4), prevangles(i,5), prevangles(i,6));
    
       
    
end
        
