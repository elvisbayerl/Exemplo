unit UnitContato;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBCtrls, ControllerContato, ModelContato;

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
    FController: IControllerContato;
    procedure SetController(AValue: IControllerContato);
  public
    property Controller: IControllerContato read FController write SetController;
  end;

var
  FrmContato: TFrmContato;

implementation

{$R *.lfm}

{ TFrmContato }

procedure TFrmContato.BtnCancelarClick(Sender: TObject);
begin
  Controller.Cancelar;
  Close;
end;

procedure TFrmContato.BtnSalvarClick(Sender: TObject);
begin
  try
    Controller.Salvar;
    Close;
  except
    on e: EDadosInvalidos do
    begin
      ShowMessage('Nome do contato inválido');
      Exit;
    end;
  end;
end;

procedure TFrmContato.SetController(AValue: IControllerContato);
begin
  FController := AValue;
end;

end.
