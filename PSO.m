function [x] = PSO(S,n,b_lo, b_up, func, term_criteria, w, fi_p, fi_g)
    x = zeros(S,n);
    p =zeros(S,n);
    v1 = zeros(S,n);
    g = ones(1,n);
    counter = 0;
    for i=1:S
        x(i,:) = unifrnd(b_lo,b_up);
        p(i,:) = x(i,:);
        if func(p(i, 1),p(i, 2)) < func(g(1), g(2))
            g = p(i, :);
        end
        v1(i,:) = unifrnd(-abs(b_up-b_lo),abs(b_up-b_lo));
    end
    while counter < term_criteria
        for i = 1:S
            for d = 1:n
                rp = unifrnd(0, 1);
                rg = unifrnd(0, 1);
                v1(i, d) = w * v1(i, d) + fi_p * rp * (p(i, d) - x(i, d)) + fi_g * rg * (g(d) - x(i, d));
            end
            x(i, :) = x(i, :) + v1(i, :);
            if func(x(i,1),x(i,2)) < func(p(i,1),p(i,2))
                p(i, :) = x(i, :);
                if func(p(i, 1),p(i, 2)) < func(g(1), g(2))
                    g = p(i, :);
                end
            end
        end
        counter = counter + 1
    end
end