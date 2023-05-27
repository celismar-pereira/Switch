unit Vcl.Control.Switch;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Graphics;

type
  {$SCOPEDENUMS ON}
  TSwitchState = (tsOn, tsOff);
  {$SCOPEDENUMS ON}

  TSwitch = class(TCustomControl)
  private
    FSwitchState: TSwitchState;
    FColorFrame: TColor;
    FColorTrumb: TColor;
    FOnChangeState: TNotifyEvent;
  private
    procedure SetSwitchState(const AValue: TSwitchState);
    procedure ToggleSwitchState;
    procedure SetColorFrame(const AValue: TColor);
    procedure SetColorTrumb(const AValue: TColor);
  protected
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure DoChange;
  public
    constructor Create(AOwner: TComponent); override;
    function IsOn: Boolean;
  published
    property ColorFrame: TColor read FColorFrame write SetColorFrame default clHighlight;
    property ColorTrumb: TColor read FColorTrumb write SetColorTrumb default clWhite;
    property State: TSwitchState read FSwitchState write SetSwitchState default TSwitchState.tsOff;
    property OnChangeState: TNotifyEvent read FOnChangeState write FOnChangeState;
  end;

procedure Register;

implementation

const
  DefaultWidth = 40;
  DefaultHeight = 20;

procedure Register;
begin
  RegisterComponents('UI', [TSwitch]);
end;

{ TSwitch }

constructor TSwitch.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width := DefaultWidth;
  Height := DefaultHeight;
  FSwitchState := TSwitchState.tsOff;
  FColorFrame := clHighlight;
  FColorTrumb := clWhite;
end;

function TSwitch.IsOn: Boolean;
begin
  Result := FSwitchState = TSwitchState.tsOn;
end;

procedure TSwitch.Paint;
var
  lRect: TRect;
  lAxisX: Integer;
  lThumbSize: Integer;
begin
  Canvas.Brush.Color := Color;
  Canvas.FillRect(ClientRect);

  lRect := ClientRect;

  Canvas.Brush.Color := FColorFrame;
  Canvas.Pen.Style := psClear;
  Canvas.RoundRect(lRect.Left, lRect.Top, lRect.Right, lRect.Bottom, lRect.Height, lRect.Height);

  lThumbSize := Height - 4;
  lAxisX := 2;
  if FSwitchState = TSwitchState.tsOn then
    lAxisX := Width - (lRect.Height div 2) - (lThumbSize div 2) - 2;

  Canvas.Brush.Color := FColorTrumb;
  Canvas.Pen.Style := psClear;
  Canvas.Ellipse(lAxisX, 2, lAxisX + lThumbSize + 2, Height - 2);
end;

procedure TSwitch.DoChange;
begin
  if not (csDesigning in ComponentState) and not (csLoading in ComponentState) then
    if Assigned(FOnChangeState) then
      FOnChangeState(Self);
end;

procedure TSwitch.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbLeft then
    ToggleSwitchState;
end;

procedure TSwitch.ToggleSwitchState;
begin
  if FSwitchState = TSwitchState.tsOn then
    FSwitchState := TSwitchState.tsOff
  else
    FSwitchState := TSwitchState.tsOn;

  Invalidate;
  DoChange;
end;

procedure TSwitch.SetColorFrame(const AValue: TColor);
begin
  if FColorFrame <> AValue then
  begin
    FColorFrame := AValue;
    Repaint;
  end;
end;

procedure TSwitch.SetColorTrumb(const AValue: TColor);
begin
  if FColorTrumb <> AValue then
  begin
    FColorTrumb := AValue;
    Repaint;
  end;
end;

procedure TSwitch.SetSwitchState(const AValue: TSwitchState);
begin
  if FSwitchState <> AValue then
  begin
    FSwitchState := AValue;
    ToggleSwitchState;
  end;
end;

end.
