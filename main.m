importTrain;
importTest;
G=training(hw2train);
Score=score(G,hw2train);
CPT=getCPT(G,hw2train);
Accuracy=test(G,hw2test,CPT);