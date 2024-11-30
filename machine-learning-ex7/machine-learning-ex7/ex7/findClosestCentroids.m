function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% sto creando una matrice con tre righe uguali alla volta
%{
X_new=X;
for i=1:K-1
  X_new= [X_new X];
endfor
X_new = X_new';
X_new = reshape( X_new, size(centroids,2), size(X,1)*K);
X_new = X_new';

% ora devo creare una matrice con le righe che si ripetono ogni 3
A=ones(size(X_new));
for i=1:K
  for j=1:size(X,1);
    A(i*j,:)=centroids(i,:);
  endfor
endfor

distances= sumsq(X_new-A,2);
distances= reshape(distances,K, size(X,1));
[ello, idx]= min(distances);
idx=idx';
%}
distances=zeros(K,size(X,1));
for i=1:size(X,1)
  for n=1:K
    distance(n,i)= sumsq(X(i,:)-centroids(n,:));
  endfor
endfor

[ello, idx]= min(distance);


% =============================================================

end

