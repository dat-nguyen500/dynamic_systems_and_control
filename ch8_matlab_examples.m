%% 
'(ch8p1) Example 8.7'       % Display label.
clf                         % Clear graph on screen.
numgh = [1 -4 20];          % Define numerator of G(s)H(s).
dengh = poly([-2 -4]);      % Define denominator of G(s)H(s).
'G(s)H(s)'                  % Display label.
GH = tf(numgh, dengh)       % Create G(s)H(s) and display.
rlocus(GH)                  % Draw root locus.
z = 0.2:0.05:0.5;           % Define damping ratio values: 0.2
                            % to 0.5 in steps of 0.05.
wn = 0:1:10;                % Define natural frequency values:
                            % 0 to 10 in steps of 1.
sgrid(z, wn)                % Generate damping ratio and
                            % natural frequency grid lines for
                            % root locus.
title('Root Locus')         % Define title for root locus.
pause
rlocus(GH)                  % Draw close-up root locus.
axis([-3 1 -4 4])           % Define range on axes for root
                            % locus close-up view.
title('Close-up')           % Define title for close-up root
                            % locus.
z = 0.45;                   % Define damping ratio line for
                            % overlay on close-up root locus.
wn = 0;                     % Suppress natural frequency
                            % overlay curves.
sgrid(z, wn)                % Overlay damping ratio curve on
                            % close-up root locus.
for k = 1:3                 % Loop allows 3 points to be
                            % selected as per Example 8.7,
                            % (z=0.45, jw crossing, breakaway).
    [K, p] = rlocfind(GH)   % Generate gain, K, and closed-loop
                            % poles, p, for point selected
                            % interactively on the root locus.
end                         % End loop.
pause

%% 
'(ch8p2) Example 8.8'       % Display label.
clear                       % Clear variables from workspace.
clf                         % Clear graph on screen.
numg = [1 1.5];             % Define numerator of G(s).
deng = poly([0 -1 -10]);    % Define denominator of G(s).
'G(s)'                      % Display label.
G = tf(numg, deng)          % Create and display G(s).
rlocus(G)                   % Draw root locus (H(s)=1).
title('Original Root Locus') % Add title.
pause
K = 0.005;                  % Specify range of gain to smooth
                            % root locus.
rlocus(G, K)                % Draw smoothed root locus
                            % (H(s)=1).
title('Smoothed Root Locus') % Add title.
pos = input('Type %OS ');   % Input desired percent overshoot
                            % from the keyboard.
z = -log(pos/100)/sqrt(pi^2 + [log(pos/100)]^2)
                            % Calculate damping ratio.
sgrid(z, 0)                 % Overlay desired damping ratio
                            % line on root locus.
title(['Root Locus with ', num2str(pos), '% overshoot line'])
                            % Define title for root locus
                            % showing percent overshoot used.
[K, p] = rlocfind(G)        % Generate gain, K, and closed-
                            % loop poles, p, for point selected
                            % interactively on the root locus.
pause
'T(s)'                      % Display label
T = feedback(K*G, 1)        % Find closed-loop transfer
                            % function with selected K and display.
step(T)                     % Generate closed-loop step
                            % response for point selected on
                            % root locus.
title(['Step Response for K=', num2str(K)])
                            % Give step response a title which
                            % includes the value of K.
pause
