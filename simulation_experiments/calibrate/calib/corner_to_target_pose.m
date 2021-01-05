function P=corner_to_target_pose(LineP,cameraA,L)
P=[];
tmp_=size(LineP);
t=tmp_(3);
for i =1:t
%**************图像点*************%
line_ = LineP(:,:,i);
% PL = laserP(:,:,i);
%***********图像点投影线***********%
[a,~] = size(line_);
ones=linspace(1,1,a);
line=[line_ ones'];
p1 = cameraA\line(1,:)';
p2 = cameraA\line(2,:)';
p3 = cameraA\line(3,:)';
%**********靶标位姿估计************%
[x1,y1,x3]=state_estimate(p1,p2,p3,L);
%**********特征点在相机空间中坐标***%
p_1=norm([x1,y1])/norm(p1)*p1;
p_3=x3/norm(p3)*p3;
%*********交比不变求取激光点*******%
% % % % % %  pl = pl_crossR(P1,P2,P3,PL,p_1,p_3,L);
% % % % % %  laserP_o=[laserP_o pl];
%**********特征点绘图**************%
P_=[p_1';p_3'];
% plot3(P_(:,1),P_(:,2),P_(:,3))
% hold on
P=[P;P_];
% % % % % plot3(pl(1),pl(2),pl(3),'r+')
end
end