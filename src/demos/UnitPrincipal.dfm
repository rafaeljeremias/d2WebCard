object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  DesignSize = (
    624
    441)
  TextHeight = 15
  object Memo1: TMemo
    Left = 0
    Top = 8
    Width = 623
    Height = 393
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 548
    Top = 408
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Gerar'
    TabOrder = 1
    OnClick = Button1Click
  end
end
