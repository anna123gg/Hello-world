u2 = WSUM_vec(1:59,2);
y2 = featureMatrix(2:60,2);
trn_data_n = 40;
total_data_n = 59;
z = [y2 u2];
z = dtrend(z);
ave = mean(y2);
ze = z(1:trn_data_n, :);
zv = z(trn_data_n+1:total_data_n, :);
T = 1;

u = z(:, 2);
y = z(:, 1)+ave;
yp = sim(u, th)+ave;

xlbl = 'Time Steps';
% fun haha