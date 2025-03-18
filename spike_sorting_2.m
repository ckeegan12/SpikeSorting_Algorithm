% Resource: Electrophysiology-Tutorial-for-Neuroscience

% Thresholds For Filtered Signal
noise_std = median(abs(filtered_signal)/0.6745); % Standard Deviation of Noise Using Donoho's Rule
threshold_low = 5 * noise_std; % Low Spike Threshold

% Finding Spike Indices of Low Threshold Passes
[peaks,spike_indices] = findpeaks(abs(filtered_signal), 'MinPeakHeight', threshold_low);

figure;
plot(t,filtered_signal); hold on
scatter(t(spike_indices),peaks,'or'); hold off


prePeak = 0.0025; % length of window to extract before spike peak (s)
posPeak = 0.0025; % length of window to extract after spike peak (s)
prePeakSamples = prePeak * Fs; % number of samples before peak (s)
posPeakSamples = posPeak * Fs; % number of samples after peak (s)

ts = -prePeakSamples:posPeakSamples;
spks = zeros(length(spike_indices),length(ts));
Transpose_Filtered = filtered_signal';

for i = 1:length(spike_indices)
    preWindow = spike_indices(i) - prePeakSamples;
    posWindow = spike_indices(i) + posPeakSamples;
    Window = preWindow:posWindow;
    spks(i, :) = Transpose_Filtered(Window);
end
fprintf("\nSpike Windowing Complete\n")

% Spike window analysis
figure;
plot(ts,spks','k')
ylabel('spikes')
xlabel('5ms Window')

% PCA analysis
[coeff,score] = pca(spks);
figure; 
scatter(score(:,1),score(:,2),'.b')
xlabel('PC1')
ylabel('PC2')

%K-Means clustering and analysis
[idx,C] = kmeans(score(:,1:2),3);

figure(3);
plot(score(idx==1,1),score(idx==1,2),'.r')
hold on
plot(score(idx==2,1),score(idx==2,2),'.b')
hold on
plot(score(idx==3,1),score(idx==3,2),'.g')
hold on
plot(C(:,1),C(:,2),'kx')
hold off


figure(4);  % plot the original waveforms
ylabel('spikes') % query variable name and units
plot(ts,spks(idx==1,:)','b')
hold on
plot(ts,spks(idx==2,:)','r')
hold on
plot(ts,spks(idx==3,:)','g')
hold on
