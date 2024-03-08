unit Multiplicacao;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TMultiplicacao }

  TMultiplicacao = class
  private
    FSolucao: integer;
    FValor1: integer;
    FValor2: integer;
    procedure SetSolucao(AValue: integer);
    procedure SetValor1(AValue: integer);
    procedure SetValor2(AValue: integer);
  public
    property Valor1: integer read FValor1 write SetValor1;
    property Valor2: integer read FValor2 write SetValor2;
    property Solucao: integer read FSolucao write SetSolucao;
  end;

implementation

{ TMultiplicacao }

procedure TMultiplicacao.SetValor1(AValue: integer);
begin

end;

procedure TMultiplicacao.SetValor2(AValue: integer);
begin

end;

procedure TMultiplicacao.SetSolucao(AValue: integer);
begin

end;

end.
