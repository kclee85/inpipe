unit uVariable;

interface
uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IniFiles,

  uConst;
type
//////////////////////////////////////////////////////////////////////////////////////
/// Control Variable
//////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//Flag
  TFLAG_PARA  = packed record
    bParamH : Boolean;
    bParama0 : Boolean;
    bParama1 : Boolean;
    bParama2 : Boolean;
    bParama3 : Boolean;
    bParama4 : Boolean;
    bParama5 : Boolean;
    bParamVs : Boolean;
    bParamDel : Boolean;
    bParamKc : Boolean;
    bParamKcs : Boolean;
    bParamKcb : Boolean;
    bParamKp : Boolean;
    bParamKi : Boolean;
    bParamKd : Boolean;
    bParamPv : Boolean;
    bParamsgn : Boolean;
  end;

  TFLAG_SWITCH = packed record
    bMFL : Boolean;
    bLED : Boolean;
    bPump : Boolean;
    bPortOut : Boolean;
    bFrontJoint : Boolean;
    bBackJoint : Boolean;
    bRLWheel : Boolean;
    bUDWheel : Boolean;
  end;

  TFLAG_DATA = packed record
    bFlagMove : Boolean;
    bFlagMode : Boolean;
    rFlagSwitch : TFLAG_SWITCH;
    aFlagEnable : Array[MOTOR_MIN..MOTOR_MAX] of Boolean;
    aFlagMode : Array[MOTOR_MIN..MOTOR_MAX] of Boolean;
    aFlagPara : Array[MOTOR_MIN..MOTOR_MAX] of TFLAG_PARA;
  end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//Setup
  TSETUP_AXIS = packed record
    nDirection : Integer;
    nAbsDirection : Integer;
    fAbsOffset : Single;
    fAutoMaxJointDegree : Single;
    fStiffness : Single;
    fAutoPGain : Single;
    fAutoIGain : Single;
  end;

  TSCALE_OFFSET_PSD = packed record
    fScale : Single;
    fOffset : Single;
  end;

  TSETUP_AUTO_GEO = packed record
    fSpringConstant : Single;
    fOriginSpringLength : Single;
    fWeightCenterPosX : Single;
    fWeightCenterPosY : Single;
    aPSDxPosX : Array[0..3] of Single;
    aPSDxPosY : Array[0..3] of Single;
    aPSDxDirection : Array[0..3] of Single;
  end;

  TSETUP_DATA = packed record
     aSetupPSD : Array[1..PSD_COUNT] of TSCALE_OFFSET_PSD;
     aSetupAxis : Array[MOTOR_MIN..MOTOR_MAX] of TSETUP_AXIS;
     rSetupAutoGeo : TSETUP_AUTO_GEO;
  end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//Control
  TCTRL_PARAMETER_FLOAT = packed record
    nGetSet : Byte;
    fValue : Single;
  end;

  TCTRL_PARAMETER_INT = packed record
    nGetSet : Byte;
    nValue : Integer;
  end;

  TCTRL_AXIS_PARA_CMD = packed record
    ParamH : TCTRL_PARAMETER_FLOAT;
    Parama0 : TCTRL_PARAMETER_FLOAT;
    Parama1 : TCTRL_PARAMETER_FLOAT;
    Parama2 : TCTRL_PARAMETER_FLOAT;
    Parama3 : TCTRL_PARAMETER_FLOAT;
    Parama4 : TCTRL_PARAMETER_FLOAT;
    Parama5 : TCTRL_PARAMETER_FLOAT;
    ParamVs : TCTRL_PARAMETER_FLOAT;
    ParamDel : TCTRL_PARAMETER_FLOAT;
    ParamKc : TCTRL_PARAMETER_FLOAT;
    ParamKcs : TCTRL_PARAMETER_FLOAT;
    ParamKcb : TCTRL_PARAMETER_FLOAT;
    ParamKp : TCTRL_PARAMETER_FLOAT;
    ParamKi : TCTRL_PARAMETER_FLOAT;
    ParamKd : TCTRL_PARAMETER_FLOAT;
    ParamPv : TCTRL_PARAMETER_INT;
    Paramsgn : TCTRL_PARAMETER_FLOAT;
  end;

  TCTRL_REF_VALUE = packed record
    fPosition : Single;
    fVelocity : Single;
    fCurrent : Single;
  end;

  TCTRL_SWITCH = packed record
    bMFL : Boolean;
    bLED : Boolean;
    bPump : Boolean;
    bPortOut : Boolean;
    bFrontJoint : Boolean;
    bBackJoint : Boolean;
    bRLWheel : Boolean;
    bUDWheel : Boolean;
  end;

  TCTRL_AUTO_SUM_DATA = packed record
    fYaw : Single;
    fPitch : Single;
  end;

  TCTRL_DATA = packed record
    rCtrlAutoSumRatio : TCTRL_AUTO_SUM_DATA;
    rCtrlAutoSumError : TCTRL_AUTO_SUM_DATA;
    nCtrlMove : Byte;
    rCtrlSwitch : TCTRL_SWITCH;
    aCtrlEnable : Array[MOTOR_MIN..MOTOR_MAX] of Boolean;
    aCtrlMode : Array[MOTOR_MIN..MOTOR_MAX] of Byte;
    aCtrlRefVal : Array[MOTOR_MIN..MOTOR_MAX] of TCTRL_REF_VALUE;
    aCtrlPara : Array[MOTOR_MIN..MOTOR_MAX] of TCTRL_AXIS_PARA_CMD;
  end;
//------------------------------------------------------------------------------
  TCONTROL_DATA = packed record
    bGetAbsDiff : Boolean;
    rCtrlFlag : Array[1..MODULE_COUNT] of TFLAG_DATA;
    rSetupData : Array[1..MODULE_COUNT] of TSETUP_DATA;
    rCtrlData : Array[1..MODULE_COUNT] of TCTRL_DATA;
  end;
//------------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////
/// Display Variable
//////////////////////////////////////////////////////////////////////////////////////
type
//------------------------------------------------------------------------------
//Global Control
  TGLOBAL_DATA = packed record
    nAuto : Byte;
    nDirection : Integer;
    fGlobalVelocity : Single;
    fDriving1Velocity : Single;
    fDriving2Velocity : Single;
    fDrivingFrontVelRatio : Single;
    fDrivingBackVelRatio : Single;
  end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//MFL
  TMFL_DATA = packed record
    bCollaps : Boolean;
  end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//Vision
  TVISION_DATA = packed record
    fRaserPntDistUp : Single;
    fRaserPntDistDown : Single;
    fRaserPntDistLeft : Single;
    fRaserPntDistRight : Single;
    fIMURoll : Single;
    fIMUPitch : Single;
    fIMUYaw : Single;
  end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//Display
  TDISP_ON = packed record
    bON : Boolean;
    nCount : Integer;
  end;

  TDISP_VIRTURE_WALL = packed record
    bYaw : Boolean;
    bPitch : Boolean;
  end;

  TDISP_ODOMETER = packed record
    fOdometer1 : Single;
    fOdometer2 : Single;
    fOdometer3 : Single;
    fOdometer4 : Single;
  end;

  TDISP_BATTERY = packed record
    fBatteryVol : Single;
    fBatteryCur : Single;
    fBatteryCurSum : Single;
  end;

  TDISP_SWITCH = packed record
    bMFL : Boolean;
    bLED : Boolean;
    bPump : Boolean;
    bPortOut : Boolean;
    bFrontJoint : Boolean;
    bBackJoint : Boolean;
    bRLWheel : Boolean;
    bUDWheel : Boolean;
  end;

  TDISP_PSD = packed record
    fValue : Single;
  end;

  TDISP_PARA_FLAG = packed record
    bFlagParaAll : Boolean;
    bFlagParaSet : Boolean;
    bFlagParaMA : Boolean;
  end;

  TDISP_PARAMETER = packed record
    ParamH : Single;
    Parama0 : Single;
    Parama1 : Single;
    Parama2 : Single;
    Parama3 : Single;
    Parama4 : Single;
    Parama5 : Single;
    ParamVs : Single;
    ParamDel : Single;
    ParamKc : Single;
    ParamKcs : Single;
    ParamKcb : Single;
    ParamKp : Single;
    ParamKi : Single;
    ParamKd : Single;
    ParamPv : Integer;
    Paramsgn : Single;
  end;

  TDISP_AXIS = packed record
    bEnable : Boolean;
    fPosition : Single;
    fVelocity : Single;
    fCurrent : Single;
    fAbsolute : Single;
    fAbsIncDiff : Single;
    rDispPara : TDISP_PARAMETER;
  end;

  TDISP_DATA = packed record
    nAuto : Byte;
    rON : TDISP_ON;
    fPressureGauge : Single;
    rDispVWall : TDISP_VIRTURE_WALL;
    rDispOdo : TDISP_ODOMETER;
    rDispBattery : TDISP_BATTERY;
    rDispSwitch : TDISP_SWITCH;
    aDispPSD : Array[1..PSD_COUNT] of TDISP_PSD;
    aDispParaFlag : TDISP_PARA_FLAG;
    aDispCrtErr : Array[MOTOR_MIN..MOTOR_MAX] of Boolean;
    aDispAxis : Array[MOTOR_MIN..MOTOR_MAX] of TDISP_AXIS;
  end;
//------------------------------------------------------------------------------
  TDISPLAY_DATA = packed record
    rGlobalData : TGLOBAL_DATA;

    rMFLData : TMFL_DATA;
    rVisionData : Array[1..2] of TVISION_DATA;

    rDispData : Array[1..MODULE_COUNT] of TDISP_DATA;
  end;
//------------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////
/// Exceptional Variable
//////////////////////////////////////////////////////////////////////////////////////
  TAUTO_DRIVING_CONTROL = packed record
    nDrivingModule_1 : Byte;
    nDrivingModule_2 : Byte;
  end;
//////////////////////////////////////////////////////////////////////////////////////
/// Initialize Variable
//////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------
  TINI_DATA = packed record
    bCenterControl : Boolean;
    nCRC : Byte;
    nHigh_Port : Word;
    nKNR_Port : Word;
    sHigh_IP : string;
    sKNR_IP : String;
  end;
//------------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////
/// Center Control Variable
//////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------
  TWALL = packed record
    bControl : Boolean;
    bON : Boolean;
  end;

  TCTRL_CENTER_VWALL = packed record
    rPitch : TWALL;
    rYaw : TWALL;
  end;

  TCTRL_CENTER_AUTO = packed record
    bControl : Boolean;
    bON : Boolean;
  end;

  TCTRL_CENTER_DATA = packed record
    rCenterCtrlAuto : Array[1..MODULE_COUNT] of TCTRL_CENTER_AUTO;
    rCenterCtrlVWall : Array[1..MODULE_COUNT] of TCTRL_CENTER_VWALL;
    rCenterCtrlPara : Array[1..MODULE_COUNT,MOTOR_MIN..MOTOR_MAX] of Boolean;
    rCenterCtrlPSD : Array[1..MODULE_COUNT] of Boolean;
    rCenterCtrlBatSumReset : Array[1..MODULE_COUNT] of Boolean;
  end;
//------------------------------------------------------------------------------
{$M+}
type
  TVariable = class
  private
  public
    nSelDeviceID : Byte;
    nDispDirection : Byte;

    rPresMinMax : array[1..2] of Single;

    rDrivingControl : TAUTO_DRIVING_CONTROL;

    rInitialize : TINI_DATA;
    HighON : TDISP_ON;
    CenterCtrlData : TCTRL_CENTER_DATA;
    ControlData : TCONTROL_DATA;
    DisplayData : TDISPLAY_DATA;
  end;

var
  Variable : TVariable;

implementation

end.
