unit uConst;

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
 VELOCITY_CONTROL				= 0;
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
  MAXVOLTAGE						      = 24;
  MINVOLTAGE						      = 20;

  MAXCURRENTPERHOUR           = 70 * 3600;

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

  RPMtoCNTSECWHEEL			 	    = 6836.66;	//
  DEGtoCNTWHEEL					      = 1137.7777;  // EncoderCount * 감속비 / 360도  -> 4096*100/360

  RPMtoCNTSECJOINT				    = 10938.656; //10922.6667;//
  DEGtoCNTJOINT					      = 1820.4444; // EncoderCount * 감속비 / 360도  -> 4096*160/360
//////////////////////////////////////////////////////////////////
////// Ethernet define
//////////////////////////////////////////////////////////////////
  SERVER_PORT		= 1000;
  CLIENT_PORT		= 2000;

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
     Valve_On		  = $01;

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
   Communication_PSD 			     = $01;
   Communication_InnerSensor   = $02;  //Abs + 모터 입력단 Current
   Communication_Odometer      = $03;
   Communication_Motor         = $04;

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

  Emb_GetComplianceParam_H	= $1930;
  Emb_GetComplianceParam_a0	= $1931;
  Emb_GetComplianceParam_a1	= $1932;
  Emb_GetComplianceParam_a2	= $1933;
  Emb_GetComplianceParam_a3	= $1934;
  Emb_GetComplianceParam_a4	= $1935;
  Emb_GetComplianceParam_a5	= $1936;
  Emb_GetComplianceParam_Vs	= $1937;
  Emb_GetComplianceParam_Del = $1938;
  Emb_GetComplianceParam_Kc	= $1939;
  Emb_GetComplianceParam_Kcs = $1940;
  Emb_GetComplianceParam_Kcb = $1941;
  Emb_GetComplianceParam_Kp	= $1942;
  Emb_GetComplianceParam_Ki	= $1943;
  Emb_GetComplianceParam_Kd	= $1944;
  Emb_GetComplianceParam_Pv	= $1945;
  Emb_GetComplianceParam_sgn = $1946;

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
//////////////////////////////////////////////////////////////////
////// New Packet define
//////////////////////////////////////////////////////////////////
 OBJ_SET_CommunicationCnt    = $3000;
	 Return_PSDData										= $01;
	 Return_InnerSensor								= $02;  //Absolute Encoder, Motor Current
	 Return_Odometer									= $03;
	 Return_MotorParameter						= $04;
   Return_VisionData    						= $05;

 OBJ_GET_PSDData	    = $3001;

 OBJ_GET_InnerSensor	= $3002;
   IN_MainVoltage									= $01;
   IN_Temperature									= $02;
   IN_AbsEncoder									= $03;
   IN_MainCurrent1								= $04;
   IN_MainCurrent2								= $05;

 OBJ_SET_LightingLED		 		= $3003;
	 Camera_Light_ON							= $01;
	 Camera_Light_OFF							= $02;

 OBJ_SET_PowerControl			= $3004;
	 SET_PowerReset								= $02;
	 MotSET_ElmoPower						= $02;
	 ValveSET_SolenoidPower		= $03;

 OBJ_GET_PowerState				= $3005;
	 GET_ElmoPWR_State					= $01;
	 GET_SolValvePWR_State		= $02;

 OBJ_GET_OdometerData		= $3006;
	 GET_OdometerData1					= $01;
	 GET_OdometerData2					= $02;
	 GET_OdometerData3					= $03;
	 GET_OdometerData4					= $04;

 OBJ_GET_AbsoluteEncoder	= $3007;
	 GET_AbsEncoder1_360		= $01; // Front
	 GET_AbsEncoder1_180		= $02;
	 GET_AbsEncoder2_360		= $03; // Back
	 GET_AbsEncoder2_180		= $04;
	 GET_AbsEncoder3_360		= $05; // MFL

 OBJ_GET_MotorCurrnet					= $3008;
	 GET_DrivingMotorUP					= $01;
	 GET_DrivingMotorRIGHT			= $02;
	 GET_DrivingMotorLEFT				= $03;
	 GET_DrivingMotorDOWN			  = $04;
	 GET_FrontSupportJoint			= $05;
	 GET_BackSupportJoint				= $06;
	 GET_SubJoint								= $07;

 OBJ_SET_SolenoidValve			= $3009;
	 SET_DrvingLink1							= $02; //UD
	 SET_DrvingLink2							= $01; //RL
	 SET_FrontSupportLink					= $03;
	 SET_BackSupportLink					= $04;
	 SET_PressureOutPort					= $05;

 OBJ_SET_PressureMotor							= $3010;

 OBJ_SET_MFL_Power						= $3011;

 OBJ_SET_MotorPower					= $3012;
	 SET_DrivingMotorUP						= $01;
	 SET_DrivingMotorRIGHT				= $02;
	 SET_DrivingMotorLEFT					= $03;
	 SET_DrivingMotorDOWN				  = $04;
	 SET_FrontSupportJoint				= $05;
	 SET_BackSupportJoint					= $06;
	 SET_SubJoint									= $07;

 OBJ_GET_PressureSensor			= $3013;

////////////////////////////////////////////////////////////////////////////
//Subindex에 따라 dByte[0]의 값 확인
////////////////////////////////////////////////////////////////////////////
 OBJ_GET_SolenoidValve					= $3014;
	 GET_DrvingLink1					  = $01;
	 GET_DrvingLink2					  = $02;
	 GET_FrontSupportLink				= $03;
	 GET_BackSupportLink				= $04;
////////////////////////////////////////////////////////////////////////////
 OBJ_GET_MotorPower					= $3015;       //퓨즈 상태
    GET_DrivingMotor						= $01;
//[0] : Up, [1] : Right, [2] : Left, [3] : Down
    GET_JointMotor  						= $02;
//[0] : Front Support, [1] : BackSupport, [2] : SubSupport

 //////////////////////////////////////////////////////////////////
/// Delphi
//////////////////////////////////////////////////////////////////
  MODULE_COUNT = 10;
  MOTOR_MIN = 1;
  MOTOR_MAX = 7;
  PSD_COUNT = 14;

  PARA_SET = 0;
  PARA_GET = 1;

  CTRL_MODE_NONE = $00;
  CTRL_MODE_MOVE = $01;
  CTRL_MODE_STOP = $02;
  CTRL_MODE_DISABLE = $03;

  VISION_CAMERA_FRONT = 1;
  VISION_CAMERA_REAR  = 2;

  MANUAL = 0;
  AUTO = 1;

  MODE_MFL = 0;
  MODE_RFECT = 1;
//////////////////////////////////////////////////////////////////
/// Communication w.Center
//////////////////////////////////////////////////////////////////
Const
  ID_HIGH   = 100;
  ID_KNR    = 101;
  ID_ISLCG  = 102;
  ID_SKKU   = 103;
  ID_ALL    = 104;

  Main_Communication = $01;
    Sub_Comm_Connection    = $01;
    Sub_Comm_Disconnetion  = $02;
    Sub_Comm_HeartBit      = $03;
    Sub_Comm_Exit          = $04;

  Main_Display_Data = $02;
    Sub_DispData_All = $01;

  Main_Initialize = $03;
    Sub_Ini_Get_AbsPosDiff        = $01;
    Sub_Ini_Set_DataFrequency     = $02;
    Sub_Ini_Set_Parameter         = $03;

  Main_Auto_Manual_Mode = $04;
    Sub_Control_Mode_Auto   = $01;
    Sub_Control_Mode_Manual = $02;
    Sub_Control_Mode_Each   = $03;

  Main_Center_Control = $05;
    Sub_Center_Control_Speed_Up   = $01;
    Sub_Center_Control_Speed_Down = $02;
    Sub_Center_Control_Mode       = $03;
    Sub_Center_Control_Stop       = $04;
    Sub_Center_Control_Enable     = $05;
    Sub_Center_Control_Disable    = $06;
    Sub_Center_Control_VWall_Yaw_On     = $07;
    Sub_Center_Control_VWall_Yaw_Off    = $08;
    Sub_Center_Control_VWall_Pitch_On   = $09;
    Sub_Center_Control_VWall_Pitch_Off  = $10;

  Main_Switch_Control = $06;
    Sub_Switch_FrontJoint_Valve   = $01;
    Sub_Switch_BackJoint_Valve    = $02;
    Sub_Switch_RLWHeel_Valve      = $03;
    Sub_Switch_UDWheel_Valve      = $04;
    Sub_Switch_Pump               = $05;
    Sub_Switch_LED_Light          = $06;
    Sub_Switch_Port_Out           = $07;

  Main_Virtural_Wall = $07;
    Sub_Virtural_Wall_Yaw      = $01;
    Sub_Virtural_Wall_Pitch    = $02;

  Main_Module_Control = $08;
    Sub_Module_Mode       = $01;
    Sub_Module_Move       = $02;
    Sub_Module_Stop       = $03;
    Sub_Module_Able       = $04;

  Main_Setup = $09;
    Sub_Setup_Drivng_Ratio  = $01;
    Sub_Setup_Pres_MinMax   = $02;
    Sub_Setup_PSD           = $03;
    Sub_Setup_Para          = $04;

  Main_Battery_Sum_Reset = $10;
    Sub_Battety_Sum_Module1 = $01;
    Sub_Battety_Sum_Module2 = $02;
//--------------------------------------------------------------------------------
  HEADER_SIZE   = 6;
  CRC_SIZE = 2;

  HEAD_SENDER   = 0;
  HEAD_RECEIVER = 1;
  HEAD_MAIN_CMD = 2;
  HEAD_SUB_CMD  = 3;
  HEAD_SIZE_HI  = 4;
  HEAD_SIZE_LO  = 5;
//--------------------------------------------------------------------------------
  DISPLAY_YAW = 0;
  DISPLAY_PITCH = 1;
//--------------------------------------------------------------------------------

implementation

end.
