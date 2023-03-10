//+------------------------------------------------------------------+
//|                                                       CPanel.mqh |
//|                                                       Sonu Majhi |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Sonu Majhi"
#property link      "https://www.mql5.com"


#include <Trade/Trade.mqh>

#define GV_CP_ISPERCENT "GV_CP_ISPERCENT"
#define GV_CP_PERCENT "GV_CP_PERCENT"
#define GV_CP_LOTS "GV_CP_LOTS"


CTrade trade;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CPanel
  {
private:
   string            NameMain,KillAllTrade,NameForm,NameSelect[6],NameTradeBut,NameBuyBut,NameSellBut,NameStopPriceLine,NameOpenPriceLine,NameSLPriceLine,NameTPPriceLine1,NameTPPriceLine2,NamePerCaption,NamePerValue,NameLotsCaption,NameLotsValue,NameLPSelect,NameSLCaption,NameSLValue,NameTPCaption1,NameTPValue1,NameTPCaption2,NameTPValue2,CaptionMainOn,CaptionMainOff,CaptionSelect[6],CaptionTradeBut[6],PStoploss,PTakeProfit1,PTakeProfit2;
   color             ColorMainButBg,ColorTradeBut[2];
   int               ATRHandle,gSelectedIndex,DefaultLineStopLoss,DefaultLineTakeProfit1,DefaultLineTakeProfit2,DefaultLinePendingLevel,DefaultLineTriggerLevel;
   double            Lots,TradePercentage,TradeStopLoss,TradeTakeProfit1,TradeTakeProfit2,miAsk,miBid,miMSL,rTriggerPrice,rOpenPrice,rSLPrice,rTPPrice1,rTPPrice2;
   bool              PerSelect;

   void              MainCreateOnOfButton();
   void              InitValue();
   void              FormCreate();
   void              FormControlsCreate();
   void              FormBuySellButtonsCreate();
   void              FormTradeButtonCreate();
   void              LinesSLTPCreate(double,double,double,double,double);
   void              FormDelete();
   void              FormControlsDelete();
   void              FormBuySellButtonDelete();
   void              LinesSLTPDelete();
   void              PipsCountDelete();
   void              FormSetSLTPValues();
   void              FormContolsSelectAllOff();
   void              fGetMarketInfo();
   void              KillAllPositions();
   double            ND(double);
   void              TradeSelected();
   double            lotFromPercentage(double,double);
   void              fOpBuy(double, double, double, string);
   void              fOpSell(double, double, double, string);
   void              fSetBuyStop(double,double,double,double,string);
   void              fSetSellStop(double,double,double,double,string);
   void              fSetBuyLimit(double,double,double,double,string);
   void              fSetSellLimit(double,double,double,double,string);
   void              LinesSLTPSolveAndCreate();
   void              LinesSLTPGetValues(double &,double &,double &,double &,double &);
   void              LinesSLTPShowInForm();
   void              fObjCreateButton(string,bool,int,int,int,int,string,color,color,int,int,int,string,long,bool,long);
   void              fObjCreateEdit(string,string,int,int,int,int,int,int,int,color,color,int,string,int,bool,double,long,bool,bool);
   void              fObjCreateLabel(string,int,int,string,int,int,int,color,int,string,int,bool,double,bool,bool,long);
   void              fObjHLine(string,double,string,int,color,color,color,int,bool,bool,bool,long);

public:
   void              CPanel()
     {
      NameMain                      =  "OnOf";
      KillAllTrade                  =  "KillAll";
      NameForm                      =  "Form";
      NameSelect[0]                 =  "Buy";
      NameSelect[1]                 =  "Sell";
      NameSelect[2]                 =  "BuyStop";
      NameSelect[3]                 =  "SellStop";
      NameSelect[4]                 =  "BuyLimit";
      NameSelect[5]                 =  "SellLimit";
      NameTradeBut                  =  "Trade";
      NameBuyBut                    =  "TradeBuy";
      NameSellBut                   =  "TradeSell";
      NameStopPriceLine             =  "StopPrice";
      NameOpenPriceLine             =  "OpenPrice";
      NameSLPriceLine               =  "StopLoss";
      NameTPPriceLine1               =  "TakeProfit1";
      NameTPPriceLine2               =  "TakeProfit2";
      NameLPSelect                  =  "LotorPercentage";
      NamePerCaption                =  "PercentageCaption";
      NamePerValue                  =  "PercentageValue";
      NameLotsCaption               =  "LotsCaption";
      NameLotsValue                 =  "LotsValue";
      NameSLCaption                 =  "SLCaption";
      NameSLValue                   =  "SLValue";
      NameTPCaption1                =  "TPCaption1";
      NameTPValue1                  =  "TPValue1";
      NameTPCaption2                =  "TPCaption2";
      NameTPValue2                  =  "TPValue2";
      CaptionMainOn                 =  "Show TradePanel";
      CaptionMainOff                =  "Hide TradePanel";
      CaptionSelect[0]              =  "b";
      CaptionSelect[1]              =  "s";
      CaptionSelect[2]              =  "bs";
      CaptionSelect[3]              =  "ss";
      CaptionSelect[4]              =  "bl";
      CaptionSelect[5]              =  "sl";
      CaptionTradeBut[0]            =  "Open Buy";
      CaptionTradeBut[1]            =  "Open Sell";
      CaptionTradeBut[2]            =  "Set BuyStop";
      CaptionTradeBut[3]            =  "Set SellStop";
      CaptionTradeBut[4]            =  "Set BuyLimit";
      CaptionTradeBut[5]            =  "Set SellLimit";
      PStoploss                     = "SL";
      PTakeProfit1                  = "TP1";
      PTakeProfit2                  = "TP2";
      ColorMainButBg                =  Silver;
      ColorTradeBut[0]              =  LightSkyBlue;
      ColorTradeBut[1]              =  Pink;
      TradeStopLoss                 =  0;
      TradeTakeProfit1              =  0;
      TradeTakeProfit2              =  0;
      DefaultLineStopLoss           =  350;
      DefaultLineTakeProfit1        =  550;
      DefaultLineTakeProfit2        =  750;
      DefaultLinePendingLevel       =  250;
      DefaultLineTriggerLevel       =  450;
      PerSelect                     = false;
      TradePercentage               =  1;
      Lots                          = 0.2;
     }
   void              Init();
   void              Deinit();
   void              Tick();
   void              Timer();
   void              ChartEvent(const int id,const long  &lparam,const double  &dparam,const string  &sparam);
  };

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::Init()
  {
   ATRHandle=iATR(_Symbol,PERIOD_CURRENT,55);
   Lots=SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_MIN);
   Lots = 0.2;
   MainCreateOnOfButton();
   ChartRedraw();
   EventSetTimer(1);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::MainCreateOnOfButton()
  {
   fObjCreateButton(NameMain,false,120,30,110,20,CaptionMainOn,ColorMainButBg,Black,0,CORNER_RIGHT_UPPER,7,"Arial",0,false,OBJ_ALL_PERIODS);

   fObjCreateButton(KillAllTrade,false,10,30,80,20,"Kill Position",clrFireBrick,clrThistle,0,CORNER_LEFT_LOWER,7,"Arial",0,false,OBJ_ALL_PERIODS);

  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::ChartEvent(const int id,
                        const long &lparam,
                        const double &dparam,
                        const string &sparam
                       )
  {
   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      if(sparam==NameMain)
        {
         Sleep(300);
         ObjectSetInteger(0,NameMain,OBJPROP_STATE,false);

         if(ObjectFind(0,NameForm)==0)
           {
            FormDelete();
           }
         else
           {
            FormCreate();
            InitValue();
           }
        }
      if(sparam==KillAllTrade)
        {
         ObjectSetInteger(0,sparam,OBJPROP_STATE,false);

         KillAllPositions();
        }
      if(sparam==NameLPSelect)
        {
         if(ObjectGetInteger(0,NameLPSelect,OBJPROP_STATE))
           {
            ObjectSetInteger(0,NameLPSelect,OBJPROP_BGCOLOR,LightGreen);
            PerSelect = true;
            GlobalVariableSet(GV_CP_ISPERCENT, PerSelect);
           }
         else
           {
            ObjectSetInteger(0,NameLPSelect,OBJPROP_BGCOLOR,Silver);
            PerSelect = false;
            GlobalVariableSet(GV_CP_ISPERCENT, PerSelect);
           }
         ChartRedraw(0);
        }
      if(sparam==NameTradeBut)
        {
         TradeSelected();
         ObjectSetInteger(0,sparam,OBJPROP_STATE,false);
         ChartRedraw(0);
        }
      if(sparam==NameBuyBut)
        {
         fOpBuy(TradeStopLoss,TradeTakeProfit1,TradeTakeProfit2,"");
         ObjectSetInteger(0,sparam,OBJPROP_STATE,false);
         ChartRedraw(0);
        }
      // = TRADE SELL =
      if(sparam==NameSellBut)
        {
         fOpSell(TradeStopLoss,TradeTakeProfit1,TradeTakeProfit2,"");
         ObjectSetInteger(0,sparam,OBJPROP_STATE,false);
         ChartRedraw(0);
        }
      for(int i=0; i<ArraySize(NameSelect); i++)
        {
         if(sparam==NameSelect[i])
           {
            if(ObjectGetInteger(0,NameSelect[i],OBJPROP_STATE))
              {
               FormContolsSelectAllOff();
               LinesSLTPDelete();
               gSelectedIndex=i;
               ObjectSetInteger(0,NameSelect[i],OBJPROP_BGCOLOR,LightGreen);
               ObjectSetInteger(0,NameSelect[i],OBJPROP_STATE,true);
               FormBuySellButtonDelete();
               FormTradeButtonCreate();
               LinesSLTPSolveAndCreate();
              }
            else
              {
               gSelectedIndex=-1;
               FormContolsSelectAllOff();
               LinesSLTPDelete();
               ObjectDelete(0,NameTradeBut);
               FormBuySellButtonsCreate();
              }
            ChartRedraw(0);
            break;
           }
        }
     }
   if(id==CHARTEVENT_OBJECT_DRAG)
     {
      if(sparam==NameStopPriceLine || sparam==NameOpenPriceLine || sparam==NameSLPriceLine || sparam==NameTPPriceLine1 || sparam==NameTPPriceLine2)
        {
         double TriggerPrice,OpenPrice,SLPrice,TPPrice1,TPPrice2;
         LinesSLTPGetValues(TriggerPrice,OpenPrice,SLPrice,TPPrice1,TPPrice2);
         LinesSLTPCreate(TriggerPrice,OpenPrice,SLPrice,TPPrice1,TPPrice2);
         ChartRedraw();
        }
     }
   if(id==CHARTEVENT_OBJECT_DELETE)
     {
      if(gSelectedIndex!=-1)
        {
         if(sparam==NameStopPriceLine || sparam==NameOpenPriceLine || sparam==NameSLPriceLine || sparam==NameTPPriceLine1 || sparam==NameTPPriceLine2)
           {
            LinesSLTPCreate(rTriggerPrice,rOpenPrice,rSLPrice,rTPPrice1,rTPPrice1);
            ChartRedraw();
           }
        }
     }
   if(id==CHARTEVENT_OBJECT_ENDEDIT)
     {
      if(sparam==NamePerValue)
        {
         TradePercentage = StringToDouble(ObjectGetString(0,sparam,OBJPROP_TEXT));
         ObjectSetString(0,sparam,OBJPROP_TEXT,DoubleToString(TradePercentage));
         GlobalVariableSet(GV_CP_PERCENT,DoubleToString(TradePercentage));
         ChartRedraw();
        }
      if(sparam==NameLotsValue)
        {
         Lots=StringToDouble(ObjectGetString(0,sparam,OBJPROP_TEXT));
         ObjectSetString(0,sparam,OBJPROP_TEXT,DoubleToString(Lots));
         GlobalVariableSet(GV_CP_LOTS,DoubleToString(Lots));
         ChartRedraw();
        }
      if(sparam==NameSLValue)
        {
         TradeStopLoss=StringToDouble(ObjectGetString(0,sparam,OBJPROP_TEXT));
         ObjectSetString(0,sparam,OBJPROP_TEXT,DoubleToString(TradeStopLoss,0));
         //FormCheckSLTPValues();
         ChartRedraw();
        }
      if(sparam==NameTPValue1)
        {
         TradeTakeProfit1=StringToDouble(ObjectGetString(0,sparam,OBJPROP_TEXT));
         ObjectSetString(0,sparam,OBJPROP_TEXT,DoubleToString(TradeTakeProfit1,0));
         //FormCheckSLTPValues();
         ChartRedraw();
        }
      if(sparam==NameTPValue2)
        {
         TradeTakeProfit2=StringToDouble(ObjectGetString(0,sparam,OBJPROP_TEXT));
         ObjectSetString(0,sparam,OBJPROP_TEXT,DoubleToString(TradeTakeProfit2,0));
         //FormCheckSLTPValues();
         ChartRedraw();
        }
     }

  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::InitValue()
  {
   ObjectSetInteger(0,NameLPSelect,OBJPROP_STATE,GlobalVariableCheck(GV_CP_ISPERCENT)?GlobalVariableGet(GV_CP_ISPERCENT):false);
   if(GlobalVariableGet(GV_CP_ISPERCENT))
      ObjectSetInteger(0,NameLPSelect,OBJPROP_BGCOLOR,LightGreen);

   ObjectSetString(0,NamePerValue,OBJPROP_TEXT,GlobalVariableCheck(GV_CP_PERCENT)?GlobalVariableGet(GV_CP_PERCENT):"0");
   ObjectSetString(0,NameLotsValue,OBJPROP_TEXT,GlobalVariableCheck(GV_CP_LOTS)?GlobalVariableGet(GV_CP_LOTS):"0");

   ChartRedraw(0);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::FormCreate()
  {
   fObjCreateEdit(NameForm,"",433,43,428,40,0,ANCHOR_RIGHT_LOWER,CORNER_RIGHT_LOWER,Gray,LightGray,7,"Arial",0,false,0,OBJ_ALL_PERIODS,false,false);
   FormControlsCreate();
   ChartRedraw(0);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::FormControlsCreate()
  {
   gSelectedIndex=-1;

   for(int i=0; i<ArraySize(NameSelect); i++)
     {
      fObjCreateButton(NameSelect[i],false,i*28+260,40,24,15+2,CaptionSelect[i],Silver,Black,0,CORNER_RIGHT_LOWER,7,"Arial",0,false,OBJ_ALL_PERIODS);
     }
   fObjCreateButton(NameLPSelect,false,430,40,25,34,"L/P",Silver,Black,0,CORNER_RIGHT_LOWER,7,"Arial",0,false,OBJ_ALL_PERIODS);
   fObjCreateLabel(NamePerCaption,380,7,"per:",0,ANCHOR_RIGHT_LOWER,CORNER_RIGHT_LOWER,LightGray,8,"Arial",0,false,0,false,false,OBJ_ALL_PERIODS);
   fObjCreateEdit(NamePerValue,DoubleToString(TradePercentage),380,21,25,15,0,ANCHOR_RIGHT_LOWER,CORNER_RIGHT_LOWER,Ivory,DimGray,7,"Arial",0,false,0,OBJ_ALL_PERIODS);

   fObjCreateLabel(NameLotsCaption,335,6,"lot:",0,ANCHOR_RIGHT_LOWER,CORNER_RIGHT_LOWER,LightGray,8,"Arial",0,false,0,false,false,OBJ_ALL_PERIODS);
   fObjCreateEdit(NameLotsValue,DoubleToString(Lots),336,21,30,15,0,ANCHOR_RIGHT_LOWER,CORNER_RIGHT_LOWER,Ivory,DimGray,7,"Arial",0,false,0,OBJ_ALL_PERIODS);

   fObjCreateLabel(NameSLCaption,290,6,"sl:",0,ANCHOR_RIGHT_LOWER,CORNER_RIGHT_LOWER,LightGray,8,"Arial",0,false,0,false,false,OBJ_ALL_PERIODS);
   fObjCreateEdit(NameSLValue,"1.08441",290,21,55,15,0,ANCHOR_RIGHT_LOWER,CORNER_RIGHT_LOWER,Ivory,DimGray,7,"Arial",0,false,0,OBJ_ALL_PERIODS);

   fObjCreateLabel(NameTPCaption1,210,25,"tp1:",0,ANCHOR_RIGHT_LOWER,CORNER_RIGHT_LOWER,LightGray,8,"Arial",0,false,0,false,false,OBJ_ALL_PERIODS);
   fObjCreateEdit(NameTPValue1,"1.08441",210,40,55,15,0,ANCHOR_RIGHT_LOWER,CORNER_RIGHT_LOWER,Ivory,DimGray,7,"Arial",0,false,0,OBJ_ALL_PERIODS);
   fObjCreateLabel(NameTPCaption2,210,7,"tp2:",0,ANCHOR_RIGHT_LOWER,CORNER_RIGHT_LOWER,LightGray,8,"Arial",0,false,0,false,false,OBJ_ALL_PERIODS);
   fObjCreateEdit(NameTPValue2,"1.08441",210,22,55,15,0,ANCHOR_RIGHT_LOWER,CORNER_RIGHT_LOWER,Ivory,DimGray,7,"Arial",0,false,0,OBJ_ALL_PERIODS);
   FormBuySellButtonsCreate();
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::FormBuySellButtonsCreate()
  {
   fObjCreateButton(NameSellBut,false,152,40,70,33,"Sell",ColorTradeBut[1],Black,0,CORNER_RIGHT_LOWER,10,"Arial",0,false,OBJ_ALL_PERIODS);
   fObjCreateButton(NameBuyBut,false,79,40,70,33,"Buy",ColorTradeBut[0],Black,0,CORNER_RIGHT_LOWER,10,"Arial",0,false,OBJ_ALL_PERIODS);
   FormSetSLTPValues();
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::FormTradeButtonCreate()
  {
   fObjCreateButton(NameTradeBut,false,152,40,144,33,CaptionTradeBut[gSelectedIndex],ColorTradeBut[gSelectedIndex%2],Black,0,CORNER_RIGHT_LOWER,10,"Arial",0,false,OBJ_ALL_PERIODS);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::LinesSLTPCreate(double aTriggerPrice,double aOpenPrice,double aSLPrice,double aTPPrice1,double aTPPrice2)
  {

   if(aTriggerPrice>0)
     {
      fObjHLine(NameStopPriceLine,aTriggerPrice,"StopPrice",0,Pink,1,2,0,false,true,true,OBJ_ALL_PERIODS);
     }
   if(aOpenPrice>0)
     {
      fObjHLine(NameOpenPriceLine,aOpenPrice,"OpenPrice",0,Blue,1,2,0,false,true,true,OBJ_ALL_PERIODS);
     }
   if(aSLPrice>0)
     {
      fObjHLine(NameSLPriceLine,aSLPrice,"StopLoss",0,Red,1,2,0,false,true,true,OBJ_ALL_PERIODS);
     }
   if(aTPPrice1>0)
     {
      fObjHLine(NameTPPriceLine1,aTPPrice1,"TakeProfit",0,LightSkyBlue,1,2,0,false,true,true,OBJ_ALL_PERIODS);
     }

   if(aTPPrice2>0)
     {
      fObjHLine(NameTPPriceLine2,aTPPrice2,"TakeProfit",0,Green,1,2,0,false,true,true,OBJ_ALL_PERIODS);
     }

   if(gSelectedIndex > 1)
     {
      double pTP1 = MathAbs(aOpenPrice - aTPPrice1) * pow(10,_Digits - 1);
      double pTP2 = MathAbs(aOpenPrice - aTPPrice2) * pow(10,_Digits - 1);
      double pSL = MathAbs(aOpenPrice - aSLPrice) * pow(10,_Digits - 1);

      fObjCreateLabel(PTakeProfit2,7,75,NormalizeDouble(pTP2,2) + " : TP2",0,ANCHOR_RIGHT_LOWER,CORNER_RIGHT_LOWER,Red,8,"Arial",0,false,0,false,false,OBJ_ALL_PERIODS);
      fObjCreateLabel(PTakeProfit1,7,60,NormalizeDouble(pTP1,2) + " : TP1",0,ANCHOR_RIGHT_LOWER,CORNER_RIGHT_LOWER,Red,8,"Arial",0,false,0,false,false,OBJ_ALL_PERIODS);
      fObjCreateLabel(PStoploss,7,45,NormalizeDouble(pSL,2) + " : STL",0,ANCHOR_RIGHT_LOWER,CORNER_RIGHT_LOWER,Red,8,"Arial",0,false,0,false,false,OBJ_ALL_PERIODS);
     }
   else
     {
      PipsCountDelete();
     }

   rTriggerPrice=aTriggerPrice;
   rOpenPrice=aOpenPrice;
   rSLPrice=aSLPrice;
   rTPPrice1=aTPPrice1;
   rTPPrice2=aTPPrice2;
   LinesSLTPShowInForm();
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::LinesSLTPGetValues(double  &aTriggerPrice,double  &aOpenPrice,double  &aSLPrice,double  &aTPPrice1,double  &aTPPrice2)
  {
   aTriggerPrice=ND(ObjectGetDouble(0,NameStopPriceLine,OBJPROP_PRICE));
   aOpenPrice=ND(ObjectGetDouble(0,NameOpenPriceLine,OBJPROP_PRICE));
   aSLPrice=ND(ObjectGetDouble(0,NameSLPriceLine,OBJPROP_PRICE));
   aTPPrice1=ND(ObjectGetDouble(0,NameTPPriceLine1,OBJPROP_PRICE));
   aTPPrice2=ND(ObjectGetDouble(0,NameTPPriceLine2,OBJPROP_PRICE));
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::LinesSLTPShowInForm()
  {
   double TriggerPrice,OpenPrice,SLPrice,TPPrice1,TPPrice2;
   LinesSLTPGetValues(TriggerPrice,OpenPrice,SLPrice,TPPrice1,TPPrice2);
   string sl="?";
   string tp1="?";
   string tp2="?";

   switch(gSelectedIndex)
     {
      case 0: // b
         fGetMarketInfo();
         OpenPrice=ND(miAsk);
         break;
      case 1: // s
         fGetMarketInfo();
         OpenPrice=ND(miBid);
         break;
     }
   if(gSelectedIndex%2==0)
     {
      if(OpenPrice!=0)
        {
         if(SLPrice!=0)
           {
            sl=DoubleToString(SLPrice);
           }
         else
           {
            sl="0";
           }
         if(TPPrice1!=0)
           {
            tp1=DoubleToString(TPPrice1);
           }
         else
           {
            tp1="0";
           }
         if(TPPrice2!=0)
           {
            tp2=DoubleToString(TPPrice2);
           }
         else
           {
            tp2="0";
           }
        }
     }
   else
     {
      if(OpenPrice!=0)
        {
         if(SLPrice!=0)
           {
            sl=DoubleToString(SLPrice);
           }
         else
           {
            sl="0";
           }
         if(TPPrice1!=0)
           {
            tp1=DoubleToString(TPPrice1);
           }
         else
           {
            tp1="0";
           }
         if(TPPrice2!=0)
           {
            tp2=DoubleToString(TPPrice2);
           }
         else
           {
            tp2="0";
           }
        }
     }
   ObjectSetString(0,NameSLValue,OBJPROP_TEXT,StringSubstr(sl,0,7));
   ObjectSetString(0,NameTPValue1,OBJPROP_TEXT,StringSubstr(tp1,0,7));
   ObjectSetString(0,NameTPValue2,OBJPROP_TEXT,StringSubstr(tp2,0,7));
   ChartRedraw();
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::LinesSLTPSolveAndCreate()
  {
   double TriggerPrice=0;
   double OpenPrice=0;
   double SLPrice=0;
   double TPPrice1=0;
   double TPPrice2=0;

   int spr=(int)SymbolInfoInteger(_Symbol,SYMBOL_SPREAD);

   DefaultLineTriggerLevel=spr*7;
   DefaultLinePendingLevel=spr*14;
   DefaultLineStopLoss=spr*14;
   DefaultLineTakeProfit1=spr*28;
   DefaultLineTakeProfit2=spr*35;


   fGetMarketInfo();
   switch(gSelectedIndex)
     {
      case 0: // b
         OpenPrice=ND(miAsk);
         break;
      case 1: // s
         OpenPrice=ND(miBid);
         break;
      case 2: //bs
         OpenPrice=ND(miAsk+_Point*DefaultLinePendingLevel);
         break;
      case 3: // ss
         OpenPrice=ND(miBid-_Point*DefaultLinePendingLevel);
         break;
      case 4: // bl
         OpenPrice=ND(miAsk-_Point*DefaultLinePendingLevel);
         break;
      case 5: // sl
         OpenPrice=ND(miBid+_Point*DefaultLinePendingLevel);
         break;
     }
   if(gSelectedIndex%2==0)
     {
      if(DefaultLineStopLoss>0)
        {
         SLPrice=ND(OpenPrice-_Point*DefaultLineStopLoss);
         SLPrice=MathMin(SLPrice,ND(OpenPrice-(miAsk-miBid)-_Point-_Point*miMSL));
        }
      if(DefaultLineTakeProfit1>0)
        {
         TPPrice1=ND(OpenPrice+_Point*DefaultLineTakeProfit1);
         TPPrice1=MathMax(TPPrice1,ND(OpenPrice+_Point+_Point*miMSL));
        }
      if(DefaultLineTakeProfit2>0)
        {
         TPPrice2=ND(OpenPrice+_Point*DefaultLineTakeProfit2);
         TPPrice2=MathMax(TPPrice2,ND(OpenPrice+_Point+_Point*miMSL));
        }
     }
   else
     {
      if(DefaultLineStopLoss>0)
        {
         SLPrice=ND(OpenPrice+_Point*DefaultLineStopLoss);
         SLPrice=MathMax(SLPrice,ND(OpenPrice+(miAsk-miBid)+_Point+_Point*miMSL));
        }
      if(DefaultLineTakeProfit1>0)
        {
         TPPrice1=ND(OpenPrice-_Point*DefaultLineTakeProfit1);
         TPPrice1=MathMin(TPPrice1,ND(OpenPrice-_Point-_Point*miMSL));
        }
      if(DefaultLineTakeProfit2>0)
        {
         TPPrice2=ND(OpenPrice-_Point*DefaultLineTakeProfit2);
         TPPrice2=MathMin(TPPrice2,ND(OpenPrice-_Point-_Point*miMSL));
        }
     }
   if(gSelectedIndex<2)
     {
      OpenPrice=0;
     }
   LinesSLTPCreate(TriggerPrice,OpenPrice,SLPrice,TPPrice1,TPPrice2);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::FormDelete()
  {
   FormControlsDelete();
   ObjectDelete(0,NameForm);
   ChartRedraw(0);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::FormControlsDelete()
  {
   gSelectedIndex=-1;

   for(int i=0; i<ArraySize(NameSelect); i++)
     {
      ObjectDelete(0,NameSelect[i]);
     }
   FormBuySellButtonDelete();
   ObjectDelete(0,NameTradeBut);
   ObjectDelete(0,NameLPSelect);
   ObjectDelete(0, NamePerCaption);
   ObjectDelete(0,NamePerValue);
   ObjectDelete(0,NameLotsCaption);
   ObjectDelete(0,NameLotsValue);

   ObjectDelete(0,NameSLCaption);
   ObjectDelete(0,NameSLValue);

   ObjectDelete(0,NameTPCaption1);
   ObjectDelete(0,NameTPValue1);
   ObjectDelete(0,NameTPCaption2);
   ObjectDelete(0,NameTPValue2);
   LinesSLTPDelete();
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::FormBuySellButtonDelete()
  {
   ObjectDelete(0,NameBuyBut);
   ObjectDelete(0,NameSellBut);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::LinesSLTPDelete()
  {
   ObjectDelete(0,NameStopPriceLine);
   ObjectDelete(0,NameOpenPriceLine);
   ObjectDelete(0,NameSLPriceLine);
   ObjectDelete(0,NameTPPriceLine1);
   ObjectDelete(0,NameTPPriceLine2);

   PipsCountDelete();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::PipsCountDelete()
  {
   ObjectDelete(0, PStoploss);
   ObjectDelete(0,PTakeProfit1);
   ObjectDelete(0,PTakeProfit2);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::FormSetSLTPValues()
  {
   ObjectSetString(0,NameSLValue,OBJPROP_TEXT,DoubleToString(TradeStopLoss,5));
   ObjectSetString(0,NameTPValue1,OBJPROP_TEXT,DoubleToString(TradeTakeProfit1,5));
   ObjectSetString(0,NameTPValue2,OBJPROP_TEXT,DoubleToString(TradeTakeProfit2,5));
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::FormContolsSelectAllOff()
  {
   for(int i=0; i<ArraySize(NameSelect); i++)
     {
      ObjectSetInteger(0,NameSelect[i],OBJPROP_BGCOLOR,Silver);
      ObjectSetInteger(0,NameSelect[i],OBJPROP_STATE,false);
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::fGetMarketInfo()
  {
   miAsk=SymbolInfoDouble(_Symbol,SYMBOL_ASK);
   miBid=SymbolInfoDouble(_Symbol,SYMBOL_BID);
   miMSL=(int)SymbolInfoInteger(_Symbol,SYMBOL_TRADE_STOPS_LEVEL);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  CPanel::KillAllPositions()
  {
   for(int i = PositionsTotal()-1; i >= 0; i--)
     {
      ulong posTicket = PositionGetTicket(i);
      trade.PositionClose(posTicket);
      PlaySound("ok");
     }

   for(int i = OrdersTotal()-1; i >= 0; i--)
     {
      ulong posTicket = OrderGetTicket(i);
      trade.OrderDelete(posTicket);
      PlaySound("ok");
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CPanel::ND(double aValue)
  {
   return(NormalizeDouble(aValue,_Digits));
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::TradeSelected()
  {
   double sp,op,sl,tp1, tp2;
   LinesSLTPGetValues(sp,op,sl,tp1,tp2);

   switch(gSelectedIndex)
     {
      case 0:
         fOpBuy(sl, tp1, tp2, "");
         break;
      case 1:
         fOpSell(sl, tp1, tp2,"");
         break;
      case 2:
         fSetBuyStop(op,sl,tp1,tp2,"");
         break;
      case 3:
         fSetSellStop(op,sl,tp1,tp2,"");
         break;
      case 4:
         fSetBuyLimit(op,sl,tp1,tp2,"");
         break;
      case 5:
         fSetSellLimit(op,sl,tp1,tp2,"");
         break;
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CPanel::lotFromPercentage(double sl, double op)
  {
   double tickSize = SymbolInfoDouble(_Symbol,SYMBOL_TRADE_TICK_SIZE);
   double tickValue = SymbolInfoDouble(_Symbol,SYMBOL_TRADE_TICK_VALUE);
   double lotStep = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_STEP);

   if(tickSize==0 || tickValue==0 || lotStep==0)
      return 0;

   double riskMoney = AccountInfoDouble(ACCOUNT_BALANCE)*TradePercentage*0.01;
   double moneyLotStep = (MathAbs(op-sl)/tickSize)*tickValue*lotStep;

   if(moneyLotStep == 0)
      return 0;
   double lot = (riskMoney/moneyLotStep)*lotStep;


   return lot;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::fOpBuy(double sl, double tp1, double tp2, string mess)
  {
   double vol = PerSelect?lotFromPercentage(sl, SymbolInfoDouble(_Symbol,SYMBOL_ASK)):Lots;

   trade.Buy(NormalizeDouble(vol/2,2),_Symbol, SymbolInfoDouble(_Symbol,SYMBOL_ASK),sl, tp1, mess);
   trade.Buy(NormalizeDouble(vol/2,2),_Symbol, SymbolInfoDouble(_Symbol,SYMBOL_ASK),sl, tp2, mess);

   PlaySound("ok");
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::fOpSell(double sl, double tp1, double tp2, string mess)
  {
   double vol = PerSelect?lotFromPercentage(sl,SymbolInfoDouble(_Symbol,SYMBOL_BID)):Lots;

   trade.Sell(NormalizeDouble(vol/2,2),_Symbol, SymbolInfoDouble(_Symbol,SYMBOL_BID),sl, tp1, mess);
   trade.Sell(NormalizeDouble(vol/2,2),_Symbol, SymbolInfoDouble(_Symbol,SYMBOL_BID),sl, tp2, mess);

   PlaySound("ok");
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::fSetBuyStop(double oPr,double sl,double tp1,double tp2,string mess)
  {
   double vol = PerSelect?lotFromPercentage(sl,oPr):Lots;

   trade.BuyStop(NormalizeDouble(vol/2,2),oPr,_Symbol,sl, tp1,ORDER_TIME_GTC,0,mess);
   trade.BuyStop(NormalizeDouble(vol/2,2),oPr,_Symbol,sl, tp2,ORDER_TIME_GTC,0,mess);

   PlaySound("ok");
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::fSetSellStop(double oPr,double sl,double tp1,double tp2,string mess)
  {
   double vol = PerSelect?lotFromPercentage(sl,oPr):Lots;

   trade.SellStop(NormalizeDouble(vol/2,2),oPr,_Symbol,sl, tp1,ORDER_TIME_GTC,0,mess);
   trade.SellStop(NormalizeDouble(vol/2,2),oPr,_Symbol,sl, tp2,ORDER_TIME_GTC,0,mess);

   PlaySound("ok");
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::fSetBuyLimit(double oPr,double sl,double tp1,double tp2,string mess)
  {
   double vol = PerSelect?lotFromPercentage(sl,oPr):Lots;

   trade.BuyLimit(NormalizeDouble(vol/2,2),oPr,_Symbol,sl, tp1,ORDER_TIME_GTC,0,mess);
   trade.BuyLimit(NormalizeDouble(vol/2,2),oPr,_Symbol,sl, tp2,ORDER_TIME_GTC,0,mess);

   PlaySound("ok");
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::fSetSellLimit(double oPr,double sl,double tp1,double tp2,string mess)
  {
   double vol = PerSelect?lotFromPercentage(sl,oPr):Lots;

   trade.SellLimit(NormalizeDouble(vol/2,2),oPr,_Symbol,sl, tp1,ORDER_TIME_GTC,0,mess);
   trade.SellLimit(NormalizeDouble(vol/2,2),oPr,_Symbol,sl, tp2,ORDER_TIME_GTC,0,mess);

   PlaySound("ok");
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::fObjCreateButton(
   string   aObjName,
   bool     aState,
   int      aX          =  30,
   int      aY          =  30,
   int      aWidth      =  100,
   int      aHeight     =  30,
   string   aCaption    =  "Push Me",
   color    aBgColor    =  Silver,
   color    aTextColor  =  Red,
   int      aWindow     =  0,
   int      aCorner     =  CORNER_LEFT_UPPER,
   int      aFontSize   =  8,
   string   aFont       =  "Arial",
   long     aChartID    =  0,
   bool     aBack       =  false,
   long     aTimeFrames =  OBJ_ALL_PERIODS
)
  {
   ObjectDelete(aChartID,aObjName);
   ObjectCreate(aChartID,aObjName,OBJ_BUTTON,aWindow,0,0);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_SELECTED,false);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_STATE,aState);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_CORNER,aCorner);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_XDISTANCE,aX);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_YDISTANCE,aY);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_XSIZE,aWidth);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_YSIZE,aHeight);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_BGCOLOR,aBgColor);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_COLOR,aTextColor);
   ObjectSetString(aChartID,aObjName,OBJPROP_FONT,aFont);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_FONTSIZE,aFontSize);
   ObjectSetString(aChartID,aObjName,OBJPROP_TEXT,aCaption);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_BACK,aBack);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_TIMEFRAMES,aTimeFrames);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::fObjCreateEdit(
   string      aObjName,
   string      aText,
   int         aX          =  30,
   int         aY          =  30,
   int         aXSize      =  380,
   int         aYSize      =  240,
   int         aWindow     =  0,
   int         aAnchor     =  ANCHOR_LEFT_UPPER,
   int         aCorner     =  CORNER_LEFT_UPPER,
   color       aBgColor    =  LightYellow,
   color       aColor      =  Chocolate,
   int         aFontSize   =  8,
   string      aFont       =  "Arial",
   int         aChartID    =  0,
   bool        aBack       =  false,
   double      aAngle      =  0,
   long        aTimeFrames =  OBJ_ALL_PERIODS,
   bool        aSelectable =  false,
   bool        aSelected   =  false
)
  {
   ObjectCreate(aChartID,aObjName,OBJ_EDIT,aWindow,0,0);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_ANCHOR,aAnchor);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_BACK,aBack);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_COLOR,aColor);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_BGCOLOR,aBgColor);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_CORNER,aCorner);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_FONTSIZE,aFontSize);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_SELECTABLE,aSelectable);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_SELECTED,aSelected);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_TIMEFRAMES,aTimeFrames);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_XDISTANCE,aX);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_YDISTANCE,aY);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_XSIZE,aXSize);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_YSIZE,aYSize);
   ObjectSetString(aChartID,aObjName,OBJPROP_FONT,aFont);
   ObjectSetString(aChartID,aObjName,OBJPROP_TEXT,aText);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::fObjCreateLabel(
   string   aObjName    =  "ObjLabel",
   int      aX          =  30,
   int      aY          =  30,
   string   aText       =  "ObjLabel",
   int      aWindow     =  0,
   int      aAnchor     =  ANCHOR_LEFT_UPPER,
   int      aCorner     =  CORNER_LEFT_UPPER,
   color    aColor      =  Red,
   int      aFontSize   =  8,
   string   aFont       =  "Arial",
   int      aChartID    =  0,
   bool     aBack       =  false,
   double   aAngle      =  0,
   bool     aSelectable =  true,
   bool     aSelected   =  false,
   long     aTimeFrames =  OBJ_ALL_PERIODS
)
  {
   ObjectDelete(aChartID,aObjName);
   ObjectCreate(aChartID,aObjName,OBJ_LABEL,aWindow,0,0);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_ANCHOR,aAnchor);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_BACK,aBack);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_COLOR,aColor);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_CORNER,aCorner);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_FONTSIZE,aFontSize);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_SELECTABLE,aSelectable);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_SELECTED,aSelected);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_TIMEFRAMES,aTimeFrames);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_XDISTANCE,aX);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_YDISTANCE,aY);
   ObjectSetString(aChartID,aObjName,OBJPROP_TEXT,aText);
   ObjectSetString(aChartID,aObjName,OBJPROP_FONT,aFont);
   ObjectSetDouble(aChartID,aObjName,OBJPROP_ANGLE,aAngle);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::fObjHLine(string   aObjName,
                       double   aPrice,
                       string   aText       =  "HLine",
                       int      aWindow     =  0,
                       color    aColor      =  Red,
                       color    aWidth      =  1,
                       color    aStyle      =  0,
                       int      aChartID    =  0,
                       bool     aBack       =  true,
                       bool     aSelectable =  true,
                       bool     aSelected   =  false,
                       long     aTimeFrames =  OBJ_ALL_PERIODS
                      )
  {
   bool exist=true;
   if(ObjectFind(aChartID,aObjName)!=aWindow)
     {
      exist=false;
     }
   ObjectCreate(aChartID,aObjName,OBJ_HLINE,aWindow,0,aPrice);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_BACK,aBack);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_COLOR,aColor);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_SELECTABLE,aSelectable);
   if(!exist)
      ObjectSetInteger(aChartID,aObjName,OBJPROP_SELECTED,aSelected);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_TIMEFRAMES,aTimeFrames);
   ObjectSetString(aChartID,aObjName,OBJPROP_TEXT,aText);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_WIDTH,aWidth);
   ObjectSetInteger(aChartID,aObjName,OBJPROP_STYLE,aStyle);
   ObjectMove(aChartID,aObjName,0,0,aPrice);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CPanel::Deinit()
  {
   EventKillTimer();
   ObjectDelete(0,NameMain);
   FormDelete();
  }
//+------------------------------------------------------------------+
