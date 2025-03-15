
```matlab
'(ch2p1)'               % Display label.
```

```matlabTextOutput
ans = '(ch2p1)'
```

```matlab
'How are you?'          % Display string.
```

```matlabTextOutput
ans = 'How are you?'
```

```matlab
-3.96                   % Display scalar number -3.96.
```

```matlabTextOutput
ans = -3.9600
```

```matlab
-4 + 7i                 % Display complex number -4 + 7i.
```

```matlabTextOutput
ans = -4.0000 + 7.0000i
```

```matlab
-5 - 6j                 % Display complex number -5 - 6j.
```

```matlabTextOutput
ans = -5.0000 - 6.0000i
```

```matlab

(-4 + 7i) + (-5 - 6i)   % Add two complex numbers and display sum.
```

```matlabTextOutput
ans = -9.0000 + 1.0000i
```

```matlab
(-4 + 7j) * (-5 - 6j)   % Multiply two complex numbers and display product.
```

```matlabTextOutput
ans = 62.0000 -11.0000i
```

```matlab

M = 5                   % Assign 5 to M and display.
```

```matlabTextOutput
M = 5
```

```matlab
N = 6                   % Assign 6 to N and display.
```

```matlabTextOutput
N = 6
```

```matlab
P = M + N               % Assign M + N to P and display.
```

```matlabTextOutput
P = 11
```

```matlab

Q = 3 + 4j              % Define complex number Q.
```

```matlabTextOutput
Q = 3.0000 + 4.0000i
```

```matlab
MagQ = abs(Q)           % Find magnitude of Q.
```

```matlabTextOutput
MagQ = 5
```

```matlab
ThetaQ = (180/pi) * angle(Q) % Find the angle of Q in degrees.
```

```matlabTextOutput
ThetaQ = 53.1301
```

```matlab
'(ch2p2)'               % Display label.
```

```matlabTextOutput
ans = '(ch2p2)'
```

```matlab
P1 = [1 7 -3 23]        % Store polynomial s^3 + 7s^2 - 3s + 23 as P1 and display.
```

```matlabTextOutput
P1 = 1x4
     1     7    -3    23

```

```matlab
'(ch2p7)'               % Display label.
```

```matlabTextOutput
ans = '(ch2p7)'
```

```matlab

numf = [7 9 12]         % Define numerator of F(s).
```

```matlabTextOutput
numf = 1x3
     7     9    12

```

```matlab

denf = conv(poly([0 -7]), [1 10 100]); % Define denominator of F(s).

[K, p, k] = residue(numf, denf) % Find residues and assign to K;
```

```matlabTextOutput
K = 4x1 complex
   0.2554 - 0.3382i
   0.2554 + 0.3382i
  -0.5280 + 0.0000i
   0.0171 + 0.0000i

p = 4x1 complex
  -5.0000 + 8.6603i
  -5.0000 - 8.6603i
  -7.0000 + 0.0000i
   0.0000 + 0.0000i

k =

     []
```

```matlab
                                 % find roots of denominator and assign to p;
                                 % find constant and assign to k.
```

```matlab
'(ch2p8) Example 2.3'   % Display label.
```

```matlabTextOutput
ans = '(ch2p8) Example 2.3'
```

```matlab

numy = 32;              % Define numerator.
deny = poly([0 -4 -8]); % Define denominator.

[r, p, k] = residue(numy, deny) % Calculate residues, poles, and direct quotient.
```

```matlabTextOutput
r = 3x1
     1
    -2
     1

p = 3x1
    -8
    -4
     0

k =

     []
```

```matlab
'(ch2p9)'                           % Display label.
```

```matlabTextOutput
ans = '(ch2p9)'
```

```matlab
'Vector Method, Polynomial Form'    % Display label.
```

```matlabTextOutput
ans = 'Vector Method, Polynomial Form'
```

```matlab

numf = 150 * [1 2 7];               % Store 150(s^2 + 2s + 7) in numf and display.
denf = [1 5 4 0];                   % Store s(s + 1)(s + 4) in denf and display.

'F(s)'                              % Display label.
```

```matlabTextOutput
ans = 'F(s)'
```

```matlab
F = tf(numf, denf)                  % Form F(s) and display.
```

```matlabTextOutput
F =
 
  150 s^2 + 300 s + 1050
  ----------------------
    s^3 + 5 s^2 + 4 s
 
Continuous-time transfer function.
Model Properties
```

```matlab

clear                               % Clear previous variables from workspace.

'Vector Method, Factored Form'       % Display label.
```

```matlabTextOutput
ans = 'Vector Method, Factored Form'
```

```matlab

numg = [-2 -4];                     % Store (s + 2)(s + 4) in numg and display.
deng = [-7 -8 -9];                  % Store (s + 7)(s + 8)(s + 9) in deng and display.
K = 20;                              % Define K.

'G(s)'                              % Display label.
```

```matlabTextOutput
ans = 'G(s)'
```

```matlab
G = zpk(numg, deng, K)              % Form G(s) and display.
```

```matlabTextOutput
G =
 
   20 (s+2) (s+4)
  -----------------
  (s+7) (s+8) (s+9)
 
Continuous-time zero/pole/gain model.
Model Properties
```

```matlab

clear                               % Clear previous variables from workspace.

'Rational Expression Method, Polynomial Form' % Display label.
```

```matlabTextOutput
ans = 'Rational Expression Method, Polynomial Form'
```

```matlab

s = tf('s');                        % Define 's' as an LTI object in polynomial form.
F = 150 * (s^2 + 2*s + 7) / (s * (s^2 + 5*s + 4))
```

```matlabTextOutput
F =
 
  150 s^2 + 300 s + 1050
  ----------------------
    s^3 + 5 s^2 + 4 s
 
Continuous-time transfer function.
Model Properties
```

```matlab
                                    % Form F(s) as an LTI transfer function in polynomial form.
G = 20 * (s + 2) * (s + 4) / ((s + 7) * (s + 8) * (s + 9))
```

```matlabTextOutput
G =
 
     20 s^2 + 120 s + 160
  --------------------------
  s^3 + 24 s^2 + 191 s + 504
 
Continuous-time transfer function.
Model Properties
```

```matlab
                                    % Form G(s) as an LTI transfer function in polynomial form.

clear                               % Clear previous variables from workspace.

'Rational Expression Method, Factored Form'  % Display label.
```

```matlabTextOutput
ans = 'Rational Expression Method, Factored Form'
```

```matlab

s = zpk('s');                       % Define 's' as an LTI object in factored form.
F = 150 * (s^2 + 2*s + 7) / (s * (s^2 + 5*s + 4))
```

```matlabTextOutput
F =
 
  150 (s^2 + 2s + 7)
  ------------------
    s (s+1) (s+4)
 
Continuous-time zero/pole/gain model.
Model Properties
```

```matlab
                                    % Form F(s) as an LTI transfer function in factored form.
G = 20 * (s + 2) * (s + 4) / ((s + 7) * (s + 8) * (s + 9))
```

```matlabTextOutput
G =
 
   20 (s+2) (s+4)
  -----------------
  (s+7) (s+8) (s+9)
 
Continuous-time zero/pole/gain model.
Model Properties
```

```matlab
                                    % Form G(s) as an LTI transfer function in factored form.
```

```matlab
'(ch2p10)'                     % Display label.
```

```matlabTextOutput
ans = '(ch2p10)'
```

```matlab

'Coefficients for F(s)'        % Display label.
```

```matlabTextOutput
ans = 'Coefficients for F(s)'
```

```matlab
numftf = [10 40 60];           % Form numerator of F(s) = (10s^2 + 40s + 60) / (s^3 + 4s^2 + 5s + 7).
denftf = [1 4 5 7];            % Form denominator of F(s).

'Roots for F(s)'               % Display label.
```

```matlabTextOutput
ans = 'Roots for F(s)'
```

```matlab
[numfzp, denfzp] = tf2zp(numftf, denftf) 
```

```matlabTextOutput
numfzp = 2x1 complex
  -2.0000 + 1.4142i
  -2.0000 - 1.4142i

denfzp = 3x1 complex
  -3.1163 + 0.0000i
  -0.4418 + 1.4321i
  -0.4418 - 1.4321i

```

```matlab
                               % Convert F(s) to factored form.

'Roots for G(s)'               % Display label.
```

```matlabTextOutput
ans = 'Roots for G(s)'
```

```matlab
numgzp = [-2 -4];             % Form numerator of G(s) = 10(s + 2)(s + 4).
K = 10;                        % Define K.
dengzp = [0 -3 -5];            % Form denominator of G(s) = 10(s + 2)(s + 4) / [s(s + 3)(s + 5)].

'Coefficients for G(s)'        % Display label.
```

```matlabTextOutput
ans = 'Coefficients for G(s)'
```

```matlab
[numgtf, dengtf] = zp2tf(numgzp', dengzp', K) 
```

```matlabTextOutput
numgtf = 1x4
     0    10    60    80

dengtf = 1x4
     1     8    15     0

```

```matlab
                               % Convert G(s) to polynomial form.
```

```matlab
'(ch2p11)'                     % Display label.
```

```matlabTextOutput
ans = '(ch2p11)'
```

```matlab

'Fzpk1(s)'                     % Display label.
```

```matlabTextOutput
ans = 'Fzpk1(s)'
```

```matlab
Fzpk1 = zpk([-2 -4], [0 -3 -5], 10);  
                                % Form Fzpk1(s) = 10(s + 2)(s + 4) / [s(s + 3)(s + 5)].

'Ftf1'                         % Display label.
```

```matlabTextOutput
ans = 'Ftf1'
```

```matlab
Ftf1 = tf(Fzpk1);              % Convert Fzpk1(s) to coefficient form.

'Ftf2'                         % Display label.
```

```matlabTextOutput
ans = 'Ftf2'
```

```matlab
Ftf2 = tf([10 40 60], [1 4 5 7]);  
                                % Form Ftf2(s) = (10s^2 + 40s + 60) / (s^3 + 4s^2 + 5s + 7).

'Fzpk2'                        % Display label.
```

```matlabTextOutput
ans = 'Fzpk2'
```

```matlab
Fzpk2 = zpk(Ftf2);             % Convert Ftf2(s) to factored form.
```

```matlab
'(ch2p12)'                 % Display label.
```

```matlabTextOutput
ans = '(ch2p12)'
```

```matlab

t = 0:0.01:10;             % Specify time range and increment.
f1 = cos(5 * t);           % Define f1 as cos(5t).
f2 = sin(5 * t);           % Define f2 as sin(5t).

plot(t, f1, 'r', t, f2, 'g');  % Plot f1 in red and f2 in green.
```

![figure_0.png](ch2_media/figure_0.png)
