clc;
clear all;
close all;
n1=-3:1;
x1=[1 2 4 5 3];
n2=-1:3;
x2=[2 3 2 6 1];
subplot(3,1,1);
stem(n1,x1,'filled','k');
title('signal x1[n]');
xlabel('n');
ylabel('amplitude');
grid on;
subplot(3,1,2);
stem(n2,x2,'filled','r');
title('signal x2[n]');
xlabel('n');
ylabel('amplitude');
grid on;
%align using zero-padding
n_min=min(min(n1),min(n2));
n_max=max(max(n1),max(n2));
n=n_min:n_max;
y1=zeros(1,length(n));
y2=zeros(1,length(n));
for i=1:length(n1)
idx=find(n==n1(i));
y1(idx)=x1(i);
end
y=y1+y2;
%plot the result
subplot(3,1,3);
stem(n,y,'filled','b');
title('addition of signals x1[n]+x2[n]');
xlabel('n');
ylabel('amplitude');
grid on;


