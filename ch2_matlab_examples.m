'(ch2p1)'               % Display label.
'How are you?'          % Display string.
-3.96                   % Display scalar number -3.96.
-4 + 7i                 % Display complex number -4 + 7i.
-5 - 6j                 % Display complex number -5 - 6j.

(-4 + 7i) + (-5 - 6i)   % Add two complex numbers and display sum.
(-4 + 7j) * (-5 - 6j)   % Multiply two complex numbers and display product.

M = 5                   % Assign 5 to M and display.
N = 6                   % Assign 6 to N and display.
P = M + N               % Assign M + N to P and display.

Q = 3 + 4j              % Define complex number Q.
MagQ = abs(Q)           % Find magnitude of Q.
ThetaQ = (180/pi) * angle(Q) % Find the angle of Q in degrees.
%% 
% 

'(ch2p2)'               % Display label.
P1 = [1 7 -3 23]        % Store polynomial s^3 + 7s^2 - 3s + 23 as P1 and display.
%% 
% 

'(ch2p7)'               % Display label.

numf = [7 9 12]         % Define numerator of F(s).

denf = conv(poly([0 -7]), [1 10 100]); % Define denominator of F(s).

[K, p, k] = residue(numf, denf) % Find residues and assign to K;
                                 % find roots of denominator and assign to p;
                                 % find constant and assign to k.
%% 
% 

'(ch2p8) Example 2.3'   % Display label.

numy = 32;              % Define numerator.
deny = poly([0 -4 -8]); % Define denominator.

[r, p, k] = residue(numy, deny) % Calculate residues, poles, and direct quotient.
%% 
% 

'(ch2p9)'                           % Display label.
'Vector Method, Polynomial Form'    % Display label.

numf = 150 * [1 2 7];               % Store 150(s^2 + 2s + 7) in numf and display.
denf = [1 5 4 0];                   % Store s(s + 1)(s + 4) in denf and display.

'F(s)'                              % Display label.
F = tf(numf, denf)                  % Form F(s) and display.

clear                               % Clear previous variables from workspace.

'Vector Method, Factored Form'       % Display label.

numg = [-2 -4];                     % Store (s + 2)(s + 4) in numg and display.
deng = [-7 -8 -9];                  % Store (s + 7)(s + 8)(s + 9) in deng and display.
K = 20;                              % Define K.

'G(s)'                              % Display label.
G = zpk(numg, deng, K)              % Form G(s) and display.

clear                               % Clear previous variables from workspace.

'Rational Expression Method, Polynomial Form' % Display label.

s = tf('s');                        % Define 's' as an LTI object in polynomial form.
F = 150 * (s^2 + 2*s + 7) / (s * (s^2 + 5*s + 4))
                                    % Form F(s) as an LTI transfer function in polynomial form.
G = 20 * (s + 2) * (s + 4) / ((s + 7) * (s + 8) * (s + 9))
                                    % Form G(s) as an LTI transfer function in polynomial form.

clear                               % Clear previous variables from workspace.

'Rational Expression Method, Factored Form'  % Display label.

s = zpk('s');                       % Define 's' as an LTI object in factored form.
F = 150 * (s^2 + 2*s + 7) / (s * (s^2 + 5*s + 4))
                                    % Form F(s) as an LTI transfer function in factored form.
G = 20 * (s + 2) * (s + 4) / ((s + 7) * (s + 8) * (s + 9))
                                    % Form G(s) as an LTI transfer function in factored form.
%% 
% 

'(ch2p10)'                     % Display label.

'Coefficients for F(s)'        % Display label.
numftf = [10 40 60];           % Form numerator of F(s) = (10s^2 + 40s + 60) / (s^3 + 4s^2 + 5s + 7).
denftf = [1 4 5 7];            % Form denominator of F(s).

'Roots for F(s)'               % Display label.
[numfzp, denfzp] = tf2zp(numftf, denftf) 
                               % Convert F(s) to factored form.

'Roots for G(s)'               % Display label.
numgzp = [-2 -4];             % Form numerator of G(s) = 10(s + 2)(s + 4).
K = 10;                        % Define K.
dengzp = [0 -3 -5];            % Form denominator of G(s) = 10(s + 2)(s + 4) / [s(s + 3)(s + 5)].

'Coefficients for G(s)'        % Display label.
[numgtf, dengtf] = zp2tf(numgzp', dengzp', K) 
                               % Convert G(s) to polynomial form.
%% 
% 

'(ch2p11)'                     % Display label.

'Fzpk1(s)'                     % Display label.
Fzpk1 = zpk([-2 -4], [0 -3 -5], 10);  
                                % Form Fzpk1(s) = 10(s + 2)(s + 4) / [s(s + 3)(s + 5)].

'Ftf1'                         % Display label.
Ftf1 = tf(Fzpk1);              % Convert Fzpk1(s) to coefficient form.

'Ftf2'                         % Display label.
Ftf2 = tf([10 40 60], [1 4 5 7]);  
                                % Form Ftf2(s) = (10s^2 + 40s + 60) / (s^3 + 4s^2 + 5s + 7).

'Fzpk2'                        % Display label.
Fzpk2 = zpk(Ftf2);             % Convert Ftf2(s) to factored form.
%% 
% 

'(ch2p12)'                 % Display label.

t = 0:0.01:10;             % Specify time range and increment.
f1 = cos(5 * t);           % Define f1 as cos(5t).
f2 = sin(5 * t);           % Define f2 as sin(5t).

plot(t, f1, 'r', t, f2, 'g');  % Plot f1 in red and f2 in green.
