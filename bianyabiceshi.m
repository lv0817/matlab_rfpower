%% 
clc;
% clear all;

%% 数据读入
filename='bianyaqi.xlsx';
VIN = xlsread(filename,1,'A2:A36');
VOUT = xlsread(filename,1,'B2:B36');
Fre = xlsread(filename,1,'C2:C36');

[VOUT_MAX,VOUT_i]=max(VOUT);
Fre_MAX = Fre(VOUT_i);

tran_ratio = VOUT./VIN; %变压比
Zin = 2.*pi.*Fre.*10^(-6).*500.*10^(-9);
% 变压比数据写入到xls
% xlswrite(filename,tran_ratio,1,'D2:D36');

%% 
figure('NumberTitle','off','Name','798线圈最大变压比 最大匝数');
% title('输出电压 变压比 与输入频率关系')
subplot(1,2,1)
% plot([3.121,3.121],[0,10],'r')
% hold on
[hAx,hLine1,hLine2] = plotyy(Fre,VIN,Fre,VOUT);
hLine1.LineStyle = '-';
hLine2.LineStyle = '--';
hLine2.Color='k';
% [a1,b1] = max(VIN);
% text(FRE(b1),a1,'MAX');
legend('输入电压','输出电压');
% plot(Fre,VIN,'.');
% grid on;grid minor;
xlabel('Frequency/MHz');
% ylabel('Input Voltage')
ylabel(hAx(1),'Input Voltage');
ylabel(hAx(2),'Output Voltage');
grid on; 
grid minor;
title('输入电压 输出电压 与 输入频率关系');

% 
% subplot(2,2,2)
% plot(Fre,VOUT,'.');
% grid on;grid minor;
% xlabel('Frequency/MHz')
% ylabel('Output Voltage')

subplot(1,2,2)

[hBx,hLine3,hLine4] = plotyy(Fre,tran_ratio,Fre,VOUT);
hLine3.LineStyle = '-';
hLine4.LineStyle = '--';
hLine4.Color='k';
set(hBx(2),'ylim',[0,250],'ytick',[0,50,100,150,200,250])
% hline1b = refline([3.121 0]);
% hline1b.Color = 'r';
% [a1,b1] = max(VIN);
% text(FRE(b1),a1,'MAX');
legend('变压比','输出电压');
% plot(Fre,VIN,'.');
% grid on;grid minor;
xlabel('Frequency/MHz');
% ylabel('Input Voltage')
ylabel(hBx(2),'Output Voltage');
ylabel(hBx(1),'tran_ratio');
grid on; grid minor;
title('输出电压 变压比 与 输入频率关系');

%% 自绕变压器数据读取
VIN2 = xlsread(filename,2,'A2:A35');
VOUT2 = xlsread(filename,2,'B2:B35');
Fre2 = xlsread(filename,2,'C2:C35');
tran_ratio2 = VOUT2./VIN2; %变压比

[VOUT2_MAX,VOUT2_i]=max(VOUT2);
Fre_MAX2 = Fre(VOUT2_i);

%% 自绕变压器绘图
figure('NumberTitle','off','Name','自绕线圈最大变压比 最大匝数');

subplot(1,2,1)

[hAx2,hLine12,hLine22] = plotyy(Fre2,VIN2,Fre2,VOUT2);
hLine12.LineStyle = '-';
hLine22.LineStyle = '--';
hLine22.Color='k';
set(hAx2(2),'ylim',[0,300],'ytick',[0,50,100,150,200,250,300]);
% [a1,b1] = max(VIN);
% text(FRE(b1),a1,'MAX');
legend('输入电压','输出电压');
% plot(Fre,VIN,'.');
% grid on;grid minor;
xlabel('Frequency/MHz');
% ylabel('Input Voltage')
ylabel(hAx2(1),'Input Voltage');
ylabel(hAx2(2),'Output Voltage');
grid on; 
grid minor;
title('输入电压 输出电压 与 输入频率关系');
% 
% subplot(2,2,2)
% plot(Fre,VOUT,'.');
% grid on;grid minor;
% xlabel('Frequency/MHz')
% ylabel('Output Voltage')

subplot(1,2,2)

[hBx2,hLine32,hLine42] = plotyy(Fre2,tran_ratio2,Fre2,VOUT2);
hLine32.LineStyle = '-';
hLine42.LineStyle = '--';
hLine42.Color='k';
set(hBx2(2),'ylim',[0,300],'ytick',[0,50,100,150,200,250,300])
% [a1,b1] = max(VIN);
% text(FRE(b1),a1,'MAX');
legend('变压比','输出电压');
% plot(Fre,VIN,'.');
% grid on;grid minor;
xlabel('Frequency/MHz');
% ylabel('Input Voltage')
ylabel(hBx(2),'Output Voltage');
ylabel(hBx(1),'tran_ratio');
grid on; grid minor;
title('输出电压 变压比 与 输入频率关系');

%% 两个线圈的对比
figure('NumberTitle','off','Name','两个线圈的对比');%3
subplot(1,2,1)
% x = [1:0.01:4];

[hAx3,hLine13,hLine23] = plotyy(Fre,VOUT,Fre2,VOUT2);
hold on
hLine13.LineStyle = '-.';
hLine23.LineStyle = '--';
hLine13.Color='b';
hLine23.Color='g';
set(hAx3(1),'ylim',[0,300],'ytick',[0,50,100,150,200,250,300])
set(hAx3(2),'ylim',[0,300],'ytick',[0,50,100,150,200,250,300])

legend('798线圈','自绕线圈');
xlabel('Frequency/MHz');
% ylabel('Input Voltage')
ylabel(hAx2(1),'Coil 798');
ylabel(hAx2(2),'Coil 自绕');
plot([2.67,2.67],[0,300])%798输出最大
hold on
plot([2.58,2.58],[0,300])%自己线圈最大
hold on
grid on; 
grid minor;
title('两个线圈最大输出电压的对比关系');

subplot(1,2,2)
plot([2.67,2.67],[0,300])%798输出最大
hold on
plot([2.58,2.58],[0,300])%自己线圈最大
hold on
% x = [1:0.01:4];
[hAx4,hLine14,hLine24] = plotyy(Fre,tran_ratio,Fre2,tran_ratio2);
hLine14.LineStyle = '-.';
hLine24.LineStyle = '--';
hLine14.Color='b';
hLine24.Color='g';
set(hAx4(1),'ylim',[0,150],'ytick',[0,25,50,75,100,125,150])
set(hAx4(2),'ylim',[0,150],'ytick',[0,25,50,75,100,125,150])


legend('798线圈','自绕线圈');
xlabel('Frequency/MHz');
% ylabel('Input Voltage')
ylabel(hAx4(1),'Coil 798');
ylabel(hAx4(2),'Coil 自绕');
grid on; 
grid minor;
title('两个线圈变压比的对比关系');

%% 负载接电阻的关系
VIN3 = xlsread(filename,3,'A2:A18');
VOUT3 = xlsread(filename,3,'B2:B18');
Fre3 = xlsread(filename,3,'C2:C18');
tran_ratio2 = VOUT3./VIN3; %变压比

figure('NumberTitle','off','Name','负载为电阻时的情况');


[hAxR,hLine1R,hLine2R] = plotyy(Fre3,VIN3,Fre3,VOUT3);
hLine1R.LineStyle = '-';
hLine2R.LineStyle = '--';
hLine2R.Color='k';
set(hAxR(1),'ylim',[0,10],'ytick',[0:1:10]);
set(hAxR(2),'ylim',[0,70],'ytick',[0:10:70]);
% [a1,b1] = max(VIN);
% text(FRE(b1),a1,'MAX');
legend('输入电压','输出电压');
% plot(Fre,VIN,'.');
% grid on;grid minor;
xlabel('Frequency/MHz');
% ylabel('Input Voltage')
ylabel(hAxR(1),'Input Voltage');
ylabel(hAxR(2),'Output Voltage');
grid on; 
grid minor;
title('电阻的输入电压 输出电压 与 输入频率关系');