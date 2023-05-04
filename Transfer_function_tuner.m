%% 
% Individual Components

transfer_Function_Highpass = tf([1 0],[1 (2*pi*700*10^3)]);
bode(transfer_Function_Highpass);
legend("tf_High_pass");
transfer_Function_BandPass = tf([0 10],[0 10]);
bode(transfer_Function_BandPass);
legend("tf_Band_pass");
transfer_Function_Lowpass = tf([0 (2*pi*1400*10^3)],[1 2*pi*1400*10^3]);
bode(transfer_Function_Lowpass);
legend("tf_Low_Pass");
transferfunction_circuit =(transfer_Function_Highpass + transfer_Function_BandPass + transfer_Function_Lowpass);
bode(transferfunction_circuit);
legend("tf_circuit");

%% 
% Individual Components on one graph

bode(transfer_Function_Highpass);
hold on
bode(transfer_Function_BandPass);
hold on
bode(transfer_Function_Lowpass);
hold on
bode(transferfunction_circuit);
legend("tf_High_pass", "tf_Op_Amp_Gain","tf_Low_pass","tf_added");
hold off
%% 
% Multiple Bode diagrams to tune and filter for "K" 

K = [0:.1:1];
transferfunction_circuit = K * (transfer_Function_Highpass + transfer_Function_BandPass + transfer_Function_Lowpass);
bode(transferfunction_circuit);