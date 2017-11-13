function [ G ] = training( D )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%initialize network structure
s=[1,1,2,2,3];
t=[2,3,4,5,6];
G0=digraph(s,t);
Gbest=G0;
%i=0;
%repeat
for i=1:2000
    G=Gbest;
    %randomly select a pair of nodes
    n1=unidrnd(6);
    n2=unidrnd(6);
    if n1 ~= n2    %make sure they are two different nodes.
        opt=unidrnd(3); %operator: add,delete,reverse
        if opt==1  %add
            if findedge(G,n1,n2)==0
                Gnew=addedge(G,n1,n2);
            else
                continue;
            end
            
        elseif opt==2  %delete
            if findedge(G,n1,n2)~=0 %make sure there is a edge
                Gnew=rmedge(G,n1,n2);
            else
                continue;
            end
            
        else  %reverse
            if findedge(G,n1,n2)~=0  %make sure there is a edge
                if findedge(G,n2,n1)==0 %make sure there is no edge on the reversal direction
                    Gnew=rmedge(G,n1,n2);
                    Gnew=addedge(Gnew,n2,n1);
                else
                    continue;
                end
            else
                continue;
            end
        end
        
        indeg=indegree(Gnew);  %get indegrees of every nodes in Gnew.
        k=max(indeg);   % k=3 is the upper bound for the number of parent nodes
        
        if k <= 3
            if isdag(Gnew)==1 %Determine if graph is acyclic
                if score(Gnew,D)>score(Gbest,D)
                    Gbest=Gnew;
                    %i=i+1;
                    %                     if isequal(G,Gnew)==1
                    %                         break;
                    %                     end
                end
            end
        end
    end
end
plot(G);
end