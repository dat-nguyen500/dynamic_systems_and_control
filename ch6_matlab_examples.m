%% 
'(ch6p1) Example 6.7'       % Display label.
numg = 1;                   % Define numerator of G(s).
deng = conv([1 0], [2 3 2 3 2]); % Define denominator of G(s).
G = tf(numg, deng);         % Create G(s) object.
'T(s)'                      % Display label.
T = feedback(G, 1)          % Calculate closed-loop T(s)
                            % object.
                            % Negative feedback is default
                            % when there is no sign parameter.
poles = pole(T)             % Find poles of T(s).
pause

%% 
'(ch6p2) Example 6.9'       % Display label.
K = [1:1:2000];             % Define range of K from 1 to 2000
                            % in steps of 1.
for n = 1:1:length(K);      % Set up length of DO LOOP to equal
                            % number of K values to be tested.
    dent = [1 18 77 K(n)];  % Define the denominator of T(s)
                            % for the nth value of K.
    poles = roots(dent);    % Find the poles for the nth value
                            % of K.
    r = real(poles);        % Form a vector containing the real
                            % parts of the poles for K(n).
    if max(r) >= 0,         % Test poles found for the nth
                            % value of K for a real value ≥ 0.
        poles               % Display first pole values where
                            % there is a real part ≥ 0.
        K = K(n)            % Display corresponding value of K.
        break               % Stop loop if rhp poles are found.
    end                     % End if.
end                         % End for.
pause

%% 
'(ch6p3) Example 6.11'      % Display label.
A = [0 3 1; 2 8 1; -10 -5 -2] % Define system matrix, A.
eigenvalues = eig(A)        % Find eigenvalues.
pause
