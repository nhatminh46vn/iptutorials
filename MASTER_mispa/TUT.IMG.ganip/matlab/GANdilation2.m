function RES = GANdilation2(A,h,m)

RES = zeros(size(A));

parfor s = 0:255
    thresh = (h >= s-m) & (h <= s+m);
    seed = (h == s);
    thresh = imreconstruct(seed,thresh,8);
    label = bwlabeln(thresh,8);
    nbLabel = max(label(:));
    for n = 1:nbLabel
        currentLabel = (label == n);
        values = A(currentLabel);
        values = sort(values);
        result = double(values(length(values)))*currentLabel;
        RES = max(RES,result);  
    end
end