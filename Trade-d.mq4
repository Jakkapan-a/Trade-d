//+------------------------------------------------------------------+
//|                                                      Trade-d.mq4 |
//|                        Copyright 2022, MetaQuotes Software Corp. |
//|                                             https://www.mql4.com |
//+------------------------------------------------------------------+
#property strict

//--- INPUT  ---//
input string BuySetting = "----------------------------------------------------------------------";
input bool BuyTrade = true;
input double Buy_Lots = 0.01; // Buy Stop Loss Profit
input int Buy_SL = 250;
input int Buy_PipStep = 500; // Distance between orders

int trane = 2; // 0 = Down, 1 = Up, 2 = SW

bool buyState = false;
bool sellState = false;
bool buyState2 = false;
bool sellState2 = false;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
    if(trane() ==1 && currentTrane() == 1)
    {
        Print("Trane Up");  
    }else if (trane() == 0 && currentTrane() == 0)
    {
      Print("Trane Down");
    }
  }
//+------------------------------------------------------------------+
// | Expert tran function                                 |
//+------------------------------------------------------------------+
int trane(){
    // iOpen
    double middle = (iOpen(NULL,PERIOD_H4,2) + iClose(NULL,PERIOD_H4,2)) / 2; // Average of the first and last prices of the bar
    // If the middle is less than the last price, then the trend is up
    if(middle < iClose(NULL,PERIOD_H4,1))
    {
      return 1; // Trane Up      
    }else if(middle > iClose(NULL,PERIOD_H4,1))
    {
      return 0; // Trane Down
    }else
    {
      return 2; // Trane SW
    }
    return -1;
}

//+------------------------------------------------------------------+
//| Expert current trane function                                 |
//+------------------------------------------------------------------+

int currentTrane(){
    // iOpen
    double middle1 = (iOpen(NULL,PERIOD_H4,1) + iClose(NULL,PERIOD_H4,1)) / 2;
    if(middle1 < iClose(NULL,PERIOD_H4,0))
    {
      return 1; // Trane Up      
    }else if(middle1 > iClose(NULL,PERIOD_H4,0))
    {
      return 0; // Trane Down
    }else
    {
      return 2; // Trane SW
    }
    return -1;
}