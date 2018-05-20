
function ys = map2(xs, f)

    [~, cols] = size(xs);
    ys = zeros(cols,1);
    for id = 1 : cols
        ys(id) = f(xs(:,id));
    end

end