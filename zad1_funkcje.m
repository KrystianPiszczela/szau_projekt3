[x1, x2] = meshgrid(-5:0.1:5, -5:0.1:5);

y_ackley = ackley(x1,x2);
y_himmelblau = himmelblau(x1,x2);

figure;
surf(x1, x2, y_ackley);
xlabel('x_1');
ylabel('x_2');
zlabel('y(x1, x2)');
title('Funkcja Ackleya');
% matlab2tikz('zad1_ackley3d.tex','showInfo',false);
saveas(gcf, 'zad1_ackley3d.svg', 'svg');
% print('zad1_ackley3d.png','-dpng','-r100')

figure;
contourf(x1, x2, y_ackley);
xlabel('x_1');
ylabel('x_2');
zlabel('y(x1, x2)');
title('Wykres poziomicowy funkcji Ackley');
% matlab2tikz('zad1_ackleypoz.tex','showInfo',false);
saveas(gcf, 'zad1_ackleypoz.svg', 'svg');
% print('zad1_ackleypoz.png','-dpng','-r100')


figure;
h = surf(x1, x2, y_himmelblau);
set(h,'LineStyle','none')
xlabel('x_1');
ylabel('x_2');
zlabel('y(x1, x2)');
title("Funkcja Himmelblau'a");
% matlab2tikz('zad1_himmel3d.tex','showInfo',false);
saveas(gcf, 'zad1_himmel3d.svg', 'svg');
% print('zad1_himmel3d.png','-dpng','-r100')

figure;
contourf(x1, x2, y_himmelblau, 20);
xlabel('x_1');
ylabel('x_2');
zlabel('y(x1, x2)');
title("Wykres poziomicowy funkcji Himmelblau'a");
% matlab2tikz('zad1_himmelpoz.tex','showInfo',false);
% print('zad1_himmelpoz.png','-dpng','-r100')
saveas(gcf, 'zad1_himmelpoz.svg', 'svg');