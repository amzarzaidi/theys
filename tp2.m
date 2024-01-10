RSB = 0:1:24;
RSBlin = 10.^(RSB / 10);
M = [4, 16, 64, 256];
BER = zeros(length(RSBlin), length(M));

for i = 1:length(M)
    SER = 2 * ( 1 - 1 / sqrt(M(i))) * erfc (sqrt(3 * RSBlin / (2*((M(i)) - 1))));
    BER(:,i) = SER / log2(M(i));
end

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

grid on;
axis([0 24 1e-10 1]);
xlabel('RSB (dB)');
ylabel('BER');
