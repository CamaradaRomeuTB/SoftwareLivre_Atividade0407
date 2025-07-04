#include <iostream>

using namespace std;

int main()
{
    int tamanhoVet;
    int maior = 0;
    
    cin >> tamanhoVet;
    
    int vet[tamanhoVet];
    
    for(int i = 0; i < tamanhoVet; i++)
    {
        cin >> vet[i];
        
        if(vet[i] > maior)
            maior = vet[i];
    }
    
    cout << maior << endl;

    return 0;
}
