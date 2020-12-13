function chromo = InitPop(N, F_NUM, X_DIM, X_MIN, X_MAX,  TEST_SUITE)
    %�������N������X_MIN��X_MAX֮���X_DIMά��������aka��N��Ⱦɫ��/����
    chromo = repmat(X_MIN, N, 1) + rand(N, X_DIM).*repmat(X_MAX - X_MIN, N, 1);
    
    %׷��F_NUM+1��ά�ȣ���¼ÿһ�����Ӧ��F_NUM��Ŀ�꺯��ֵ���Լ��ø����Ƿ�Ϊ��֧�����
    for i = 1:N
        for j = 1:X_DIM
            %chromo(i, (X_DIM + 1):(X_DIM + F_NUM)) = ObjFun(chromo(i,:),TEST_SUITE);
            chromo(i, (X_DIM + 1):(X_DIM + F_NUM)) = ObjFun(chromo(i, :), F_NUM, X_DIM, TEST_SUITE);
        end
        chromo(i, X_DIM + F_NUM + 1) = 0;   %bool isNonDom = false;
    end
end

