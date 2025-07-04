#include <iostream>

using namespace std;

int main()
{
    int x;
    cin >> x;
    
    bool ePrimo = true;
    
    for(int i = x - 1; i > 1; i--)
    {
        if(x % i == 0)
        {
            ePrimo = false;
            break;
        }
    }
    
    if(ePrimo)
        cout << "Primo" << endl;
    else
        cout << "Não é primo" << endl;

    return 0;
}
