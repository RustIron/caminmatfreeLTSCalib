function plane_img = plane_project(cameraA,plane_after_trans,err)

end_=size(plane_after_trans,3);
for i = 1:end_
    target_=plane_after_trans(:,:,i);
    target_img=cameraA*target_';
    %齐次坐标化普通图像坐标
    %增加噪声试图解决奇异问题
    target_img=[target_img(1:2,1)/target_img(3,1)+err*randn(2,1)...
                target_img(1:2,2)/target_img(3,2)+err*randn(2,1)...
                target_img(1:2,3)/target_img(3,3)+err*randn(2,1)];
    target_img=target_img';

    plane_img(:,:,i)=target_img;
end
end
       