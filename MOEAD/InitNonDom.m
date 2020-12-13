function chromo = InitNonDom(chromo, N, F_NUM, X_DIM)
    % 穷举法，时间复杂度o(N*N*F_NUM)
    for i = 1:N
        isNonDominated  = 1;    % assume chromo(i) is non-dominated
        for j = 1:N
            less_or_equal = 0;
            equal = 0;
            for k = 1:F_NUM
                if(chromo(j, X_DIM + k) <= chromo(i, X_DIM + k))
                    less_or_equal = less_or_equal + 1;    % 个体j在多少个目标上<=个体i
                end
                if(chromo(j, X_DIM + k) == chromo(i, X_DIM + k))
                    equal = equal + 1;    % 个体j在多少个目标上==个体i
                end
                
                % 如果个体A在所有目标上都小于等于个体B，且在至少一个目标上小于个体B，则称个体A支配个体B
                if(less_or_equal == F_NUM && equal ~= F_NUM) % 个体j在所有目标上均<=个体j, 且至少在一个目标<个体j
                    isNonDominated  = 0;    % 个体j支配个体i, i不是非支配个体
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
