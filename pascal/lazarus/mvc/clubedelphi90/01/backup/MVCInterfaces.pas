unit MVCInterfaces;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  TModelChangedEvent = procedure of object;

  IModel = interface
    ['{20778F5C-1848-4F1C-9777-E1882579DD49}']
    function GetOnModelChanged: TModelChangedEvent;
    procedure SetOnModelChanged(Value: TModelChangedEvent);
    property OnModelChanged: TModelChangedEvent read GetOnModelChanged write SetOnModelChanged;
    procedure Initialize;
  end;

  IView = interface
    ['{03296B3A-6F6B-4342-8B73-8D2625E9465E}']
    procedure Initialize;
  end;

  IController = interface
    ['{9420FC4B-4930-49D7-8511-9DF41DA37D54}']
    procedure Initialize;
  end;

implementation

end.
