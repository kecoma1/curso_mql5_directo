int manejador_ema;
double ema[];

void OnInit() {
    manejador_ema = iMA(_Symbol, _Period, 10, 0, MODE_EMA, PRICE_CLOSE);
    
    ArraySetAsSeries(ema, true);
}

void OnTick() {
   CopyBuffer(manejador_ema, 0, 0, 2, ema);
}