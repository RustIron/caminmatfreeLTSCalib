function plane_after_trans=transform_(plane)
theta_with_z = pi/4;
rotate_=[0,0,theta_with_z];
distance_to_z = 400;
transplace_=[0;0;distance_to_z];
t_Mat = transMat(rotate_,transplace_);
end_=size(plane,3);
for i=1:end_
    target=plane(:,:,i);
    target_=[target zeros(3,1) ones(3,1)]';
    target_after_trans = (t_Mat*target_)';
    plane_after_trans(:,:,i)=target_after_trans;
end
end