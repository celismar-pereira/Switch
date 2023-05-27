program BasicSwitch;

uses
  Vcl.Forms,
  View.Main in 'view\View.Main.pas' {ViewMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewMain, ViewMain);
  Application.Run;
end.
