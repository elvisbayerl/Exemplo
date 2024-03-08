unit UnitPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBGrids,
  DataPrincipal, UnitContato, LCLType, MVCInterfaces, ControllerContato, ModelContato;

type

  { TFrmPrincipal }

  TFrmPrincipal = class(TForm)
    BtnIncluir: TButton;
    BtnEditar: TButton;
    BtnExcluir: TButton;
    DBGrid1: TDBGrid;
    EdtBusca: TEdit;
    Label1: TLabel;
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure EdtBuscaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    FController: IControllerContato;
    procedure SetController(AValue: IControllerContato);

    procedure CMDialogKey(Var msg: TCMDialogKey); message CM_DIALOGKEY;

    procedure Initalize;
  public
    property Controller: IControllerContato read FController write SetController;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.lfm}

{ TFrmPrincipal }

procedure TFrmPrincipal.EdtBuscaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_TAB) then
  begin
    try
      Controller.LocalizarPorNome(EdtBusca.Text);
    except
      on e: EQuantidadeCaracteresInvalidos do
      begin
        ShowMessage(e.Message);
        EdtBusca.SetFocus;
      end;
    end;
  end;
end;

procedure TFrmPrincipal.BtnIncluirClick(Sender: TObject);
begin
  FrmContato := TFrmContato.Create(nil);
  try
    Controller.Inserir;
    FrmContato.Controller := Controller;
    FrmContato.ShowModal;
  finally
    FreeAndNil(FrmContato);
  end;
end;

procedure TFrmPrincipal.BtnEditarClick(Sender: TObject);
begin
  FrmContato := TFrmContato.Create(nil);
  try
    Controller.Editar;
    FrmContato.Controller := Self.Controller;
    FrmContato.ShowModal;
  finally
    FreeAndNil(FrmContato);
  end;
end;

procedure TFrmPrincipal.BtnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma exclusão do contato ?', 'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
  begin
    Controller.Excluir;
  end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  Self.Initalize;
end;

procedure TFrmPrincipal.CMDialogKey(var msg: TCMDialogKey);
begin
  if msg.CharCode <> VK_TAB then
  begin
    inherited;
  end;
end;

procedure TFrmPrincipal.Initalize;
var
  lModel: TModelContato;
begin
  lModel := TModelContato.Create;
  Controller := TControllerContato.Create;
  Controller.Model := lModel;
  //Controller.View := Self;
  Controller.Initialize;
end;

procedure TFrmPrincipal.SetController(AValue: IControllerContato);
begin
  FController := AValue;
end;

end.
