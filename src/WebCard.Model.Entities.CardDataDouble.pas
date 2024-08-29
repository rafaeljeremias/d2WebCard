unit WebCard.Model.Entities.CardDataDouble;

interface

uses
  WebCard.Model.Interfaces;

type
  TModelEntitiesCardDataDouble = class(TInterfacedObject, IWebCardModelEntitiesCardDataDouble)
  strict private
    FValue: Double;
    FBarVisible: Boolean;
    FColorFont: EnumWebCardColors;
    FBarColorFont: EnumWebCardColors;
    FColorBackground: EnumWebCardColors;
    FBarColorBackground: EnumWebCardColors;
  public
    constructor Create(AValue: Double = 0; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone; ABarVisible: Boolean = False;
      ABarColorFont: EnumWebCardColors = wccDark; ABarColorBackground: EnumWebCardColors = wccNone);
    class function New(AValue: Double = 0; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone; ABarVisible: Boolean = False;
      ABarColorFont: EnumWebCardColors = wccDark; ABarColorBackground: EnumWebCardColors = wccNone): IWebCardModelEntitiesCardDataDouble;

    function AsFloat: Double; overload;
    function BarVisible: Boolean; overload;
    function ColorFont: EnumWebCardColors; overload;
    function BarColorFont: EnumWebCardColors; overload;
    function ColorBackground: EnumWebCardColors; overload;
    function BarColorBackground: EnumWebCardColors; overload;

    function SetValue(AValue: Double): IWebCardModelEntitiesCardDataDouble; overload;
    function BarVisible(AValue: Boolean): IWebCardModelEntitiesCardDataDouble; overload;
    function ColorFont(AValue: EnumWebCardColors): IWebCardModelEntitiesCardDataDouble; overload;
    function BarColorFont(AValue: EnumWebCardColors): IWebCardModelEntitiesCardDataDouble; overload;
    function ColorBackground(AValue: EnumWebCardColors): IWebCardModelEntitiesCardDataDouble; overload;
    function BarColorBackground(AValue: EnumWebCardColors): IWebCardModelEntitiesCardDataDouble; overload;
  End;

implementation

{ TModelEntitiesCardDataDouble }

function TModelEntitiesCardDataDouble.ColorBackground(
  AValue: EnumWebCardColors): IWebCardModelEntitiesCardDataDouble;
begin
  result := Self;

  FColorBackground := AValue;
end;

function TModelEntitiesCardDataDouble.ColorBackground: EnumWebCardColors;
begin
  result := FColorBackground;
end;

function TModelEntitiesCardDataDouble.ColorFont(
  AValue: EnumWebCardColors): IWebCardModelEntitiesCardDataDouble;
begin
  result := Self;

  FColorFont := AValue;
end;

function TModelEntitiesCardDataDouble.ColorFont: EnumWebCardColors;
begin
  result := FColorFont;
end;

constructor TModelEntitiesCardDataDouble.Create(AValue: Double; AColorFont,
  AColorBackground: EnumWebCardColors; ABarVisible: Boolean;
  ABarColorFont: EnumWebCardColors; ABarColorBackground: EnumWebCardColors);
begin
  inherited Create;

  FValue := AValue;
  FColorFont := AColorFont;
  FBarVisible := ABarVisible;
  FBarColorFont := ABarColorFont;
  FColorBackground := AColorBackground;
  FBarColorBackground := ABarColorBackground;
end;

class function TModelEntitiesCardDataDouble.New(AValue: Double; AColorFont,
  AColorBackground: EnumWebCardColors; ABarVisible: Boolean;
  ABarColorFont: EnumWebCardColors; ABarColorBackground: EnumWebCardColors): IWebCardModelEntitiesCardDataDouble;
begin
  result := Self.Create(AValue, AColorFont, AColorBackground, ABarVisible,
    ABarColorFont, ABarColorBackground);
end;

function TModelEntitiesCardDataDouble.AsFloat: Double;
begin
  result := FValue;
end;

function TModelEntitiesCardDataDouble.SetValue(
  AValue: Double): IWebCardModelEntitiesCardDataDouble;
begin
  result := Self;

  FValue := AValue;
end;

function TModelEntitiesCardDataDouble.BarColorBackground(
  AValue: EnumWebCardColors): IWebCardModelEntitiesCardDataDouble;
begin
  result := Self;

  FBarColorBackground := AValue;
end;

function TModelEntitiesCardDataDouble.BarColorBackground: EnumWebCardColors;
begin
  result := FBarColorBackground;
end;

function TModelEntitiesCardDataDouble.BarColorFont(
  AValue: EnumWebCardColors): IWebCardModelEntitiesCardDataDouble;
begin
  result := Self;

  FBarColorFont := AValue;
end;

function TModelEntitiesCardDataDouble.BarColorFont: EnumWebCardColors;
begin
  result := FBarColorFont;
end;

function TModelEntitiesCardDataDouble.BarVisible(
  AValue: Boolean): IWebCardModelEntitiesCardDataDouble;
begin
  result := Self;

  FBarVisible := AValue;
end;


function TModelEntitiesCardDataDouble.BarVisible: Boolean;
begin
  result := FBarVisible;
end;


end.
