clc
clear all
syms a x
y=int(exp(-0.1*a-x.^2/2),'x','-inf','x')
%֮��õ�һ��y��x��func
%%
a=10;
x=0:0.1:4
y=(2^(1/2)*pi^(1/2)*exp(-a/5)*(erf((2^(1/2)*inf)/2) + erf((2^(1/2)*x)/2)))/2
plot(x,y,'-+')
%%
%��Ȼ��֪�����Ǹ���ô���£��������Ի�������
 openExample('matlab/SpecifyDataTypeOfRandomNumbersrandnExample')

