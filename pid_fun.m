function [E] = pid_fun(parametry)
    Kp =  parametry(:,1); Ti = parametry(:, 2); Td = parametry(:,3);
    

    Tp = 1; E = 0; S = size(parametry,1);
    kk=1000;
    dane();
    u = zeros(S,kk); y = zeros(S,kk); e = zeros(S,kk); x1 = zeros(S,kk); x2 = zeros(S,kk);
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
    E;
end