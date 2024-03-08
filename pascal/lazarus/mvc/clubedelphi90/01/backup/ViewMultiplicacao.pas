unit ViewMultiplicacao;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ModelMultiplicacao;

type
  { TFrmMultiplicacao }

  TFrmMultiplicacao = class(TForm)
    BtnCalcular: TButton;
    EdtValor1: TEdit;
    EdtValor2: TEdit;
    EdtSolucao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure BtnCalcularClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FModel: TModelMultiplicacao;
    procedure SetModel(AValue: TModelMultiplicacao);
  public
    procedure Initiliaze;
    property Model: TModelMultiplicacao read FModel write SetModel;
  end;

var
  FrmMultiplicacao: TFrmMultiplicacao;

implementation

{$R *.lfm}

{ TFrmMultiplicacao }

procedure TFrmMultiplicacao.BtnCalcularClick(Sender: TObject);
begin
  Model.Multiplicacao.Valor1 := StrToInt(EdtValor1.Text);
  Model.Multiplicacao.Valor2 := StrToInt(EdtValor2.Text);
  EdtSolucao.Text := IntToStr(Model.Multiplicar);
end;

procedure TFrmMultiplicacao.FormCreate(Sender: TObject);
begin
  Model := TModelMultiplicacao.Create;
end;

procedure TFrmMultiplicacao.FormDestroy(Sender: TObject);
begin
  Model.Free;
end;

procedure TFrmMultiplicacao.SetModel(AValue: TModelMultiplicacao);
begin
  FModel := AValue;
end;

procedure TFrmMultiplicacao.Initiliaze;
begin
  EdtValor1.Text := IntToStr(Model.Multiplicacao.Valor1);
  EdtValor2.Text := IntToStr(Model.Multiplicacao.Valor2);
  EdtSolucao.Text := IntToStr(Model.Multiplicacao.Solucao);
end;

//procedure TFrmMultiplicacao.ModelChanged;
//begin
//  //Model.OnModelChanged := ModelChanged;
//  Initiliaze;
//  //ShowModal;
//end;

end.
