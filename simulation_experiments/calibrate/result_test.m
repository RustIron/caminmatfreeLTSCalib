function [result_Contest,rel_err]=result_test(CAM,plane,k)
% k for the number of rand point
% testp=[546   201 1
%        598   904 1
%        826   270 1
%        723   800 1
%        986   199 1
%        1042  588 1
%        1057  634 1
%        1001 1016 1];
testp_=rand(k,2)*1000;
testp=[testp_ ones(length(testp_),1)];


   result_Contest=[];
   result_P=[];
for k = 1:length(plane)
cameraA=CAM(:,:,k);
p=plane(:,:,k);
test_Result=[];
P=[];
    for i = 1:1:length(testp)-1
        testP1=img2camra(testp(i,:)',cameraA,p);
        testP2=img2camra(testp(i+1,:)',cameraA,p);
        P=[P testP1];
        test_Result=[test_Result;norm(testP1-testP2)];
    end
    result_Contest=[result_Contest test_Result];
    result_P=[result_P;P];
end

[a,~]=size(result_Contest);
rel_err=[];
for i=1:a
    row = result_Contest(i,:);
    relative_err=(max(row)-min(row))/row(1);
    rel_err=[rel_err;relative_err];
end

end