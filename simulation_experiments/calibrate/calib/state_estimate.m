function [x1,y1,x2]=state_estimate(p1,p2,p3,L)
cos_a = dot(p1,p3)/(norm(p1)*norm(p3));
a = sqrt(1-cos_a^2)/cos_a;
cos_b = dot(p2,p3)/(norm(p3)*norm(p2));
b = sqrt(1-cos_b^2)/cos_b;
x = sqrt(L^2/((4*b/a-2)^2+4*b^2));
y = b*x;
y1= 2*y;
x1= y1/a;
x2= 2*x-x1;
end