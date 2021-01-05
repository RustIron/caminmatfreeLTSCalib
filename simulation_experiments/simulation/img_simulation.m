clear
clc
close all
addpath(genpath(pwd));
%���ɰб�ֲ��ֲ�
    Num_Positon =10;
    length_target = 200;
    plane_local = target_plane(Num_Positon,length_target);
    figure
    plane2Dplot(plane_local)
%���ɰб����������ϵ�µķֲ�
    plane_after_trans = transform_(plane_local);
    figure
    plane3Dplot(plane_after_trans)
%���ɰб���Ƭ
    err_pix = 0.1;
    cameraA = [1200 0 800;
               0 1200 600;
               0    0   1];
    corners = plane_project(cameraA,plane_after_trans,err_pix);
    figure
    plane2Dplot(corners)

  save('corners_.mat','corners','plane_local')