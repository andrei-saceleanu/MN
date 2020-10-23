function R = Algebraic(nume, d)
  %se deschide fisierul de intrare si se citeste numarul de resurse
  input=fopen(nume,"r");
  N=fscanf(input,"%d",1); 
  A=zeros(N); %se initializeaza matricea de adiacenta si cea care contine
  K=zeros(N); %gradele exterioare ale resurselor
  
  for i=1:N
    current_page=fscanf(input,"%d",1);
    count=fscanf(input,"%d",1);% citire lista de adiacenta si dimensiunea sa
    adj=fscanf(input,"%d",count);
    indices=adj==current_page;%eliminarea linkurilor din nod in acelasi nod
    adj(indices)=[];
    A(current_page,adj)=1;%setare adiacenta in A si grad exterior in K
    K(current_page,current_page)=length(adj);
  endfor
  
  M=(PR_Inv(K)*A)';%calcul M conform algoritmului
  one=ones(N,1);% vector cu fiecare componenta 1
  R0=PR_Inv(eye(N)-d*M);
  R=(R0*(1-d)*one)/N;%calcul vector PageRank( R )
  fclose(input);%inchidere fisier
endfunction
