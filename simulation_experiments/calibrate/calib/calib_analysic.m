function result=calib_analysic(x)
global corners L plane;
cameraA = [x(1)  0   x(3);
           0    x(2) x(4);
           0     0     1];
LP=corner_to_target_pose(corners,cameraA,L);
LP_1=[ones(length(LP),1) LP];
[plane,~,rp] = regress(LP_1(:,4),LP_1(:,1:3));
result = mean(abs(rp));
end