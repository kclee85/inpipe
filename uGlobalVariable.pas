unit uGlobalVariable;

interface
const
//////////////////////////////////////////////////////////////////
////// Pre define elements declared by jaekyu working for knr
//////////////////////////////////////////////////////////////////
 DISPLAY_DATA		= 2;
 JOYSTICKLOOP		= 3;
 AUTOCONTROL		= 4;
 COMLOADTEST		= 5;
 ABSREQUEST		  = 6;
 INISETTINGTIMER	= 7;
 RESPSETTIMER		= 8;
 DATALOG			  = 9;
 ROLLSEQUENCE		= 10;
 ROLLSTRAIGHT		= 11;
 ROLLCROSSTYPE1	= 12;
 ROLLCROSSTYPE2	= 13;
 CANCLEROLLCROSS	= 14;
 PUMPBATTERYUPDATE	= 15;
 ROLLOPERATE		= 16;
 VALVEAUTOSEQ		= 17;
//-------------------------------------------------------
 VELOCITYSETPARAM				= 3;  // unit is rpm
 CURRENT_CONTROL				= 1;
 VELOCITY_CONTROL				= 2;
 POSITION_CONTROL				= 4;
 P_C							= 0.0002;
 P_CS							= -0.00004;
 ProgressbarscaleMax		= 250;
 ProgressbarscaleMin		= 10;
 SPRINGCONSTANT			= 1.0;
 ORIGINSPRINGLENGTH			= 200.0; // mm
//////////////////////////////////////////////////////////////////
////// Flash Data define
//////////////////////////////////////////////////////////////////
  FLASH_OFFSET_BOOTACTION			= 0;
  FLASH_OFFSET_BD_STATE			  = 4;

  Pie								          = 3.14159265359;
  Diameter_Wheel					    = 100;
  JMAXCURRENT						      = 2.35;
  WHMAXCURRENT						    = 2.35;
  MAXVOLTAGE						      = 23.8;
  MINVOLTAGE						      = 19.0;
  MAXVELOCITY						      = 50;			// rpm
  BASEVELOCITY						    = 50;
  MAXPOSITION						      = 90;
  MAXCURRENT						      = 2.35;
  MAXDELAYTIME						    = 50;
  WHEELBASE1						      = 370;
  WHEELBASE2						      = 900;
  EXITFLAGDIST1						    = 700;
  LINKCRITCUR						      = 5.9;
  WHEELCRITCUR						    = 7.9;

  RPMtoCNTSECWHEEL			 	    = 60.0;	//  1minute _> 60second   ->   EncoderCountx4/1munute  ->   4000/60  -> 66.6666f*100
  RPMtoCNTSECPITCH				    = 66666.67;   //  1minute _> 60second   ->   EncoderCountx4/1munute  ->   4000/60  -> 66.6666f*1000
  RPMtoCNTSECROLL				      = 17777.31;	//  1minute _> 60second   ->   EncoderCountx4/1munute  ->   4000/60  -> 66.6666f*266.66
  DEGtoCNTPITCH					      = 11111.11;	// EncoderCount * 감속비 / 360도  -> 4000*1000/360
  DEGtoCNTROLL					      = 2962.88;	// EncoderCount * 감속비 / 360도  -> 4000*266.66/360
  DEGtoCNTWHEEL					      = 11.1111;
//////////////////////////////////////////////////////////////////
////// Ethernet define
//////////////////////////////////////////////////////////////////
  SERVER_PORT		= 1000;
  CLIENT_PORT		= 2000;
  CENTER_PORT   = 3000;

  CONNECT			    = 1;
  NOT_CONNECT     = 0;

  DISP								= 1;
//////////////////////////////////////////////////////////////////
////// Protocol define
//////////////////////////////////////////////////////////////////
  MAX_PACKET_SIZE	  =	512;
  INDEX_ID			    = 0;
  INDEX_COM			    = 1;
  INDEX_OBJ_H		    =	2;
  INDEX_OBJ_L		    =	3;
  INDEX_SUB_OBJ	    = 4;
  INDEX_DATA			  = 5;

  COBID_WRITE		    =	$0600;
  COBID_WRITE_REIVE	= $0580;

  CS_WRITE_1B	      =	$2F;
  CS_WRITE_2B	      =	$2B;
  CS_WRITE_4B	      =	$23;
  CS_WRITE_nB	      =	$24;
  CS_WRITE_NONE     =	$22;
  CS_READ	          =	$40;
  CS_READ_1B        =	$4F;
  CS_READ_2B        =	$4B;
  CS_REAB_3B        =	$43;

  SUBINDEX_NONE     = $00;
  SUBINDEX_1		    = $01;
  SUBINDEX_2		    = $02;
  SUBINDEX_3		    = $03;
  SUBINDEX_4		    = $04;

//////////////////////////////////////////////////////////////////
////// Control Object dictionary define
//////////////////////////////////////////////////////////////////
  Connect_Information		= $1105;
  Alram_HeartBit			= $1106;
  Power_Control			= $1200;
   Power_Control_On	= $01;
   Power_Control_Off	= $02;
   Power_Control_State = $03;
  Power_Control_Reset	= $1301;
  Power_Voltage_State		= $1201;
    PWR_Main			= $01;
   PWR_RF				= $02;
   PWR_VISION			= $03;
   PWR_Driving			= $04;
   PWR_Steering		= $05;
  Power_Current_State		= $1202;
  Power_Battery_Current_State = $1300;
  Inner_Sensor_State		= $1203;
   IN_Temperture		= $01;
    IN_Humidity			= $02;
   IN_Pressure			= $03;
   IN_Pressure_CAM		= $04;
   IN_STTemperture		= $05;
    IN_STHumidity		= $06;
   IN_STPressure		= $07;
  LED_Dimming_Control		= $1204;
   Set_Dimming			= 1;
   Get_Dimming			= 2;
  GetPressure_PSE530		= $1205;
  PressureValveControl	= $1206;
   SetValveControl		= $01;
   GetValveState		= $02;
     Valve_Off		= $00;
     Valve_On		= $01;
  DCValveControl			= $1207;
  NDE_GPIO_Control		= $1208;
   NDE_Bit_Off			= $00;
   NDE_Bit_On			= $01;
  RegulatorControl		= $1209;
  OdometerState			= $1210;
   Get_Odometer		= $01;
   Reset_Odometer		= $02;
  Joint_AbsoluteEncoder	= $1211;
   Joint_Abs1			= $01;
   Joint_Abs2			= $02;
   Joint_Abs3			= $03;
   Joint_Abs4			= $04;
   Joint_Abs5			= $05;

  SensorData_PSD		= $1700;
  OBJECT_NDE_PSDData			= $2200;

  SET_CommunicationCnt   = $1800;
   Communication_PSD 			= $01;
   Communication_ElmoMotor     = $02;

  Battery_Module_State	= $1212;
   Main_Voltage		= $01;
   Battery_Voltage		= $02;
   Charging_State		= $03;
  Joint_Homming			= $1213;
   Homming				= $01;		// data 0 : Roll, Data 1 : Pitch, Data 2: RollPitch
   Homming_SetPoint	= $02;
   Homming_GetPoint	= $03;
   Homming_SetPoint1	= $04;
   Homming_GetPoint1	= $05;
   Homming_State		= $06;



   InActive			= $00;
   Active				= $01;


  Elmo_SetAccelerationValue	= $1401;
  Elmo_SetDecelerationValue	= $1402;
     Elmo_GetAccelerationValue	= $1421;
     Elmo_GetDecelerationValue	= $1422;
  Elmo_SetJoggingVelocityValue	= $1403;
  Elmo_SetMotorOnOff							= $1404;
     ElmoMotorON		= 1;
     ElmoMotorOFF  = 0;
  Elmo_SetAbsolutePositionValue = $1405;
  Elmo_SetStopDecelerationValue	= $1406;
     Elmo_GetStopDecelerationValue	= $1426;
  Elmo_SetStopMotionUsing					= $1407;
  Elmo_SetTorqueLimits								= $1408;
     Elmo_GetErrorCode									= $1409;

     Elmo_GetMotorFault									= $1410;
     Elmo_GetCurrentValue								= $1411;
      Elmo_GetPositionValue							= $1412;
     Elmo_GetVelocityValue							= $1413;
  Elmo_SetCurrentLimitArray_1					= $1414;
  Elmo_SetCurrentLimitArray_2					= $1458;
  Elmo_SetCurrentLimitArray_3					= $1459;
     Elmo_GetCurrentLimitArray_1					= $1425;
     Elmo_GetCurrentLimitArray_2					= $1455;
     Elmo_GetCurrentLimitArray_3					= $1427;
     Elmo_GetMaximumPeakCurrent					= $1415;
  Elmo_SetPeakdurationAndLimit_1		= $1416;
  Elmo_SetPeakdurationAndLimit_2		= $1456;
     Elmo_GetPeakdurationAndLimit_1		= $1436;
     Elmo_GetPeakdurationAndLimit_2		= $1437;
  Elmo_SetUniMode										= $1417;

  Elmo_SetKiGainValue_1							= $1418;
  Elmo_SetKiGainValue_2							= $1419;
  Elmo_SetKpGainvalue_1							= $1420;
  Elmo_SetKpGainvalue_2							= $1453;
  Elmo_SetKpGainvalue_3							= $1454;
     Elmo_GetKiGainValue_1							= $1428;
     Elmo_GetKiGainValue_2							= $1429;
     Elmo_GetKpGainvalue_1							= $1450;
     Elmo_GetKpGainvalue_2							= $1451;
     Elmo_GetKpGainvalue_3							= $1452;

  Elmo_SetHLValue_2								= $1440;
  Elmo_SetHLValue_3								= $1444;
     Elmo_GetHLValue_2								= $1441;
     Elmo_GetHLValue_3								= $1445;
  Elmo_SetLLValue_2								= $1442;
  Elmo_SetLLValue_3								= $1446;
     Elmo_GetLLValue_2								= $1443;
     Elmo_GetLLValue_3								= $1447;
  Elmo_SetBeginMotion							= $1430;
  Elmo_SetSpeedforPTPValue					= $1431;

  Elmo_ProfileSAVE							= $1460;

  Elmo_FeedBackFlag							= $1500;

//////////////////////////////////////////////////////////////////
////// Embeded define
//////////////////////////////////////////////////////////////////
  Emb_SetComplianceParam_H				= $1900;
  Emb_SetComplianceParam_a0				= $1901;
  Emb_SetComplianceParam_a1				= $1902;
  Emb_SetComplianceParam_a2				= $1903;
  Emb_SetComplianceParam_a3				= $1904;
  Emb_SetComplianceParam_a4				= $1905;
  Emb_SetComplianceParam_a5				= $1906;
  Emb_SetComplianceParam_Vs				= $1907;
  Emb_SetComplianceParam_Del			= $1908;
  Emb_SetComplianceParam_Kc				= $1909;
  Emb_SetComplianceParam_Kcs			= $1910;
  Emb_SetComplianceParam_Kcb			= $1911;
  Emb_SetComplianceParam_Kp				= $1912;
  Emb_SetComplianceParam_Ki				= $1913;
  Emb_SetComplianceParam_Kd				= $1914;
  Emb_SetComplianceParam_Pv				= $1915;
  Emb_SetComplianceParam_sgn			= $1916;

  Emb_SetReferenceValue		  = $2100;
  Emb_SetElmoCurrentValue	  = $2010;
  Emb_SetElmoVelocityValue	= $2020;
  Emb_SetElmoPositionValue	= $2030;
  Emb_SetUnitMode	          = $2000;
       Model_ElmoPosition  			= 1;
       Model_ElmoVelocity	 		  = 2;
       Model_ElmoCurrent	 			= 3;
       Model_EmbedPosition	 		= 4;
       Model_EmbedVelocity	 		= 5;
       Model_EmbedCurrent	 		  = 6;

       Model_Log								= 7;
       Model_Exp								= 8;
       Model_Root								= 9;

       Model_A  								= 10;
       Model_B									= 11;

type
  TCAN_DATA = packed record
    case integer of
      0: (dByte : array[0..7] of UInt8);
      1: (dInt8 : array[0..7] of Int8);
      2: (dInt : array[0..1] of Integer);
      3: (dFloat : array[0..1] of Single);
      4: (dU32 : array[0..1] of UInt32);
      5: (dU16 : array[0..3] of UInt16);
      6: (dInt16 : array[0..3] of Word);
      7: (dShort : array[0..3] of SmallInt);
  end;

//==============================================================================
//=================================== Delphi ===================================
//==============================================================================
const
  MODULE_COUNT = 8;
  MOTOR_MIN = 1;
  MOTOR_MAX = 6;

  PARA_SET = 0;
  PARA_GET = 1;

  CTRL_MODE_NONE = $00;
  CTRL_MODE_MOVE = $01;
  CTRL_MODE_STOP = $02;
  CTRL_MODE_DISABLE = $03;

  VISION_CAMERA_FRONT = 1;
  VISION_CAMERA_REAR  = 2;
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
  end;

  TMOTOR_ID = packed record
    MOTOR_PITCH     : Byte;
    MOTOR_YAW       : Byte;
    MOTOR_RWHEEL    : Byte;
    MOTOR_LWHEEL    : Byte;
    MOTOR_UWHEEL    : Byte;
    MOTOR_DWHEEL    : Byte;
  end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//Global Auto
  TGLOBAL_AUTO_DATA = packed record
    bAutoCtrl : Boolean;
    fAutoVelocity : Single;
    nDirection : Integer;
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
//Install
  TINST_DATA = packed record
    rInSensor : Boolean;
    rOdoData : Boolean;
    rBattery : Boolean;
    rJointValve : Boolean;
    rRLWheelValve : Boolean;
    rUDWheelValve : Boolean;
    rPump : Boolean;
    aInstPSD : Array[1..8] of Boolean;
    aInstAxis : Array[MOTOR_MIN..MOTOR_MAX] of Boolean;
  end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//Display
  TDISP_ON = packed record
    bON : Boolean;
    nCount : Integer;
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

  TDISPLAY_VALVE = packed record
    bJoint : Boolean;
    bRLWheel : Boolean;
    bUDWheel : Boolean;
  end;

  TDISP_PUMP = packed record
    bPump : Boolean;
    fPressureGauge : Single;
  end;

  TDISP_COLLAPS = packed record
    bON : Boolean;
  end;

  TDISP_PSD = packed record
    fValue : Single;
  end;

  TDISP_BATTERY = packed record
    fBatteryVol : Single;
    fBatteryCur : Single;
  end;

  TDISP_ODOMETER = packed record
    fOdometer : Single;
  end;

  TVIRTURE_WALL = packed record
    bYaw : Boolean;
    bPitch : Boolean;
  end;

  TDISP_INNER_SENSOR = packed record
    fTemperture : Single;
    fHumidity : Single;
  end;

  TDISP_DATA = packed record
    rON : TDISP_ON;
    bAutoCtrl : Boolean;
    rDispVWall : TVIRTURE_WALL;
    rDispInSensor : TDISP_INNER_SENSOR;
    rDispOdo : Array[0..3] of TDISP_ODOMETER;
    rDispBattery : TDISP_BATTERY;
    rDispValve : TDISPLAY_VALVE;
    rDispPump : TDISP_PUMP;
    aDispPSD : Array[1..8] of TDISP_PSD;
    aDispAxis : Array[MOTOR_MIN..MOTOR_MAX] of TDISP_AXIS;
  end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//Control
  TCTRL_PARAMETER_FLOAT = packed record
    bGetSet : Byte;
    fValue : Single;
  end;

  TCTRL_PARAMETER_INT = packed record
    bGetSet : Byte;
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

  TCTRL_AXIS = packed record
    fAbsOffset : Single;
    fPosition : Single;
    fVelocity : Single;
    fCurrent : Single;
    nCtrlMode : Byte;
    nCtrlMove : Byte;
    rCtrlPara : TCTRL_AXIS_PARA_CMD;
  end;

  TCTRL_VALVE = packed record
    bJoint : Boolean;
    bRLWheel : Boolean;
    bUDWheel : Boolean;
  end;

  TCTRL_PUMP = packed record
    bPump : Boolean;
  end;

  TCTRL_DATA = packed record
    rCtrlValve : TCTRL_VALVE;
    rCtrlPump : TCTRL_PUMP;
    aCtrlAxis : Array[MOTOR_MIN..MOTOR_MAX] of TCTRL_AXIS;
  end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//Flag
  TFLAG_PARA = packed record
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

  TFLAG_VALVE = packed record
    bJoint : Boolean;
    bRLWheel : Boolean;
    bUDWheel : Boolean;
  end;

  TFLAG_PUMP = packed record
    bPump : Boolean;
  end;

  TFLAG_AXIS = packed record
    rFlagPara : TFLAG_PARA;
    bFlagMode : Boolean;
    bFlagMove : Boolean;
  end;

  TFLAG_DATA = packed record
    rFlagValve : TFLAG_VALVE;
    rFlagPump : TFLAG_PUMP;
    aFlagAxis : Array[MOTOR_MIN..MOTOR_MAX] of TFLAG_AXIS;
  end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//Setup
  TSETUP_AXIS = packed record
    nDirection : Integer;
    nAbsJointNum : Integer;
    fAutoMaxJointDegree : Single;
    fStiffness : Single;
  end;

  TSCALE_OFFSET_PSD = packed record
    fScale : Single;
    fOffset : Single;
  end;

  TSETUP_DATA = packed record
     aSetupPSD : Array[1..8] of TSCALE_OFFSET_PSD;
     aSetupAxis : Array[MOTOR_MIN..MOTOR_MAX] of TSETUP_AXIS;
  end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//Auto Control
  TAUTO_GEO = packed record
    fSpringConstant : Single;
    fOriginSpringLength : Single;
    fWeightCenterPosX : Single;
    fWeightCenterPosY : Single;
    aPSDxPosX : Array[0..3] of Single;
    aPSDxPosY : Array[0..3] of Single;
    aPSDxDirection : Array[0..3] of Single;
  end;

  TAUTO_GAIN = packed record
    fWheelPGain : Single;
    fWheelIGain : Single;
    fJointPGain : Single;
    fJointIGain : Single;
  end;

  TAUTO_SUM_RATIO_N_ERROR = packed record
    fYaw : Single;
    fPitch : Single;
  end;

  TAUTO_DATA = packed record
    rSumRatioOrErr : TAUTO_SUM_RATIO_N_ERROR;
    rAutoGeo : TAUTO_GEO;
    rAutoGain : TAUTO_GAIN;
  end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//Center Control
  TWALL = packed record
    bControl : Boolean;
    bON : Boolean;
  end;

  TCTRL_VWALL = packed record
    rPitch : TWALL;
    rYaw : TWALL;
  end;

  TCTRL_PSD = packed record
    bControl : Boolean;
  end;

  TCTRL_GAIN = packed record
    bControl :  Boolean;
  end;

  TCTRL_AUTO = packed record
    bControl : Boolean;
    bON : Boolean;
  end;
//==============================================================================
//================================= Data Structure =============================
//==============================================================================
//Data
  TDATA = packed record
    rAuto : TGLOBAL_AUTO_DATA;

    rMFLData : TMFL_DATA;
    rVisionData : Array[1..2] of TVISION_DATA;

    rInstData : Array[1..MODULE_COUNT] of TINST_DATA;
    rDispData : Array[1..MODULE_COUNT] of TDISP_DATA;
    rCtrlData : Array[1..MODULE_COUNT] of TCTRL_DATA;
    rSetupData : Array[1..MODULE_COUNT] of TSETUP_DATA;
    rAutoData : Array[1..MODULE_COUNT] of TAUTO_DATA;

    rFlagData : Array[1..MODULE_COUNT] of TFLAG_DATA;

    rControlVWall : Array[1..MODULE_COUNT] of TCTRL_VWALL;
    rControlPSD : Array[1..MODULE_COUNT] of TCTRL_PSD;
    rControlGain : Array[1..MODULE_COUNT] of TCTRL_GAIN;
    rControlAuto : Array[1..MODULE_COUNT] of TCTRL_AUTO;
  end;
//==============================================================================
//==============================================================================
//==============================================================================

type
  TGlobalVariable = Class
  public
    nDispDirection : Byte;
    bConnectHigh : TDISP_ON;
    rModuleData : TDATA;
    nSelDeviceID : Byte;
  End;
var
  GV : TGlobalVariable;

//==============================================================================
//=================================== Delphi ===================================
//==============================================================================
implementation

end.
