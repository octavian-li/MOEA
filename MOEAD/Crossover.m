function [off1, off2] = Crossover(parent1,  parent2,  F_NUM,  X_DIM,  X_MIN,  X_MAX, TEST_SUITE)
    PC = 1; % probability of cross
    n = 2;
    %Simulated Binary Crossover
    if(rand(1) < PC)
        %��ʼ���Ӵ���Ⱥ
        off1 = zeros(1, X_DIM + F_NUM + 1);
        off2 = zeros(1, X_DIM + F_NUM + 1);
        %����ģ������ƽ���
        dice = rand(1, X_DIM);
        beta = zeros(1, X_DIM);
        for j = 1:X_DIM
            if dice (j) <= 0.5
                beta(j) = (2*dice(j))^(1/(n + 1));
            else
                beta(j) = (1/(2*(1-dice(j))))^(1/(n + 1));
            end
            
            off1(j) = 0.5*((1 - beta(j))*parent1(j) + (1 + beta(j))*parent2(j));
            off2(j) = 0.5*((1 + beta(j))*parent1(j) + (1 - beta(j))*parent2(j));
            
            %ʹ�Ӵ��ڶ�������
            if(off1(j)>X_MAX(j))
                off1(j) = X_MAX(j);
            elseif(off1(j)<X_MIN(j))
                off1(j) = X_MIN(j);
            end
            
            if(off2(j)>X_MAX(j))
                off2(j) = X_MAX(j);
            elseif(off1(j)<X_MIN(j))
                off2(j) = X_MIN(j);
            end
        end
        %�����Ӵ������Ŀ�꺯��ֵ
        off1(1, (X_DIM + 1):(X_DIM + F_NUM)) = ObjFun(off1, F_NUM, X_DIM, TEST_SUITE);
        off2(1, (X_DIM + 1):(X_DIM + F_NUM)) = ObjFun(off1, F_NUM, X_DIM, TEST_SUITE);
    end
end
