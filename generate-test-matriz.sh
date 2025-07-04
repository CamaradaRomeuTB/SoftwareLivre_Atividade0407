#!/bin/bash

# variaveis com os nomes do programa que sera compilado e o nome do executavel gerado, respectivamente
SOURCE="matriz.cpp"
EXEC="matriz"

# compila o programa C++ e imprime um erro caso o programa nao retorne zero
g++ "$SOURCE" -o "$EXEC"
if [ $? -ne 0 ]; then
    echo "Erro na compilação."
    exit 1
fi

# casos de teste no formato: "entrada esperada-saida esperada"
# cada entrada representa: tamanho da matriz (1 digito)| elementos mat1 (4 digitos) | elementos mat2 (4 digitos) | operacao (1 char) | matriz final esperada (4 digitos)
testes=(
    # adicao
    "2 1 2 3 4 5 6 7 8 a 6 8 10 12"
    # subtracao
    "2 8 9 10 11 1 2 3 4 s 7 7 7 7"
    # multiplicacao
    "2 1 2 3 4 5 6 7 8 m 19 22 43 50"
)

echo "Executando testes..."

#laco de repeticao que passa por todos os elementos do array de casos de teste e os compara com as saidas
for teste in "${testes[@]}"; do
    entrada=$(echo "$teste" | awk '{for(i=1;i<=NF-4) printf "%s ", $i}')
    op=$(echo "$teste" | awk '{print $(NF-3)}')
    esperado=$(echo "$teste" | awk '{print $(NF-2) " " $(NF-1) " " $NF}')

    saida=$(echo "$entrada$op" | ./"$EXEC" | tr '\n' ' ' | sed 's/ *$//')

    if [ "$saida" = "$esperado" ]; then
        echo "O teste com '$entrada' passou."
    else
        echo "O teste com '$entrada' falhou."
    fi
done

# remove o executavel gerado da compilacao
rm "$EXEC"
