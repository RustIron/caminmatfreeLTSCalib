function p=plane_estimate(x,corners)
cameraA = [x(1)  0    x(2);
           0    x(3)  x(4);
           0     0      1];
LP=combina(corners,cameraA);
LP_1=[ones(length(LP),1) LP];
[p,~,rp] = regress(LP_1(:,4),LP_1(:,1:3));
end

