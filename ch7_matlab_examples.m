%% 
'(ch7p1) Example 7.4, sys.b' % Display label
numg = 500 * poly([-2 -5 -6]); % Define numerator of G(s).
deng = poly([0 -8 -10 -12]);   % Define denominator of G(s).
G = tf(numg, deng);            % Form G(s)
'Check Stability'              % Display label.
T = feedback(G, 1);            % Form T(s)
poles = pole(T)                % Display closed-loop poles.
'Step Input'                   % Display label.
Kp = dcgain(G)                 % Evaluate Kp=numg/deng for s=0.
ess = 1 / (1 + Kp)             % Evaluate ess for step input.
'Ramp Input'                   % Display label.
numsg = conv([1 0], numg);     % Define numerator of sG(s).
densg = poly([0 -8 -10 -12]);  % Define denominator of sG(s).
sG = tf(numsg, densg);         % Create sG(s).
sG = minreal(sG);              % Cancel common 's' in
                               % numerator(numsg) and
                               % denominator(densg).
Kv = dcgain(sG)                % Evaluate Kv=sG(s) for s=0.
ess = 1 / Kv                   % Evaluate steady-state error for
                               % ramp input.
'Parabolic Input'              % Display label.
nums2g = conv([1 0 0], numg);  % Define numerator of s^2G(s).
dens2g = poly([0 -8 -10 -12]); % Define denominator of s^2G(s).
s2G = tf(nums2g, dens2g);      % Create s^2G(s).
s2G = minreal(s2G);            % Cancel common 's' in
                               % numerator(nums2g) and
                               % denominator(dens2g).
Ka = dcgain(s2G)               % Evaluate Ka=s^2G(s) for s=0.
ess = 1 / Ka                   % Evaluate steady-state error for
                               % parabolic input.
pause

%% 
'(ch7p2) Example 7.6'          % Display label.
numgdK = [1 5];                % Define numerator of G(s)/K.
dengdK = poly([0 -6 -7 -8]);   % Define denominator of G(s)/K.
GdK = tf(numgdK, dengdK);      % Create G(s)/K.
numgkv = conv([1 0], numgdK);  % Define numerator of sG(s)/K.
dengkv = dengdK;               % Define denominator of sG(s)/K.
GKv = tf(numgkv, dengkv);      % Create sG(s)/K.
GKv = minreal(GKv);            % Cancel common 's' in numerator
                               % and denominator of sG(s)/K.
KvdK = dcgain(GKv)             % Evaluate (Kv/K)=(numgkv/dengkv)
                               % for s=0.
ess = 0.1                      % Enumerate steady-state error.
K = 1 / (ess * KvdK)           % Solve for K.
'Check Stability'              % Display label.
T = feedback(K * GdK, 1);      % Form T(s).
poles = pole(T)                % Display closed-loop poles.
pause
