% Craciunoiu Cezar 314CA

Tema 1 MN - PageRank

În temă s-a urmărit implementarea cât mai eficientă a cerințelor date. Fiecare
funcție s-a implementat conform șablonului, fiind independentă de restul. S-a
încercat utilizarea vectorizărilor pe cât de mult posibil.
Prima funcție, "Iterative", se folosește de funcția dlmread pentru a
citi tot fisierul o dată, apoi se preluează, din matricea în care s-a
citit, lucrurile dorite. Se elimină din construirea matricei de adiacență
linkurile către pagina de proveniență, iar apoi se aplică logica fuzzy. Se
inițializează vectorul coloana de valori proprii și este pus pe coloana.
Cu ajutorul unui while se construieste vectorul, utilizându-se formula dată,
până când diferența este mai mică decât o eroare dată. La final se asigură că
nu se face cu un pas mai mult.
Funcția "GramSchmidt" se folosește de o variantă stabilă a algoritmului
GramSchmidt, plecând de la modelul dat, iar apoi se rezolvă
sistemul superior triunghiular prin metoda învățată la laborator,
transformând-o pentru a putea rezolva sisteme în care matricea
necunoscută este o matrice pătratică, nu un vector coloană.
A doua funcție, "Algebraic", citește din fișier si construiește matricea
de adiacența în acelasi mod ca funcția "Iterative". Singura diferență este
modul în care se calculează vectorul de Page Rank-uri, utilizându-se atât
formula dată pentru calculul ei, cât și funcția "GramSchmidt" utilizată pentru
calculul inversei.
A treia funcție, "Apartenenta", calculează gradul de apartenență al fiecarei
pagini. Pentru a rezolva sistemul dat se utilizează ideea de limite laterale.
Se aplică limite laterale pe prima și a doua ecuație, cât și pe a doua și a
treia. Se obține astfel un sistem de două ecuații cu două necunoscute ce se
rezolvă. Se verifică apoi pentru fiecare valoare obținută că aparține
domeniului definit.
Toate aceste trei funcții se "asamblează" în programul principal, "PageRank".
Se mai deschide o dată fisierul pentru a citi cele două valori folosite în
calcularea gradului de apartenență. Se sortează vectorul obținut din metoda
"Algebraic" și se calculeaza gradele de apartenență. Se construiește numele
fișierului de ieșire și se afișează pe rând datele dorite în formatul impus,
folosindu-se funcția fprintf.
