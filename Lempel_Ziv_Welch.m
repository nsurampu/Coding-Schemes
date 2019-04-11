clear all;

text = 'thisisthe';
i = 1;
j = 1;
dict = {};
code = {};
vals = {};
ascii_max = 256;

while true
    flag = true;
    current_ptr = i;
    next_ptr = i+1;
    if next_ptr > length(text)
        code{end+1} = next;
        break;
    end
    current = text(current_ptr);
    next = text(next_ptr);
    combo = strcat(current, next);
    %disp(combo);
    if length(dict) == 0
        dict{1} = combo;
        i = next_ptr;
        flag = false;
        vals{end+1} = ascii_max;
        ascii_max = ascii_max + 1;
    end
    if flag
        if any(strcmp(dict,combo))
            current = combo;
            next_ptr = next_ptr+1;
            if next_ptr > length(text)
                code{end+1} = combo;
                break;
            end
            next = text(next_ptr);
            combo = strcat(current, next);
        end
        dict{end+1} = combo;
        vals{end+1} = ascii_max;
        ascii_max = ascii_max + 1;
        i = next_ptr;
    end
    code{end+1} = current;
end

construct_dict = containers.Map(dict, vals);
final_code = {};

for i=1:length(code)
    if length(double(code{i})) > 1
        final_code{end+1} = construct_dict(code{i});
    else
        final_code{end+1} = double(code{i});
    end
end
final_code
