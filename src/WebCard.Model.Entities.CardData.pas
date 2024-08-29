unit WebCard.Model.Entities.CardData;

interface

uses
  WebCard.Model.Interfaces,
  WebCard.Model.Entities.CardDataStr,
  WebCard.Model.Entities.CardDataIcon,
  WebCard.Model.Entities.CardDataDouble;

type
  TModelEntitiesCardData = class(TInterfacedObject, IWebCardModelEntitiesCardData)
  strict private
    FToolTip: string;
    FCardLabel: IWebCardModelEntitiesCardDataStr;
    FCardIcon: IWebCardModelEntitiesCardDataIcon;
    FCardValue: IWebCardModelEntitiesCardDataDouble;
  public
    constructor Create;
    class function New: IWebCardModelEntitiesCardData;

    function ToolTip: string; overload;
    function Text: IWebCardModelEntitiesCardDataStr; overload;
    function Icon: IWebCardModelEntitiesCardDataIcon; overload;
    function Value: IWebCardModelEntitiesCardDataDouble; overload;

    function ToolTip(AValue: string): IWebCardModelEntitiesCardData; overload;
    function Text(AText: string; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IWebCardModelEntitiesCardData; overload;
    function Value(AValue: Double; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone; ABarVisible: Boolean = False;
      ABarColorFont: EnumWebCardColors = wccDark; ABarColorBackground: EnumWebCardColors = wccNone): IWebCardModelEntitiesCardData; overload;
    function Icon(AIcon: EnumWebCardIcons; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IWebCardModelEntitiesCardData; overload;
  End;

implementation

{ TModelEntitiesCardData }

function TModelEntitiesCardData.Icon: IWebCardModelEntitiesCardDataIcon;
begin
  result := FCardIcon;
end;

function TModelEntitiesCardData.Icon(AIcon: EnumWebCardIcons;
  AColorFont: EnumWebCardColors; AColorBackground: EnumWebCardColors): IWebCardModelEntitiesCardData;
begin
  result := Self;

  FCardIcon.SetValue(AIcon)
    .ColorFont(AColorFont)
    .ColorBackground(AColorBackground);
end;

function TModelEntitiesCardData.Text(AText: string;
  AColorFont: EnumWebCardColors; AColorBackground: EnumWebCardColors): IWebCardModelEntitiesCardData;
begin
  result := Self;

  FCardLabel.SetValue(AText)
    .ColorFont(AColorFont)
    .ColorBackground(AColorBackground);
end;

function TModelEntitiesCardData.ToolTip(
  AValue: string): IWebCardModelEntitiesCardData;
begin
  result := Self;

  FToolTip := AValue;
end;

function TModelEntitiesCardData.ToolTip: string;
begin
  result := FToolTip;
end;

function TModelEntitiesCardData.Text: IWebCardModelEntitiesCardDataStr;
begin
  result := FCardLabel;
end;

function TModelEntitiesCardData.Value(AValue: Double; AColorFont: EnumWebCardColors;
  AColorBackground: EnumWebCardColors; ABarVisible: Boolean;
  ABarColorFont: EnumWebCardColors; ABarColorBackground: EnumWebCardColors): IWebCardModelEntitiesCardData;
begin
  result := Self;

  FCardValue.SetValue(AValue)
    .ColorFont(AColorFont)
    .BarVisible(ABarVisible)
    .BarColorFont(ABarColorFont)
    .ColorBackground(AColorBackground)
    .BarColorBackground(ABarColorBackground);
end;

constructor TModelEntitiesCardData.Create;
begin
  inherited Create;

  FCardLabel := TModelEntitiesCardDataStr.New;
  FCardIcon := TModelEntitiesCardDataIcon.New;
  FCardValue := TModelEntitiesCardDataDouble.New;
end;

function TModelEntitiesCardData.Value: IWebCardModelEntitiesCardDataDouble;
begin
  result := FCardValue;
end;

class function TModelEntitiesCardData.New: IWebCardModelEntitiesCardData;
begin
  result := Self.Create;
end;

end.
