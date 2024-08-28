unit Model.Entities.CardDataIcon;

interface

uses
  Model.Interfaces;

type
  TModelEntitiesCardDataIcon = class(TInterfacedObject, IModelEntitiesCardDataIcon)
  strict private
    FIcon: EnumWebCardIcons;
    FColorFont: EnumWebCardColors;
    FColorBackground: EnumWebCardColors;
  public
    constructor Create(AIcon: EnumWebCardIcons = wciNone; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone);
    class function New(AIcon: EnumWebCardIcons = wciNone; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IModelEntitiesCardDataIcon;

    function Name: EnumWebCardIcons; overload;
    function ColorFont: EnumWebCardColors; overload;
    function ColorBackground: EnumWebCardColors; overload;

    function SetValue(AValue: EnumWebCardIcons): IModelEntitiesCardDataIcon; overload;
    function ColorFont(AValue: EnumWebCardColors): IModelEntitiesCardDataIcon; overload;
    function ColorBackground(AValue: EnumWebCardColors): IModelEntitiesCardDataIcon; overload;
  End;

implementation

{ TModelEntitiesCardDataIcon }

function TModelEntitiesCardDataIcon.ColorBackground(
  AValue: EnumWebCardColors): IModelEntitiesCardDataIcon;
begin
  result := Self;

  FColorBackground := AValue;
end;

function TModelEntitiesCardDataIcon.ColorBackground: EnumWebCardColors;
begin
  result := FColorBackground;
end;

function TModelEntitiesCardDataIcon.ColorFont(
  AValue: EnumWebCardColors): IModelEntitiesCardDataIcon;
begin
  result := Self;

  FColorFont := AValue;
end;

function TModelEntitiesCardDataIcon.ColorFont: EnumWebCardColors;
begin
  result := FColorFont;
end;

constructor TModelEntitiesCardDataIcon.Create(AIcon: EnumWebCardIcons;
  AColorFont: EnumWebCardColors; AColorBackground: EnumWebCardColors);
begin
  inherited Create;

  FIcon := AIcon;
  FColorFont := AColorFont;
  FColorBackground := AColorBackground;
end;

function TModelEntitiesCardDataIcon.SetValue(
  AValue: EnumWebCardIcons): IModelEntitiesCardDataIcon;
begin
  result := Self;

  FIcon := AValue;
end;

function TModelEntitiesCardDataIcon.Name: EnumWebCardIcons;
begin
  result := FIcon;
end;

class function TModelEntitiesCardDataIcon.New(AIcon: EnumWebCardIcons;
  AColorFont: EnumWebCardColors; AColorBackground: EnumWebCardColors): IModelEntitiesCardDataIcon;
begin
  result := Self.Create(AIcon, AColorFont, AColorBackground);
end;

end.
