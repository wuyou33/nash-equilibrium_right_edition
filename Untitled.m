clc
clear all
syms a x
y=int(exp(-0.1*a-x.^2/2),'x','-inf','x')
%之后得到一个y对x的func
%%
a=10;
x=0:0.1:4
y=(2^(1/2)*pi^(1/2)*exp(-a/5)*(erf((2^(1/2)*inf)/2) + erf((2^(1/2)*x)/2)))/2
plot(x,y,'-+')
%%
%虽然不知道你那个怎么回事，参数不对还是怎样
 openExample('matlab/SpecifyDataTypeOfRandomNumbersrandnExample')

