clc;
clear all;
location = 190;
filename='duigouchuli.xlsx';

offset = xlsread(filename,1,'B1:L1');
location_low = xlsread(filename,1,'B2:L2');
location_high = xlsread(filename,1,'B3:L3');
diff = location_high-location_low

plot([-0.5,0.5],[190,190]);
hold on;
plot(offset,location_low);
hold on;
plot(offset,location_high);
legend('ˮƽ����','����͵�','����ߵ�');
hold on;
plot(offset,diff);
grid on;
grid minor;
title('��ͬƫ�ö�����ߵ�͵͵��Ӱ��');
xlabel('offset voltage');
ylabel('output voltage curve');

