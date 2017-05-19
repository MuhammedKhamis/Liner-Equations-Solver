function [decomp err steps pos b] = getLU(A,tol,b)
% This method is used to get the L and U matrcies of the matrix A
%Input:     
%           A    Input Matrix which will be decomposite to L and U
%Output:
%           L     Lower triangle matrix from decomposition of A
%           U     Upper triangle matrix from decomposition of A
%           err   error flag that indicate any division by 0 in the decomposition
%           steps 2D array that tells the status of L and U matrices after each elemination
    sizes = size(A);
    err = 0;
    steps = [];
    decomp =[];
    L = zeros(size(A));
    if(sizes(1) == sizes(2))
       pos = zeros(1,sizes(1));
       scale = zeros(1,sizes(1));
       % assigning postions and finding scaleing of each row in the matrix
       for i = 1 : sizes(1)
        pos(i) = i;
        scale(i) = abs(A(i,1));
        for j = 2 : sizes(1)
            scale(i) = max(scale(i),abs(A(i,j)));
        end
       end
       % main Decomposition
       for i = 1 : sizes(1)
          [pos, A, b, L] = pivot(A,pos,scale,i,sizes(1),b,L);
          
          %check for singular or near-singular cases
          if(abs(A(pos(i),i)/scale(pos(i))) < tol)
            err = 1;
            decomp =[];
            steps=[];
            pos=[];
            return;
          end
          for j = i+1 : sizes(1)
              factor = A(pos(j),i)/A(pos(i),i);
              L(pos(j),i) = factor;
              for k = i : sizes(1)
                A(pos(j),k) =  A(pos(j),k) - factor*A(pos(i),k);
              end
              % This loop for putting thing in good order as the pivoting
              % changes the postions of the rows and this will appear in A
              % if you want to see the changes just comment the loop and
              % line before and after them
              % for tidy order
              steps = [steps;getTityOrder(A,pos)+eye(sizes(1))];
              % end tidy order
              %if you want to see the changes due to pivoting uncomment
              %this line put comment the lines above.
              %steps = [steps;A];    
          end          
       end
       % same as in A Matrix
       steps = [steps;getTityOrder(L,pos)+eye(sizes(1))];
       %steps = [steps;L];
       if(abs(A(pos(sizes(1)),sizes(1))/scale(pos(sizes(1)))) < tol)
           err = 1;
           decomp =[];
           steps=[];
           pos=[];
           return;
       end
    else
        err = 1;
    end
    decomp = (A+L);
end