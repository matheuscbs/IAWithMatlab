function centroids = computeCentroids(X, idx, K)

[m n] = size(X);
centroids = zeros(K, n);

for i = 1:K
    C = find(idx == i);
    if(size(C,1) > 0)
        centroids(i,:) = mean(X(C,:));
    end
end

end