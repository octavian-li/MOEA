function chromo = UpdateNeighbors(lamda, z, chromo, B, off, X_DIM, F_NUM )
    % 更新领域解
    for i = 1:size(B, 2)    % size(B, 2) == T
        % gte = TchebycheffApproach(lamda, z, f, i)
        % gte = max(lamda(i,:).*abs(f-z));
        gte_xi = TchebycheffApproach(lamda, z, chromo(B(i), (X_DIM+1):(X_DIM+F_NUM)), B(i));
        gte_off = TchebycheffApproach(lamda, z, off(:, (X_DIM+1):(X_DIM+F_NUM)), B(i));
        % if gte_off is smaller/better
        if gte_off <= gte_xi
            chromo(B(i), :) = off;
        end
    end
end
