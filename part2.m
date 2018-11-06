t = -5:0.01:4.99;
m_t = sinc( (2*t) / pi);
A_c = 1;
f_c = 25;
c_t = A_c * cos(2*pi*f_c*t);

s_t = m_t .* c_t;

%part a


subplot(2,3,1);
plot(t,s_t);
title("Modulated Signal S(t): Part A");
xlabel("time");
ylabel("s(t)");

%part b
r_t = s_t;
f_cut = 25;
r_t2 = r_t .* (2*cos(2*pi*f_c*t));
[r_t3, t_lp] = lowpass(r_t2,t,f_cut);
subplot(2,3,2);
plot(t_lp,r_t3);
title("Output of Coh. Detector: Part b");
xlabel("time");
ylabel("m_r(t)");


%part c


p_signal = norm(r_t3)^2/length(r_t3);

SNR = db2pow(14);

P_noise = p_signal / SNR;


%part d

 n_t = P_noise.*randn(1,length(t));
 r_t4 = s_t + n_t ; 
 subplot(2,3,3);
 plot(t,r_t4);
 title("Recieved Signal With A Noisy Channel: Part D");
 xlabel("time");
 ylabel("r(t) = s(t)+n(t)");

 %part e 
 
 m_rec_noisy = r_t4 .* (2 * cos(2 * pi * 25 * t));
 [mr, time] = lowpass(m_rec_noisy,t,f_cut);
 %[mr2, time2] = lowpass(mr,time,0.35);
 subplot(2,3,4);
 plot(time,mr);
 title("Recovered Signal With A Noisy Channel: Part E");
 xlabel("time");
 ylabel("m_r(t)");
 
 %part f
 
 my_detector_s1 = r_t4 .* (2 * cos(2 * pi * 25 * t));
 [my_det_s2,time_s2] = lowpass(my_detector_s1, t, 25);
 [my_det_s3,time_s3] = lowpass(my_det_s2,time_s2,0.32);
 
 subplot(2,3,5);
 plot(time_s3,my_det_s3);
 title("Proposed Detector Recovered Signal With A Noisy Channel: Part f");
 xlabel("time");
 ylabel("m_r(t)");



