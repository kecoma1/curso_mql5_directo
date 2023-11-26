void OnInit() {
    // Operando entre valores enteros
    Print(2 + 3);

    // Operando entre valores enteros y decimales
    Print(2 + 3.0);

    // Operando entre variables y valores
    int a = 12;
    Print(a + 2);

    // No debemos operar junto con variables que no sean númericas
    Print(2.0 + true);

    // No debemos dividir entre 0, da error.
    Print(12 / 0);

    // Operador módulo
    Print(2754 % 9); // Debe devolver 54
}