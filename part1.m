% bandwidth = 1/pi

%part b
t = -5:0.01:4.99;
m_t = sinc( (2*t) / pi);
subplot(2,3,1);
plot(t,m_t);
title("Message Signal: Part b");
xlabel("Time t");
ylabel("m(t)");

%part c

[m_f,f] = fouriert(m_t,t);
subplot(2,3,2);
plot(f,abs(m_f));
title("Amplitude Spectrum |M(f)|: Part C");
xlabel("Frequency");
ylabel("|M(f)|");

%part d
s_dev = sqrt(0.2);
n_t = s_dev.*randn(1,length(t));
r_t = m_t + n_t;
subplot(2,3,3);
plot(t,r_t);
title("Message Signal + Gaussain Noise: Part D");
xlabel("time");
ylabel("r(t)");

%part e

[R_f,f_parte] = fouriert(r_t,t);

subplot(2,3,4);
plot(f_parte,abs(R_f));
title("Amplitude Spectrum of R(f): Part E");
xlabel("Frequency");
ylabel("|R(f)|");

%part f
[slp, tslp] = lowpass(r_t, t, 0.35);
subplot(2,3,5);
plot(tslp,slp);
title("Filtered Signal r(t): Part f");
xlabel("time");
ylabel("r_filt(t)");

%The signal was recovered completely, since the bandwidth of the message
%signal is 1/pi, which can also be seen from the amplitude spectrum of the
%message signal in the frequency domain. Anything above that will be
%cleaned out. If you zoom in , you will see some minor distortion in the
%bottom of the singal. However it is insgnificant. 


%part g

[slp_f,tslp_f] = fouriert(slp,tslp);
subplot(2,3,6);
plot(tslp_f,abs(slp_f));
title("Amplitude Spectrum of Filtered signal r(t): Part g");
xlabel("Frequency");
ylabel("R_Filt(f)");




