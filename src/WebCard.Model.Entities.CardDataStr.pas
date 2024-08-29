unit WebCard.Model.Entities.CardDataStr;

interface

uses
  WebCard.Model.Interfaces;

type
  TModelEntitiesCardDataStr = class(TInterfacedObject, IWebCardModelEntitiesCardDataStr)
  strict private
    FText: string;
    FColorFont: EnumWebCardColors;
    FColorBackground: EnumWebCardColors;
  public
    constructor Create(AText: string = ''; AColorFont: EnumWebCardColors = wccDark;
      AColorBackGround: EnumWebCardColors = wccNone);
    class function New(AText: string = ''; AColorFont: EnumWebCardColors = wccDark;
      AColorBackGround: EnumWebCardColors = wccNone): IWebCardModelEntitiesCardDataStr;

    function AsString: string; overload;
    function ColorFont: EnumWebCardColors; overload;
    function ColorBackground: EnumWebCardColors; overload;

    function SetValue(AValue: string): IWebCardModelEntitiesCardDataStr; overload;
    function ColorFont(AValue: EnumWebCardColors): IWebCardModelEntitiesCardDataStr; overload;
    function ColorBackground(AValue: EnumWebCardColors): IWebCardModelEntitiesCardDataStr; overload;
  End;

implementation

{ TModelEntitiesCardDataStr }

function TModelEntitiesCardDataStr.ColorBackground(
  AValue: EnumWebCardColors): IWebCardModelEntitiesCardDataStr;
begin
  result := Self;

  FColorBackground := AValue;
end;

function TModelEntitiesCardDataStr.ColorBackground: EnumWebCardColors;
begin
  result := FColorBackground;
end;

function TModelEntitiesCardDataStr.ColorFont(
  AValue: EnumWebCardColors): IWebCardModelEntitiesCardDataStr;
begin
  result := Self;

  FColorFont := AValue;
end;

function TModelEntitiesCardDataStr.ColorFont: EnumWebCardColors;
begin
  result := FColorFont;
end;

constructor TModelEntitiesCardDataStr.Create(AText: string; AColorFont,
  AColorBackGround: EnumWebCardColors);
begin
  inherited Create;

  FText := AText;
  FColorFont := AColorFont;
  FColorBackground := AColorBackground;
end;

class function TModelEntitiesCardDataStr.New(AText: string; AColorFont,
  AColorBackGround: EnumWebCardColors): IWebCardModelEntitiesCardDataStr;
begin
  result := Self.Create(AText, AColorFont, AColorBackGround);
end;

function TModelEntitiesCardDataStr.AsString: string;
begin
  result := FText;
end;

function TModelEntitiesCardDataStr.SetValue(
  AValue: string): IWebCardModelEntitiesCardDataStr;
begin
  result := Self;

  FText := AValue;
end;

end.
