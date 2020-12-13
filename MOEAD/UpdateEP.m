function newEP = UpdateEP(off, EP, F_NUM, X_DIM)
    tmp = InitNonDom([EP; off], size(EP, 1) + 1, F_NUM, X_DIM);
    newEP = [];
    for i = 1:size(EP, 1) + 1
        if tmp(i, X_DIM + F_NUM + 1) == 1
            newEP = [tmp(i, :); newEP];    
        end
    end
end