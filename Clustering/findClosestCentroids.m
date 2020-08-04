function idx = findClosestCentroids(X, centroids)

K = size(centroids, 1);
idx = zeros(size(X,1), 1);

dist = zeros(size(X,1), K);

for i = 1:K
    diff = bsxfun(@minus, X, centroids(i,:));
    dist(:,i) = sum(diff .^ 2, 2);
end

[dumb idx] = min(dist, [], 2);

end