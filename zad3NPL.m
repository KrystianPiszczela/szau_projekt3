S = 50;            % liczba cząstek
n = 3;             % liczba wymiarów
b_lo = [0 0 0];         % dolne ograniczenie dla każdego wymiaru
b_up = [50 15 30];          % górne ograniczenie dla każdego wymiaru
term_criteria = 100; % kryterium zakończenia
w = 0.65;           % waga inercji
fi_p = 1.1;          % współczynnik osobistej najlepszej pozycji
fi_g = 1.4;        % współczynnik globalnej najlepszej pozycji

[result, x_best] = PSO2(S, n, b_lo, b_up, @npl_fun, term_criteria, w, fi_p, fi_g);
x_best
% disp('Znalezione minimum:');
% disp(result);
disp('Wartość funkcji celu w znalezionym minimum:');
pid_fun(result(end,:))
