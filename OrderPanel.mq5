//+------------------------------------------------------------------+
//|                                                   OrderPanel.mq5 |
//|                                                       Sonu Majhi |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Sonu Majhi"
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <CPanel.mqh>

CPanel TradePanel;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   TradePanel.Init();
   return(0);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   TradePanel.Deinit();
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam
                 )
  {
   TradePanel.ChartEvent(id,lparam,dparam,sparam);
  }
//+------------------------------------------------------------------+
