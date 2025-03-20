# SpikeSorting_Algorithm
EEG Signal Spike Sorting Algorithm that uses Principle Component Analysis (**PCA**) and **K-means** machine learning algorithm for action ponentials.
It uses Donoho's rule for the threshold standard deviation. I used a **5x STD** threshold to detect spikes to avoid artifacts in windowing. After the spike detection from thresholding the spikes
are overlapped in a 5ms window then sent into PCA. I used **PC1** and **PC2** for cluster in K-means which used **3 clusters** for the detected spikes.
<p align="center">Threshold/Donoho's: </p>
<p align="center"><img width="212" alt="image" src="https://github.com/user-attachments/assets/8ce89a91-bf95-431d-a2dc-765e8255c168" /></p>
# Resources
http://www.scholarpedia.org/article/Spike_sorting 
https://www.nature.com/articles/s41598-021-93088-w
