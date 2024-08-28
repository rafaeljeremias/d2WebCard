unit Model;

interface

uses
  Model.Card,
  Model.Entities,
  Model.Interfaces;

type
  TModel = class(TInterfacedObject, IModel)
  public
    class function New: IModel;

    function Card(AValue: IModelEntitiesCardData): IModelCard;
    function Entities: IModelEntities;
  End;

implementation

{ TModel }

function TModel.Card(AValue: IModelEntitiesCardData): IModelCard;
begin
  result := TModelCard.New(AValue);
end;

function TModel.Entities: IModelEntities;
begin
  result := TModelEntities.New;
end;

class function TModel.New: IModel;
begin
  result := Self.Create;
end;

end.
