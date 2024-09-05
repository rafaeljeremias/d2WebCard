unit WebCard.Model.Card;

interface

uses
  System.Classes,
  System.StrUtils,
  System.SysUtils,
  WebCard.Model.Utils,
  WebCard.Model.Interfaces;

type
  TModelCard = class(TInterfacedObject, IWebCardModelCard)
  strict private
    FIconsType: EnumWebCardIconsType;
    FCard: IWebCardModelEntitiesCardData;
  public
    constructor Create(AValue: IWebCardModelEntitiesCardData;
      AIconsType: EnumWebCardIconsType = wiGoogleFonts);
    class function New(AValue: IWebCardModelEntitiesCardData;
      AIconsType: EnumWebCardIconsType = wiGoogleFonts): IWebCardModelCard;

    function Generate: string;
  End;

implementation

{ TModelCard }

constructor TModelCard.Create(AValue: IWebCardModelEntitiesCardData;
  AIconsType: EnumWebCardIconsType = wiGoogleFonts);
begin
  inherited Create;

  FCard := AValue;
  FIconsType := AIconsType;
end;

function TModelCard.Generate: string;
var
  LHtmlBar: string;
  LBarColor: string;
  LIconsTypeStr: string;
  LBarColorBackground: string;
begin
  var LIcon := EnumWebCardIconToStr(FCard.Icon.Name);
  LHtmlBar := '';

  LIconsTypeStr := Format('<span class="material-symbols-outlined p-0 fw-bolder %s %s" style="font-size: 40pt;">%s</span>',
                          [EnumWebCardColorsToStr(FCard.Icon.ColorFont),
                           EnumWebCardColorsToBackgroudStr(FCard.Icon.ColorBackground),
                           LIcon]);

  if FIconsType = wiImage then
  begin
    LIconsTypeStr := Format('<img src="assets\img\icons\%s" style="height: 45pt;"/>',
                            [EnumWebCardIconsTypeToFileName(FCard.Icon.Name)]);
  end;

  if FCard.Value.BarVisible then
  begin
    LBarColor := EnumWebCardColorsToBackgroudStr(FCard.Value.BarColorFont);
    LBarColorBackground := EnumWebCardColorsToBackgroudStr(FCard.Value.BarColorBackground);

    var LValorPercentual := FCard.Value.AsFloat;

    if LValorPercentual > 100 then
      LValorPercentual := 100;

    LHtmlBar := Format('<div class="progress p-0 %s" style="height: .5rem"> '+
                       '  <div class="progress-bar %s" style="width:%s"></div> '+
                       '</div> ',
                       [LBarColorBackground,
                        LBarColor,
                        AnsiReplaceStr(FormatFloat('#,##0.00', LValorPercentual), ',', '.') +'%']);
  end;

  var LToolTip := '';
  if FCard.ToolTip <> '' then
    LToolTip := Format('data-bs-toggle="tooltip" data-bs-placement="top" title="%s"', [FCard.ToolTip]);

  result := Format('<div class="p-1 col-sm-3 col-12" %s> '+
                   '  <div class="card py-0 h-100"> '+
                   '    <div class="card-body row p-2"> '+
                   '      <div class="row m-0 d-flex justify-content-between"> '+
                   '        <div class="col-2 d-flex align-items-center justify-content-center"> '+
                   '          %s '+
                   '        </div> '+
                   '        <div class="col-9 m-0 row p-0"> '+
                   '          <span class="col-12 text-truncate text-end fw-semibold %s %s">%s</span> '+
                   '          <span class="col-12 text-truncate text-end fs-2 fw-bolder %s %s">%s</span> '+
                   '            %s '+
                   '        </div> '+
                   '      </div> '+
                   '    </div> '+
                   '  </div> '+
                   '</div>',
                   [LToolTip,
                    LIconsTypeStr,
                    EnumWebCardColorsToStr(FCard.Text.ColorFont),
                    EnumWebCardColorsToBackgroudStr(FCard.Text.ColorBackground),
                    FCard.Text.AsString,
                    EnumWebCardColorsToStr(FCard.Value.ColorFont),
                    EnumWebCardColorsToBackgroudStr(FCard.Value.ColorBackground),
                    FormatFloat('#,##0.00', FCard.Value.AsFloat) +
                      ifThen(FCard.Value.BarVisible or FCard.Value.IsPercent, '%', ''),
                    LHtmlBar]);
end;

class function TModelCard.New(AValue: IWebCardModelEntitiesCardData;
  AIconsType: EnumWebCardIconsType = wiGoogleFonts): IWebCardModelCard;
begin
  result := Self.Create(AValue, AIconsType);
end;

end.
