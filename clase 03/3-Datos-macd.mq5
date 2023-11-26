int manejador_macd;
double macd[];
double signal[];

void OnInit() {
    manejador_macd = iMACD(_Symbol, _Period, 12, 26, 9, PRICE_CLOSE);
    
    ArraySetAsSeries(macd, true);
    ArraySetAsSeries(signal, true);
}

void OnTick() {
   CopyBuffer(manejador_macd, MAIN_LINE, 0, 2, macd);
   CopyBuffer(manejador_macd, SIGNAL_LINE, 0, 2, signal);
}