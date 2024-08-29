unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  WebCard.Model,
  WebCard.Model.Interfaces;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  LCardData: IWebCardModelEntitiesCardData;
begin
  LCardData := TWebCardModel.New.Entities
                 .CardData.Text('Valor do dia (R$)')
                   .Icon(wciMoney)
                   .Value(3054, wccDark, wccNone, True, wccWarning, wccDanger);

  Memo1.Lines.Text := TWebCardModel.New.Card(LCardData).Generate;
end;

end.
