# Regras especificas para cada programa
primo: primo.cpp
    g++ -Wall -Wextra -o primo primo.cpp

vetor: vetor.cpp
    g++ -Wall -Wextra -o vetor vetor.cpp

matriz: matriz.cpp
    g++ -Wall -Wextra -o matriz matriz.cpp

# Regra que compila todos os programas
tudo: primo vetor matriz
