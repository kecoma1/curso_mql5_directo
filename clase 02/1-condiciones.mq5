void OnInit() {
    bool esta_lloviendo = true;
    bool hace_frio = true;
    bool estoy_cansado = true;

    if (esta_lloviendo && hace_frio) {
        Print("Me quedo en casa");
    }

    if (esta_lloviendo || hace_frio) {
        Print("Me quedo en casa");
    }
    
    if ((esta_lloviendo && hace_frio) || estoy_cansado) {
        Print("Me quedo en casa");
    }
    
    if (!estoy_cansado) {
        Print("Me quedo en casa");
    }
}