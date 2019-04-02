L_number=50;r=3;h=8;
[S,infMatrix]=random_Li(L_number,r,h);
Amdec=zeros(1,L_number);
pi=zeros(1,L_number);
Ii=zeros(1,L_number);
for playerRun=1:L_number
%%
%º∆À„Am-(»Î±ﬂ) ,Ii,pi

for playerRun_inner=1:L_number
    if infMatrix(playerRun_inner,playerRun)==1
       Amdec(playerRun)=Amdec(playerRun)+min(sum(S(playerRun,:)),sum(S(playerRun_inner,:)));
        Ii(playerRun)=Ii(playerRun)+dot(S(playerRun,:),S(playerRun_inner,:));
%     else
%         if infMatrix(playerRun,playerRun_inner)==1
%             pi(playerRun)=pi(playerRun)+dot(S(playerRun,:),S(playerRun_inner,:));
%         end
    end
end
end
sum(Amdec)
