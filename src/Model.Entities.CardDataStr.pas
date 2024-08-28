unit Model.Entities.CardDataStr;

interface

uses
  Model.Interfaces;

type
  TModelEntitiesCardDataStr = class(TInterfacedObject, IModelEntitiesCardDataStr)
  strict private
    FText: string;
    FColorFont: EnumWebCardColors;
    FColorBackground: EnumWebCardColors;
  public
    constructor Create(AText: string = ''; AColorFont: EnumWebCardColors = wccDark;
      AColorBackGround: EnumWebCardColors = wccNone);
    class function New(AText: string = ''; AColorFont: EnumWebCardColors = wccDark;
      AColorBackGround: EnumWebCardColors = wccNone): IModelEntitiesCardDataStr;

    function AsString: string; overload;
    function ColorFont: EnumWebCardColors; overload;
    function ColorBackground: EnumWebCardColors; overload;

    function SetValue(AValue: string): IModelEntitiesCardDataStr; overload;
    function ColorFont(AValue: EnumWebCardColors): IModelEntitiesCardDataStr; overload;
    function ColorBackground(AValue: EnumWebCardColors): IModelEntitiesCardDataStr; overload;
  End;

implementation

{ TModelEntitiesCardDataStr }

function TModelEntitiesCardDataStr.ColorBackground(
  AValue: EnumWebCardColors): IModelEntitiesCardDataStr;
begin
  result := Self;

  FColorBackground := AValue;
end;

function TModelEntitiesCardDataStr.ColorBackground: EnumWebCardColors;
begin
  result := FColorBackground;
end;

function TModelEntitiesCardDataStr.ColorFont(
  AValue: EnumWebCardColors): IModelEntitiesCardDataStr;
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
  AColorBackGround: EnumWebCardColors): IModelEntitiesCardDataStr;
begin
  result := Self.Create(AText, AColorFont, AColorBackGround);
end;

function TModelEntitiesCardDataStr.AsString: string;
begin
  result := FText;
end;

function TModelEntitiesCardDataStr.SetValue(
  AValue: string): IModelEntitiesCardDataStr;
begin
  result := Self;

  FText := AValue;
end;

end.
