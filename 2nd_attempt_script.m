A = 1;
B = A;
C = A;
D = A;
w1 = 2*pi*7*10^5;
w2 = 2*pi*1*10^6;
w3 = 2*pi*1.4*10^6;
w4 = 2*pi*1*10^6;

Vout = D * tf([1 0],[1 0 w4]);
VinA = A * tf([cos(135) -w1*sin(135)],[1 0 w1^2]);
VinB = B * tf([1 0],[1 0 w2^2]);
VinC = C * tf([cos(300) -w3*sin(300)],[1 0 w3^2]);

Vin = VinA + VinB + VinC;

H = tf(Vout,Vin);

bode(H);
hold on
bode(VinA);
hold on
bode(VinB);
hold on;
bode(VinC);
hold off;
legend("H(S)", "VinA","VinB","VinC");

bode(Vin);
hold on
bode(Vout);
hold on
bode(H);
legend("Vin(S)","Vout(s)","H(s)");
hold off