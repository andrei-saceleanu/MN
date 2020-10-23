#SACELEANU ANDREI IULIAN 311CB

Tema 2 MN 2020
PageRank

	Pentru calculul vectorului de indici PageRank al resurselor furnizate in
fisierul de intrare,se utilizeaza doua variante de algoritmi

ALgoritmul Iterative
	Din fisierul de intrare se obtin adiacentele dintre resursele web si se
construiesc matricea de adiacenta A a grafului asociat si matricea K necesara
algoritmului,care contine pe diagonala gradele exterioare ale resurselor/
nodurilor.
	Pentru a calcula inversa matricei K,se utilizeaza algoritmul Gram-Schmidt,
fiecare coloana a inversei rezultat fiind solutia unui sistem liniar in care
matricea sistemului a fost descompusa QR.
	Se initializeaza vectorii de iteratie R1 si R0,iterandu-se pana cand
diferenta dintre rezultate nu depaseste o anumita toleranta.
	Vectorul PageRank este reprezentat de R0 final

Algoritmul Algebraic
	Se preiau datele de intrare,se calculeaza matricea M conform algoritmului
Algebraic.In loc de a se itera pana a obtine o solutie convenabila,se aplica
direct o formula de calcul

PageRank
	Rezultatele cumulate ale temei sunt date de functia PageRank.Se afiseaza
rezultatele obtinute in urma aplicarii algoritmilor descrisi anterior.Pentru
a obtine o ierarhie a paginilor importante,se utilizeaza vectorul PageRank R2
care se sorteaza,stocandu-se totodata ordinea indicilor din sirul nesortat.
	Pentru fiecare resursa,se afiseaza numarul de ordine in clasament,indicele
din vectorul initial si gradul de apartententa a acesteia la multimea paginilor
importante.
 
