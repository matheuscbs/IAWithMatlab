function plotDataPoints(X, idx, K)

palette = hsv(K + 1);
colors = palette(idx, :);
scatter(X(:,1), X(:,2), 35, colors);

end