function trans=transMat(rotate,transplace)
% % yaw   
% % % ÈÆ z
% % pitch 
% % % ÈÆ y
% % roll ;
% % % ÈÆ x
dcm = angle2dcm(rotate(1),rotate(2),rotate(3));
trans = [dcm transplace];
end