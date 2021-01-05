clear
clc
close all
addpath(genpath(pwd));
%生成靶标局部分布
    Num_Positon =10;
    length_target = 200;
    plane_local = target_plane(Num_Positon,length_target);
    figure
    plane2Dplot(plane_local)
%生成靶标在相机坐标系下的分布
    plane_after_trans = transform_(plane_local);
    figure
    plane3Dplot(plane_after_trans)
%生成靶标照片
    err_pix = 0.1;
    cameraA = [1200 0 800;
               0 1200 600;
               0    0   1];
    corners = plane_project(cameraA,plane_after_trans,err_pix);
    figure
    plane2Dplot(corners)

  save('corners_.mat','corners','plane_local')