unit UnitPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBGrids, DataPrincipal, UnitContato, LCLType;

type

  { TFrmPrincipal }

  TFrmPrincipal = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid1: TDBGrid;
    EdtBusca: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure EdtBuscaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.lfm}

{ TFrmPrincipal }

procedure TFrmPrincipal.EdtBuscaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    DMPrincipal.QryContato.Close;
    DMPrincipal.QryContato.SQL.Clear;
    DMPrincipal.QryContato.SQL.Add('select ID_CONTATO,             ');
    DMPrincipal.QryContato.SQL.Add('       NOME,                   ');
    DMPrincipal.QryContato.SQL.Add('       TELEFONE                ');
    DMPrincipal.QryContato.SQL.Add('  from CONTATO                 ');
    DMPrincipal.QryContato.SQL.Add(' where NOME starting with :NOME');
    DMPrincipal.QryContato.SQL.Add(' order by NOME                 ');
    DMPrincipal.QryContato.ParamByName('NOME').AsString := EdtBusca.Text;
    DMPrincipal.QryContato.Open;
  end
  else
  begin
    if Trim(EdtBusca.Text) = '' then
    begin
      DMPrincipal.QryContato.Close;
      DMPrincipal.QryContato.SQL.Clear;
      DMPrincipal.QryContato.SQL.Add('select ID_CONTATO,             ');
      DMPrincipal.QryContato.SQL.Add('       NOME,                   ');
      DMPrincipal.QryContato.SQL.Add('       TELEFONE                ');
      DMPrincipal.QryContato.SQL.Add('  from CONTATO                 ');
      DMPrincipal.QryContato.SQL.Add(' order by NOME                 ');
      DMPrincipal.QryContato.ParamByName('NOME').AsString := EdtBusca.Text;
      DMPrincipal.QryContato.Open;
    end
    else
    begin
      ShowMessage('Para realizar a busca você deve informar no mínimo 3 caracteres');
      EdtBusca.SetFocus;
    end;
  end;
end;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
  FrmContato := TFrmContato.Create(nil);
  try
    DMPrincipal.QryContato.Append;
    FrmContato.ShowModal;
  finally
    FreeAndNil(FrmContato);
  end;
end;

procedure TFrmPrincipal.Button2Click(Sender: TObject);
begin
  FrmContato := TFrmContato.Create(nil);
  try
    DMPrincipal.QryContato.Edit;
    FrmContato.ShowModal;
  finally
    FreeAndNil(FrmContato);
  end;
end;

procedure TFrmPrincipal.Button3Click(Sender: TObject);
begin
  if Application.MessageBox('Confirma exclusão do contato ?', 'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
  begin
    DMPrincipal.QryContato.Delete;
    DMPrincipal.QryContato.ApplyUpdates;
  end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  DMPrincipal.QryContato.Open;
end;

end.
