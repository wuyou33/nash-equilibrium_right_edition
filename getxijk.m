function xijk=getxijk(S,interf_matrix,L_number,h)
%%
%ªÒµ√xijkæÿ’Û
xijk=zeros(L_number,L_number,h);
for n_for_i=1:L_number-1
    for n_for_j=n_for_i+1:L_number
        if interf_matrix(n_for_i,n_for_j)==1
           for n_for_channel=1:h
               if S(n_for_i,n_for_channel)==S(n_for_j,n_for_channel)&&S(n_for_i,n_for_channel)==1
                   xijk(n_for_i,n_for_j,n_for_channel)=1;
               end
                xijk(n_for_j,n_for_i,n_for_channel)=xijk(n_for_i,n_for_j,n_for_channel);
           end
        end
    end
end
xijk
