function plane2Dplot(plane)

end_=length(plane);
for i =1:end_
    target=plane(:,:,i);
    plot(target(:,1),target(:,2),'b')
    hold on
    plot(target(:,1),target(:,2),'ro')
    hold on 
end
axis equal