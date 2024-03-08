unit ModelContato;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DataPrincipal, MVCInterfaces;

type
  IModelContato = interface(IModel)
    ['{1A955B8D-27E6-4DD3-8B1C-A204E8FB12D6}']
    procedure LocalizarPorNome(Nome: String);
    procedure Inserir;
    procedure Excluir;
    procedure Editar;
    procedure Salvar;
    procedure Cancelar;
  end;

  { TModelContato }

  TModelContato = class(TInterfacedObject, IModelContato)
  public
    procedure LocalizarPorNome(Nome: String);
    procedure Inserir;
    procedure Excluir;
    procedure Editar;
    procedure Salvar;
    procedure Cancelar;
    procedure Initialize;
  end;

  EQuantidadeCaracteresInvalidos = class(Exception);
  EDadosInvalidos = class(Exception);

implementation

{ TModelContato }

procedure TModelContato.LocalizarPorNome(Nome: String);
begin
  if (Length(Trim(Nome)) >= 3) then
  begin
    DMPrincipal.QryContato.Close;
    DMPrincipal.QryContato.SQL.Clear;
    DMPrincipal.QryContato.SQL.Add('select ID_CONTATO,             ');
    DMPrincipal.QryContato.SQL.Add('       NOME,                   ');
    DMPrincipal.QryContato.SQL.Add('       TELEFONE                ');
    DMPrincipal.QryContato.SQL.Add('  from CONTATO                 ');
    DMPrincipal.QryContato.SQL.Add(' where NOME starting with :NOME');
    DMPrincipal.QryContato.SQL.Add(' order by NOME                 ');
    DMPrincipal.QryContato.ParamByName('NOME').AsString := Nome;
    DMPrincipal.QryContato.Open;
  end
  else
  begin
    if Trim(Nome) = '' then
    begin
      Self.Initialize;
    end
    else
    begin
      raise EQuantidadeCaracteresInvalidos.Create('Para realizar a busca você deve informar no mínimo 3 caracteres');
    end;
  end;
end;

procedure TModelContato.Inserir;
begin
  DMPrincipal.QryContato.Append;
end;

procedure TModelContato.Excluir;
begin
  DMPrincipal.QryContato.Delete;
  DMPrincipal.QryContato.ApplyUpdates;
end;

procedure TModelContato.Editar;
begin
  DMPrincipal.QryContato.Edit;
end;

procedure TModelContato.Salvar;
begin
  if Trim(DMPrincipal.QryContato.FieldByName('NOME').AsString) = '' then
  begin
    raise EDadosInvalidos.Create('Nome do contato inválido');
  end;

  DMPrincipal.QryContato.Post;
  DMPrincipal.QryContato.ApplyUpdates;
  //DMPrincipal.QryContato.Refresh;
end;

procedure TModelContato.Cancelar;
begin
  DMPrincipal.QryContato.CancelUpdates;
end;

procedure TModelContato.Initialize;
begin
  DMPrincipal.QryContato.Close;
  DMPrincipal.QryContato.SQL.Clear;
  DMPrincipal.QryContato.SQL.Add('select ID_CONTATO,             ');
  DMPrincipal.QryContato.SQL.Add('       NOME,                   ');
  DMPrincipal.QryContato.SQL.Add('       TELEFONE                ');
  DMPrincipal.QryContato.SQL.Add('  from CONTATO                 ');
  DMPrincipal.QryContato.SQL.Add(' order by NOME                 ');
  DMPrincipal.QryContato.Open;
end;

end.
