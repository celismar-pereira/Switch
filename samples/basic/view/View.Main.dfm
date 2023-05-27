object ViewMain: TViewMain
  Left = 0
  Top = 0
  Caption = 'ViewMain'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblText: TLabel
    Left = 101
    Top = 27
    Width = 3
    Height = 13
  end
  object swDefault: TSwitch
    Left = 48
    Top = 24
    Width = 40
    Height = 20
    OnChangeState = swDefaultChangeState
  end
  object swAlter: TSwitch
    Left = 48
    Top = 176
    Width = 70
    Height = 30
    ColorFrame = clLime
    State = tsOn
  end
  object btnCheck: TButton
    Left = 40
    Top = 224
    Width = 89
    Height = 25
    Caption = 'Check State'
    TabOrder = 2
    OnClick = btnCheckClick
  end
  object btnCheckStateOther: TButton
    Left = 40
    Top = 255
    Width = 89
    Height = 25
    Caption = 'Check State'
    TabOrder = 3
    OnClick = btnCheckStateOtherClick
  end
end
