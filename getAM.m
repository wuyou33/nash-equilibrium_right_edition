function Am=getAM(S,interf_matrix,L_number,h)
%%
%ͳ��ÿ���û��ķ����S����Ŀ
s_num=sum(S,2);

%%
%AmΪǱ��Ӱ��ͼMPING
Am=zeros(L_number);
for i_for_Am_row=1:L_number
    for i_for_Am_column=1:L_number
        if interf_matrix(i_for_Am_row,i_for_Am_column)=1
            Am(i_for_Am_row,i_for_Am_column)=min(s_num(i_for_Am_row),s_num(i_for_Am_column));
        end
    end
end
