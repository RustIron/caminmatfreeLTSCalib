plane_after_trans=transform_(plane);
for i= 1:10
target = plane_after_trans(:,:,i);
norm(target(1,:)-target(3,:))
end