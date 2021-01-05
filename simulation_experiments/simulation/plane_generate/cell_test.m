plane=target_plane(10,200);
for i= 1:10
target = plane(:,:,i);
norm(target(1,:)-target(3,:))
end