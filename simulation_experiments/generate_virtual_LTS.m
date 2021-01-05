    global plane;
    x0 = [1000,1000,1000,1000];
    options = optimset('Display','off');
    [x,fval] = fminunc(@calib_analysic,x0,options);
    virtual_camera = [x(1)  0   x(3);
                      0    x(2) x(4);
                      0     0     1];
   
%     save('LTS_model',virtual_camera,plane)