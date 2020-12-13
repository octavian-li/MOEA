function lambda = GenerateLambda(N, F_NUM)

    if F_NUM == 2
        lambda = zeros(N, F_NUM);
        array = (1 : N) / N;
        for i = 1 : N
            lambda(i, 1) = array(i);
            lambda(i, 2) = 1 - array(i);
            % lambda(i, 1) + lambda(i, 2) = 1
        end
        % ��ʱ����Ȩ������lambda������ֱ��x + y = 1��
    end
    
    if F_NUM == 3
        k = 1;
        MAX = ceil(2 + sqrt(2*N));  %֤��������
        array = ( 1 : MAX) / MAX;
        tmp = zeros((1 + (MAX - 2)) * (MAX - 2) / 2, F_NUM);
        for i = 1 : MAX
            for j = 1 : MAX
                if i + j < MAX % ��ָ֤�벻Խ��, 0 <= MAX - i - j <= MAX
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
        %��ʱ����Ȩ������lambda������ƽ��x + y + z = 1��
    end
end

% �������´��룬k���ѭ������Ϊ[1+(M-2)]*(M-2)/2
% ��Ҫ��[1+(M-2)]*(M-2)/2 >= N, M��ȡ2+sqrt(2N)
% [1+sqrt(2N)]*sqrt(2N)/2 > N 
% for i = 1 : M
%     for j = 1 : M
%         if i + j < M
%           k = k + 1;
%         end
%      end
% end

% %�ӳ���ΪN��һά����arr1����ȡM����Ա�����������arr2
% N=5;
% M=3;
% arr1 = rand(1,N)
% index = randperm(N);
% index = sort(index(1:M));
% arr2 = arr1(index)

