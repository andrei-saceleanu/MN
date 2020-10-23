function R = Iterative(nume, d, eps)
  %se deschide fisierul de intrare si se citeste numarul de resurse
  input=fopen(nume,"r");
  N=fscanf(input,"%d",1);
  A=zeros(N); %se initializeaza matricea de adiacenta si cea care contine
  K=zeros(N); %gradele exterioare ale resurselor
  
  for i=1:N
    current_page=fscanf(input,"%d",1);
    count=fscanf(input,"%d",1);% citire lista de adiacenta si dimensiunea sa
    adj=fscanf(input,"%d",count);
    indices=adj==current_page;
    adj(indices)=[];%eliminarea linkurilor din nod in acelasi nod
    A(current_page,adj)=1;%setare adiacenta in A si grad exterior in K
    K(current_page,current_page)=length(adj);
  endfor
  
  M=(PR_Inv(K)*A)';%calcul M conform algoritmului
  R1=zeros(N,1);%iteratie curenta vector PageRank
  R0=1/N*ones(N,1);%initializare vector PageRank/iteratie anterioara
  one=ones(N,1);
  
  while 1 %cat timp diferenta intre iteratii este mai mare de eps
    %se recalculeaza noi iteratii
    R1=d*M*R0+(1-d)*one/N;
    if(norm(R1-R0)<=eps)
      break;
    endif
    R0=R1;
  endwhile
  
  R=R0;%rezultatul final este dat de R0
  fclose(input);
endfunction
  
