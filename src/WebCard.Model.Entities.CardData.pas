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
    FValueIsInteger: Boolean;
    FCardLabel: IWebCardModelEntitiesCardDataStr;
    FCardIcon: IWebCardModelEntitiesCardDataIcon;
    FCardValue: IWebCardModelEntitiesCardDataDouble;
    FCardValue2: IWebCardModelEntitiesCardDataDouble;
  public
    constructor Create;
    class function New: IWebCardModelEntitiesCardData;

    function ValueIsInteger: Boolean;
    function ToolTip: string; overload;
    function Text: IWebCardModelEntitiesCardDataStr; overload;
    function Icon: IWebCardModelEntitiesCardDataIcon; overload;
    function Value: IWebCardModelEntitiesCardDataDouble; overload;
    function Value2: IWebCardModelEntitiesCardDataDouble; overload;

    function ToolTip(AValue: string): IWebCardModelEntitiesCardData; overload;
    function Text(AText: string; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IWebCardModelEntitiesCardData; overload;
    function Value(AValue: Double; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone; ABarVisible: Boolean = False;
      ABarColorFont: EnumWebCardColors = wccDark; ABarColorBackground: EnumWebCardColors = wccNone;
      AIsPercent: Boolean = False): IWebCardModelEntitiesCardData; overload;
    function Value(AValue: Integer; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone; ABarVisible: Boolean = False;
      ABarColorFont: EnumWebCardColors = wccDark; ABarColorBackground: EnumWebCardColors = wccNone;
      AIsPercent: Boolean = False): IWebCardModelEntitiesCardData; overload;
    function Value2(AValue: Double; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone; ABarVisible: Boolean = False;
      ABarColorFont: EnumWebCardColors = wccDark; ABarColorBackground: EnumWebCardColors = wccNone;
      AIsPercent: Boolean = False): IWebCardModelEntitiesCardData; overload;
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

function TModelEntitiesCardData.Value(AValue: Integer; AColorFont,
  AColorBackground: EnumWebCardColors; ABarVisible: Boolean; ABarColorFont,
  ABarColorBackground: EnumWebCardColors;
  AIsPercent: Boolean): IWebCardModelEntitiesCardData;
begin
  result := Self;

  FValueIsInteger := True;
  FCardValue.SetValue(AValue)
    .ColorFont(AColorFont)
    .IsPercent(AIsPercent)
    .BarVisible(ABarVisible)
    .BarColorFont(ABarColorFont)
    .ColorBackground(AColorBackground)
    .BarColorBackground(ABarColorBackground);
end;

function TModelEntitiesCardData.Value2: IWebCardModelEntitiesCardDataDouble;
begin
  result := FCardValue2;
end;

function TModelEntitiesCardData.Value2(AValue: Double; AColorFont,
  AColorBackground: EnumWebCardColors; ABarVisible: Boolean; ABarColorFont,
  ABarColorBackground: EnumWebCardColors;
  AIsPercent: Boolean): IWebCardModelEntitiesCardData;
begin
  result := Self;

  FValueIsInteger := False;
  FCardValue2.SetValue(AValue)
    .ColorFont(AColorFont)
    .IsPercent(AIsPercent)
    .BarVisible(ABarVisible)
    .BarColorFont(ABarColorFont)
    .ColorBackground(AColorBackground)
    .BarColorBackground(ABarColorBackground);
end;

function TModelEntitiesCardData.ValueIsInteger: Boolean;
begin
  result := FValueIsInteger;
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
  ABarColorFont: EnumWebCardColors; ABarColorBackground: EnumWebCardColors;
  AIsPercent: Boolean): IWebCardModelEntitiesCardData;
begin
  result := Self;

  FValueIsInteger := False;
  FCardValue.SetValue(AValue)
    .ColorFont(AColorFont)
    .IsPercent(AIsPercent)
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
  FCardValue2 := TModelEntitiesCardDataDouble.New;
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
