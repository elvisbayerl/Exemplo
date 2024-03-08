unit DataPrincipal;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, BufDataset, dbf, memds, ZConnection, ZDataset;

type

  { TDMPrincipal }

  TDMPrincipal = class(TDataModule)
    BDContato: TBufDataset;
    Connection: TZConnection;
    DSContato: TDataSource;
    QryContato: TZQuery;
    QryContatoID_CONTATO: TLongintField;
    QryContatoNOME: TStringField;
    QryContatoTELEFONE: TStringField;
  private

  public

  end;

var
  DMPrincipal: TDMPrincipal;

implementation

{$R *.lfm}

end.

