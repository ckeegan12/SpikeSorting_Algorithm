# SpikeSorting_Algorithm
EEG Signal Spike Sorting Algorithm that uses Principle Component Analysis (**PCA**) and **K-means** machine learning algorithm for action ponentials.
It uses Donoho's rule for the threshold standard deviation. I used a **5x STD** threshold to detect spikes. After the spike detection from thresholding the spikes
are overlapped in a 5ms window then sent into PCA. I used **PC1** and **PC2** for cluster in K-means which used **3 clusters** for the detected spikes.
