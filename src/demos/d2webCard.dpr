program d2webCard;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {Form1},
  Model.Interfaces in '..\Model.Interfaces.pas',
  Model.Entities.CardData in '..\Model.Entities.CardData.pas',
  Model.Card in '..\Model.Card.pas',
  Model.Utils in '..\Model.Utils.pas',
  Model in '..\Model.pas',
  Model.Entities in '..\Model.Entities.pas',
  Model.Entities.CardDataStr in '..\Model.Entities.CardDataStr.pas',
  Model.Entities.CardDataDouble in '..\Model.Entities.CardDataDouble.pas',
  Model.Entities.CardDataIcon in '..\Model.Entities.CardDataIcon.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
