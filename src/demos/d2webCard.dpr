program d2webCard;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {Form1},
  WebCard.Model.Interfaces in '..\WebCard.Model.Interfaces.pas',
  WebCard.Model.Entities.CardData in '..\WebCard.Model.Entities.CardData.pas',
  WebCard.Model.Card in '..\WebCard.Model.Card.pas',
  WebCard.Model.Utils in '..\WebCard.Model.Utils.pas',
  WebCard.Model in '..\WebCard.Model.pas',
  WebCard.Model.Entities in '..\WebCard.Model.Entities.pas',
  WebCard.Model.Entities.CardDataStr in '..\WebCard.Model.Entities.CardDataStr.pas',
  WebCard.Model.Entities.CardDataDouble in '..\WebCard.Model.Entities.CardDataDouble.pas',
  WebCard.Model.Entities.CardDataIcon in '..\WebCard.Model.Entities.CardDataIcon.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
