unit WebCard.Model;

interface

uses
  WebCard.Model.Card,
  WebCard.Model.Entities,
  WebCard.Model.Interfaces;

type
  TWebCardModel = class(TInterfacedObject, IWebCardModel)
  public
    class function New: IWebCardModel;

    function Card(AValue: IWebCardModelEntitiesCardData;
      AIconsType: EnumWebCardIconsType = wiGoogleFonts): IWebCardModelCard;
    function Entities: IWebCardModelEntities;
  End;

implementation

{ TWebCardModel }

function TWebCardModel.Card(AValue: IWebCardModelEntitiesCardData;
  AIconsType: EnumWebCardIconsType = wiGoogleFonts): IWebCardModelCard;
begin
  result := TModelCard.New(AValue, AIconsType);
end;

function TWebCardModel.Entities: IWebCardModelEntities;
begin
  result := TWebCardModelEntities.New;
end;

class function TWebCardModel.New: IWebCardModel;
begin
  result := Self.Create;
end;

end.
