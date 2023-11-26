#include <Trade/Trade.mqh>
CTrade trade;
ulong trade_ticket=0;

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

int bars = Bars(_Symbol, _Period);
bool nueva_vela() {
   int current_bars = Bars(_Symbol, _Period);
   if (current_bars != bars) {
      bars = current_bars;
      return true;
   }
   
   return false;
}

bool operacion_cerrada() {
   return PositionSelectByTicket(trade_ticket);
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
   
   if (operacion_cerrada() && nueva_vela()) {
      if (cruce_compra()) {
         double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
         double normalized = NormalizeDouble(bid, _Digits);
      
         trade.Buy(0.01, _Symbol, bid, bid-100*_Point, bid+100*_Point);
         trade_ticket = trade.ResultOrder();
      } else if (cruce_venta()) {
         double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
         double normalized = NormalizeDouble(ask, _Digits);
      
         trade.Sell(0.01, _Symbol, ask, ask+100*_Point, ask-100*_Point);
         trade_ticket = trade.ResultOrder();
      }
   }
}