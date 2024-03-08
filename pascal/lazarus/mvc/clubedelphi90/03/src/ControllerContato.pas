unit ControllerContato;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, MVCInterfaces, ModelContato;

type
  IControllerContato = interface(IController)
    ['{E9957826-5469-4D37-8EC4-57BC88AAAB4F}']

    procedure LocalizarPorNome(Nome: String);
    procedure Inserir;
    procedure Excluir;
    procedure Editar;
    procedure Salvar;
    procedure Cancelar;
    procedure Initialize;

    function GetModel: IModelContato;
    function GetView: IView;
    procedure SetModel(const Value: IModelContato);
    procedure SetView(const Value: IView);

    property Model: IModelContato read GetModel write SetModel;
    property View: IView read GetView write SetView;
  end;

  { TControllerContato }

  TControllerContato = class(TInterfacedObject, IControllerContato)
  private
    FModel: IModelContato;
    FView: IView;
    function GetModel: IModelContato;
    function GetView: IView;
    procedure SetModel(const Value: IModelContato);
    procedure SetView(const Value: IView);
  public
    procedure LocalizarPorNome(Nome: String);
    procedure Inserir;
    procedure Excluir;
    procedure Editar;
    procedure Salvar;
    procedure Cancelar;
    procedure Initialize;

    property Model: IModelContato read GetModel write SetModel;
    property View: IView read GetView write SetView;
  end;

implementation

{ TControllerContato }

function TControllerContato.GetModel: IModelContato;
begin
  Result := FModel;
end;

function TControllerContato.GetView: IView;
begin
  Result := FView;
end;

procedure TControllerContato.SetModel(const Value: IModelContato);
begin
  FModel := Value;
end;

procedure TControllerContato.SetView(const Value: IView);
begin
  FView  := Value;
end;

procedure TControllerContato.LocalizarPorNome(Nome: String);
begin
  FModel.LocalizarPorNome(Nome);
end;

procedure TControllerContato.Inserir;
begin
  FModel.Inserir;
end;

procedure TControllerContato.Excluir;
begin
  FModel.Excluir;
end;

procedure TControllerContato.Editar;
begin
  FModel.Editar;
end;

procedure TControllerContato.Salvar;
begin
  FModel.Salvar;
end;

procedure TControllerContato.Cancelar;
begin
  FModel.Cancelar;
end;

procedure TControllerContato.Initialize;
begin
  FModel.Initialize;
end;

end.
