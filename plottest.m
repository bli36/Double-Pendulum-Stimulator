function plottest(arr)
x = 0:0.01:99.99;
y = arr;
figure
plot(x,y);
print('thetaplot','-dpdf');
end