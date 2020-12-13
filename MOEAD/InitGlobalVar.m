function [F_NUM, X_DIM, X_MIN, X_MAX] = InitGlobalVar(TEST_SUITE)
    %--------------------ZDT1--------------------
    if strcmp(TEST_SUITE,'ZDT1')
        F_NUM = 2;%目标函数个数
        X_DIM = 30;%决策变量维数
        X_MIN = zeros(1,X_DIM);%决策变量的最小值
        X_MAX = ones(1,X_DIM);%决策变量的最大值
        load('ZDT1.txt');%导入正确的前端解
        plot(ZDT1(:,1),ZDT1(:,2),'g*');
        PP = ZDT1;
        return;
    end
    
    %--------------------ZDT2--------------------
    if strcmp(TEST_SUITE,'ZDT2')
        F_NUM = 2;%目标函数个数
        X_DIM = 30;%决策变量个数
        X_MIN = zeros(1,X_DIM);%决策变量的最小值
        X_MAX = ones(1,X_DIM);%决策变量的最大值
        load('ZDT2.txt');%导入正确的前端解
        plot(ZDT2(:,1),ZDT2(:,2),'g*');
        PP = ZDT2;
        return;
    end
    
    %--------------------ZDT3--------------------
    if strcmp(TEST_SUITE,'ZDT3')
        F_NUM = 2;%目标函数个数
        X_DIM = 30;%决策变量个数
        X_MIN = zeros(1,X_DIM);%决策变量的最小值
        X_MAX = ones(1,X_DIM);%决策变量的最大值
        load('ZDT3.txt');%导入正确的前端解
        plot(ZDT3(:,1),ZDT3(:,2),'g*');
        PP = ZDT3;
        return;
    end
    
    %--------------------ZDT4--------------------
    if strcmp(TEST_SUITE,'ZDT4')
        F_NUM = 2;%目标函数个数
        X_DIM = 10;%决策变量个数
        X_MIN = [0,-5,-5,-5,-5,-5,-5,-5,-5,-5];%决策变量的最小值
        X_MAX = [1,5,5,5,5,5,5,5,5,5];%决策变量的最大值
        load('ZDT4.txt');%导入正确的前端解
        plot(ZDT4(:,1),ZDT4(:,2),'g*');
        PP = ZDT4;
        return;
    end
    
    %--------------------ZDT6--------------------
    if strcmp(TEST_SUITE,'ZDT6')
        F_NUM = 2;%目标函数个数
        X_DIM = 10;%决策变量个数
        X_MIN = zeros(1,X_DIM);%决策变量的最小值
        X_MAX = ones(1,X_DIM);%决策变量的最大值
        load('ZDT6.txt');%导入正确的前端解
        plot(ZDT6(:,1),ZDT6(:,2),'g*');
        PP = ZDT6;
        return;
    end
    
    %-------------------DTLZ1--------------------
    if strcmp(TEST_SUITE,'DTLZ1')
        F_NUM = 3;%目标函数个数
        X_DIM = 10;%决策变量个数
        X_MIN = zeros(1,X_DIM);%决策变量的最小值
        X_MAX = ones(1,X_DIM);%决策变量的最大值
        load('DTLZ1.txt');%导入正确的前端解
        plot3(DTLZ1(:,1),DTLZ1(:,2),DTLZ1(:,3),'g*');
        PP = DTLZ1;
        return;
    end
    
    %-------------------DTLZ2--------------------
    if strcmp(TEST_SUITE,'DTLZ2')
        F_NUM = 3;%目标函数个数
        X_DIM = 10;%决策变量个数
        X_MIN = zeros(1,X_DIM);%决策变量的最小值
        X_MAX = ones(1,X_DIM);%决策变量的最大值
        load('DTLZ2.txt');%导入正确的前端解
        plot3(DTLZ2(:,1),DTLZ2(:,2),DTLZ2(:,3),'g*');
        PP = DTLZ2;
        return;
    end
end

