function [x] = FA(S, n, b_lo, b_up, func, term_criteria, gamma, alpha)
    x = zeros(S,n);
    for i=1:S
        x(i,:) = unifrnd(b_lo,b_up);
    end
    counter = 0;

    while counter < term_criteria
        for i = 1:S
            attractiveness_sum = zeros(1, n);
            
            for j = 1:S
                if func(x(j, 1),x(j, 2)) < func(x(i, 1),x(i, 2))
                    r = norm(x(j, :) - x(i, :));
                    attractiveness = exp(-gamma * r^2);
                    attractiveness_sum = attractiveness_sum + attractiveness * (x(j, :) - x(i, :));
                end
            end
            
            % Dodanie losowego komponentu
            random_movement = unifrnd(-1, 1, [1, n]) * 0.001;
            
            % Aktualizacja położenia świetlika
            x(i, :) = x(i, :) + alpha * attractiveness_sum + random_movement;
            
            % Ograniczenie do zdefiniowanych granic
            x(i, :) = max(min(x(i, :), b_up), b_lo);
        end

        counter = counter + 1;
    end

    % % Wyszukiwanie najlepszego rozwiązania
    % f_best = func(x(1, :));
    % x_best = x(1, :);
    % for i = 2:S
    %     f_current = func(x(i, :));
    %     if f_current < f_best
    %         f_best = f_current;
    %         x_best = x(i, :);
    %     end
    % end
end