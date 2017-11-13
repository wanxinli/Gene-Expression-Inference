function [ CPT ] = getCPT( G, D )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
CPT=cell(1,6); %1*6

t=tabulate(num2str(D));
t1=str2num(cell2mat(t(:,1)));
t2=cell2mat(t(:,2));
t3=[t1,t2];  %store the frequences of all situations of 6 genes combination in train data.
t3_len=length(t3);  %t3_length=33

for v=1:6 % node in G
    u = predecessors(G,v); %obtain the parent nodes of node v in G. array
    num_u = length(u);% get the number of parents.
    M1=0; % M[x=1,u]
    M2=0; % M[u]
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if num_u == 0 % root
       % a0=0;
        for i=1:t3_len
            if t3(i,v)==1
                M1=M1+t3(i,7);
            end
        end
        M2=200;
        a0=M1/M2;
        CPT{v}=a0;
    end
    M1=0;
    M2=0;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if num_u==1 % node v has 1 parent
        a1=[0,0];
        for i=1:t3_len
            if t3(i,u(1))==1
                M2=M2+t3(i,7);
                if t3(i,v)==1
                    M1=M1+t3(i,7);
                end
            end
        end
        if M2~=0
            a1(1)=M1/M2;
        end
        
        M1=0;
        M2=0;
        
        for i=1:t3_len
            if t3(i,u(1))==0 %
                M2=M2+t3(i,7);
                if t3(i,v)==1 %
                    M1=M1+t3(i,7);
                end
            end
        end
        if M2~=0
            a1(2)=M1/M2;
        end
        CPT{v}=a1;
    end
    M1=0;
    M2=0;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if num_u==2  % node v has 2 parent
        a2=[0,0,0,0];
        for i=1:t3_len
            if t3(i,u(1))==1 && t3(i,u(2))==1
                M2=M2+t3(i,7);
                if t3(i,v)==1
                    M1=M1+t3(i,7);
                end
            end
        end
        if M2~=0
            a2(1)=M1/M2;
        end
        M1=0;
        M2=0;
        
        for i=1:t3_len
            if t3(i,u(1))==1 && t3(i,u(2))==0
                M2=M2+t3(i,7);
                if t3(i,v)==1
                    M1=M1+t3(i,7);
                end
            end
        end
        if M2~=0
            a2(2)=M1/M2;
        end
        M1=0;
        M2=0;
        
        for i=1:t3_len
            if t3(i,u(1))==0 && t3(i,u(2))==1
                M2=M2+t3(i,7);
                if t3(i,v)==1
                    M1=M1+t3(i,7);
                end
            end
        end
        if M2~=0
            a2(3)=M1/M2;
        end
        M1=0;
        M2=0;
        
        for i=1:t3_len
            if t3(i,u(1))==0 && t3(i,u(2))==0
                M2=M2+t3(i,7);
                if t3(i,v)==1
                    M1=M1+t3(i,7);
                end
            end
        end
        if M2~=0
            a2(4)=M1/M2;
        end
        CPT{v}=a2;
    end
    M1=0;
    M2=0;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if num_u==3   % node v has 3 parent
        a3=zeros(1,8);
        for i=1:t3_len
            if t3(i,u(1))==1 && t3(i,u(2))==1 && t3(i,u(3))==1
                M2=M2+t3(i,7);
                if t3(i,v)==1
                    M1=M1+t3(i,7);
                end
            end
        end
        if M2~=0
            a3(1)=M1/M2;
        end
        M1=0;
        M2=0;
        
        for i=1:t3_len
            if t3(i,u(1))==1 && t3(i,u(2))==1 && t3(i,u(3))==0
                M2=M2+t3(i,7);
                if t3(i,v)==1
                    M1=M1+t3(i,7);
                end
            end
        end
        if M2~=0
            a3(2)=M1/M2;
        end
        M1=0;
        M2=0;
        
        for i=1:t3_len
            if t3(i,u(1))==1 && t3(i,u(2))==0 && t3(i,u(3))==1
                M2=M2+t3(i,7);
                if t3(i,v)==1
                    M1=M1+t3(i,7);
                end
            end
        end
        if M2~=0
            a3(3)=M1/M2;
        end
        M1=0;
        M2=0;
        
        for i=1:t3_len
            if t3(i,u(1))==1 && t3(i,u(2))==0 && t3(i,u(3))==0
                M2=M2+t3(i,7);
                if t3(i,v)==1
                    M1=M1+t3(i,7);
                end
            end
        end
        if M2~=0
            a3(4)=M1/M2;
        end
        M1=0;
        M2=0;
        
        for i=1:t3_len
            if t3(i,u(1))==0 && t3(i,u(2))==1 && t3(i,u(3))==1
                M2=M2+t3(i,7);
                if t3(i,v)==1
                    M1=M1+t3(i,7);
                end
            end
        end
        if M2~=0
            a3(5)=M1/M2;
        end
        M1=0;
        M2=0;
        
        for i=1:t3_len
            if t3(i,u(1))==0 && t3(i,u(2))==1 && t3(i,u(3))==0
                M2=M2+t3(i,7);
                if t3(i,v)==1
                    M1=M1+t3(i,7);
                end
            end
        end
        if M2~=0
            a3(6)=M1/M2;
        end
        M1=0;
        M2=0;
        
        for i=1:t3_len
            if t3(i,u(1))==0 && t3(i,u(2))==0 && t3(i,u(3))==1
                M2=M2+t3(i,7);
                if t3(i,v)==1
                    M1=M1+t3(i,7);
                end
            end
        end
        if M2~=0
            a3(7)=M1/M2;
        end
        M1=0;
        M2=0;
        
        for i=1:t3_len
            if t3(i,u(1))==0 && t3(i,u(2))==0 && t3(i,u(3))==0
                M2=M2+t3(i,7);
                if t3(i,v)==1
                    M1=M1+t3(i,7);
                end
            end
        end
        if M2~=0
            a3(8)=M1/M2;
        end
        CPT{v}=a3;        
    end
end

