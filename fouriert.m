function [S,f] = fouriert(s,t)
Dt = t(2)-t(1);
N=length(t);
Df = (1/((length(s))*Dt));
f= (-0.5/Dt):Df:(0.5/Dt-Df);
S = fftshift(fft(fftshift(s)))*Dt;
end
%Scale factor Dt to account for the discrete nature of Matlab