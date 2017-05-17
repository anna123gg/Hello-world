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

% Run through all different models
V = arxstruc(ze, zv, struc(1:10, 1:10, 1:10));
% Find the best model
% nn = selstruc(V, 0);
nn = [0 10 0];
% Time domain plot
th = arx(ze, nn);
th.Ts = 1;
u = z(:, 2);
y = z(:, 1)+ave;
yp = sim(u, th)+ave;

xlbl = 'Time Steps';

subplot(2,1,1);
index = 1:trn_data_n;
plot(index, y2(index), index, yp(index), '.');
rmse = norm(y(index)-yp(index))/sqrt(length(index));
title(['(a) Training Data (Solid Line) and ARX Prediction (Dots) with RMSE = ' num2str(rmse)],'fontsize',10);
disp(['[na nb d] = ' num2str(nn)]);
xlabel(xlbl,'fontsize',10);

subplot(2,1,2);
index = (trn_data_n+1):(total_data_n);
plot(index, y2(index), index, yp(index), '.');
rmse = norm(y(index)-yp(index))/sqrt(length(index));
title(['(b) Checking Data (Solid Line) and ARX Prediction (Dots) with RMSE = ' num2str(rmse)],'fontsize',10);
xlabel(xlbl,'fontsize',10);
