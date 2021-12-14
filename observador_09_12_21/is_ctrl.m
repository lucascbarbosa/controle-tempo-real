function res = is_ctrl(A,B)
    Co = ctrb(A,B);
    if rank(Co)==length(A)
        res = true;
    else
        res = false;
end