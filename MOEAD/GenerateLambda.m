function lambda = GenerateLambda(N, F_NUM)

    if F_NUM == 2
        lambda = zeros(N, F_NUM);
        array = (1 : N) / N;
        for i = 1 : N
            lambda(i, 1) = array(i);
            lambda(i, 2) = 1 - array(i);
            % lambda(i, 1) + lambda(i, 2) = 1
        end
        % 此时所有权重向量lambda均落在直线x + y = 1上
    end
    
    if F_NUM == 3
        k = 1;
        MAX = ceil(2 + sqrt(2*N));  %证明见最下
        array = ( 1 : MAX) / MAX;
        tmp = zeros((1 + (MAX - 2)) * (MAX - 2) / 2, F_NUM);
        for i = 1 : MAX
            for j = 1 : MAX
                if i + j < MAX % 保证指针不越界, 0 <= MAX - i - j <= MAX
                    tmp(k, 1) = array(i); % array[i] = i / MAX
                    tmp(k, 2) = array(j); % array[j] = j / MAX
                    tmp(k, 3) = array(MAX - i - j);    % array[MAX - i - j] = (MAX - i - j) / MAX
                    % tmp(k, 1) + tmp(k, 2) + tmp(k, 3) = 1
                    k = k + 1;
                end
            end
        end
        len = size(tmp, 1);
        index = randperm(len);
        index = sort(index(1 : N));
        lambda = tmp(index, :);
        %此时所有权重向量lambda均落在平面x + y + z = 1上
    end
end

% 对于以下代码，k最大循环次数为[1+(M-2)]*(M-2)/2
% 若要求[1+(M-2)]*(M-2)/2 >= N, M可取2+sqrt(2N)
% [1+sqrt(2N)]*sqrt(2N)/2 > N 
% for i = 1 : M
%     for j = 1 : M
%         if i + j < M
%           k = k + 1;
%         end
%      end
% end

% %从长度为N的一维数组arr1中任取M个成员，组成新数组arr2
% N=5;
% M=3;
% arr1 = rand(1,N)
% index = randperm(N);
% index = sort(index(1:M));
% arr2 = arr1(index)

