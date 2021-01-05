function distance_different=laser_dot_2_3D_point(laser_dot,cameraA,laser_plane)
distance_different=zeros(size(laser_dot,3),1);
for i =1:size(laser_dot,3)
%**************图像点*************%
line_ = laser_dot(:,:,i);
% PL = laserP(:,:,i);
%***********图像点投影线***********%
[a,~] = size(line_);
ones=linspace(1,1,a);
line=[line_ ones'];
p1 = cameraA\line(1,:)';
p3 = cameraA\line(3,:)';
%**********根据投影线反求点********%
point3d_1=laser_plane(1)/(p1(3)-laser_plane(2)*p1(1)-laser_plane(3)*p1(2))*p1;
point3d_3=laser_plane(1)/(p3(3)-laser_plane(2)*p3(1)-laser_plane(3)*p3(2))*p3;
distance_different(i) = norm(point3d_3-point3d_1);
end