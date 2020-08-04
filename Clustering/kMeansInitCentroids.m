function centroids = kMeansInitCentroids(X, K)
  
  centroids = zeros(K, size(X,2));
  idx = randperm(size(X,1));
  centroids = X(idx(1:K),:);
   


end

