#include <iostream>

using namespace std;

int main()
{
    int tamanhoMat;
    char op;
    
    cin >> tamanhoMat;
    
    int mat1[tamanhoMat][tamanhoMat];
    int mat2[tamanhoMat][tamanhoMat];
    int matFinal[tamanhoMat][tamanhoMat];
    
    for(int i = 0; i < tamanhoMat; i++)
    {
        for(int j = 0; j < tamanhoMat; j++)
        {
            cin >> mat1[i][j];
        }
    }
    
    for(int i = 0; i < tamanhoMat; i++)
    {
        for(int j = 0; j < tamanhoMat; j++)
        {
            cin >> mat2[i][j];
        }
    }
    
    cin >> op;
    
    if(op == 'a')
    {
        for(int i = 0; i < tamanhoMat; i++)
        {
            for(int j = 0; j < tamanhoMat; j++)
            {
                matFinal[i][j] = mat1[i][j] + mat2[i][j];
            }
        }
    }
    
    else if(op == 's')
    {
        for(int i = 0; i < tamanhoMat; i++)
        {
            for(int j = 0; j < tamanhoMat; j++)
            {
                matFinal[i][j] = mat1[i][j] - mat2[i][j];
            }
        }
    }
    
    else if(op == 'm')
    {
        for(int i = 0; i < tamanhoMat; i++) 
        {
            for(int j = 0; j < tamanhoMat; j++) 
            {
                matFinal[i][j] = 0;
    
                for(int k = 0; k < tamanhoMat; k++) 
                {
                    matFinal[i][j] += mat1[i][k] * mat2[k][j];
                }
            }
        }
    }
    
    for(int i = 0; i < tamanhoMat; i++)
    {
        for(int j = 0; j < tamanhoMat; j++)
        {
            cout << matFinal[i][j] << ' ';
        }
        cout << endl;
    }
    
    return 0;
}
