function S_temp=alg(L_number,r,h)
[S,interf_matrix]=random_Li(L_number,r,h);
 S_temp=getbi(S,interf_matrix,10)
 S(10,:)
 