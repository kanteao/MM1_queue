%% TP3: Qualité de Service et Diemntionnement
%% Simulation d'une file d'attente M/M/1
lamda=3.8;
mu=4;
z=1000;
T1=-log(rand)/lamda;
X=[0,0,Inf,T1];% initialisation de X=(N,t,TD,TA)
% Matrice dont chaque ligne contient X=(N',t',TD',TA')
M=X;
for i=2:z
    N=X(1);
   Td=X(3);
   Ta=X(4);
   if Ta<Td
       Nprime=N+1;
       tprime=Ta;
       T=-log(rand)/lamda;
       Taprime=Ta+T;
       if N==0
          S=-log(rand)/mu;
         
          Tdprime=Ta+S;
        
       else
           Tdprime=Td;
       end
       X=[Nprime,tprime,Tdprime,Taprime];
       M=[M;X];
   else
       
       Nprime=N-1;
       if(Nprime==0)
           Tdprime=Inf;
       else
           Tdprime=Td+S;
       end
       tprime=Td;
       S=-log(rand)/mu;
       Taprime=Ta;
       X=[Nprime,tprime,Tdprime,Taprime];
       M=[M;X];
   end 
    
    
end
M
figure;
Ntab=M(:,1).'
j=1:1000;
plot(j,Ntab);
xlabel('Temps');
ylabel('capacité');
title('Courbe de la capacité du système en fonction du temps');
figure(2);
Ntab=M(:,1).'
j=1:1000;
bar(Ntab);
xlabel('Temps');
ylabel('capacité');
title('Courbe de la capacité du système en fonction du temps');