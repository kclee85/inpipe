unit uModules;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  uDispModule, fmParaModule,

  uConst;
type
  TModuleItem = packed record
    bConnected : Boolean;
    DispModule : TFormDispModule;
    ParaModule : TFormParaModule;
  end;

{$M+}
type
  TModules = class
  private
  protected
  public
    Forms : Array[1.. MODULE_COUNT] of TModuleItem;
  published
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
  end;

var
  Modules : TModules;

implementation

{ TModules }

constructor TModules.Create(AOwner: TComponent);
begin
end;

destructor TModules.Destroy;
begin

  inherited;
end;

end.
