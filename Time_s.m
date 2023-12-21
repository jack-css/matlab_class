function [E_sum1,E_sum2] = Time_s(lamuda)
%TIME_S 计算能耗
% 输入，时间复杂度，返回两种策略的能耗
% E_sum1是择优计算能耗，E_sum2是全在边缘上计算的能耗
% 式子以及参数定义
% 任务的时间复杂度
N = 20;
lamuda = lamuda*ones(N,1);
% 发送功率
Pn_tx=1 + rand(N,1);
% 本地执行率
Pn_loc = 0.8 + 2.2*rand(N,1);
%  用户要处理的数据的大小
D = 1024* 40*rand(N,1);
% 用户 本地处理能力
Fn_loc = 1024*1024*0.5*ones(N,1);
% 传输数据的速度
Rn_tx = 1024*(1 + 7*rand(N,1));
% 用户在本地执行的耗能
E_loc = Pn_loc.*D.*lamuda./Fn_loc;
% 在服务器执行耗能
E_mec = Pn_tx.*D./Rn_tx;
% 参数定义结束
% 优化处理
% 策略一
L_1 = E_mec<E_loc;
E_sum1 = sum(E_mec(L_1))+sum(E_loc(~L_1));
% 策略二
E_sum2 = sum(E_mec);
end

