function [slp, tslp] = lowpass(s, ts, fcut)
B = fcut;
h = 2*B*sinc(2*B*ts);
N=length(ts);
Dty=ts(2)-ts(1);
tslp=ts;
slp=conv(h,s)*Dty;
slp=slp([(N)/2+1:(N)/2+N]);
end