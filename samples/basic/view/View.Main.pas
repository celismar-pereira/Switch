unit View.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Control.Switch;

type
  TViewMain = class(TForm)
    swDefault: TSwitch;
    lblText: TLabel;
    swAlter: TSwitch;
    btnCheck: TButton;
    btnCheckStateOther: TButton;
    procedure swDefaultChangeState(Sender: TObject);
    procedure btnCheckClick(Sender: TObject);
    procedure btnCheckStateOtherClick(Sender: TObject);
  end;

var
  ViewMain: TViewMain;

implementation

{$R *.dfm}

procedure TViewMain.btnCheckClick(Sender: TObject);
begin
  if swAlter.IsOn then
    ShowMessage('On')
  else
    ShowMessage('Off');
end;

procedure TViewMain.btnCheckStateOtherClick(Sender: TObject);
begin
  case swAlter.State of
    TSwitchState.tsOn:
      ShowMessage('On');
    TSwitchState.tsOff:
      ShowMessage('Off');
  end;
end;

procedure TViewMain.swDefaultChangeState(Sender: TObject);
var
  lSwitch: TSwitch absolute Sender;
begin
  case lSwitch.State of
    TSwitchState.tsOn:
      lblText.Caption := 'Ligado';
    TSwitchState.tsOff:
      lblText.Caption := 'Desligado';
  end;
end;

end.
