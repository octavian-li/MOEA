function B = FindNeighbors(lamda, T)
    N = size(lamda, 1);
    B = zeros(N, T);
    dist = zeros(N, N); % �����
    
    for i = 1:N
        for j = i:N
            l = lamda(i, :) - lamda(j, :);
            dist(i, j) = sqrt(l*l');    % lamda(i, :)��lamda(i, :)֮���ŷ�Ͼ���
            dist(j, i) = dist(i, j);    % ���öԳƹ�ϵ���ټ�����
        end
    end
    
    for i = 1:N
        for j = 1:N
            [~, index] = sort(dist(i, :));
            % [newArr,index] = sort(oldArr),newArrΪ����������,indexΪnewArr��ÿһԪ����oldArr�е�����
            % oldArr = [5, 4, 3, 2, 1]
            % [newArr, index] = sort(oldArr)
            % >> newArr = 1 2 3 4 5
            % >> index = 5 4 3 2 1
            B(i, :) = index(1:T);
        end
    end
end

