MqlRates velas[];

void OnInit() {
   ArraySetAsSeries(velas, true);
}

void OnTick() {
   CopyRates(_Symbol, _Period, 0, 2, velas);
}