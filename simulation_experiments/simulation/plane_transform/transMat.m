function trans=transMat(rotate,transplace)
% % yaw   
% % % �� z
% % pitch 
% % % �� y
% % roll ;
% % % �� x
dcm = angle2dcm(rotate(1),rotate(2),rotate(3));
trans = [dcm transplace];
end