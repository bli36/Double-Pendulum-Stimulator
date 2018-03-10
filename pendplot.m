function pendplot(th1, th2)
% PENDPLOT(TH1, TH2)
% Plot a double pendulum with unit lengths defined by angles TH1, TH2

L = 1.0;

x1 = sin(th1);
y1 = -cos(th1);

x2 = x1 + sin(th2);
y2 = y1 - cos(th2);

r = 0.1;
clf;
line([0,x1*(L-r)],[0,y1*(L-r)],'Color','k','LineWidth',4);
line([x1*L,x2*L],[y1*(L+r),y2*(L-r/2)],'Color','k','LineWidth',4);
viscircles(L*[x1,y1], r, 'Color', [0,0.2,0.6], 'LineWidth', 6);
viscircles(L*[x2,y2], r, 'Color', [0,0.6,0.2], 'LineWidth', 6);
axis equal
xlim([-2.5,2.5])
ylim([-2.5,1])