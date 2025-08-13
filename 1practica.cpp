#include <iostream>
#include <cctype>
#include <string>
#include <sstream> // Para dividir la cadena en palabras

using namespace std;

int main() {
    string cadena;
    cout << "Ingrese una cadena de caracteres: ";
    getline(cin, cadena);

    istringstream stream(cadena); // Separa las palabras
    string palabra;

    while (stream >> palabra) {
        bool letras = false;
        bool numeros = false;

        // Analiza cada carácter de la palabra, Size_t sepera y palabra.length cuenta el caracter
        for (size_t i = 0; i < palabra.length(); ++i) {
            char c = palabra[i];
            if (isalpha(c)) {
                letras = true;
            } else if (isdigit(c)) {
                numeros = true;
            }
        }

        cout << "Palabra: \"" << palabra << "\" -> ";
        if (letras && numeros) {
            cout << "Es una palabra compuesta";
        } else if (letras) {
            cout << "Es una palabra";
        } else if (numeros) {
            cout << "Es un numero entero";
        } else {
            cout << "Cadena de caracteres no reconocida";
        }
        cout << endl;
    }

    return 0;
}
