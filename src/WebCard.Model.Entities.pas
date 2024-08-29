unit WebCard.Model.Entities;

interface

uses
  WebCard.Model.Interfaces,
  WebCard.Model.Entities.CardData,
  WebCard.Model.Entities.CardDataStr,
  WebCard.Model.Entities.CardDataIcon,
  WebCard.Model.Entities.CardDataDouble;

type
  TWebCardModelEntities = class(TInterfacedObject, IWebCardModelEntities)
  public
    class function New: IWebCardModelEntities;

    function CardData: IWebCardModelEntitiesCardData;
    function CardDataStr(AText: string; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IWebCardModelEntitiesCardDataStr;
    function CardDataDouble(AValue: Double; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IWebCardModelEntitiesCardDataDouble;
    function CardDataIcon(AIcon: EnumWebCardIcons; AColorFont: EnumWebCardColors = wccDark;
      AColorBackground: EnumWebCardColors = wccNone): IWebCardModelEntitiesCardDataIcon;
  End;

implementation

{ TWebCardModelEntities }

function TWebCardModelEntities.CardData: IWebCardModelEntitiesCardData;
begin
  result := TModelEntitiesCardData.New;
end;

function TWebCardModelEntities.CardDataDouble(AValue: Double; AColorFont,
  AColorBackground: EnumWebCardColors): IWebCardModelEntitiesCardDataDouble;
begin
  result := TModelEntitiesCardDataDouble.New(AValue, AColorFont, AColorBackground);
end;

function TWebCardModelEntities.CardDataIcon(AIcon: EnumWebCardIcons; AColorFont,
  AColorBackground: EnumWebCardColors): IWebCardModelEntitiesCardDataIcon;
begin
  result := TModelEntitiesCardDataIcon.New(AIcon, AColorFont, AColorBackground);
end;

function TWebCardModelEntities.CardDataStr(AText: string; AColorFont,
  AColorBackground: EnumWebCardColors): IWebCardModelEntitiesCardDataStr;
begin
  result := TModelEntitiesCardDataStr.New(AText, AColorFont, AColorBackground);
end;

class function TWebCardModelEntities.New: IWebCardModelEntities;
begin
  result := Self.Create;
end;

end.
