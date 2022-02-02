clc;

t = out.time(:,1);
ref = out.ref(:,1);
y = out.X1(:,1);
dist = out.disturbance(:,1);
rate = out.X2(:,1);

figure(1);
clf;
hold on;
grid on;
title("USV Heading Control using CDM");
xlabel("Time (seconds)");
ylabel("Heading angle (degrees)");
plot(t,ref,"Linewidth",2);
plot(t,y,"Linewidth",2);
legend("Reference","USV heading angle","Location","Southeast");

figure(2);
clf;
hold on;
grid on;
title("USV Heading Rate");
xlabel("Time (seconds)");
ylabel("Heading rate (deg/s)");
plot(t,rate,"Linewidth",2);
legend("USV heading rate","Location","Northeast");

stepinfo(y,t,ref(end))
sError = abs(ref(end) - y(end))
