unit Model.Utils;

interface

uses
  Model.Interfaces;

function EnumWebCardIconToStr(AValue: EnumWebCardIcons): string;
function EnumWebCardColorsToStr(AValue: EnumWebCardColors): string;
function EnumWebCardColorsToBackgroudStr(AValue: EnumWebCardColors): string;

implementation

function EnumWebCardIconToStr(AValue: EnumWebCardIcons): string;
begin
  result := '';

  case AValue of
    wciBitcoin: result := 'currency_bitcoin';
    wciMoney: result := 'attach_money';
    wciShoppingCart: result := 'shopping_cart';
    wciSell: result := 'sell';
    wciMonitoring: result := 'monitoring';
    wciFinance: result := 'finance';
  end;
end;

function EnumWebCardColorsToStr(AValue: EnumWebCardColors): string;
begin
  result := '';

  case AValue of
    wccSuccess: result := 'text-success';
    wccSecondary: result := 'text-secondary';
    wccWarning: result := 'text-warning';
    wccPrimary: result := 'text-primary';
    wccDanger: result := 'text-danger';
    wccInfo: result := 'text-info';
    wccDark: result := 'text-dark';
  end;
end;

function EnumWebCardColorsToBackgroudStr(AValue: EnumWebCardColors): string;
begin
  result := '';

  case AValue of
    wccSuccess: result := 'bg-success';
    wccSecondary: result := 'bg-secondary';
    wccWarning: result := 'bg-warning';
    wccPrimary: result := 'bg-primary';
    wccDanger: result := 'bg-danger';
    wccInfo: result := 'bg-info';
    wccDark: result := 'bg-dark';
  end;
end;

end.
