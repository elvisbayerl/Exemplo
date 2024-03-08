unit UnitContato;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBCtrls, DataPrincipal;

type

  { TFrmContato }

  TFrmContato = class(TForm)
    BtnSalvar: TButton;
    BtnCancelar: TButton;
    EdtNome: TDBEdit;
    EdtTelefone: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
  private

  public

  end;

var
  FrmContato: TFrmContato;

implementation

{$R *.lfm}

{ TFrmContato }

procedure TFrmContato.BtnCancelarClick(Sender: TObject);
begin
  DMPrincipal.QryContato.CancelUpdates;
  Close;
end;

procedure TFrmContato.BtnSalvarClick(Sender: TObject);
begin
  if Trim(EdtNome.Text) = '' then
  begin
    ShowMessage('Nome do contato inválido');
    Exit;
  end;

  DMPrincipal.QryContato.Post;
  DMPrincipal.QryContato.ApplyUpdates;
  DMPrincipal.QryContato.Refresh;
  Close;
end;

end.
