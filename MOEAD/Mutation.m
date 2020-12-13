function off = Mutation(off, F_NUM, X_DIM, X_MIN, X_MAX, TEST_SUITE)
    PM = 0.1; % probability of mutation
    n = 5;
    
    if(rand(1) < PM)
        u = rand(1, X_DIM);
        delta = zeros(1, X_DIM);
        
        % ��λ����
        for j = 1:X_DIM
            if(u(j) < 0.5)
                delta(j) = (2*u(j))^(1/(n + 1)) - 1;
            else
                delta(j) = 1 - (2*(1 - u(j)))^(1/(n + 1));
            end
            off(j) = off(j) + delta(j);
            
            %ʹ�Ӵ��ڶ�������
            if(off(j) > X_MAX(j))
                off(j) = X_MAX(j);
            elseif(off(j) < X_MIN(j))
                off(j) = X_MIN(j);
            end
        end
        %�����Ӵ������Ŀ�꺯��ֵ
        off(1, (X_DIM + 1):(X_DIM + F_NUM)) = ObjFun(off, F_NUM, X_DIM, TEST_SUITE);
    end
end
