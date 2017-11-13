function [ accuracy ] = test(G,D,CPT ) %test data and CPT got from training
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
cpt5=CPT{5};% get the cpt of gene5
u = predecessors(G,5); %obtain the parent of gene5 in G. array
num_u = length(u);% get the number of parents.
%num_u=log2(length(cpt5));  %number of gene5's parents
correct=0;
total=0;
for i = 1:20
    if num_u==0  % gene5 is the root
        if cpt5(1)>0.5
            total=total+1;
            if D(i,5)==1
                correct=correct+1;
            end
        end
        if cpt5(1)<=0.5
            total=total+1;
            if D(i,5)==0
                correct=correct+1;
            end
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if num_u==1  % gene5 has 1 parent
        if D(i,u(1))==1  %gene5's parent is 1 in test data set
            total=total+1;
            if D(i,5)==1 && cpt5(1)>0.5
                correct=correct+1;
            end
            if D(i,5)==0 && cpt5(1)<=0.5
                correct=correct+1;
            end
        end
        if D(i,u(1))==0
            total=total+1;
            if D(i,5)==1 && cpt5(2)>0.5
                correct=correct+1;
            end
            if D(i,5)==0 && cpt5(2)<=0.5
                correct=correct+1;
            end
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if num_u==2 %gene5 has 2 parents
        if D(i,u(1))==1 && D(i,u(2))==1 %gene5's parents are 1 in test data set
            total=total+1;
            if D(i,5)==1 && cpt5(1)>0.5
                correct=correct+1;
            end
            if D(i,5)==0 && cpt5(1)<=0.5
                correct=correct+1;
            end
        end
        if D(i,u(1))==1 && D(i,u(2))==0  %gene5's parents are(1,0)
            total=total+1;
            if D(i,5)==1 && cpt5(2)>0.5
                correct=correct+1;
            end
            if D(i,5)==0 && cpt5(2)<=0.5
                correct=correct+1;
            end
        end
        if D(i,u(1))==0 && D(i,u(2))==1  %gene5's parents are(0,1)
            total=total+1;
            if D(i,5)==1 && cpt5(3)>0.5
                correct=correct+1;
            end
            if D(i,5)==0 && cpt5(3)<=0.5
                correct=correct+1;
            end
        end
        if D(i,u(1))==0 && D(i,u(2))==1  %gene5's parents are(0,0)
            total=total+1;
            if D(i,5)==1 && cpt5(4)>0.5
                correct=correct+1;
            end
            if D(i,5)==0 && cpt5(4)<=0.5
                correct=correct+1;
            end
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if num_u==3
        if D(i,u(1))==1 && D(i,u(2))==1 && D(i,u(3))==1 %gene5's parents are(1,1,1)
            total=total+1;
            if D(i,5)==1 && cpt5(1)>0.5
                correct=correct+1;
            end
            if D(i,5)==0 && cpt5(1)<=0.5
                correct=correct+1;
            end
        end
        if D(i,u(1))==1 && D(i,u(2))==1 && D(i,u(3))==0 %gene5's parents are(1,1,0)
            total=total+1;
            if D(i,5)==1 && cpt5(2)>0.5
                correct=correct+1;
            end
            if D(i,5)==0 && cpt5(2)<=0.5
                correct=correct+1;
            end
        end
        if D(i,u(1))==1 && D(i,u(2))==0 && D(i,u(3))==1 %gene5's parents are(1,0,1)
            total=total+1;
            if D(i,5)==1 && cpt5(3)>0.5
                correct=correct+1;
            end
            if D(i,5)==0 && cpt5(3)<=0.5
                correct=correct+1;
            end
        end
        if D(i,u(1))==1 && D(i,u(2))==0 && D(i,u(3))==0 %gene5's parents are(1,0,0)
            total=total+1;
            if D(i,5)==1 && cpt5(4)>0.5
                correct=correct+1;
            end
            if D(i,5)==0 && cpt5(4)<=0.5
                correct=correct+1;
            end
        end
        if D(i,u(1))==0 && D(i,u(2))==1 && D(i,u(3))==1 %gene5's parents are(0,1,1)
            total=total+1;
            if D(i,5)==1 && cpt5(5)>0.5
                correct=correct+1;
            end
            if D(i,5)==0 && cpt5(5)<=0.5
                correct=correct+1;
            end
        end
        if D(i,u(1))==0 && D(i,u(2))==1 && D(i,u(3))==0 %gene5's parents are(0,1,0)
            total=total+1;
            if D(i,5)==1 && cpt5(6)>0.5
                correct=correct+1;
            end
            if D(i,5)==0 && cpt5(6)<=0.5
                correct=correct+1;
            end
        end
        if D(i,u(1))==0 && D(i,u(2))==0 && D(i,u(3))==1 %gene5's parents are(0,0,1)
            total=total+1;
            if D(i,5)==1 && cpt5(7)>0.5
                correct=correct+1;
            end
            if D(i,5)==0 && cpt5(7)<=0.5
                correct=correct+1;
            end
        end
        if D(i,u(1))==0 && D(i,u(2))==0 && D(i,u(3))==0 %gene5's parents are(0,0,0)
            total=total+1;
            if D(i,5)==1 && cpt5(8)>0.5
                correct=correct+1;
            end
            if D(i,5)==0 && cpt5(8)<=0.5
                correct=correct+1;
            end
        end
        
    end
end
accuracy=correct/total;
end

