unit WebCard.Model.Interfaces;

{

fontes dos icons

https://fonts.google.com/icons?selected=Material+Symbols+Outlined:ads_click:FILL@0;wght@400;GRAD@0;opsz@24&icon.size=24&icon.color=%23e8eaed&icon.platform=android&icon.query=target

}

interface

type
  EnumWebCardIconsType = (wiNone, wiGoogleFonts, wiImage);
  EnumWebCardIcons = (wciNone, wciBitcoin, wciMoney, wciShoppingCart, wciSell,
    wciMonitoring, wciFinance, wciTarget, wciNorthEast, wciPriceCheck,
    wciStoreFront, wciInventory_2, wciCategory, wciFunctions, wciEqualizer);
  EnumWebCardColors = (wccNone, wccSuccess, wccSecondary, wccWarning, wccPrimary,
    wccDanger, wccInfo, wccDark);
  EnumWebCardToolTipPosition = (ttpNone, ttpTop, ttpBottom, ttpCenter, ttpRight, ttpLeft);

  IWebCardModelEntitiesCardDataStr = Interface
    ['{07749743-B394-4142-B741-924742B4E4CE}']
    function AsString: string; overload;
    function ColorFont: EnumWebCardColors; overload;
    function ColorBackground: EnumWebCardColors; overload;

    function SetValue(AValue: string): IWebCardModelEntitiesCardDataStr; overload;
    function ColorFont(AValue: EnumWebCardColors): IWebCardModelEntitiesCardDataStr; overload;
    function ColorBackground(AValue: EnumWebCardColors): IWebCardModelEntitiesCardDataStr; overload;
  End;

  IWebCardModelEntitiesCardDataDouble = Interface
    ['{16C4E007-6631-4C94-802D-5391E49C1C03}']
    function AsFloat: Double; overload;
    function IsPercent: Boolean; overload;
    function BarVisible: Boolean; overload;
    function ColorFont: EnumWebCardColors; overload;
    function BarColorFont: EnumWebCardColors; overload;
    function ColorBackground: EnumWebCardColors; overload;
    function BarColorBackground: EnumWebCardColors; overload;

    function SetValue(AValue: Double): IWebCardModelEntitiesCardDataDouble; overload;
    function IsPercent(AValue: Boolean): IWebCardModelEntitiesCardDataDouble; overload;
    function BarVisible(AValue: Boolean): IWebCardModelEntitiesCardDataDouble; overload;
    function ColorFont(AValue: EnumWebCardColors): IWebCardModelEntitiesCardDataDouble; overload;
    function BarColorFont(AValue: EnumWebCardColors): IWebCardModelEntitiesCardDataDouble; overload;
    function ColorBackground(AValue: EnumWebCardColors): IWebCardModelEntitiesCardDataDouble; overload;
    function BarColorBackground(AValue: EnumWebCardColors): IWebCardModelEntitiesCardDataDouble; overload;
  End;

  IWebCardModelEntitiesCardDataIcon = Interface
    ['{65B18F79-7DE8-4245-A895-3BB4A6AC6CBE}']
    function Name: EnumWebCardIcons; overload;
    function ColorFont: EnumWebCardColors; overload;
    function ColorBackground: EnumWebCardColors; overload;

    function SetValue(AValue: EnumWebCardIcons): IWebCardModelEntitiesCardDataIcon; overload;
    function ColorFont(AValue: EnumWebCardColors): IWebCardModelEntitiesCardDataIcon; overload;
    function ColorBackground(AValue: EnumWebCardColors): IWebCardModelEntitiesCardDataIcon; overload;
  End;

  IWebCardModelEntitiesCardData = Interface
    ['{9BA026AE-3AC7-497A-BB12-1AD71768A68C}']
    function ToolTip: string; overload;
    function Text: IWebCardModelEntitiesCardDataStr; overload;
    function Value: IWebCardModelEntitiesCardDataDouble; overload;
    function Icon: IWebCardModelEntitiesCardDataIcon; overload;

    function ToolTip(AValue: string): IWebCardModelEntitiesCardData; overload;
    function Text(AText: string; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IWebCardModelEntitiesCardData; overload;
    function Value(AValue: Double; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone; ABarVisible: Boolean = False;
      ABarColorFont: EnumWebCardColors = wccDark; ABarColorBackground: EnumWebCardColors = wccNone;
      AIsPercent: Boolean = False): IWebCardModelEntitiesCardData; overload;
    function Icon(AIcon: EnumWebCardIcons; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IWebCardModelEntitiesCardData; overload;
  End;

  IWebCardModelCard = Interface
    ['{20763EDB-6949-494C-ABE6-E83EA66200C1}']
    function Generate: string;
  End;

  IWebCardModelEntities = Interface
    ['{5A572DE5-7DE7-4FB6-8160-71A12413D150}']
    function CardData: IWebCardModelEntitiesCardData;
    function CardDataStr(AText: string; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IWebCardModelEntitiesCardDataStr;
    function CardDataDouble(AValue: Double; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IWebCardModelEntitiesCardDataDouble;
    function CardDataIcon(AIcon: EnumWebCardIcons; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IWebCardModelEntitiesCardDataIcon;
  End;

  IWebCardModel = Interface
    ['{3384B153-FBC0-4347-A18A-94FC301C06ED}']
    function Card(AValue: IWebCardModelEntitiesCardData;
      AIconsType: EnumWebCardIconsType = wiGoogleFonts): IWebCardModelCard;
    function Entities: IWebCardModelEntities;
  End;

implementation

end.
