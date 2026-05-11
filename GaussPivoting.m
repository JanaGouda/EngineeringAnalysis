%{
clc;                           % Clear the command window

clear;                         % Remove all variables from workspace

A = input('Enter your coefficient matrix: ');
% Take the coefficient matrix from the user

B = input('Enter source vector: ');
% Take the constants/source vector from the user

N = length(B);
% Determine the number of equations using the length of B

X = zeros(N,1);
% Create a column vector of zeros to store the final solutions

Aug = [A B];
% Create the augmented matrix by attaching B to A

for j = 1 : N-1
% Loop through each pivot column

    % Partial Pivoting
    [M,P] = max(abs(Aug(j:N,j)));
    % Find the maximum absolute value in the current column
    % M = maximum value
    % P = position of the maximum value relative to submatrix

    C = Aug(j,:);
    % Store the current row temporarily

    Aug(j,:) = Aug(P+j-1,:);
    % Replace current row with the row containing largest pivot

    Aug(P+j-1,:) = C;
    % Put stored row into the swapped position

    % Echelon Form
    for i = j+1 : N
    % Loop through rows below the pivot row

        m = Aug(i,j) / Aug(j,j);
        % Calculate elimination multiplier

        Aug(i,:) = Aug(i,:) - m * Aug(j,:);
        % Eliminate the element below the pivot
        % Row operation:
        % New Row = Current Row - multiplier × Pivot Row

    end
end

% Back Substitution
X(N) = Aug(N,N+1) / Aug(N,N);
% Calculate the last variable directly

for k = N-1 : -1 : 1
% Start from second-last row upward

    X(k) = (Aug(k,N+1) - Aug(k,k+1:N)*X(k+1:N)) / Aug(k,k);
    % Back substitution formula:
    % x(k) = (constant term - known variables contribution)
    %        divided by pivot coefficient

end

disp('Upper Triangular Matrix:')
% Display message

disp(Aug)
% Display the echelon (upper triangular) matrix

disp('Solution Vector:')
% Display message

disp(X)
% Display final solution vector
%}







    clc; 
clear;

A = input('Enter your coefficient matrix');
B = input('Enter source vector');

N = length(B)
X = zeros(N,1)

Aug = [A B]

for j = 1 : N - 1

    %Partial Pivoting
    [M,P] = max(abs(Aug(j:N,j)))

    C = Aug(j,:)
    Aug(j,:) = Aug(P+j-1,:)
    Aug(P+j-1,:) = C
    %echlon form 

    for i = j + 1 : N
        m = Aug(i,j)/Aug(j,j)
        Aug(i,:) = Aug(i,:) - m*Aug(j,:)
    end  
end
X(N) = Aug(N,N+1)/Aug(N,N)

for k=N-1:-1:1
    X(k) = (Aug(k,N+1) - Aug(k,k+1:N)*X(k+1:N))/Aug(k,k)
end 










