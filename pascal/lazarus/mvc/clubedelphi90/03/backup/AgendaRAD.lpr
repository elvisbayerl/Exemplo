program AgendaRAD;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, memdslaz, zcomponent, UnitPrincipal, DataPrincipal, UnitContato, 
MVCInterfaces, ModelContato, ControllerContato
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Scaled := True;
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDMPrincipal, DMPrincipal);
  Application.Run;
end.

