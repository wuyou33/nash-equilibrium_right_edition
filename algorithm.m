function S=algorithm(L_number,r,h,q)
[S,interf_matrix]=random_Li(L_number,r,h);
run_result=zeros(1,q);
U_result=zeros(1,q);
for run=1:q
    for player=1:L_number
        W=player;ctr=0;
        while true
            if W==0
                s_temp=getbi(S,interf_matrix,player);
                if s_temp==S(player,:)
                    if ctr==L_number
                        break;
                    else
                        ctr=ctr+1;
                    end
                    else
                        S(player,:)=s_temp;
                        ctr=0;
                end
                W=L_number;
            else 
                W=W-1;
            end
        end
    end
run_result(run)=run;
U=systempfm(L_number,interf_matrix,S);
U_result(run)=U;
end
plot(run_result,U_result,'-*b');
hold on 

[S,interf_matrix]=random_Li(L_number,r,h);
run_converge=zeros(1,q);
U_converge=zeros(1,q);
for run_con=1:q
      for player=1:L_number
        W=player;ctr=0;
        while true
            if W==0
                s_temp=getbi_1(S,interf_matrix,player);
                if s_temp==S(player,:)
                    if ctr==L_number
                        break;
                    else
                        ctr=ctr+1;
                    end
                    else
                        S(player,:)=s_temp;
                        ctr=0;
                end
                W=L_number;
            else 
                W=W-1;
            end
        end
      end
run_converge(run_con)=run_con;
U=systempfm(L_number,interf_matrix,S);
U_converge(run_con)=U;
end
plot(run_converge,U_converge,'-s');
xlabel('runtime');ylabel('sysperform');
legend('charge','no-charge');
hold off