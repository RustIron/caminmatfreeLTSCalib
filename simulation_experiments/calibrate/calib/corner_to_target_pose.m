function P=corner_to_target_pose(LineP,cameraA,L)
P=[];
tmp_=size(LineP);
t=tmp_(3);
for i =1:t
%**************ͼ���*************%
line_ = LineP(:,:,i);
% PL = laserP(:,:,i);
%***********ͼ���ͶӰ��***********%
[a,~] = size(line_);
ones=linspace(1,1,a);
line=[line_ ones'];
p1 = cameraA\line(1,:)';
p2 = cameraA\line(2,:)';
p3 = cameraA\line(3,:)';
%**********�б�λ�˹���************%
[x1,y1,x3]=state_estimate(p1,p2,p3,L);
%**********������������ռ�������***%
p_1=norm([x1,y1])/norm(p1)*p1;
p_3=x3/norm(p3)*p3;
%*********���Ȳ�����ȡ�����*******%
% % % % % %  pl = pl_crossR(P1,P2,P3,PL,p_1,p_3,L);
% % % % % %  laserP_o=[laserP_o pl];
%**********�������ͼ**************%
P_=[p_1';p_3'];
% plot3(P_(:,1),P_(:,2),P_(:,3))
% hold on
P=[P;P_];
% % % % % plot3(pl(1),pl(2),pl(3),'r+')
end
end