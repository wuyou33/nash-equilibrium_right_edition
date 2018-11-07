function getrandom=random_Li(L_number,r,h)
%%
%获得random channel 矩阵，对应S，为L_number*h的矩阵
S=binornd(1,r/h,[L_number h]);
%%
%获取每个Link的中心位置与半径矩阵，对应location与radius(length)
%默认分布空间1000*1000
location=int16(unifrnd(0,1000,[2 L_number]));
x=location(1,:);
y=location(2,:);
figure
hold on
scatter(x,y,'Y');
radius=int16(unifrnd(1,30,[1 L_number]));
theta=unifrnd(0,2*pi,[1 L_number]);
deta(2,L_number)=0;
for i_for_deta=1:L_number
    deta(1,i_for_deta)=radius(1,i_for_deta)*cos(theta(1,i_for_deta))/2;
    deta(2,i_for_deta)=radius(1,i_for_deta)*sin(theta(1,i_for_deta))/2;
end
%%
%确定Vi和Ui的位置
v_location(2,L_number)=0;
u_location(2,L_number)=0;
%预分配内存
for i_for_location=1:L_number
    v_location(1,i_for_location)=location(1,i_for_location)-deta(1,i_for_location);
    v_location(2,i_for_location)=location(2,i_for_location)-deta(2,i_for_location);
    u_location(1,i_for_location)=location(1,i_for_location)+deta(1,i_for_location);
    u_location(2,i_for_location)=location(2,i_for_location)+deta(2,i_for_location);
end
%%
%验证位置 ：ok
scatter(v_location(1,:),v_location(2,:),'G')
scatter(u_location(1,:),u_location(2,:),'filled')
hold off
%%
%设定干扰范围,2倍link长度(ok),获得干扰矩阵，为一个对称阵
interf_matrix=zeros(L_number);
interference_range=2*radius;
for i_for_interference=1:L_number-1
    for i_for_interference_1=i_for_interference+1:L_number
        distance_vi_vj_x=abs(v_location(1,i_for_interference)-v_location(1,i_for_interference_1));
        distance_vi_vj_y=abs(v_location(2,i_for_interference)-v_location(2,i_for_interference_1));
        distance_vi_vj=sqrt(distance_vi_vj_x^2+distance_vi_vj_y^2);
        
        distance_vi_uj_x=abs(v_location(1,i_for_interference)-u_location(1,i_for_interference_1));
        distance_vi_uj_y=abs(v_location(2,i_for_interference)-u_location(2,i_for_interference_1));
        distance_vi_uj=sqrt(distance_vi_uj_x^2+distance_vi_uj_y^2);
        
        distance_ui_vj_x=abs(u_location(1,i_for_interference)-v_location(1,i_for_interference_1));
        distance_ui_vj_y=abs(u_location(2,i_for_interference)-v_location(2,i_for_interference_1));
        distance_ui_vj=sqrt(distance_ui_vj_x^2+distance_ui_vj_y^2);
        
        distance_ui_uj_x=abs(u_location(1,i_for_interference)-u_location(1,i_for_interference_1));
        distance_ui_uj_y=abs(u_location(2,i_for_interference)-u_location(2,i_for_interference_1));
        distance_ui_uj=sqrt(distance_ui_uj_x^2+distance_ui_uj_y^2);
        
        if distance_vi_vj<interference_range(1,i_for_interference)|distance_vi_vj<interference_range(1,i_for_interference_1)
            interf_matrix(i_for_interference,i_for_interference_1)=1;
        elseif distance_vi_uj<interference_range(1,i_for_interference)|distance_vi_vj<interference_range(1,i_for_interference_1)
            interf_matrix(i_for_interference,i_for_interference_1)=1;
        elseif distance_ui_uj<interference_range(1,i_for_interference)|distance_vi_vj<interference_range(1,i_for_interference_1)
            interf_matrix(i_for_interference,i_for_interference_1)=1;
        elseif distance_ui_vj<interference_range(1,i_for_interference)|distance_vi_vj<interference_range(1,i_for_interference_1)
            interf_matrix(i_for_interference,i_for_interference_1)=1;
        end
        
        interf_matrix(i_for_interference_1,i_for_interference)=interf_matrix(i_for_interference,i_for_interference_1);
    end
end

interf_matrix;
 %%
 %获得xijk矩阵
 
