unit Model.Entities.CardData;

interface

uses
  Model.Interfaces,
  Model.Entities.CardDataStr,
  Model.Entities.CardDataIcon,
  Model.Entities.CardDataDouble;

type
  TModelEntitiesCardData = class(TInterfacedObject, IModelEntitiesCardData)
  strict private
    FCardLabel: IModelEntitiesCardDataStr;
    FCardIcon: IModelEntitiesCardDataIcon;
    FCardValue: IModelEntitiesCardDataDouble;
  public
    constructor Create;
    class function New: IModelEntitiesCardData;

    function Text: IModelEntitiesCardDataStr; overload;
    function Icon: IModelEntitiesCardDataIcon; overload;
    function Value: IModelEntitiesCardDataDouble; overload;

    function Text(AText: string; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IModelEntitiesCardData; overload;
    function Value(AValue: Double; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone; ABarVisible: Boolean = False;
      ABarColorFont: EnumWebCardColors = wccDark; ABarColorBackground: EnumWebCardColors = wccNone): IModelEntitiesCardData; overload;
    function Icon(AIcon: EnumWebCardIcons; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IModelEntitiesCardData; overload;
  End;

implementation

{ TModelEntitiesCardData }

function TModelEntitiesCardData.Icon: IModelEntitiesCardDataIcon;
begin
  result := FCardIcon;
end;

function TModelEntitiesCardData.Icon(AIcon: EnumWebCardIcons;
  AColorFont: EnumWebCardColors; AColorBackground: EnumWebCardColors): IModelEntitiesCardData;
begin
  result := Self;

  FCardIcon.SetValue(AIcon)
    .ColorFont(AColorFont)
    .ColorBackground(AColorBackground);
end;

function TModelEntitiesCardData.Text(AText: string;
  AColorFont: EnumWebCardColors; AColorBackground: EnumWebCardColors): IModelEntitiesCardData;
begin
  result := Self;

  FCardLabel.SetValue(AText)
    .ColorFont(AColorFont)
    .ColorBackground(AColorBackground);
end;

function TModelEntitiesCardData.Text: IModelEntitiesCardDataStr;
begin
  result := FCardLabel;
end;

function TModelEntitiesCardData.Value(AValue: Double; AColorFont: EnumWebCardColors;
  AColorBackground: EnumWebCardColors; ABarVisible: Boolean;
  ABarColorFont: EnumWebCardColors; ABarColorBackground: EnumWebCardColors): IModelEntitiesCardData;
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

function TModelEntitiesCardData.Value: IModelEntitiesCardDataDouble;
begin
  result := FCardValue;
end;

class function TModelEntitiesCardData.New: IModelEntitiesCardData;
begin
  result := Self.Create;
end;

end.
