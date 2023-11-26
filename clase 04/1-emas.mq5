int ema_rapida_h;
int ema_lenta_h;

double ema_rapida[];
double ema_lenta[];

bool cruce_compra() {
   return ema_rapida[1] < ema_lenta[1] && ema_rapida[0] > ema_lenta[0];
}

bool cruce_venta() {
   return ema_rapida[1] > ema_lenta[1] && ema_rapida[0] < ema_lenta[0];
}


void OnInit() {
   ema_rapida_h = iMA(_Symbol, _Period, 12, 0, MODE_EMA, PRICE_CLOSE);
   ema_lenta_h = iMA(_Symbol, _Period, 100, 0, MODE_EMA, PRICE_CLOSE);
   
   ArraySetAsSeries(ema_rapida, true);
   ArraySetAsSeries(ema_lenta, true);
}

void OnTick() {
   CopyBuffer(ema_rapida_h, 0, 1, 2, ema_rapida);
   CopyBuffer(ema_lenta_h, 0, 1, 2, ema_lenta);
}