# Graph classification using Deng entropy and bidirectional LSTM

In this repository, you will find the resources to reproduce and verify the experiments and results presented in the paper titled *Graph classification using Deng entropy and bidirectional long short-term memory* by  M.C. Soto-Camacho, M. Nagy, R. Molontay, and A. Ramirez-Arellano.


# Supplementary material and resources 

The resources are classified in the following folders:

* [__Code__](./Code): Contains the Matlab source code.
* [__Data__](./Data): Containing TUDA dataset (Deng entropy of graphs).
* [__Networks__](./Networks): There are synthetic network files such as Barabasi--Albert (BA), Song, Havlin, and Makse (SHM).

To replicate the results of experiments presented in the paper (*Graph classification using Deng entropy and bidirectional long short-term memory*), you need to download all the resources and follow the following steps:

1. Open the Matlab source code that is found in [`code\ClassificationDEbLSTM.m`](./Code/ClassificationDEbLSTM.m) file.
2. In line 7, you can modify the dataset file name to load, which you can locate in the [data folder](./Data).
3. Load the dataset in Matlab.
4. Run the code 

__Note__
 If you would like to change the network configuration data, you need to uncomment the lines (13 - 22), make the modifications, and then comment out the lines (7 - 11) in the [`ClassificationDEbLSTM.m` file](./Code/ClassificationDEbLSTM.m).

 The file [`code\SPAWNER2.m`](./Codes/SPAWNER2.m) contains a simplified algorithm to solve the problem of low accuracy with small graph datasets by generating synthetic data based on real data. The algorithm is based on the work of Krzysztof-Kamycki, Kapuscinski, and Mariusz [1].

 [1] Kamycki, K., Kapuscinski, T., & Oszust, M. (2019). Data augmentation with suboptimal warping for time-series classification. *Sensors, 20*(1), 98.
