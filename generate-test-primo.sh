#!/bin/bash

# variaveis com os nomes do programa que sera compilado e o nome do executavel gerado, respectivamente
SOURCE="primo.cpp"
EXEC="primo"

# compila o programa C++ e imprime um erro caso o programa retorne algo diferente de zero
g++ "$SOURCE" -o "$EXEC"
if [ $? -ne 0 ]; then
    echo "Erro na compilação."
    exit 1
fi

# array com casos de teste esperados, "entrada esperada-saida esperada"
testes=(
    "2 Primo"
    "4 Não é primo"
    "5 Primo"
    "9 Não é primo"
    "13 Primo"
    "15 Não é primo"
)

echo "Executando testes..."

# laco de repeticao que passa por todos os elementos do array de casos de teste e os compara com as saidas, imprimindo o resultad da comparacao
for teste in "${testes[@]}"; do
    entrada=$(echo "$teste" | cut -d' ' -f1)
    esperado=$(echo "$teste" | cut -d' ' -f2-)

    saida=$(echo "$entrada" | ./"$EXEC")

    if [ "$saida" = "$esperado" ]; then
        echo "O teste com '$entrada' passou."
    else
        echo "O teste com '$entrada' falhou."
    fi
done

# remove o executavel gerado da compilacao
rm "$EXEC"
