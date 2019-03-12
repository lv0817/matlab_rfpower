%% 
clc;
clear all;

%% 数据读入
filename='bianyaqi.xlsx';
VIN = xlsread(filename,1,'A2:A36');
VOUT = xlsread(filename,1,'B2:B36');
Fre = xlsread(filename,1,'C2:C36');

tran_ratio = VOUT./VIN; %变压比
Zin = 2.*pi.*Fre.*10^(-6).*500.*10^(-9)
% 变压比数据写入到xls
% xlswrite(filename,tran_ratio,1,'D2:D36');

%% 
figure(1);
% title('输出电压 变压比 与输入频率关系')
subplot(1,2,1)

[hAx,hLine1,hLine2] = plotyy(Fre,VIN,Fre,VOUT);
hLine1.LineStyle = '-';
hLine2.LineStyle = '--';
hLine2.Color='k'
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

[hBx,hLine3,hLine4] = plotyy(Fre,tran_ratio,Fre,VOUT)
hLine3.LineStyle = '-';
hLine4.LineStyle = '--';
hLine4.Color='k'
set(hBx(2),'ylim',[0,250],'ytick',[0,50,100,150,200,250])
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

%% 
figure(2);
plot(Fre,Zin)


