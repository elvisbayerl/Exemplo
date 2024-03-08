unit MVCInterfaces;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  IModel = interface
    ['{C231F13C-1DCC-4685-B6F8-13CB2FE1241F}']
    procedure Initialize;
  end;

  IController = interface
    ['{B2C05A98-607A-4A94-A227-1415C2AC2916}']
    procedure Initialize;
  end;


    IView = interface
      ['{23B4E47E-ECFF-4B9F-87A3-D80555D10DB0}']
      procedure Initialize;
    end;

implementation

end.
