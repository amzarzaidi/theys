RSB = 0:1:24;
RSBlin = 10.^(RSB / 10);
M = [4, 16, 64, 256];
BER = zeros(length(RSBlin), length(M));

for i = 1:length(M)
    SER = 2 * ( 1 - 1 / sqrt(M(i))) * erfc (sqrt(3 * RSBlin / (2*((M(i)) - 1))));
    BER(:,i) = SER / log2(M(i));
end

BER256pratique = [0.3942, 0.3872, 0.3796, 0.3175, 0.3625, 0.3527, 0.3425, 0.3316, 0.3201, 0.3077, 0.2946, 0.2807, 0.2661, 0.2507, 0.2345, 0.2173, 0.1987, 0.1787, 0.1574, 0.1354, 0.1129, 0.0908, 0.0699, 0.0509, 0.03477];
BER4 = BER(:,1);
BER16 = BER(:,2);
BER64 = BER(:,3);
BER256 = BER(:,4);

figure;
semilogy(RSB,BER4);
hold on;
semilogy(RSB,BER16);
hold on;
semilogy(RSB,BER64);
hold on;
semilogy(RSB,BER256);
hold on;
semilogy(RSB,BER256pratique);

grid on;
axis([0 24 1e-10 1]);
xlabel('RSB ');
ylabel('BER');
legend('4','16','64','256-theorique','256-pratique');
