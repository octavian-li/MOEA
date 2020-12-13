function B = FindNeighbors(lamda, T)
    N = size(lamda, 1);
    B = zeros(N, T);
    dist = zeros(N, N); % 距离表
    
    for i = 1:N
        for j = i:N
            l = lamda(i, :) - lamda(j, :);
            dist(i, j) = sqrt(l*l');    % lamda(i, :)与lamda(i, :)之间的欧氏距离
            dist(j, i) = dist(i, j);    % 利用对称关系减少计算量
        end
    end
    
    for i = 1:N
        for j = 1:N
            [~, index] = sort(dist(i, :));
            % [newArr,index] = sort(oldArr),newArr为排序后的向量,index为newArr中每一元素在oldArr中的索引
            % oldArr = [5, 4, 3, 2, 1]
            % [newArr, index] = sort(oldArr)
            % >> newArr = 1 2 3 4 5
            % >> index = 5 4 3 2 1
            B(i, :) = index(1:T);
        end
    end
end

