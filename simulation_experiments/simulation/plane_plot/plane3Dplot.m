function plane3Dplot(target_in_camera)

end_=length(target_in_camera);
for i =1:end_
    target_after_trans=target_in_camera(:,:,i);
    plot3(target_after_trans(:,1), ...
          target_after_trans(:,2), ...
          target_after_trans(:,3),'rO')
    hold on
    plot3(target_after_trans(:,1), ...
          target_after_trans(:,2), ...
          target_after_trans(:,3))
    hold on
end
plot3([0 0],[0 0],[0 50],'r','linewidth',10)
xlabel('x')
ylabel('y')
zlabel('z')
grid on
axis equal
end