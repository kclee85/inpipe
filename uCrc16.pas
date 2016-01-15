unit uCrc16;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

const
  POLYNOMIAL = $8005;
type
  PBYTE = ^Byte;

{$M+}
type
  TCRC16 = Class
  private
    CRCTable16 : Array[0..255] of Word;
  public
    procedure GensCrcTable;
    function ComputeChecksum(const pData: Pointer; nLength: Integer): Word;
  published
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
  End;

var
  CRC16 : TCRC16;

implementation
//---------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------
constructor TCRC16.Create(AOwner: TComponent);
begin
  GensCrcTable;
end;

destructor TCRC16.Destroy;
begin

  inherited;
end;
//---------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------
procedure TCRC16.GensCrcTable;
var
  i, j : Word;
  nCRC : Word;
begin
  for i := 0 to 255 do
  begin
    nCRC := (i shl 8);

    for j := 0 to 7 do
    begin
      if (nCRC and $8000) = $8000 then
      begin
        nCRC := (nCRC shl 1) xor POLYNOMIAL;
      end else
      begin
        nCRC := nCRC shl 1;
      end;
    end;

    CRCTable16[i] := nCRC;
  end;
end;

function TCRC16.ComputeChecksum(const pData: Pointer; nLength: Integer): Word;
var
  nCRC : Word;
  nIndex : Word;
  p: PBYTE;
begin
  p := PBYTE(PData);
  nCRC := 0;
  while (nLength > 0) do
  begin
    nIndex := ((nCRC shr 8) xor p^);
    nCRC := (nCRC shl 8) xor CRCTable16[nIndex];
    Dec(nLength);
    Inc(p);
  end;
  result := nCRC;
end;

end.
