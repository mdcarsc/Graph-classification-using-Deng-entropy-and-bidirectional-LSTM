# Graph-classification-using-Deng-entropy-and-bidirectional-LSTM

In this repository you will find the resourse to reproduce and verify the experiments and results presented in the "Graph classification Deng entropy" articule.
The resources are classified in the following folders:

Code: Contains the matlab source code.
Data: Containing TUDA dataset (Deng entropy of graphs).
Network: There are the synthetic netwok files such as Barabasi--Albert (BA), Song, Havlin, and Makse (SHM).

To replicate the results of experiments presented on "Graph classification Deng entropy" you need to download all the resources and follow the following steps:

1. Open the matlab source code that is found in "code\ClassificationDEbLSTM.m" file.
2. In line 7 you can modify the dataset file name to load,  wich you can locate in the data folder.
3. Load the data setfile in matlab.
4. Run the code 

*Note
 If you prefer change the network configuration data, you need to uncomment the lines (13 - 22) so then change the values, and comment the lines (7 - 11) in ClassificationDEbLSTM.m file.

 In the file "code\SPAWNER2.m" is provided a simplified algorithm to solve the problem of low accuracy with small graph datasets by generating synthetic data based on real data. The algorithm is based on the one described by Krzysztof-Kamycki (KK), Kapuscinski, and Mariusz (KM).
