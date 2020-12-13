function chromo = InitPop(N, F_NUM, X_DIM, X_MIN, X_MAX,  TEST_SUITE)
    %随机生成N个介于X_MIN与X_MAX之间的X_DIM维行向量，aka，N个染色体/个体
    chromo = repmat(X_MIN, N, 1) + rand(N, X_DIM).*repmat(X_MAX - X_MIN, N, 1);
    
    %追加F_NUM+1个维度，记录每一个体对应的F_NUM个目标函数值，以及该个体是否为非支配个体
    for i = 1:N
        for j = 1:X_DIM
            %chromo(i, (X_DIM + 1):(X_DIM + F_NUM)) = ObjFun(chromo(i,:),TEST_SUITE);
            chromo(i, (X_DIM + 1):(X_DIM + F_NUM)) = ObjFun(chromo(i, :), F_NUM, X_DIM, TEST_SUITE);
        end
        chromo(i, X_DIM + F_NUM + 1) = 0;   %bool isNonDom = false;
    end
end

