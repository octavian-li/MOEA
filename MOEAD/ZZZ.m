close all;
clear all;
clc

% update T
    X=updateNeighbor(lamda,z,X,B(i,:),off,X_DIM,f_num);
    % update EP
    [number,~]=size(EP);
    temp=0;
    kk=[];
    for k=1:number
        less=0;%y'的目标函数值小于个体的目标函数值数目
        equal=0;%y'的目标函数值等于个体的目标函数值数目
        greater=0;%y'的目标函数值大于个体的目标函数值数目
        for mm=1:f_num
            if(off(:,X_DIM+mm)>EP(k,X_DIM+mm))
                greater=greater+1;
            else
                if(off(:,X_DIM+mm)==EP(k,X_DIM+mm))
                    equal=equal+1;
                else
                    less=less+1;
                end
            end
        end
        %%%从EP中移除被y'支配的向量
        if(greater==0 && equal~=f_num)
            kk=[k kk];
        end
        %%%如果EP中没有支配y'的个体，将y'加入EP
        if(less==0 && equal~=f_num)
            temp=1;
        end
    end
    if(isempty(kk)==0)
        EP(kk,:)=[];
    end
    if(temp==1)
        EP=[EP;off];
    end

    if mod(gen,10) == 0
        fprintf('%d gens has completed!\n',gen);
    end
    end