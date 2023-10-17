%% Q2c
clear all
n = 100000;
HnomA = 65;
HnomB = 97;
DnomA = 95;
DnomB = 95;
HtolA = 10;
HtolB = 3;
DtolA = 5;
DtolB = 0.5;
HmaxA = HnomA + HtolA;
HminA = HnomA - HtolA;
DmaxA = DnomA + DtolA;
DminA = DnomA - DtolA;
H_unif = zeros(1,n);
D_unif = zeros(1,n);
H_nom = zeros(1,n);
D_nom = zeros(1,n);
H_C = zeros(1,n);
H_D = zeros(1,n);
% uniform distribution
for i = 1:n
    H_unif(i) = (HmaxA - HminA)*rand() + HminA;
    D_unif(i) = (DmaxA - DminA)*rand() + DminA;
end
% normal distribution
for i = 1:n
    rH = rand();
    rD = rand();
    H_nom(i) = HnomB + HtolB * sqrt(2) * erfinv(2 * rH - 1);
    D_nom(i) = DnomB + DtolB * sqrt(2) * erfinv(2 * rD - 1);
end 
% C distribution
for i = 1:n
    H_C(i) = ((sqrt(H_unif(i)) + sqrt(H_nom(i))).^2)/4;
    D_C(i) = ((sqrt(D_unif(i)) + sqrt(D_nom(i))).^2)/4;
end
% histograms
figure; 
subplot(3,1,1);
edges = 50:110; 
histogram(H_unif, edges, "Normalization", "probability");
hold on
histogram(D_unif, edges, "Normalization", "probability");
hold off
title('H and D Scenario A');

subplot(3,1,2);
edges = 50:110; 
histogram(H_nom, edges, "Normalization", "probability");
hold on
histogram(D_nom, edges, "Normalization", "probability");
hold off
title('H and D Scenario B');

subplot(3,1,3);
edges = 50:110; 
histogram(H_C, edges, "Normalization", "probability");
hold on
histogram(D_C, edges, "Normalization", "probability");
hold off
title('H and D Scenario C');