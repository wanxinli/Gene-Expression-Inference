function [ result ] = score( G, D )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
CPT=getCPT(G,D); %CPT is 1*6 cell
result=0;
for i=1:200
    for v=1:6
        u = predecessors(G,v); %obtain the parent nodes of node v in G. array
        num_u = length(u);% get the number of parents.
        
        if num_u==0% node v is root
            if D(i,v)==1 %gene(v) at row i in the data set.
                result=result+log2(CPT{v}(1));
            end
            if D(i,v)==0
                result=result+log2(1-CPT{v}(1));
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if num_u==1% node v has a parent
            if D(i,v)==1
                if D(i,u(1))==1  %parent of v
                    result=result+log2(CPT{v}(1));
                end
                if D(i,u(1))==0
                    result=result+log2(CPT{v}(2));
                end
            end
            if D(i,v)==0
                if D(i,u(1))==1
                    result=result+log2(1-CPT{v}(1));
                end
                if D(i,u(1))==0
                    result=result+log2(1-CPT{v}(2));
                end
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if num_u==2 %node v has 2 parents
            if D(i,v)==1
                if D(i,u(1))==1 && D(i,u(2))==1
                    result=result+log2(CPT{v}(1));
                end
                if D(i,u(1))==1 && D(i,u(2))==0
                    result=result+log2(CPT{v}(2));
                end
                if D(i,u(1))==0 && D(i,u(2))==1
                    result=result+log2(CPT{v}(3));
                end
                if D(i,u(1))==0 && D(i,u(2))==0
                    result=result+log2(CPT{v}(4));
                end
            end
            if D(i,v)==0
                if D(i,u(1))==1 && D(i,u(2))==1
                    result=result+log2(1-CPT{v}(1));
                end
                if D(i,u(1))==1 && D(i,u(2))==0
                    result=result+log2(1-CPT{v}(2));
                end
                if D(i,u(1))==0 && D(i,u(2))==1
                    result=result+log2(1-CPT{v}(3));
                end
                if D(i,u(1))==0 && D(i,u(2))==0
                    result=result+log2(1-CPT{v}(4));
                end
            end
            
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if num_u==3 % node v has 3 parents
            if D(i,v)==1
                if D(i,u(1))==1 && D(i,u(2))==1 && D(i,u(3))==1
                    result=result+log2(CPT{v}(1));
                end
                if D(i,u(1))==1 && D(i,u(2))==1 && D(i,u(3))==0
                    result=result+log2(CPT{v}(2));
                end
                if D(i,u(1))==1 && D(i,u(2))==0 && D(i,u(3))==1
                    result=result+log2(CPT{v}(3));
                end
                if D(i,u(1))==1 && D(i,u(2))==0 && D(i,u(3))==0
                    result=result+log2(CPT{v}(4));
                end
                if D(i,u(1))==0 && D(i,u(2))==1 && D(i,u(3))==1
                    result=result+log2(CPT{v}(5));
                end
                if D(i,u(1))==0 && D(i,u(2))==1 && D(i,u(3))==0
                    result=result+log2(CPT{v}(6));
                end
                if D(i,u(1))==0 && D(i,u(2))==0 && D(i,u(3))==1
                    result=result+log2(CPT{v}(7));
                end
                if D(i,u(1))==0 && D(i,u(2))==0 && D(i,u(3))==0
                    result=result+log2(CPT{v}(8));
                end
            end
            if D(i,v)==0
                if D(i,u(1))==1 && D(i,u(2))==1 && D(i,u(3))==1
                    result=result+log2(1-CPT{v}(1));
                end
                if D(i,u(1))==1 && D(i,u(2))==1 && D(i,u(3))==0
                    result=result+log2(1-CPT{v}(2));
                end
                if D(i,u(1))==1 && D(i,u(2))==0 && D(i,u(3))==1
                    result=result+log2(1-CPT{v}(3));
                end
                if D(i,u(1))==1 && D(i,u(2))==0 && D(i,u(3))==0
                    result=result+log2(1-CPT{v}(4));
                end
                if D(i,u(1))==0 && D(i,u(2))==1 && D(i,u(3))==1
                    result=result+log2(1-CPT{v}(5));
                end
                if D(i,u(1))==0 && D(i,u(2))==1 && D(i,u(3))==0
                    result=result+log2(1-CPT{v}(6));
                end
                if D(i,u(1))==0 && D(i,u(2))==0 && D(i,u(3))==1
                    result=result+log2(1-CPT{v}(7));
                end
                if D(i,u(1))==0 && D(i,u(2))==0 && D(i,u(3))==0
                    result=result+log2(1-CPT{v}(8));
                end
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
    
end

