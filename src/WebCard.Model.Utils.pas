unit WebCard.Model.Utils;

interface

uses
  WebCard.Model.Interfaces;

function EnumWebCardIconsTypeToFileName(AValue: EnumWebCardIcons): string;
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
    wciTarget: result := 'ads_click';
    wciNorthEast: result := 'north_east';
    wciPriceCheck: result := 'price_check';
    wciStoreFront: result := 'storefront';
    wciInventory_2: result := 'inventory_2';
    wciCategory: result := 'category';
    wciFunctions: result := 'functions';
    wciEqualizer: result := 'equalizer';
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

function EnumWebCardIconsTypeToFileName(AValue: EnumWebCardIcons): string;
begin
  result := '';

  case AValue of
    wciBitcoin: result := 'currency_bitcoin.png';
    wciMoney: result := 'attach_money.png';
    wciShoppingCart: result := 'shopping_cart.png';
    wciSell: result := 'sell.png';
    wciMonitoring: result := 'monitoring.png';
    wciFinance: result := 'finance.png';
    wciTarget: result := 'ads_click.png';
    wciNorthEast: result := 'north_east.png';
    wciPriceCheck: result := 'price_check.png';
    wciStoreFront: result := 'storefront.png';
    wciInventory_2: result := 'inventory_2.png';
    wciCategory: result := 'category.png';
    wciFunctions: result := 'functions.png';
    wciEqualizer: result := 'equalizer.png';
  end;
end;

end.
