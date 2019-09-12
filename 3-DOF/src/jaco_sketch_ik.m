function theta = jaco_sketch_ik(xc,yc,zc)

% Link Lengths
d1 = 275.5;
d2 = 290;
d3 = 187.468;
d4 = 118.14;

r = sqrt(xc*xc + yc*yc - d4*d4);
% alpha = atan2d(yc,sqrt(xc*xc + yc*yc));
alpha = atan2d(xc,yc)
phi = acosd((r*r + xc*xc + yc*yc - d4*d4)/(2*r*sqrt(xc*xc + yc*yc)));
theta1 = alpha - phi;

d = sqrt(r*r + (zc-d1)^2);
beta = acosd((d*d + d2*d2 - d3*d3)/(2*d*d2));
theta2 = atan2d(zc-d1, r) - beta;

gamma = acosd((d2*d2 + d3*d3 - d*d)/(2*d2*d3));
theta3 = gamma - 90;

    theta = [-theta1 -theta2 -theta3]
end

