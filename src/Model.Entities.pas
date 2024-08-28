unit Model.Entities;

interface

uses
  Model.Interfaces,
  Model.Entities.CardData,
  Model.Entities.CardDataStr,
  Model.Entities.CardDataIcon,
  Model.Entities.CardDataDouble;

type
  TModelEntities = class(TInterfacedObject, IModelEntities)
  public
    class function New: IModelEntities;

    function CardData: IModelEntitiesCardData;
    function CardDataStr(AText: string; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IModelEntitiesCardDataStr;
    function CardDataDouble(AValue: Double; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IModelEntitiesCardDataDouble;
    function CardDataIcon(AIcon: EnumWebCardIcons; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IModelEntitiesCardDataIcon;
  End;

implementation

{ TModelEntities }

function TModelEntities.CardData: IModelEntitiesCardData;
begin
  result := TModelEntitiesCardData.New;
end;

function TModelEntities.CardDataDouble(AValue: Double; AColorFont,
  AColorBackground: EnumWebCardColors): IModelEntitiesCardDataDouble;
begin
  result := TModelEntitiesCardDataDouble.New(AValue, AColorFont, AColorBackground);
end;

function TModelEntities.CardDataIcon(AIcon: EnumWebCardIcons; AColorFont,
  AColorBackground: EnumWebCardColors): IModelEntitiesCardDataIcon;
begin
  result := TModelEntitiesCardDataIcon.New(AIcon, AColorFont, AColorBackground);
end;

function TModelEntities.CardDataStr(AText: string; AColorFont,
  AColorBackground: EnumWebCardColors): IModelEntitiesCardDataStr;
begin
  result := TModelEntitiesCardDataStr.New(AText, AColorFont, AColorBackground);
end;

class function TModelEntities.New: IModelEntities;
begin
  result := Self.Create;
end;

end.
