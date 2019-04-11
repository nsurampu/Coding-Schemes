% Shannon-Fano-Elias Coding Scheme
% Author: Naren

clear all;

probs = [0.25, 0.5 0.125 0.125];

for i=1:length(probs)
    F(i) = sum(probs(1:i));
end

FF(1) = probs(1)/2;

for i=2:length(probs)
    FF(i) = probs(i)/2 + sum(probs(1:i-1));
end

for i=1:length(probs)
    l(i) = round(log(1/probs(i))/0.6931) + 1;
end

for i=1:length(FF)
    j = 1;
    b_num  = '';
    num = FF(i);
    while true
        f(j) = num * 2;
        num = f(j);
        if f(j) < 1
            f(j) = 0;
            b_num = strcat(b_num, num2str(f(j)));
        elseif f(j) > 1
            num = f(j) - 1;
            f(j) = 1;
            b_num = strcat(b_num, num2str(f(j)));
        else
            f(j) = 1;
            b_num = strcat(b_num, num2str(f(j)));
            while length(b_num) < l(i)
                b_num = strcat(b_num, num2str(0));
            end
            break;
        end
        j = j + 1;
    end
    FF_b{i} = b_num;
end
FF_b