unit Model.Interfaces;

interface

type
  EnumWebCardIcons = (wciNone, wciBitcoin, wciMoney, wciShoppingCart,wciSell,
    wciMonitoring, wciFinance);
  EnumWebCardColors = (wccNone, wccSuccess, wccSecondary, wccWarning, wccPrimary,
    wccDanger, wccInfo, wccDark);

  IModelEntitiesCardDataStr = Interface
    ['{07749743-B394-4142-B741-924742B4E4CE}']
    function AsString: string; overload;
    function ColorFont: EnumWebCardColors; overload;
    function ColorBackground: EnumWebCardColors; overload;

    function SetValue(AValue: string): IModelEntitiesCardDataStr; overload;
    function ColorFont(AValue: EnumWebCardColors): IModelEntitiesCardDataStr; overload;
    function ColorBackground(AValue: EnumWebCardColors): IModelEntitiesCardDataStr; overload;
  End;

  IModelEntitiesCardDataDouble = Interface
    ['{16C4E007-6631-4C94-802D-5391E49C1C03}']
    function AsFloat: Double; overload;
    function BarVisible: Boolean; overload;
    function ColorFont: EnumWebCardColors; overload;
    function BarColorFont: EnumWebCardColors; overload;
    function ColorBackground: EnumWebCardColors; overload;
    function BarColorBackground: EnumWebCardColors; overload;

    function SetValue(AValue: Double): IModelEntitiesCardDataDouble; overload;
    function BarVisible(AValue: Boolean): IModelEntitiesCardDataDouble; overload;
    function ColorFont(AValue: EnumWebCardColors): IModelEntitiesCardDataDouble; overload;
    function BarColorFont(AValue: EnumWebCardColors): IModelEntitiesCardDataDouble; overload;
    function ColorBackground(AValue: EnumWebCardColors): IModelEntitiesCardDataDouble; overload;
    function BarColorBackground(AValue: EnumWebCardColors): IModelEntitiesCardDataDouble; overload;
  End;

  IModelEntitiesCardDataIcon = Interface
    ['{65B18F79-7DE8-4245-A895-3BB4A6AC6CBE}']
    function Name: EnumWebCardIcons; overload;
    function ColorFont: EnumWebCardColors; overload;
    function ColorBackground: EnumWebCardColors; overload;

    function SetValue(AValue: EnumWebCardIcons): IModelEntitiesCardDataIcon; overload;
    function ColorFont(AValue: EnumWebCardColors): IModelEntitiesCardDataIcon; overload;
    function ColorBackground(AValue: EnumWebCardColors): IModelEntitiesCardDataIcon; overload;
  End;

  IModelEntitiesCardData = Interface
    ['{9BA026AE-3AC7-497A-BB12-1AD71768A68C}']
    function Text: IModelEntitiesCardDataStr; overload;
    function Value: IModelEntitiesCardDataDouble; overload;
    function Icon: IModelEntitiesCardDataIcon; overload;

    function Text(AText: string; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IModelEntitiesCardData; overload;
    function Value(AValue: Double; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone; ABarVisible: Boolean = False;
      ABarColorFont: EnumWebCardColors = wccDark; ABarColorBackground: EnumWebCardColors = wccNone): IModelEntitiesCardData; overload;
    function Icon(AIcon: EnumWebCardIcons; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IModelEntitiesCardData; overload;
  End;

  IModelCard = Interface
    ['{20763EDB-6949-494C-ABE6-E83EA66200C1}']
    function Generate: string;
  End;

  IModelEntities = Interface
    ['{5A572DE5-7DE7-4FB6-8160-71A12413D150}']
    function CardData: IModelEntitiesCardData;
    function CardDataStr(AText: string; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IModelEntitiesCardDataStr;
    function CardDataDouble(AValue: Double; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IModelEntitiesCardDataDouble;
    function CardDataIcon(AIcon: EnumWebCardIcons; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IModelEntitiesCardDataIcon;
  End;

  IModel = Interface
    ['{3384B153-FBC0-4347-A18A-94FC301C06ED}']
    function Card(AValue: IModelEntitiesCardData): IModelCard;
    function Entities: IModelEntities;
  End;

implementation

end.
