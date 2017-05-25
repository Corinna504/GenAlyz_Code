function [H,T,outperm]= hierarchicalcluster( A, ts )
% computes pca and clusters data hierarchically according to Li et al.
% (2015)
%
% A is a n x m Matrix with n (number of rows) being the observations, and m
% (number of columns) being the variables.
% ts are the time stamps corresponding to A. they are only relevant when
% plotting the results.
% 
% 
% @CL  


ncomp = 3; % number of components

coeff = pca(A);
X = coeff(1:ncomp, :)';

D = pdist(X);
tree = linkage(D, 'average'); 
leafOrder = optimalleaforder(tree, D);


% plot the results
figure; 
subplot(2,1,1)
dendrogram(tree);
subplot(2,1,2)
[H,T,outperm] = dendrogram(tree,'reorder',leafOrder);

[~, idx] = sort(T);
figure; imagesc(ts, 1:length(ts), A(idx,:)); title('supposably sorted')


figure; imagesc(ts, 1:length(ts), A); title('unsorted')

end

