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
        less=0;%y'��Ŀ�꺯��ֵС�ڸ����Ŀ�꺯��ֵ��Ŀ
        equal=0;%y'��Ŀ�꺯��ֵ���ڸ����Ŀ�꺯��ֵ��Ŀ
        greater=0;%y'��Ŀ�꺯��ֵ���ڸ����Ŀ�꺯��ֵ��Ŀ
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
        %%%��EP���Ƴ���y'֧�������
        if(greater==0 && equal~=f_num)
            kk=[k kk];
        end
        %%%���EP��û��֧��y'�ĸ��壬��y'����EP
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