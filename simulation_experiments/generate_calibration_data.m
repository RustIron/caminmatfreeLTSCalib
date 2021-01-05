    

    plane_local = target_plane(Num_Positon,length_target);
    global L;
    L=length_target;
%     figure;plane2Dplot(plane_local)%绘制靶标分布图
%生成靶标在相机坐标系下的分布
    plane_after_trans = transform_(plane_local);
%    figure;plane3Dplot(plane_after_trans)%绘制靶标转换图
%生成靶标照片
    global corners
    err_pix = 0.1;
    cameraA = [1200 0 800;
               0 1200 600;
               0    0   1];
    corners = plane_project(cameraA,plane_after_trans,err_pix);