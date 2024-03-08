unit ViewPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ViewMultiplicacao;

type

  { TFrmPrincipal }

  TFrmPrincipal = class(TForm)
    BtnCarregarController: TButton;
    procedure BtnCarregarControllerClick(Sender: TObject);
  private

  public

  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.lfm}

{ TFrmPrincipal }

procedure TFrmPrincipal.BtnCarregarControllerClick(Sender: TObject);
var
  lController: TFrmMultiplicacao;
begin
  lController := TFrmMultiplicacao.Create(nil);
  lController.Initiliaze;
  lController.ShowModal;
  lController.Free;
end;

end.

