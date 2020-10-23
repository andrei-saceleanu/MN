function [R1 R2] = PageRank(nume, d, eps)
  input=fopen(nume,'r');
  N=fscanf(input,"%d",1);%citire numar resurse N
  
  nume_output=strcat(nume,".out");%construire fisier de iesire
  output=fopen(nume_output,'w'); %si deschiderea acestuia
  fprintf(output,"%d \n",N);
  fprintf(output,"\n");%afisare N
  
  R1=Iterative(nume,d,eps);
  fprintf(output,"%.6f \n",R1);
  fprintf(output,"\n");%afisare vector cu ajutorul algoritmului Iterative
  
  R2=Algebraic(nume,d);
  fprintf(output,"%.6f \n",R2);
  fprintf(output,"\n");%afisare vector cu ajutorul algoritmului Algebraic
  
  for i=1:N+1   %mutare cursor pentru a citi val1 si val2
    fgets(input);
  endfor
  
  val1=fscanf(input,"%f",1);
  val2=fscanf(input,"%f",1);
  
  %sortare vector de rankuri descrescator,cu stocarea indexilor
  %din vectorul initial
  [sorted,indexes]=sort(R2,'descend');
  
  for i=1:N
    fprintf(output,"%d ",i);%afisare indice in clasament
    fprintf(output,"%d ",indexes(i));%afisare indice resursa
    x=sorted(i);
    y=Apartenenta(x,val1,val2);
    fprintf(output,"%.6f \n",y);%afisare grad de apartenenta pentru
    %resursa curenta
  endfor

  fclose(input);%inchidere fisiere
  fclose(output);
endfunction
