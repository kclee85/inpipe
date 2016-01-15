unit uID;

interface
uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IniFiles,

  uConst, uVariable;

type
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//ID
  TMODULE_ID = packed record
    MODULE_CAMERA_FRONT	: Byte;
    MODULE_DRIVING_1		: Byte;
    MODULE_BATTERY_1		: Byte;
    MODULE_PUMP		      : Byte;
    MODULE_NDE  		    : Byte;
    MODULE_BATTERY_2		: Byte;
    MODULE_DRIVING_2  	: Byte;
    MODULE_CAMERA_REAR	: Byte;
    MODULE_RF_1	        : Byte;
    MODULE_RF_2	        : Byte;
  end;

  TPSD_ID = packed record
    PSD_FRONT_RIGHT   : Byte;
    PSD_FRONT_LEFT    : Byte;
    PSD_FRONT_UP      : Byte;
    PSD_FRONT_DOWN    : Byte;
    PSD_BACK_RIGHT    : Byte;
    PSD_BACK_LEFT     : Byte;
    PSD_BACK_UP       : Byte;
    PSD_BACK_DOWN     : Byte;
    PSD_EX_RIGHT      : Byte;
    PSD_EX_LEFT       : Byte;
    PSD_EX_UP         : Byte;
    PSD_EX_DOWN       : Byte;
    PSD_WHEEL_UD      : Byte;
    PSD_WHEEL_RL      : Byte;
  end;

  TMOTOR_ID = packed record
    MOTOR_UWHEEL    : Byte;
    MOTOR_RWHEEL    : Byte;
    MOTOR_LWHEEL    : Byte;
    MOTOR_DWHEEL    : Byte;
    MOTOR_PITCH     : Byte;
    MOTOR_YAW       : Byte;
    MOTOR_EXTRA     : Byte;
  end;

  TABS_ID = packed record
    ABS_PITCH     	: Byte;
    ABS_YAW       	: Byte;
    ABS_EXTRA	      : Byte;
  end;
type

  TIds = packed record
    nMode : Byte;
    rModuleID : TMODULE_ID;
    rPsdID : Array[1..MODULE_COUNT] of TPSD_ID;
    rMotorID : Array[1..MODULE_COUNT] of TMOTOR_ID;
    rAbsID : Array[1..MODULE_COUNT] of TABS_ID;
  end;

{$M+}
type
  TID = class
  private
  public
    rIds : TIds;
    procedure Initial_Ids;
  published
  end;

var
  ID : TID;

implementation
{ TID }

procedure TID.Initial_Ids;
var
  nDeviceID : Integer;
  sModuleName : string;
  h_IniFile : TIniFile;
begin
  h_IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + '/Initialize/Initialize.ini');

  Variable.rInitialize.nHigh_Port     := h_IniFile.ReadInteger('COMM','HIGH_PORT',3000);
  Variable.rInitialize.nKNR_Port   := h_IniFile.ReadInteger('COMM','KNR_PORT',4001);

  Variable.rInitialize.sHigh_IP       := h_IniFile.ReadString('COMM','HIGH_IP','127.0.0.1');
  Variable.rInitialize.sKNR_IP     := h_IniFile.ReadString('COMM','KNR_IP','127.0.0.1');

  rIds.rModuleID.MODULE_CAMERA_FRONT  := h_IniFile.ReadInteger('MODULE_ID','MODULE_CAMERA_FRONT',1);
  rIds.rModuleID.MODULE_DRIVING_1     := h_IniFile.ReadInteger('MODULE_ID','MODULE_DRIVING_1',2);
  rIds.rModuleID.MODULE_BATTERY_1     := h_IniFile.ReadInteger('MODULE_ID','MODULE_BATTERY_1',3);
  rIds.rModuleID.MODULE_PUMP          := h_IniFile.ReadInteger('MODULE_ID','MODULE_PUMP',4);
  rIds.rModuleID.MODULE_NDE           := h_IniFile.ReadInteger('MODULE_ID','MODULE_NDE',5);
  rIds.rModuleID.MODULE_BATTERY_2     := h_IniFile.ReadInteger('MODULE_ID','MODULE_BATTERY_2',6);
  rIds.rModuleID.MODULE_DRIVING_2     := h_IniFile.ReadInteger('MODULE_ID','MODULE_DRIVING_2',7);
  rIds.rModuleID.MODULE_CAMERA_REAR   := h_IniFile.ReadInteger('MODULE_ID','MODULE_CAMERA_REAR',8);
  rIds.rModuleID.MODULE_RF_1          := h_IniFile.ReadInteger('MODULE_ID','MODULE_RF_1',9);
  rIds.rModuleID.MODULE_RF_2          := h_IniFile.ReadInteger('MODULE_ID','MODULE_RF_2',10);

  for nDeviceID := 1 to MODULE_COUNT do
  begin
    if ID.rIds.rModuleID.MODULE_CAMERA_FRONT	= nDeviceID then sModuleName := 'MODULE_CAMERA_FRONT'
    else if ID.rIds.rModuleID.MODULE_DRIVING_1		= nDeviceID then sModuleName := 'MODULE_DRIVING_1'
    else if ID.rIds.rModuleID.MODULE_BATTERY_1		= nDeviceID then sModuleName := 'MODULE_BATTERY_1'
    else if ID.rIds.rModuleID.MODULE_PUMP		      = nDeviceID then sModuleName := 'MODULE_PUMP'
    else if ID.rIds.rModuleID.MODULE_NDE  		    = nDeviceID then sModuleName := 'MODULE_NDE'
    else if ID.rIds.rModuleID.MODULE_DRIVING_2  	= nDeviceID then sModuleName := 'MODULE_DRIVING_2'
    else if ID.rIds.rModuleID.MODULE_BATTERY_2		= nDeviceID then sModuleName := 'MODULE_BATTERY_2'
    else if ID.rIds.rModuleID.MODULE_CAMERA_REAR	= nDeviceID then sModuleName := 'MODULE_CAMERA_REAR'
    else if ID.rIds.rModuleID.MODULE_RF_1		      = nDeviceID then sModuleName := 'MODULE_RF_1'
    else if ID.rIds.rModuleID.MODULE_RF_2	        = nDeviceID then sModuleName := 'MODULE_RF_2';

    rIds.rMotorID[nDeviceID].MOTOR_PITCH           := h_IniFile.ReadInteger('MOTOR_ID_' + sModuleName,'MOTOR_PITCH',1);
    rIds.rMotorID[nDeviceID].MOTOR_YAW             := h_IniFile.ReadInteger('MOTOR_ID_' + sModuleName,'MOTOR_YAW',2);
    rIds.rMotorID[nDeviceID].MOTOR_EXTRA           := h_IniFile.ReadInteger('MOTOR_ID_' + sModuleName,'MOTOR_EXTRA',7);
    rIds.rMotorID[nDeviceID].MOTOR_RWHEEL          := h_IniFile.ReadInteger('MOTOR_ID_' + sModuleName,'MOTOR_RWHEEL',3);
    rIds.rMotorID[nDeviceID].MOTOR_LWHEEL          := h_IniFile.ReadInteger('MOTOR_ID_' + sModuleName,'MOTOR_LWHEEL',4);
    rIds.rMotorID[nDeviceID].MOTOR_UWHEEL          := h_IniFile.ReadInteger('MOTOR_ID_' + sModuleName,'MOTOR_UWHEEL',5);
    rIds.rMotorID[nDeviceID].MOTOR_DWHEEL          := h_IniFile.ReadInteger('MOTOR_ID_' + sModuleName,'MOTOR_DWHEEL',6);

    rIds.rPsdID[nDeviceID].PSD_FRONT_RIGHT         := h_IniFile.ReadInteger('PSD_ID_' + sModuleName,'PSD_FRONT_RIGHT',1);
    rIds.rPsdID[nDeviceID].PSD_FRONT_LEFT          := h_IniFile.ReadInteger('PSD_ID_' + sModuleName,'PSD_FRONT_LEFT',2);
    rIds.rPsdID[nDeviceID].PSD_FRONT_UP            := h_IniFile.ReadInteger('PSD_ID_' + sModuleName,'PSD_FRONT_UP',3);
    rIds.rPsdID[nDeviceID].PSD_FRONT_DOWN          := h_IniFile.ReadInteger('PSD_ID_' + sModuleName,'PSD_FRONT_DOWN',4);
    rIds.rPsdID[nDeviceID].PSD_BACK_RIGHT          := h_IniFile.ReadInteger('PSD_ID_' + sModuleName,'PSD_BACK_RIGHT',5);
    rIds.rPsdID[nDeviceID].PSD_BACK_LEFT           := h_IniFile.ReadInteger('PSD_ID_' + sModuleName,'PSD_BACK_LEFT',6);
    rIds.rPsdID[nDeviceID].PSD_BACK_UP             := h_IniFile.ReadInteger('PSD_ID_' + sModuleName,'PSD_BACK_UP',7);
    rIds.rPsdID[nDeviceID].PSD_BACK_DOWN           := h_IniFile.ReadInteger('PSD_ID_' + sModuleName,'PSD_BACK_DOWN',8);
    rIds.rPsdID[nDeviceID].PSD_EX_RIGHT            := h_IniFile.ReadInteger('PSD_ID_' + sModuleName,'PSD_EX_RIGHT',9);
    rIds.rPsdID[nDeviceID].PSD_EX_LEFT             := h_IniFile.ReadInteger('PSD_ID_' + sModuleName,'PSD_EX_LEFT',10);
    rIds.rPsdID[nDeviceID].PSD_EX_UP               := h_IniFile.ReadInteger('PSD_ID_' + sModuleName,'PSD_EX_UP',11);
    rIds.rPsdID[nDeviceID].PSD_EX_DOWN             := h_IniFile.ReadInteger('PSD_ID_' + sModuleName,'PSD_EX_DOWN',12);
    rIds.rPsdID[nDeviceID].PSD_WHEEL_UD            := h_IniFile.ReadInteger('PSD_ID_' + sModuleName,'PSD_WHEEL_UD',13);
    rIds.rPsdID[nDeviceID].PSD_WHEEL_RL            := h_IniFile.ReadInteger('PSD_ID_' + sModuleName,'PSD_WHEEL_RL',14);

    rIds.rAbsID[nDeviceID].ABS_PITCH               := h_IniFile.ReadInteger('ABS_ID_' + sModuleName,'ABS_PITCH',1);
    rIds.rAbsID[nDeviceID].ABS_YAW                 := h_IniFile.ReadInteger('ABS_ID_' + sModuleName,'ABS_YAW',3);
    rIds.rAbsID[nDeviceID].ABS_EXTRA               := h_IniFile.ReadInteger('ABS_ID_' + sModuleName,'ABS_EXTRA',5);
  end;

  h_IniFile.Free;
end;

end.
