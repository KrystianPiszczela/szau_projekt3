    Kp = x_best(1); Ti = x_best(2); Td = x_best(3);

    Tp = 1; E = 0;
    kk=1000;
    dane();
    u = zeros(1,kk); y = zeros(1,kk); e = zeros(1,kk); x1 = zeros(1,kk); x2 = zeros(1,kk);
    y_zad(1:0.2*kk) = 0;
    y_zad(0.2*kk:0.4*kk) = -1.5;
    y_zad(0.4*kk:0.6*kk) = 0.5;
    y_zad(0.6*kk:0.8*kk) = -0.5;
    y_zad(0.8*kk:kk) = 0.2;

    r1 = Kp.*((Tp./(2.*Ti))-2*(Td./Tp)-1);
    r2 = Kp.*(Td./Tp);
    r0 = Kp.*(1+(Tp./(2*Ti))+(Td./Tp));


    for k=6:kk
        g1 = (exp(4.75*u(k-3))-1)/(exp(4.75*u(k-3))+1);
        x1(k) = -alfa1*x1(k-1) + x2(k-1) + beta1*g1;
        x2(k) = -alfa2*x1(k-1) + beta2*g1;
        y(k) = 1-exp(-1.5*x1(k));
        e(:,k)=(y_zad(:,k)-y(:,k));
        E = E + e(:,k).^2;
        u(:,k)=r2.*e(:,k-2)+r1.*e(:,k-1)+r0.*e(:,k)+u(:,k-1);
        u(:,k) = max(min(u(:,k),u_max),u_min);
    end
    E
    
figure; plot(y); hold on; plot(y_zad); 
xlabel('Numer próbki k'); ylabel('Wartość y'); legend('y', 'y_{zad}',Location='southeast');
axis([min(0), max(1000), -1.75, 0.75]);
set(gcf,'papersize',[16 12]);
print(gcf,'zad2_PID_y.pdf','-dpdf', '-bestfit', '-r400')
figure; plot(u);  
xlabel('Numer próbki k'); ylabel('Sterowanie u');
set(gcf,'papersize',[16 12]);
print(gcf,'zad2_PID_u.pdf','-dpdf', '-bestfit', '-r400')