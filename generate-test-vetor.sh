#!/bin/bash

# variaveis com os nomes do programa que sera compilado e o nome do executavel gerado, respectivamente
SOURCE="vetor.cpp"
EXEC="vetor"

# compila o programa C++ e imprime um erro caso o programa nao retorne zero
g++ "$SOURCE" -o "$EXEC"
if [ $? -ne 0 ]; then
    echo "Erro na compilação."
    exit 1
fi

# array com casos de teste esperados, o ultimo numero de cada linha e a resposta esperada, os outros sao inputs
testes=(
    "5 1 2 3 4 5 5"
    "3 10 30 20 30"
    "4 0 0 0 0 0"
    "6 100 99 98 97 96 95 100"
    "1 -5 -5"
    "3 -10 -20 -30 -10"
)

echo "Executando testes..."

#laco de repeticao que passa por todos os elementos do array de casos de teste e os compara com as saidas
for teste in "${testes[@]}"; do
    entrada=$(echo "$teste" | awk '{for(i=1;i<=NF-1) printf "%s ", $i}')
    esperado=$(echo "$teste" | awk '{print $NF}')

    saida=$(echo "$entrada" | ./"$EXEC")

    if [ "$saida" = "$esperado" ]; then
        echo "O teste com '$entrada' passou."
    else
        echo "O teste com '$entrada' falhou."
    fi
done

# remove o executavel gerado da compilacao
rm "$EXEC"
