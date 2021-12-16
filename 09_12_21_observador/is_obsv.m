function res = is_obsv(A,C)
    O = obsv(A,C);
    
    if rank(O) == length(A)
        res = true
    else
        res = false
    end
end