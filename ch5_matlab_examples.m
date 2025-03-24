%%
'(ch5p1) UFSS Pitch Control System'
'& Feedback Commands'
'Solution via Series, Parallel' % Display labels.
numg1 = [-1];                   % Define numerator of G1(s).
deng1 = [1];                    % Define denominator of G1(s).
numg2 = [0 2];                  % Define numerator of G2(s).
deng2 = [1 2];                  % Define denominator of G2(s).
numg3 = -0.125*[1 0.435];       % Define numerator of G3(s).
deng3 = conv([1 1.23], [1 0.226 0.0169]);
                                % Define denominator of G3(s).
numh1 = [-1 0];                 % Define numerator of H1(s).
denh1 = [0 1];                  % Define denominator of H1(s).
G1 = tf(numg1, deng1);          % Create LTI transfer function,
                                % G1(s).
G2 = tf(numg2, deng2);          % Create LTI transfer function,
                                % G2(s).
G3 = tf(numg3, deng3);          % Create LTI transfer function,
                                % G3(s).
H1 = tf(numh1, denh1);          % Create LTI transfer function,
                                % H1(s).
G4 = series(G2, G3);            % Calculate product of elevator
                                % and vehicle dynamics.
G5 = feedback(G4, H1);          % Calculate close-loop transfer
                                % function of inner loop.
Ge = series(G1, G5);            % Multiply inner-loop transfer
                                % function and pitch gain.
'T(s) via Series, Parallel, & Feedback Commands'
                                % Display label.
T = feedback(Ge, 1)             % Find closed-loop transfer
                                % function.

'Solution via Algebraic Operations'
                                % Display label.
clear                           % Clear session.
numg1 = [-1];                   % Define numerator of G1(s).
deng1 = [1];                    % Define denominator of G1(s).
numg2 = [0 2];                  % Define numerator of G2(s).
deng2 = [1 2];                  % Define denominator of G2(s).
numg3 = -0.125*[1 0.435];       % Define numerator of G3(s).
deng3 = conv([1 1.23], [1 0.226 0.0169]);
                                % Define denominator of G3(s).
numh1 = [-1 0];                 % Define numerator of H1(s).
denh1 = [0 1];                  % Define denominator of H1(s).
G1 = tf(numg1, deng1);          % Create LTI transfer function, G1(s).
G2 = tf(numg2, deng2);          % Create LTI transfer function, G2(s).
G3 = tf(numg3, deng3);          % Create LTI transfer function, G3(s).
H1 = tf(numh1, denh1);          % Create LTI transfer function, H1(s).
G4 = G3 * G2;                   % Calculate product of elevator and
                                % vehicle dynamics.
G5 = G4 / (1 + G4 * H1);        % Calculate closed-loop transfer
                                % function of inner loop.
G5 = minreal(G5);               % Cancel common terms.
Ge = G5 * G1;                   % Multiply inner-loop transfer
                                % functions.
'T(s) via Algebraic Operations' % Display label.
T = Ge / (1 + Ge);              % Find closed-loop transfer function.
T = minreal(T)                  % Cancel common terms.

'Solution via Append & Connect Commands'
                                % Display label.
'G1(s)=(-K1)*(1/(-K2s))=1/s'    % Display label.
numg1 = [1];                    % Define numerator of G1(s).
deng1 = [1 0];                  % Define denominator of G1(s).
G1 = tf(numg1, deng1)           % Create LTI transfer function,
                                % G1(s)=pitch gain*1/(Pitch rate sensor).
'G2(s)=(-K2s)*(2/(s+2))'        % Display label.
numg2 = [-2 0];                 % Define numerator of G2(s).
deng2 = [1 2];                  % Define denominator of G2(s).
G2 = tf(numg2, deng2)           % Create LTI transfer function,
                                % G2(s)=pitch rate sensor*vehicle dynamics.
'G3(s)=-0.125(s+0.435)/((s+1.23)(s^2+0.226s+0.0169))'
                                % Display label.
numg3 = -0.125*[1 0.435];       % Define numerator of G3(s).
deng3 = conv([1 1.23], [1 0.226 0.0169]);
                                % Define denominator of G3(s).
G3 = tf(numg3, deng3);          % Create LTI transfer function,
                                % G3(s)=vehicle dynamics.
System = append(G1, G2, G3);    % Gather all subsystems.
input = 1;                      % Input is at first subsystem,
                                % G1(s).
output = 3;                     % Output is output of third
                                % subsystem, G3(s).
Q = [1 -3 0                     % Subsystem 1, G1(s), gets its
                                % input from the negative of the
                                % output of subsystem 3, G3(s).
     2 1 -3                     % Subsystem 2, G2(s), gets its
                                % input from subsystem 1, G1(s),
                                % and the negative of the output
                                % of subsystem 3, G3(s).
     3 2 0];                    % Subsystem 3, G3(s), gets its
                                % input from subsystem 2, G2(s).
T = connect(System, Q, input, output);
                                % Connect the subsystems.
'T(s) via Append & Connect Commands'
                                % Display label.
T = tf(T);                      % Create LTI closed-loop transfer
                                % function.
T = minreal(T)                  % Cancel common terms.

%%
'(ch5p2) Example 5.3'           % Display label.
numg = [25];                    % Define numerator of G(s).
deng = poly([0 -5]);            % Define denominator of G(s).
'G(s)'                          % Display label.
G = tf(numg, deng)              % Create and display G(s).
'T(s)'                          % Display label.
T = feedback(G, 1)              % Find T(s).
[numt, dent] = tfdata(T, 'v');  % Extract numerator & denominator
                                % of T(s).
wn = sqrt(dent(3))              % Find natural frequency.
z = dent(2)/(2*wn)              % Find damping ratio.
Ts = 4/(z*wn)                   % Find settling time.
Tp = pi/(wn*sqrt(1-z^2))        % Find peak time.
pos = exp(-z*pi/sqrt(1-z^2))*100 % Find percent overshoot.
step(T)                         % Generate step response.

%%
'(ch5p3)'                       % Display label.
numt = 24;                      % Define numerator of T(s).
dent = poly([-2 -3 -4]);        % Define denominator of T(s).
'T(s)'                          % Display label.
T = tf(numt, dent)              % Create and display T(s).
[Acc, Bcc, Ccc, Dcc] = tf2ss(numt, dent);
                                % Convert T(s) to controller
                                % canonical form.
Scc = ss(Acc, Bcc, Ccc, Dcc);   % Create LTI controller canonical
                                % state-space object.
Sp = canon(Scc, 'modal');       % Convert controller canonical form
                                % to parallel form.
'Controller Canonical Form'     % Display label.
[Acc, Bcc, Ccc, Dcc] = ssdata(Scc) % Extract and display controller
                                % canonical form matrices.
'Parallel Form'                 % Display label.
[Ap, Bp, Cp, Dp] = ssdata(Sp)   % Extract and display parallel form
                                % matrices.

%%
'(ch5p4) Example 5.9'           % Display label.
Pinv = [2 0 0; 3 2 0; 1 4 5];   % Define P inverse.
P = inv(Pinv)                   % Calculate P.
'Original'                      % Display label.
Ax = [0 1 0; 0 0 1; -2 -5 -7]   % Define original A.
Bx = [0 0 1]                    % Define original B.
Cx = [1 0 0]                    % Define original C.
'Transformed'                   % Display label.
Az = Pinv * Ax * P              % Calculate new A.
Bz = Pinv * Bx'                 % Calculate new B.
Cz = Cx * P                     % Calculate new C.

%%
'(ch5p5)'                       % Display label.
A = [3 1 5; 4 -2 7; 2 3 1];     % Define original A.
B = [1; 2; 3];                  % Define original B.
C = [2 4 6];                    % Define original C.
[P, d] = eig(A)                 % Generate transformation matrix,
                                % P, and eigenvalues, d.
'Via Transformation'            % Display label.
Adt = inv(P) * A * P            % Calculate diagonal system A.
Bdt = inv(P) * B                % Calculate diagonal system B.
Cdt = C * P                     % Calculate diagonal system C.
'Via Canon Command'             % Display label.
S = ss(A, B, C, 0)              % Create state-space LTI object
                                % for original system.
Sp = canon(S, 'modal')          % Calculate diagonal system via
                                % canon command.
