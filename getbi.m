function S_temp=getbi(S,interferematrix,numberofplayer)
%%
[row_num,col_num]=size(S);
%计算每个C的权值
weight=zeros(1,col_num);
e_k=zeros(1,col_num);
for iterforchannel=1:col_num
    for iterforinterfere_1=1:row_num
    if interferematrix(iterforinterfere_1,numberofplayer)==1
        e_k(iterforchannel)=1;
        weight(iterforchannel)=weight(iterforchannel)+dot(S(iterforinterfere_1,:),e_k);
        e_k(iterforchannel)=0;
    end
    if interferematrix(numberofplayer,iterforinterfere_1)==1
         e_k(iterforchannel)=1;
         weight(iterforchannel)=weight(iterforchannel)+dot(S(iterforinterfere_1,:),e_k);
         e_k(iterforchannel)=0;
    end
    end
end
[weight_result,ind]=sort(weight);
%%
S_temp=zeros(1,col_num);
tempCounter=sum(S(numberofplayer,:));
for loopfor_S=1:tempCounter
    S_temp(ind(loopfor_S))=1;
end

