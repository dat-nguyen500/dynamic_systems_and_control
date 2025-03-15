%% 
'(ch3p1)'                   % Display label.
A = [0 1 0; 0 0 1; -9 -8 -7] % Represent A.
'or'
A = [0 1 0                  % Represent A.
     0 0 1
     -9 -8 -7]

%% 
'(ch3p2)'                   % Display label.
C = [2 3 4]                 % Represent row vector C.
B = [7; 8; 9]               % Represent column vector B.
'or'
B = [7                      % Represent column vector B.
     8
     9]
'or'
B = [7 8 9]'                % Represent column vector B.

%% 
'(ch3p3)'                   % Display label.
A = [0 1 0; 0 0 1; -9 -8 -7] % Represent A.
B = [7; 8; 9];              % Represent column vector B.
C = [2 3 4];                % Represent row vector C.
D = 0;                      % Represent D.
F = ss(A, B, C, D)          % Create an LTI object and display.

%% 
'(ch3p4) Example 3.4'       % Display label.
'Numerator-denominator representation conversion' % Display label.
'Controller canonical form' % Display label.
num = 24;                   % Define numerator of
                            % G(s)=C(s)/R(s).
den = [1 9 26 24];          % Define denominator of G(s).
[A, B, C, D] = tf2ss(num, den) % Convert G(s) to controller
                            % canonical form, store matrices
                            % A, B, C, D, and display.

'Phase-variable form'       % Display label.
P = [0 0 1; 0 1 0; 1 0 0];  % Form transformation matrix.
Ap = inv(P) * A * P         % Form A matrix, phase-variable
                            % form.
Bp = inv(P) * B             % Form B vector, phase-variable
                            % form.
Cp = C * P                  % Form C vector, phase-variable
                            % form.
Dp = D                      % Form D phase-variable form.

'LTI object representation' % Display label.
T = tf(num, den)            % Represent T(s)=24/(s^3+9s^2 +
                            % 26s+24) as an LTI transfer-
                            % function object.
Tss = ss(T)                 % Convert T(s) to state space.

%% 
'(ch3p5)'                   % Display label.
'Non LTI'                   % Display label.
A = [0 1 0; 0 0 1; -9 -8 -7]; % Represent A.
B = [7; 8; 9];              % Represent B.
C = [2 3 4]                 % Represent C.
D = 0;                      % Represent D.

'Ttf (s)'                   % Display label.
[num, den] = ss2tf(A, B, C, D, 1) % Convert state-space
                            % representation to a
                            % transfer function represented as
                            % a numerator and denominator in
                            % polynomial form, G(s)=num/den,
                            % and display num and den.

'LTI'                       % Display label.
Tss = ss(A, B, C, D)        % Form LTI state-space model.

'Polynomial form, Ttf(s)'   % Display label.
Ttf = tf(Tss)               % Transform from state space to
                            % transfer function in polynomial
                            % form.

'Factored form, Tzpk(s)'    % Display label.
Tzpk = zpk(Tss)             % Transform from state space to
                            % transfer function in factored
                            % form.
