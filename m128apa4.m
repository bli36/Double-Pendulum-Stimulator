%Boying Li 26742398
%calculate ang2(100) using h6 and PC
W0 = [1, 1, 0, 0];
h1 = 0.05;
h2 = h1./2;
h3 = h1./4;
h4 = h1./8;
h5 = h1./16;
h6 = 0.01;
i = 4;

t0 = 0;
t1 = (1).*h6;
t2 = (2).*h6;
t3 = (3).*h6;

plotarray = size(100./h6);
plotarray(1) = W0(2);
W1 = RK4(@Fpend, W0, t0, h6);
plotarray(2) = W1(2);
% pendplot(W1(1),W1(2));
% hold off
% pause(0.001);
W2 = RK4(@Fpend, W1, t1, h6);
% plotarray(3) = W2(2);
% pendplot(W2(1),W2(2));
% hold off
% pause(0.001);
W3 = RK4(@Fpend, W2, t2, h6);
% plotarray(4) = W3(2);
% pendplot(W3(1),W3(2));
% hold off
% pause(0.001);
while t3<100-h6
    
    t3 = (i).*h6;
    fprintf('%d is i',i);
    W4 = PC(@Fpend, W0, W1, W2,W3,t3,h6);
    plotarray(i+1) = W4(2);
    disp(W4(2));
    fprintf(' %d is t3',t3);
    pendplot(W4(1),W4(2));
    hold off
    pause(0.1);
    
    %fprintf(' %d is W4',W4);
    if(t3 == 100-h6)
       exact_theta2_100 = W4(2);
       
    else
        i = i + 1;
        W0 = W1;
        W1 = W2;
        W2 = W3;
        W3 = W4;
    end
    
end
fprintf('%d is size',size(plotarray));
disp(plotarray(10000));
plottest(plotarray);


% while t0<100
%     W1 = RK4(@Fpend,W0,t0,h1);
    %pendplot(W1(1),W1(2));
    %hold off
    %pause(0.01);
    t0 = t0+h1;
    W0 = W1;
% end

%using RK4 using h2
% while t0<100
%     W1 = RK4(@Fpend,W0,t0,h2);
%     pendplot(W1(1),W1(2));
%     hold off
%     pause(0.01);
%     t0 = t0+h2;
%     W0 = W1;
%     
%     
% end


%using RK4 using h3
% while t0<100
%     W1 = RK4(@Fpend,W0,t0,h3);
%     pendplot(W1(1),W1(2));
%     hold off
%     pause(0.01);
%     t0 = t0+h3;
%     W0 = W1;
%     
% end

%using RK4 using h4
% while t0<100
%     W1 = RK4(@Fpend,W0,t0,h4);
%     pendplot(W1(1),W1(2));
%     hold off
%     pause(0.01);
%     t0 = t0+h4;
%     W0 = W1;
%     
%     
% end

%using RK4 using h5
% while t0<100
%     W1 = RK4(@Fpend,W0,t0,h5);
%     pendplot(W1(1),W1(2));
%     hold on
%     pause(0.01);
%     t0 = t0+h5;
%     W0 = W1;
% end
% 




