unit Model.Card;

interface

uses
  Model.Utils,
  System.Classes,
  System.StrUtils,
  System.SysUtils,
  Model.Interfaces;

type
  TModelCard = class(TInterfacedObject, IModelCard)
  strict private
    FCard: IModelEntitiesCardData;
  public
    constructor Create(AValue: IModelEntitiesCardData);
    class function New(AValue: IModelEntitiesCardData): IModelCard;

    function Generate: string;
  End;

implementation

{ TModelCard }

constructor TModelCard.Create(AValue: IModelEntitiesCardData);
begin
  inherited Create;

  FCard := AValue;
end;

function TModelCard.Generate: string;
var
  LHtmlBar: string;
  LBarColor: string;
  LBarColorBackground: string;
begin
  var LIcon := EnumWebCardIconToStr(FCard.Icon.Name);
  LHtmlBar := '';

  if FCard.Value.BarVisible then
  begin
    LBarColor := EnumWebCardColorsToStr(FCard.Value.BarColorFont);
    LBarColorBackground := EnumWebCardColorsToBackgroudStr(FCard.Value.BarColorBackground);

    LHtmlBar := Format('<div class="progress-bar %s %s" style="width:%s"></div>',
                       [LBarColor,
                        LBarColorBackground,
                        FormatFloat('#,##0.00', FCard.Value.AsFloat) +'%']);
  end;

  result := Format('<div class="card py-0 h-100"> '+
                   '   <div class="card-body row p-2"> '+
                   '      <div class="row m-0 d-flex justify-content-between"> '+
                   '          <div class="col-2 d-flex align-items-center justify-content-center"> '+
                   '             <span class="material-symbols-outlined p-0 fw-bolder %s %s" style="font-size: 40pt;">%s</span> '+
                   '          </div> '+
                   '          <div class="col-9 m-0 row p-0"> '+
                   '             <span class="col-12 text-truncate text-end fw-semibold %s %s">%s</span> '+
                   '             <span class="col-12 text-truncate text-end fs-2 fw-bolder %s %s">%s</span> '+
                   '             <div class="progress p-0" style="height: .5rem"> '+
                   '               %s '+
                   '             </div> '+
                   '          </div> '+
                   '      </div> '+
                   '   </div> '+
                   '</div>',
                   [EnumWebCardColorsToStr(FCard.Icon.ColorFont),
                    EnumWebCardColorsToBackgroudStr(FCard.Icon.ColorBackground),
                    LIcon,
                    EnumWebCardColorsToStr(FCard.Text.ColorFont),
                    EnumWebCardColorsToBackgroudStr(FCard.Text.ColorBackground),
                    FCard.Text.AsString,
                    EnumWebCardColorsToStr(FCard.Value.ColorFont),
                    EnumWebCardColorsToBackgroudStr(FCard.Value.ColorBackground),
                    FormatFloat('#,##0.00', FCard.Value.AsFloat),
                    LHtmlBar]);
end;

class function TModelCard.New(AValue: IModelEntitiesCardData): IModelCard;
begin
  result := Self.Create(AValue);
end;

end.
