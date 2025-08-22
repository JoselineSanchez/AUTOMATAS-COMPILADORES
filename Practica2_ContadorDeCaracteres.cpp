#include <iostream>
#include <cctype>
#include <string>
#include <sstream> // Para dividir la cadena en palabras

using namespace std;

int main() {
    string cadena;
    cout << "Ingrese una cadena de caracteres: ";
    getline(cin, cadena);

    istringstream stream(cadena); // Separa las palabras una por una
    string palabra;
    int comp = 0;
    int pal = 0;
    int num= 0;

    while (stream >> palabra) {
        bool letras = false;
        bool numeros = false;

        for (size_t i = 0; i < palabra.length(); ++i) {
            char c = palabra[i];
            if (isalpha(c)) {
                letras = true;
            } else if (isdigit(c)) {
                numeros = true;
            }
        }

        if (letras && numeros) {
        	comp++;
        } else if (letras) {
           pal++;
        } else if (numeros) {
            num++;
        } else {
            cout << "Cadena de caracteres no reconocida";
            return 0;
        }
    }
    
    cout<<"La cadena de caracteres contiene:"<<endl;
    cout<<"Palabras: "<<pal<<endl;
    cout<<"Palabras compuestas: "<<comp<<endl;
    cout<<"Numeros: "<<num<<endl;

    return 0;
}
