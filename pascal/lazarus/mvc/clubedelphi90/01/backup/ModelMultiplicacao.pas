unit ModelMultiplicacao;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Multiplicacao;

type

  { TModelMultiplicacao }

  TModelMultiplicacao = class
  private
    FMultiplicacao: TMultiplicacao;
    procedure SetMultiplicacao(AValue: TMultiplicacao);
    procedure Initialize;
  public
    constructor Create; reintroduce;
    destructor Destroy; override;
    property Multiplicacao: TMultiplicacao read FMultiplicacao write SetMultiplicacao;
    function Multiplicar: Integer;
  end;

implementation

{ TModelMultiplicacao }

procedure TModelMultiplicacao.SetMultiplicacao(AValue: TMultiplicacao);
begin
  FMultiplicacao := AValue;
end;

procedure TModelMultiplicacao.Initialize;
begin
  Multiplicacao := TMultiplicacao.Create;

  Multiplicacao.Valor1 := 0;
  Multiplicacao.Valor2 := 0;
  Multiplicacao.Solucao := 0;
end;

constructor TModelMultiplicacao.Create;
begin
  Initialize;
end;

destructor TModelMultiplicacao.Destroy;
begin
  Multiplicacao.Free;
  inherited Destroy;
end;

function TModelMultiplicacao.Multiplicar: Integer;
begin
  Result := Multiplicacao.Valor1 * Multiplicacao.Valor2;

  Multiplicacao.Solucao := Result;
end;

end.

