%Andrew Jones
%MA 321 - Project 1
%3/2/21

%Naive Gaussian Elimination:
%This file consists of a function that computes Naive Gaussian
%Elimination. This function will work only if the inputs A and B are an
%n*n matrix and a vector of length n


function x = Gauss_Naive(A,b)

    %Gets n by finding the size of b
    n = length(b);
    %This blank vector will become our answer for x1,...,xn
    x = zeros(n,1);
    
    %These three four loops contain the forward elimination for our
    %function
    
    %this loop iterates every time a leading value is eliminated from all
    %rows below k
        for k = 1 : n-1
            
            %this loop iterates for each row that the leading value is
            %eliminated from
            for i = k + 1 : n
                
                %gets our multiplyer using leading values
                Mult = A(i,k) / A(k,k);
                
                %this loop iterates for eack column of the row i
                for j = k : n
                    
                    %A(i,) is overwritten by subtracting A(k,) * Mult
                    A(i,j) = A(i,j) - (A(k,j) * Mult);
                end
                
                %b(i) is overwritten my subtracting A(k,) * Mult
                b(i) = b(i) - (b(k) * Mult);
            end
        end
        
        %The rest of the function performs back substitution
        
        %iterates for each x value (starting at the bottom)
        for k = n : -1 : 1
            
            %b(k) is placed into x(k) for calculation
            x(k) = b(k);
            
            %iterates for each value in the row after k
            for i = k + 1 : n
                
                %all constant values are subtracted from x(k)
                x(k) = x(k) - (A(k,i) * x(i));
            end
            
            %The value of x is found by dividing the coefficient of the
            %remaining term
            x(k) = x(k)/A(k,k);
        end
end
            
        
                
    
    

