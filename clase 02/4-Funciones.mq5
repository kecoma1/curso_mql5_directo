double funcion_clase(int a, int b) {
    if (a == 0 || b == 0) return 0;

    if (a > b) {
        return a*b;
    } else if (a < b) {
        return a/b;
    } else {
        return -1;
    }
}

void OnInit() {
    
}