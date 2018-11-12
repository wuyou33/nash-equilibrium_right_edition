function Am=getAM(S,interf_matrix,L_number,h)
%%
%统计每个用户的分配的S的数目
s_num=sum(S,2);

%%
%Am为潜在影响图MPING
Am=zeros(L_number);
for i_for_Am_row=1:L_number
    for i_for_Am_column=1:L_number
        if interf_matrix(i_for_Am_row,i_for_Am_column)=1
            Am(i_for_Am_row,i_for_Am_column)=min(s_num(i_for_Am_row),s_num(i_for_Am_column));
        end
    end
end
