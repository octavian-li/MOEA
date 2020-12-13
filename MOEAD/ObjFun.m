function f = ObjFun(x, F_NUM, X_DIM, TEST_SUITE) %x is a decisive vector, f = f(x)

    f = zeros(1, F_NUM);
    
    %--------------------ZDT1--------------------
    if strcmp(TEST_SUITE,'ZDT1')
        f(1)=x(1);
        sum=0;
        for i=2:X_DIM
            sum = sum+x(i);
        end
        g=1+9*(sum/(X_DIM-1));
        f(2)=g*(1-(f(1)/g)^0.5);
    end
    
    %--------------------ZDT2--------------------
    if strcmp(TEST_SUITE,'ZDT2')
        f(1)=x(1);
        sum=0;
        for i=2:X_DIM
            sum = sum+x(i); %sum = Sn - a1
        end
        g=1+9*(sum/(X_DIM-1));
        f(2)=g*(1-(f(1)/g)^2);
    end
    
    %--------------------ZDT3--------------------
    if strcmp(TEST_SUITE,'ZDT3')
        f(1)=x(1);
        sum=0;
        for i=2:X_DIM
            sum = sum+x(i);
        end
        g=1+9*(sum/(X_DIM-1));
        f(2)=g*(1-(f(1)/g)^0.5-(f(1)/g)*sin(10*pi*f(1)));
    end
    
    %--------------------ZDT4--------------------
    if strcmp(TEST_SUITE,'ZDT4')
        f(1)=x(1);
        sum=0;
        for i=2:X_DIM
            sum = sum+(x(i)^2-10*cos(4*pi*x(i)));
        end
        g=1+9*10+sum;
        f(2)=g*(1-(f(1)/g)^0.5);
    end
    
    %--------------------ZDT6--------------------
    if strcmp(TEST_SUITE,'ZDT6')
        f(1)=1-(exp(-4*x(1)))*((sin(6*pi*x(1)))^6);
        sum=0;
        for i=2:X_DIM
            sum = sum+x(i);
        end
        g=1+9*((sum/(X_DIM-1))^0.25);
        f(2)=g*(1-(f(1)/g)^2);
    end

    %--------------------DTLZ1-------------------
    if strcmp(TEST_SUITE,'DTLZ1')
        sum=0;
        for i=3:X_DIM
            sum = sum+((x(i)-0.5)^2-cos(20*pi*(x(i)-0.5)));
        end
        g=100*(X_DIM-2)+100*sum;
        f(1)=(1+g)*x(1)*x(2);
        f(2)=(1+g)*x(1)*(1-x(2));
        f(3)=(1+g)*(1-x(1));
    end

    %--------------------DTLZ2-------------------
    if strcmp(TEST_SUITE,'DTLZ2')
        sum=0;
        for i=3:X_DIM
            sum = sum+(x(i))^2;
        end
        g=sum;
        f(1)=(1+g)*cos(x(1)*pi*0.5)*cos(x(2)*pi*0.5);
        f(2)=(1+g)*cos(x(1)*pi*0.5)*sin(x(2)*pi*0.5);
        f(3)=(1+g)*sin(x(1)*pi*0.5);
    end
end

