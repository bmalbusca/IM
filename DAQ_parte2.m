function [] = DAQ_parte2( device,type , channel, fs, n, range)

 [ S, t ] = acquire2( device,type , channel1,channel2, fsampl, n, range);
 
 [ ~ ,~, s_rms1 ] = meanf( S(1,:), t,fs, n, f_estim );
 [ ~ ,~, s_rms2 ] = meanf( S(2,:), t,fs, n, f_estim );
 
Z_rms = (s_rms1/s_rms2)*100 ;
angle = phase((S(1,:)- S(2,:)), S(1,:)); 
end