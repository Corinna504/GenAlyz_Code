function B = pseudoperm( A, varargin )
% B = pseudoperm( A, varargin )
% 
% returns the permutated version of A
% 
% @CL  
% TODO: rename the function 

if nargin>1
    rng(varargin{1});
end

B = A;

% loop through the vector and switch the entry with a randomly chosen other
% item. this ensures that every item was touched at least once
for i = 1:length(B)
   
   temp = B(i); % save the current entry because it will be overwritten later
   r = randi(length(B)); % random index of the second item
   
   % switch the items
   B(i) = B(r);
   B(r) = temp;
    
end

end

