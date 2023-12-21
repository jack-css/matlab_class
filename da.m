% 任务复杂度
lamudas = 500:10:1100;
% lamudas = [10,100,200,300,400,500];
% 能耗均值
sum1 = zeros(6,1);
sum2 = zeros(6,1);
for i = 1:length(lamudas)
    lamuda_e = lamudas(i);
%     初始化能耗总值
    a = zeros(10000,1);
    b = zeros(10000,1);
%     运行一万次取平均值
    for j = 1:10000
        [a(j),b(j)] = Time_s(lamuda_e);
    end
    sum1(i)=mean(a);
    sum2(i)=mean(b);
end
plot(lamudas,sum1)
hold on
ylabel('能耗(J)')
xlabel('任务复杂度（单位： CPU cycles/bit）')
plot(lamudas,sum2)
legend('优化策略','mec策略','Location','southeast')



