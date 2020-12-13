function chromo = InitNonDom(chromo, N, F_NUM, X_DIM)
    % ��ٷ���ʱ�临�Ӷ�o(N*N*F_NUM)
    for i = 1:N
        isNonDominated  = 1;    % assume chromo(i) is non-dominated
        for j = 1:N
            less_or_equal = 0;
            equal = 0;
            for k = 1:F_NUM
                if(chromo(j, X_DIM + k) <= chromo(i, X_DIM + k))
                    less_or_equal = less_or_equal + 1;    % ����j�ڶ��ٸ�Ŀ����<=����i
                end
                if(chromo(j, X_DIM + k) == chromo(i, X_DIM + k))
                    equal = equal + 1;    % ����j�ڶ��ٸ�Ŀ����==����i
                end
                
                % �������A������Ŀ���϶�С�ڵ��ڸ���B����������һ��Ŀ����С�ڸ���B����Ƹ���A֧�����B
                if(less_or_equal == F_NUM && equal ~= F_NUM) % ����j������Ŀ���Ͼ�<=����j, ��������һ��Ŀ��<����j
                    isNonDominated  = 0;    % ����j֧�����i, i���Ƿ�֧�����
                    chromo(i, (X_DIM + F_NUM + 1)) = 0;
                    break;
                end
            end % end j
            if isNonDominated == 1
                chromo(i, (X_DIM + F_NUM + 1)) = 1;     % chromo(i) is truely non-dominated
            end
        end % end i
    end    
end
