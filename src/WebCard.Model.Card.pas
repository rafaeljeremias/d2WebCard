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
    FExibirSegundoValor: Boolean;
    FIconsType: EnumWebCardIconsType;
    FCard: IWebCardModelEntitiesCardData;
  public
    constructor Create(AValue: IWebCardModelEntitiesCardData;
      AIconsType: EnumWebCardIconsType = wiGoogleFonts;
      AExibirSegundoValor: Boolean = False);
    class function New(AValue: IWebCardModelEntitiesCardData;
      AIconsType: EnumWebCardIconsType = wiGoogleFonts;
      AExibirSegundoValor: Boolean = False): IWebCardModelCard;

    function Generate: string;
  End;

implementation

{ TModelCard }

constructor TModelCard.Create(AValue: IWebCardModelEntitiesCardData;
  AIconsType: EnumWebCardIconsType; AExibirSegundoValor: Boolean);
begin
  inherited Create;

  FCard := AValue;
  FIconsType := AIconsType;
  FExibirSegundoValor := AExibirSegundoValor;
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

    LHtmlBar := Format('<div class="progress p-0 align-self-end mt-2 %s" style="height: .5rem"> '+
                       '  <div class="progress-bar %s" style="width:%s"></div> '+
                       '</div> ',
                       [LBarColorBackground,
                        LBarColor,
                        AnsiReplaceStr(FormatFloat('#,##0.00', LValorPercentual), ',', '.') +'%']);
  end;

  var LToolTip := '';
  if FCard.ToolTip <> '' then
    LToolTip := Format('data-bs-toggle="tooltip" data-bs-placement="top" title="%s"', [FCard.ToolTip]);

  var LSegundoValor := '';
  if FExibirSegundoValor then
  begin
    LSegundoValor := '<p class="text-end fw-semibold text-secondary m-0 align-self-start">&nbsp;</p>';

    if FCard.Value2.AsFloat > 0 then
    begin
      LSegundoValor := Format('<p class="text-end fw-semibold text-secondary m-0 align-self-start">%s</p>',
                              [FormatFloat('#,##0.00', FCard.Value2.AsFloat)]);
    end;
  end;

  result := Format('<div class="p-1 col-sm-3 col-12" %s> '+
                   '  <div class="card py-0 h-100"> '+
                   '    <div class="card-body row p-2"> '+
                   '      <div class="row m-0 d-flex justify-content-between"> '+
                   '        <div class="col-2 d-flex align-items-center justify-content-center"> '+
                   '          %s '+
                   '        </div> '+
                   '        <div class="col-9 m-0 row p-0 align-items-start"> '+
                   '          <span class="col-12 text-truncate text-end fw-semibold %s %s" align-self-start m-0>%s</span> '+
                   '          <h2 class="col-12 text-truncate text-end fw-bolder px-2 m-0 align-self-start %s %s">%s</h2> '+
                   '            %s '+
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
                    ifThen(FCard.ValueIsInteger, IntToStr(FCard.Value.AsInteger), FormatFloat('#,##0.00', FCard.Value.AsFloat)) +
                      ifThen(FCard.Value.BarVisible or FCard.Value.IsPercent, '%', ''),
                    LSegundoValor,
                    LHtmlBar]);
end;

class function TModelCard.New(AValue: IWebCardModelEntitiesCardData;
  AIconsType: EnumWebCardIconsType; AExibirSegundoValor: Boolean): IWebCardModelCard;
begin
  result := Self.Create(AValue, AIconsType, AExibirSegundoValor);
end;

end.
