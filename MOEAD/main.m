close all;
clear all;
clc;

%%
% initialization
% N---number of subproblems considered, aka, the population size
% T---number of weight vectors in the neighborhood of each weight vector of each weight vector
% X---matrix consists of decisive vectors
% B---closest T weight vectors of a certain weight vector
% EP---External Population to store non-dominated ones
% TEST_SUITE---name of the test suite, ZDT1 for example
%  initialize global variables
N = 200;
T = 20;
MAX_GEN = 100;
TEST_SUITE = 'ZDT1';
[F_NUM, X_DIM, X_MIN, X_MAX] = InitGlobalVar(TEST_SUITE);

chromo = InitPop(N, F_NUM, X_DIM, X_MIN, X_MAX, TEST_SUITE);    % chromo(N, X_DIM + F_NUM + 1)

lambda = GenerateLambda(N, F_NUM);

B = FindNeighbors(lambda, T);

z = zeros(1, F_NUM);
for i = 1:F_NUM
    z(i) = min(chromo( : , X_DIM + i));
end

chromo = InitNonDom(chromo, N, F_NUM, X_DIM);

EP = [];
for i = 1:N
    if chromo(i, X_DIM + F_NUM + 1) == 1
        EP = [chromo(i, :); EP];    
        % 矩阵拼接，A = [M; N]，M是上半身，N是下半身，因此M、N列数必须相等
        % 若A = [M, N]或A = [M N]，则M是左半身，N是右半身，因此M、N行数必须相等
    end
end


%%
%iteration
for gen = 1:MAX_GEN
    for i = 1:N
        % generate an offspring by crossover, mutation, improvement
        tmpIndex = randperm(T);
        parent1 = B(i, tmpIndex(1));
        parent2 = B(i, tmpIndex(2));
        [off, ~] = Crossover(chromo(parent1, :), chromo(parent2, :), F_NUM,  X_DIM,  X_MIN,  X_MAX, TEST_SUITE);
        off = Mutation(off, F_NUM, X_DIM,  X_MIN, X_MAX, TEST_SUITE);
        off = Improve(off);
        
        % update z
        for j = 1:F_NUM
            z(j)=min(z(j),off(X_DIM+j));
        end
        
        % update neighbors
        chromo = UpdateNeighbors(lambda, z, chromo, B(i,:), off, X_DIM, F_NUM);
        
        % update EP
        EP = UpdateEP(off, EP, F_NUM, X_DIM);
    end % end i
    
    if mod(gen, 20) == 0
        fprintf('%d gens has completed!\n',gen);
    end
end % end gen


%%
figure;
scatter(EP(:, 31), EP(:, 32));
title('EP');

figure;
plot(chromo(:, X_DIM + 1), chromo(:, X_DIM + 2));
title('chromo');
