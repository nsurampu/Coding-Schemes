clear all;

bit_stream = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1];
count = 0;
code = {};
j = 1;

for i=1:length(bit_stream)-1
    flag = 0;
    if bit_stream(i) == bit_stream(i+1)
        count = count + 1;
    else
        count = count + 1;
        code{j} = strcat(strcat(num2str(bit_stream(i)), ':'), num2str(dec2bin(count)));
        j = j + 1;
        count = 0;
        flag = 1;
    end
end

if flag == 0
    count = count + 1;
    code{j} = strcat(strcat(num2str(bit_stream(i)), ':'), num2str(dec2bin(count)));
end
code