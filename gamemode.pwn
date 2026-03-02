         ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	    //																												 //
	   // 						======================== Scripter ============================							//
	  // 						> GAMEMODE Fivem ANDRO/PC INDONESIA							 <						   //
	 // 						> Scripter: Cagus											 <						  //
	// 							> Version: v1.5 											 <						 //
   //  							> GameMode Basic : Lrp										 <						//
  //  							==============================================================					   //
 //																												  //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////




#pragma warning disable 217, 219, 235, 204, 209, 203
#include <a_samp>
#undef MAX_PLAYERS
#define MAX_PLAYERS	100
#include <crashdetect>
#include <gvar>
#include <a_mysql>
#include <a_actor>
#include <a_zones>
#include <progress2>
#include <Pawn.CMD>
#include <mSelection.inc>
#include <FiTimestamp>
#define ENABLE_3D_TRYG_YSI_SUPPORT
#include <3DTryg>
#include <streamer>
#include <EVF2>
#include <YSI\y_timers>
#include <YSI\y_ini>
#include <sscanf2>
#include <yom_buttons>
#include <geoiplite>
#include <garageblock>
#include <tp>
#include <compat>
#define DCMD_PREFIX '!'
#include <discord-connector>
#include <discord-cmd>
#include <fixobject>
#include <timerfix.inc>
//#include <GPS>
#define MAX_AUCTIONS    10
//-----[ Modular ]-----
#include "DATA\DEFINE.pwn"
//#include "DATA\GPS.pwn"
#include "DATA\VPARA.pwn"
//=================================================
new bool:explosive[MAX_PLAYERS char] = {false,...};
new Text:gspeedo[4];
new Text:speedo_dot[21];
new Text:speedo_number[12];
new WaktuMolotov[MAX_PLAYERS];
new PakaiSenjata[MAX_PLAYERS];
new carvid_0;
//=======[ ATM FIVEM]=======
new atm1;
new atm2;
new atm3;
//======[ JOB BY dentot ]========
new Sopirbus;
new tukangayam;
new tukangfarmer;
new tukangtebang;
new penambangminyak;
new penjahit;
new pemerah;
new penambang;
//=============[ SPARPART DEN ]=========
new kerjasparepart;
//======[ CP BUS dentot ]========
new BusCP;
//=======[ JOB PEMERAH dentot ]=========
new PemerahCP;
new Trucker;
new Disnaker;
new MobilKerja[MAX_PLAYERS];
//================================
new
    JOB[MAX_PLAYERS], inJOB[MAX_PLAYERS], Car_Job[MAX_PLAYERS], timer_Car[MAX_PLAYERS],
    Seconds_timer[MAX_PLAYERS], Hunter_Deer[MAX_PLAYERS], Meeters_BTWDeer[MAX_PLAYERS],
    Meeters[MAX_PLAYERS], Deer[MAX_PLAYERS], Deep_Deer[MAX_PLAYERS], Meeter_Kill[MAX_PLAYERS],
    Shoot_Deer[MAX_PLAYERS];

//han
new STATUS_BOT2;

//STATIC SAPD
new SAPDVeh[MAX_PLAYERS];
//STATIC SAMD
new SAMDVeh[MAX_PLAYERS];
//STATIC SANA
new SANAVeh[MAX_PLAYERS];

//callsign
new vehiclecallsign[MAX_VEHICLES];
new STREAMER_TAG_3D_TEXT_LABEL:vehicle3Dtext[MAX_VEHICLES];

static warnings[MAX_PLAYERS char] = {0,...};

new Text3D:cNametag[MAX_PLAYERS];

new DCC_Channel:g_Discord_CHENH4X;

//-----[ Quiz ]-----
new quiz,
	answers[256],
	answermade,
	qprs;

//-----[ Twitter ]-----
new tweet[60];

//-----[ New HamZyy ]----
//rob
new DCC_Channel:chLogsRobbank;
//New GMX
new CurGMX;
//Enum GMX
forward DoGMX();
//


//-----[ Rob ]-----
new RobMember = 0;

//-----[ Event ]-----
new EventCreated = 0, 
	EventStarted = 0, 
	EventPrize = 500;
new Float: RedX, 
	Float: RedY, 
	Float: RedZ, 
	EventInt, 
	EventWorld;
new Float: BlueX, 
	Float: BlueY, 
	Float: BlueZ;
new EventHP = 100,
	EventArmour = 0,
	EventLocked = 0;
new EventWeapon1, 
	EventWeapon2, 
	EventWeapon3, 
	EventWeapon4, 
	EventWeapon5;
new BlueTeam = 0, 
	RedTeam = 0;
new MaxRedTeam = 5, 
	MaxBlueTeam = 5;
new IsAtEvent[MAX_PLAYERS];


new AntiBHOP[MAX_PLAYERS];

new InRob[MAX_PLAYERS];
//-----[ Discord Connector ]-----
new pemainic;
new upt = 0;

//-----[ Selfie System ]-----
new takingselfie[MAX_PLAYERS];
new Float:Degree[MAX_PLAYERS];
const Float: Radius = 1.4; //do not edit this
const Float: Speed  = 1.25; //do not edit this
const Float: Height = 1.0; // do not edit this
new Float:lX[MAX_PLAYERS];
new Float:lY[MAX_PLAYERS];
new Float:lZ[MAX_PLAYERS];
//=========[ TIMER ]============//
new olahh[MAX_PLAYERS];
new ayamjob[MAX_PLAYERS];
//=========[ DISCORD ]============//
new DCC_Channel:g_Discord_Serverstatus;



enum
{
	//JOBBALKOTi
	DIALOG_DISNAKER,
	DIALOG_LOCKERAYAM,
	DIALOG_LOCKERPEMERAH,
	DIALOG_DOKUMEN,
	DIALOG_LOCKERPENJAHIT,
	DIALOG_GOJEK,
	DIALOG_GOPAY,
	DIALOG_LOCKERMINYAK,
	DIALOG_GOTOPUP,
	DIALOG_GOJEKLANJUTAN,
	DIALOG_METODEPEMBAYARAN,
	DIALOG_GPSPENJAHIT,
	DIALOG_VRM,
	DIALOG_LOCKERPENAMBANG,
	DIALOG_TINGGI,
	DIALOG_BERAT,
	DIALOG_AYAMFILL,
	DIALOG_REPORTS,
	//dialog radial menu dewata
	DIALOG_RADIAL,
	DIALOG_WT,
	DIALOG_HOLIMARKET,
	DIALOG_GPSSPAREPART,
	DIALOG_LOCKERGOJEK,
	//modshop
	DIALOG_GIVE,
	DIALOG_AMOUNT,
	DIALOG_MODSHOP,
	DIALOG_MAKE_CHAR,
	DIALOG_CHARLIST,
	DIALOG_VERIFYCODE,
	DIALOG_UNUSED,
    DIALOG_LOGIN,
    DIALOG_REGISTER,
    DIALOG_AGE,
	DIALOG_GENDER,
	DIALOG_EMAIL,
	DIALOG_PASSWORD,
	DIALOG_STATS,
	DIALOG_SETTINGS,
	DIALOG_HBEMODE,
	DIALOG_CHANGEAGE,
	DIALOG_GOLDSHOP,
	// MODSHOP
	DIALOG_MODMENU,
	DIALOG_MODTOY,
	DIALOG_MODTBUY,
	DIALOG_MODTEDIT,
	DIALOG_MODTPOSX,
	DIALOG_MODTPOSY,
	DIALOG_MODTPOSZ,
	DIALOG_MODTPOSRX,
	DIALOG_MODTPOSRY,
	DIALOG_MODTPOSRZ,
	DIALOG_MODTSELECTPOS,
	DIALOG_MODTSETVALUE,
	DIALOG_MODTSETCOLOUR,
	DIALOG_MODTSETPOS,
	DIALOG_MODTACCEPT,
	DIALOG_GOLDNAME,
	DIALOG_SELL_BISNISS,
	DIALOG_SELL_BISNIS,
	DIALOG_MY_BISNIS,
	DIALOG_MENU,
	DIALOG_MENUMASAK,
	DIALOG_LOCKERPEDAGANG,
	DIALOG_LOCKFAMS,
	DIALOG_GUDANGPEDAGANG,
	DIALOG_SIMPAN,
	DIALOG_SIMPANUANG,
	DIALOG_TAKEMONEY,
	DIALOG_TAKE,
	DIALOG_WEAPONPEDAGANG,
	DIALOG_MMENU,
	BISNIS_MENU,
	BISNIS_INFO,
	BISNIS_NAME,
	BISNIS_VAULT,
	BISNIS_WITHDRAW,
	BISNIS_DEPOSIT,
	BISNIS_BUYPROD,
	BISNIS_EDITPROD,
	BISNIS_PRICESET,
	DIALOG_SELL_HOUSES,
	DIALOG_SELL_HOUSE,
	DIALOG_MY_HOUSES,
	DIALOG_MY_SG,
	DIALOG_SG_MENU,
	DIALOG_SETNAME,
	DIALOG_MAT,
	DIALOG_COM,
	DIALOG_UANG,
	DIALOG_COM2,
	DIALOG_MAT2,
	DIALOG_AMBILUANG,
	DIALOG_DEPOUANG,
	HOUSE_INFO,
	HOUSE_STORAGE,
	HOUSE_WEAPONS,
	HOUSE_MONEY,
	HOUSE_REALMONEY,
	HOUSE_WITHDRAW_REALMONEY,
	HOUSE_DEPOSIT_REALMONEY,
	HOUSE_REDMONEY,
	HOUSE_WITHDRAW_REDMONEY,
	HOUSE_DEPOSIT_REDMONEY,
	HOUSE_FOODDRINK,
	HOUSE_FOOD,
	HOUSE_FOOD_DEPOSIT,
	HOUSE_FOOD_WITHDRAW,
	HOUSE_DRINK,
	HOUSE_DRINK_DEPOSIT,
	HOUSE_DRINK_WITHDRAW,
	HOUSE_DRUGS,
	HOUSE_MEDICINE,
	HOUSE_MEDICINE_DEPOSIT,
	HOUSE_MEDICINE_WITHDRAW,
	HOUSE_MEDKIT,
	HOUSE_MEDKIT_DEPOSIT,
	HOUSE_MEDKIT_WITHDRAW,
	HOUSE_BANDAGE,
	HOUSE_BANDAGE_DEPOSIT,
	HOUSE_BANDAGE_WITHDRAW,
	HOUSE_OTHER,
	HOUSE_SEED,
	HOUSE_SEED_DEPOSIT,
	HOUSE_SEED_WITHDRAW,
	HOUSE_MATERIAL,
	HOUSE_MATERIAL_DEPOSIT,
	HOUSE_MATERIAL_WITHDRAW,
	HOUSE_COMPONENT,
	HOUSE_COMPONENT_DEPOSIT,
	HOUSE_COMPONENT_WITHDRAW,
	HOUSE_MARIJUANA,
	HOUSE_MARIJUANA_DEPOSIT,
	HOUSE_MARIJUANA_WITHDRAW,
	DIALOG_TRACK,
	DIALOG_TRACK_PH,
	DIALOG_INFO_BIS,
	DIALOG_INFO_HOUSE,
	DIALOG_FINDVEH,
	DIALOG_TRACKVEH,
	DIALOG_TRACKVEH2,
	DIALOG_TRACKPARKEDVEH,
	DIALOG_GOTOVEH,
	DIALOG_GETVEH,
	DIALOG_DELETEVEH,
	DIALOG_BUYPV,
	DIALOG_BUYVIPPV,
	DIALOG_BUYPLATE,
	DIALOG_LOCKVEH,
	DIALOG_BUYPVCP,
	DIALOG_BUYPVCP_BIKES,
	DIALOG_BUYPVCP_CARS,
	DIALOG_BUYPVCP_UCARS,
	DIALOG_BUYPVCP_JOBCARS,
	DIALOG_BUYPVCP_VIPCARS,
	DIALOG_BUYPVCP_CONFIRM,
	DIALOG_BUYPVCP_VIPCONFIRM,
	DIALOG_RENT_JOBCARS,
	DIALOG_RENT_JOBCARSCONFIRM,
	DIALOG_SKINFAM,
	DIALOG_RENT_BOAT,
	DIALOG_RENT_BOATCONFIRM,
	DIALOG_RENT_BIKE,
	DIALOG_RENT_BIKECONFIRM,
	DIALOG_KENDARAAN_POLISI,
	DIALOG_AMBIL_POLISICONFIRM,
	DIALOG_GARKOT,
	DIALOG_GUDANG,
	DIALOG_MY_VEHICLE,
	DIALOG_TOY,
	DIALOG_TOYEDIT,
	DIALOG_TOYEDIT_ANDROID,
	DIALOG_TOYPOSISI,
	DIALOG_TOYPOSISIBUY,
	DIALOG_TOYBUY,
	DIALOG_TOYVIP,
	DIALOG_TOYPOSX,
	DIALOG_TOYPOSY,
	DIALOG_TOYPOSZ,
	DIALOG_TOYPOSRX,
	DIALOG_TOYPOSRY,
	DIALOG_TOYPOSRZ,
	DIALOG_TOYPOSSX,
	DIALOG_TOYPOSSY,
	DIALOG_TOYPOSSZ,
	//ingame map
	DIALOG_MTEDIT,
	DIALOG_EDIT,
	DIALOG_X,
	DIALOG_Y,
	DIALOG_Z,
	DIALOG_RX,
	DIALOG_RY,
	DIALOG_RZ,
	DIALOG_MTC,
	DIALOG_COORD,
	DIALOG_MTX,
	DIALOG_MTY,
	DIALOG_MTZ,
	DIALOG_MTRX,
	DIALOG_MTRY,
	DIALOG_MTRZ,
	DIALOG_HELP,
	DIALOG_GPS,
	DIALOG_JOB,
	DIALOG_GPS_MINYAK,
	DIALOG_GPS_PENAMBANG,
	DIALOG_GPS_JOB,
	DIALOG_GPS_PUBLIC,
	DIALOG_GPS_PROPERTIES,
	DIALOG_GPS_GENERAL,
	DIALOG_GPS_MISSION,
	DIALOG_GPS_AYAM,
	DIALOG_TRACKBUSINESS,
	DIALOG_ELECTRONIC_TRACK,
	DIALOG_PAYBILL,
	DIALOG_PAY,
	DIALOG_EDITBONE,
	FAMILY_SAFE,
	FAMILY_STORAGE,
	FAMILY_WEAPONS,
	FAMILY_MARIJUANA,
	FAMILY_WITHDRAWMARIJUANA,
	FAMILY_DEPOSITMARIJUANA,
	FAMILY_COMPONENT,
	FAMILY_WITHDRAWCOMPONENT,
	FAMILY_DEPOSITCOMPONENT,
	FAMILY_MATERIAL,
	FAMILY_WITHDRAWMATERIAL,
	FAMILY_DEPOSITMATERIAL,
	FAMILY_MONEY,
	FAMILY_WITHDRAWMONEY,
	FAMILY_DEPOSITMONEY,
	FAMILY_INFO,
	DIALOG_SERVERMONEY,
	DIALOG_SERVERMONEY_STORAGE,
	DIALOG_SERVERMONEY_WITHDRAW,
	DIALOG_SERVERMONEY_DEPOSIT,
	DIALOG_SERVERMONEY_REASON,
	DIALOG_LOCKERSAPD,
	DIALOG_WEAPONSAPD,
	DIALOG_LOCKERSAGS,
	DIALOG_WEAPONSAGS,
	DIALOG_LOCKERSAMD,
	DIALOG_WEAPONSAMD,
	DIALOG_DRUGSSAMD,
	DIALOG_LOCKERSANEW,
	DIALOG_WEAPONSANEW,
	DIALOG_LOCKERVIP,
	DIALOG_SERVICE,
	DIALOG_SERVICE_COLOR,
	DIALOG_SERVICE_COLOR2,
	DIALOG_SERVICE_PAINTJOB,
	DIALOG_SERVICE_WHEELS,
	DIALOG_SERVICE_SPOILER,
	DIALOG_SERVICE_HOODS,
	DIALOG_SERVICE_VENTS,
	DIALOG_SERVICE_LIGHTS,
	DIALOG_SERVICE_EXHAUSTS,
	DIALOG_SERVICE_FRONT_BUMPERS,
	DIALOG_SERVICE_REAR_BUMPERS,
	DIALOG_SERVICE_ROOFS,
	DIALOG_SERVICE_SIDE_SKIRTS,
	DIALOG_SERVICE_BULLBARS,
	DIALOG_SERVICE_NEON,
	DIALOG_MENU_TRUCKER,
	DIALOG_SHIPMENTS,
	DIALOG_SHIPMENTS_VENDING,
	DIALOG_HAULING,
	DIALOG_RESTOCK,
	DIALOG_RESTOCK_VENDING,
	DIALOG_ARMS_GUN,
	DIALOG_PLANT,
	DIALOG_EDIT_PRICE,
	DIALOG_EDIT_PRICE1,
	DIALOG_EDIT_PRICE2,
	DIALOG_EDIT_PRICE3,
	DIALOG_EDIT_PRICE4,
	DIALOG_OFFER,
	DIALOG_MATERIAL,
	DIALOG_COMPONENT,
	DIALOG_DRUGS,
	DIALOG_FOOD,
	DIALOG_FOOD_BUY,
	DIALOG_SEED_BUY,
	DIALOG_PRODUCT,
	DIALOG_GASOIL,
	DIALOG_APOTEK,
	DIALOG_ATM,
	DIALOG_TRACKATM,
	DIALOG_ATMDEPOSIT,
	DIALOG_ATMWITHDRAW,
	DIALOG_BSHOP,
	DIALOG_BANK,
	DIALOG_BANKDEPOSIT,
	DIALOG_BANKWITHDRAW,
	DIALOG_BANKREKENING,
	DIALOG_BANKTRANSFER,
	DIALOG_BANKCONFIRM,
	DIALOG_BANKSUKSES,
	DIALOG_PHONE,
	DIALOG_TWITTER,
	DIALOG_TWITTERPOST,
	DIALOG_TWITTERNAME,
	DIALOG_PHONE_ADDCONTACT,
	DIALOG_PHONE_CONTACT,
	DIALOG_PHONE_NEWCONTACT,
	DIALOG_PHONE_INFOCONTACT,
	DIALOG_PHONE_SENDSMS,
	DIALOG_PHONE_TEXTSMS,
	DIALOG_PHONE_DIALUMBER,
	DIALOG_TOGGLEPHONE,
	DIALOG_IBANK,
	DIALOG_AYAM,
	DIALOG_ASKS,
	DIALOG_SALARY,
	DIALOG_PAYCHECK,
	DIALOG_BUS,
	DIALOG_RUTE_BUS,
	DIALOG_HEALTH,
	DIALOG_OBAT,
	DIALOG_ISIKUOTA,
	DIALOG_DOWNLOAD,
	DIALOG_KUOTA,
	DIALOG_STUCK,
	DIALOG_TDM,
	DIALOG_PICKUPVEH,
	DIALOG_TRACKPARK,
	DIALOG_MY_WS,
	DIALOG_TRACKWS,
	WS_MENU,
	WS_SETNAME,
	WS_SETOWNER,
	WS_SETEMPLOYE,
	WS_SETEMPLOYEE,
	WS_SETOWNERCONFIRM,
	WS_SETMEMBER,
	WS_SETMEMBERE,
	WS_MONEY,
	WS_WITHDRAWMONEY,
	WS_DEPOSITMONEY,
	WS_COMPONENT,
	WS_COMPONENT2,
	WS_MATERIAL,
	WS_MATERIAL2,
	DIALOG_ACTORANIM,
	DIALOG_MY_VENDING,
	DIALOG_VENDING_INFO,
	DIALOG_VENDING_BUYPROD,
	DIALOG_VENDING_MANAGE,
	DIALOG_VENDING_NAME,
	DIALOG_VENDING_VAULT,
	DIALOG_VENDING_WITHDRAW,
	DIALOG_VENDING_DEPOSIT,
	DIALOG_VENDING_EDITPROD,
	DIALOG_VENDING_PRICESET,
	DIALOG_VENDING_RESTOCK,
	DIALOG_SPAWN_1,
	DIALOG_MYVEH,
	DIALOG_MYVEH_INFO,
	DIALOG_FAMILY_INTERIOR,
	DIALOG_SPAREPART,
	DIALOG_BUYPARTS,
	DIALOG_BUYPARTS_DONE,
	VEHICLE_STORAGE,
	VEHICLE_WEAPON,
	VEHICLE_MONEY,
	VEHICLE_REALMONEY,
	VEHICLE_REALMONEY_WITHDRAW,
	VEHICLE_REALMONEY_DEPOSIT,
	VEHICLE_REDMONEY,
	VEHICLE_REDMONEY_WITHDRAW,
	VEHICLE_REDMONEY_DEPOSIT,
	VEHICLE_DRUGS,
	VEHICLE_MEDICINE,
	VEHICLE_MEDICINE_WITHDRAW,
	VEHICLE_MEDICINE_DEPOSIT,
	VEHICLE_MEDKIT,
	VEHICLE_MEDKIT_WITHDRAW,
	VEHICLE_MEDKIT_DEPOSIT,
	VEHICLE_BANDAGE,
	VEHICLE_BANDAGE_WITHDRAW,
	VEHICLE_BANDAGE_DEPOSIT,
	VEHICLE_OTHER,
	VEHICLE_SEED,
	VEHICLE_SEED_WITHDRAW,
	VEHICLE_SEED_DEPOSIT,
	VEHICLE_MATERIAL,
	VEHICLE_MATERIAL_WITHDRAW,
	VEHICLE_MATERIAL_DEPOSIT,
	VEHICLE_COMPONENT,
	VEHICLE_COMPONENT_WITHDRAW,
	VEHICLE_COMPONENT_DEPOSIT,
	VEHICLE_MARIJUANA,
	VEHICLE_MARIJUANA_WITHDRAW,
	VEHICLE_MARIJUANA_DEPOSIT,
	DIALOG_NONRPNAME,
	//CONTAINER
	DIALOG_CONTAINER,
	//bb
	DIALOG_BOOMBOX,
	DIALOG_BOOMBOX1,
	//dealership
	DIALOG_BUYDEALERCARS_CONFIRM_M,
	DIALOG_BUYJOBCARSVEHICLE,
	DIALOG_ACLAIM,
	DIALOG_BUYDEALERCARS_CONFIRM,
	DIALOG_BUYTRUCKVEHICLE,
	DIALOG_BUYMOTORCYCLEVEHICLE,
	DIALOG_BUYUCARSVEHICLE,
	DIALOG_BUYCARSVEHICLE,
	DIALOG_DEALER_MANAGE,
	DIALOG_DEALER_VAULT,
	DIALOG_DEALER_WITHDRAW,
	DIALOG_PRISONMENU,
	DIALOG_DEALER_DEPOSIT,
	DIALOG_DEALER_NAME,
	DIALOG_DEALER_RESTOCK,
	DIALOG_TAKEFOOD,
	DIALOG_TDC,
	DIALOG_TDC_PLACE,
	//PEDAGANG
	PEDAGANG_MENU,
	PDG_KENTANG,
	PDG_MINERAL,
	PDG_SNACK,
	PDG_CHICKEN,
	PDG_COCACOLA,
	PDG_JERUK,
	PDG_BURGER,
	PDG_PIZZA,
	PDG_AYAM_FILET,
	//
	PDG_KENTANG1,
	PDG_MINERAL1,
	PDG_SNACK1,
	PDG_CHICKEN1,
	PDG_COCACOLA1,
	PDG_JERUK1,
	PDG_BURGER1,
	PDG_PIZZA1,
	PDG_AYAM_FILET1,
	//---[ DIALOG OWN FARM ]---
	FARM_STORAGE,
	FARM_INFO,
	FARM_POTATO,
	FARM_WHEAT,
	FARM_ORANGE,
	FARM_MONEY,
	FARM_DEPOSITPOTATO,
	FARM_WITHDRAWPOTATO,
	FARM_DEPOSITWHEAT,
	FARM_WITHDRAWWHEAT,
	FARM_DEPOSITORANGE,
	FARM_WITHDRAWORANGE,
	FARM_DEPOSITMONEY,
	FARM_WITHDRAWMONEY,
	//spawn faction
	DIALOG_SAMD_GARAGE,
	DIALOG_SANA_GARAGE,
	DIALOG_SAPD_GARAGE,
	//playermenu
	DIALOG_PRM
}

//-----[ Download System ]-----
new download[MAX_PLAYERS];

//-----[ Count System ]-----
new Count = -1;
new countTimer;
new showCD[MAX_PLAYERS];
new CountText[5][5] =
{
	"~r~1",
	"~g~2",
	"~y~3",
	"~g~4",
	"~b~5"
};

//-----[ Rob System ]-----
new robmoney;

//-----[ Server Uptime ]-----
new up_days,
	up_hours,
	up_minutes,
	up_seconds,
	WorldTime = 10,
	WorldWeather = 24;

//idskin
new SpawnMale = mS_INVALID_LISTID,
	SpawnFemale = mS_INVALID_LISTID,
	MaleSkins = mS_INVALID_LISTID,
	FemaleSkins = mS_INVALID_LISTID,
	VIPMaleSkins = mS_INVALID_LISTID,
	VIPFemaleSkins = mS_INVALID_LISTID,
	SAPDMale = mS_INVALID_LISTID,
	SAPDFemale = mS_INVALID_LISTID,
	SAPDWar = mS_INVALID_LISTID,
	SAGSMale = mS_INVALID_LISTID,
	SAGSFemale = mS_INVALID_LISTID,
	SAMDMale = mS_INVALID_LISTID,
	SAMDFemale = mS_INVALID_LISTID,
	SANEWMale = mS_INVALID_LISTID,
	SANEWFemale = mS_INVALID_LISTID,
	toyslist = mS_INVALID_LISTID,
	viptoyslist = mS_INVALID_LISTID,
	vtoylist = mS_INVALID_LISTID,
	PDGSkinMale = mS_INVALID_LISTID,
	PDGSkinFemale = mS_INVALID_LISTID,
	TransFender = mS_INVALID_LISTID,
	Waa = mS_INVALID_LISTID,
	LoCo = mS_INVALID_LISTID;

//-----[ Faction Vehicle ]-----	
#define VEHICLE_RESPAWN 7200

new SAPDVehicles[75],
	SAGSVehicles[30],
	SAMDVehicles[30],
	SANAVehicles[30];

IsSAPDCar(carid)
{
	for(new v = 0; v < sizeof(SAPDVehicles); v++)
	{
	    if(carid == SAPDVehicles[v]) return 1;
	}
	return 0;
}

IsGovCar(carid)
{
	for(new v = 0; v < sizeof(SAGSVehicles); v++)
	{
	    if(carid == SAGSVehicles[v]) return 1;
	}
	return 0;
}

IsSAMDCar(carid)
{
	for(new v = 0; v < sizeof(SAMDVehicles); v++)
	{
	    if(carid == SAMDVehicles[v]) return 1;
	}
	return 0;
}

IsSANACar(carid)
{
	for(new v = 0; v < sizeof(SANAVehicles); v++)
	{
	    if(carid == SANAVehicles[v]) return 1;
	}
	return 0;
}

//-----[ Showroom Checkpoint ]-----	
new ShowRoomCP,
	ShowRoomCPRent;

new DutyTimer;
new MalingKendaraan;

//-----[ Button ]-----	
new SAGSLobbyBtn[8],
	SAGSLobbyDoor[4],
	SAMCLobbyBtn[6],
	SAMCLobbyDoor[3];

//-----[ MySQL Connect ]-----	
new MySQL: g_SQL;

new TogOOC = 1;

new bool:DialogHauling[7];
new bool:DialogSaya[MAX_PLAYERS][7];
new TrailerContainer[MAX_VEHICLES];
//-----[ Player Data ]-----	
enum E_PLAYERS
{
	pID,
	pUCP[22],
	pExtraChar,
	pChar,
	pName[MAX_PLAYER_NAME],
	pAdminname[MAX_PLAYER_NAME],
	bool:pAhide,
	pIP[16],
	pVerifyCode,
	pPassword[65],
	pSalt[17],
	pEmail[40],
	pUcpAdmin,
	pAdmin,
	pHelper,
	pClikmap,
	pLevel,
	pLevelUp,
	pVip,
	pVipTime,
	pGold,
	pRegDate[50],
	pLastLogin[50],
	UangGudang,
	pMoney,
	pRedMoney,
	Text3D:pMaskLabel,
	pBankMoney,
	pToggleBank,
	pBankRek,
	pPhone,
	pPhoneOn,
	pPhoneCredit,
	pContact,
	pPhoneBook,
	pSMS,
	pCall,
	pCallTime,
	pWT,
	pHours,
	pMinutes,
	pSeconds,
	pPaycheck,
	pSkin,
	pFacSkin,
	pJobSkin,
	pGender,
	pAge[50],
	pDutyJob,
	pGetPARKID,
	pInDoor,
	pInHouse,
	pInBiz,
	pInVending,
	pInFamily,
	Float: pPosX,
	Float: pPosY,
	Float: pPosZ,
	Float: pPosA,
	pInt,
	pWorld,
	Float:pHealth,
    Float:pArmour,
    pVest,
	pHunger,
	pEnergy,
	pBladder,
	pBladderTime,
	pHungerTime,
	pEnergyTime,
	pSick,
	pSickTime,
	pHospital,
	pHospitalTime,
	pInjured,
	Text3D: pInjuredLabel,
	pOnDuty,
	pOnDutyTime,
	pFaction,
	pFactionRank,
	pFactionLead,
	pTazer,
	pBroadcast,
	pNewsGuest,
	pFamily,
	pFamilyRank,
	pJail,
	pJailTime,
	pArrest,
	pArrestTime,
	pWarn,
	pJob,
	pJob2,
	pJobTime,
	pExitJob,
	pMedicine,
	pMedkit,
	pMask,
	pHelmet,
	pCig,
	pMineral,
	pPizza,
	pBurger,
	pChiken,
	pCola,
	pSnack,
	pSprunk,
	pGas,
	pBandage,
	pGPS,
	pGpsActive,
	pMaterial,
	pComponent,
	pFood,
	pSeed,
	pPotato,
	pWheat,
	pOrange,
	pPrice1,
	pPrice2,
	pPrice3,
	pPrice4,
	pMarijuana,
	pKanabis,
	pPlant,
	pPlantTime,
	pInSt,
	pFishTool,
	pMenuTypeStorage,
	pIns,
	pWorm,
	pFish,
	//bus
	Kontol,
	Memek,
	pInFish,
	pIDCard,
	pIDCardTime,
	pDriveLic,
	pDriveLicTime,
	pDriveLicApp,
	pBoatLic,
	pBoatLicTime,
	pWeaponLic,
	pWeaponLicTime,
	pBizLic,
	pBizLicTime,
	pBpjs,
	pBpjsTime,
	pFlyLic,
	pFlyLicTime,
	pGuns[13],
    pAmmo[13],
	pWeapon,
	//Not Save
	Cache:Cache_ID,
	bool: IsLoggedIn,
	LoginAttempts,
	LoginTimer,
	pSpawned,
	pSpawnList,
	pAdminDuty,
	pFreezeTimer,
	pFreeze,
	pMaskID,
	pMaskOn,
	pSPY,
	pTogPM,
	pTogLog,
	pTogAds,
	pTogWT,
	pBuluAyam,
	Text3D:pAdoTag,
	Text3D:pBTag,
	bool:pBActive,
	bool:pAdoActive,
	pFlare,
	bool:pFlareActive,
	sampahsaya,
	//=======[ PEMERAS SUSU ]======
	pSusu,
	bool:pJobmilkduty,
	pMilkJob,
	bool:pLoading,
	pSusuOlahan,
	//========[ Duty Job ]========
	bool:DutyPenambang,
	bool:DutyMinyak,
	bool:DutyPemotong,
	//=============================
	pPeluru[2],
	pDe,
	pKatana,
	pMolotov,
	p9mm,
	pSg,
	pSpas,
	pMp5,
	pM4,
	pClip,
	//================
	pTrackCar,
	pBuyPvModel,
	pTrackHouse,
	pTrackBisnis,
	pTrackVending,
	pFacInvite,
	pFacOffer,
	pFamInvite,
	pFamOffer,
	pFindEms,
	pCuffed,
	toySelected,
	bool:PurchasedToy,
	pEditingItem,
	pProductModify,
	pEditingVendingItem,
	pVendingProductModify,
	pCurrSeconds,
	pCurrMinutes,
	pCurrHours,
	pSpec,
	playerSpectated,
	pFriskOffer,
	pDragged,
	pDraggedBy,
	pDragTimer,
	pHBEMode,
	pHelmetOn,
	pReportTime,
	pAskTime,
	//Player Progress Bar
	PlayerBar:spfuelbar,
	PlayerBar:spdamagebar,
	PlayerBar:sphungrybar,
	PlayerBar:spenergybar,
	PlayerBar:activitybar,
	pPart,
	pPartStatus,
	pProducting,
	pProductingStatus,
	pPemotong,
	pPemotongStatus,
	pCooking,
	pCookingStatus,
	pArmsDealer,
	pArmsDealerStatus,
	// Roleplay Booster
 	pBooster,
 	pBoostTime,
	pMechanic,
	pMechanicStatus,
	pActivity,
	pActivityStatus,
	pActivityTime,
	pCs,
	//Jobs
	pSideJob,
	pSideJobTime,
	pBustime,
	pBusTime,
	bool:pBuswaiting,
	pSparepartTime,
	bool:BensinWaiting,
	SPAWNMENU,
	pGetJob,
	pGetJob2,
	pMechDuty,
	pMechVeh,
	pMechColor1,
	pMechColor2,
	EditingTrash,
	EditingGarkot,
	//ATM
	EditingATMID,
	//lumber job
	pKamera,
	EditingTreeID,
	CuttingTreeID,
	bool:CarryingLumber,
	//Storage
	ST_MENU,
	ST_MONEY,
	ST_WITHDRAWMONEY,
	ST_DEPOSITMONEY,
	ST_COMPONENT,
	ST_COMPONENT2,
	ST_MATERIAL,
	ST_MATERIAL2,
	//Miner job
	EditingOreID,
	MiningOreID,
	CarryingLog,
	LoadingPoint,
	//Container
	pSedangContainer,
	//ROB
	pLockPick,
	BankDelay,
	pRobStatus,
	RobbankTime,
	RobatmTime,
	RobbizTime,
	//Vending
	EditingVending,
	//production
	CarryProduct,
	//part job
	CarryPart,
	//trucker
	pMission,
	pHauling,
	pVendingRestock,
	bool: CarryingBox,
	//kejar
	pCheckpointTarget,
	//Farmer
	pHarvest,
	pHarvestID,
	pOffer,
	//Bank
	pTransfer,
	pTransferRek,
	pTransferName[128],
	//Gas Station
	pFill,
	pFillStatus,
	pFillTime,
	pFillPrice,
	//boombox
	pBoombox,
	//Gate
	gEditID,
	gEdit,
	// WBR
	pHead,
 	pPerut,
 	pLHand,
 	pRHand,
 	pLFoot,
 	pRFoot,
 	// Inspect Offer
 	pInsOffer,
 	// Obat System
 	pObat,
 	// Suspect
 	pSuspectTimer,
 	pSuspect,
 	// Phone On Off
 	pPhoneStatus,
 	// Shareloc Offer
 	pLocOffer,
 	// Register tinggi dan berat badan
 	pTinggi[50],
 	pBerat[50],
 	//download app handphone
 	pInstallTweet,
 	pInstallGojek,
 	pInstallMap,
 	pInstallBank,
 	// Twitter
 	pTwitter,
	pTwitterStatus, 
	pTwittername[MAX_PLAYER_NAME],
	pTwitterPostCooldown,
	pTwitterNameCooldown,
 	pRegTwitter,
 	// Kuota
 	pKuota,
 	// DUTY SYSTEM
 	pDutyHour,
 	//pemotong ayam
	timerambilayamhidup,
    timerpotongayam,
    timerpackagingayam,
    timerjualayam,
    AyamHidup,
	AyamPotong,
	AyamFillet,
	sedangambilayam,
    sedangpotongayam,
    sedangfilletayam,
    sedangjualayam,
 	// CHECKPOINT
 	pCP,
 	// ROBBERY
 	pRobTime,
 	pRobOffer,
 	pRobLeader,
 	pRobMember,
 	pMemberRob,
	pTrailer,
	// Smuggler
	bool:pTakePacket,
	pTrackPacket,
	// Garkot
	pPark,
	pLoc,
	//robbank
	pPanelHacking,
	pBomb,
	// WS
	pMenuType,
	pInWs,
	pTransferWS,
	//PENJAHIT
	pKain,
	pWool,
	pPakaian,
	//Anticheat
	pACWarns,
	pACTime,
	pRadioVoice,
	pTombolVoice,
	pTombolVoiceRadio,
	pTombolVoiceAdmin,
	pCallStage,
	pJetpack,
	pArmorTime,
	pLastUpdate,
	//Checkpoint
	pCheckPoint,
	pBus,
	//SpeedCam
	pSpeedTime,
	//Starterpack
	pStarterpack,
	//inventkry
	PilihSpawn,
	pProgress,
	WaktuWarung,
	pSelectItem,
	pTarget,
	pGiveAmount,
	//Anim
	pLoopAnim,
	//Rob Car
	pLastChop,
	pLastChopTime,
	pIsStealing,
	//Sparepart
	pSparepart,
	//
	pUangKorup,
	//Senter
	pFlashlight,
	pUsedFlashlight,
	//Moderator
	pServerModerator,
	pEventModerator,
	pFactionModerator,
	pFamilyModerator,
	//
	pPaintball,
	pPaintball2,
	//
	pDelayIklan,
	//LADANG
	pBorax,
	pKecubung,
	pPaketborax,
	pPaketkecubung,
	pTukar,
	//PENAMBANG
	pBatu,
	pBatuCucian,
	pTujuan[100],
	pOngkos[50],
	pEmas,
	//PENAMBANGMINYAK
	pMinyak,
	pEssence,
	//Pedagang
	pdgMenuType,
	pInPdg,
	Text3D: pLabelDisconnect,
	pTimerDisconnect,
	//-----[ FARM PRIVATE]
	pFarm,
	pFarmRank,
	pFarmInvite,
	pFarmOffer,
	//GPS TAG HAN
	pWaypoint,
	pLocation[32],
	Float:pWaypointPos[3],
	PlayerText:pTextdraws[83],
	//SEATBLET
	pSeatbelt,
	// Vehicle Toys
	EditStatus,
	VehicleID,
	pInDealer,
	//spawn faction
	pSpawnSamd,
	pSpawnSana,
	pSpawnSapd
};
new pData[MAX_PLAYERS][E_PLAYERS];
new g_MysqlRaceCheck[MAX_PLAYERS];
#define PlayerData pData
#define PlayerInfo PlayerData

enum e_TEMP_INFO
{
	Text3D:FuelLabel
}
new pTemp[MAX_PLAYERS][e_TEMP_INFO];
//-----[ Smuggler ]-----	

new Text3D:packetLabel,
	packetObj,
	Float:paX, 
	Float:paY, 
	Float:paZ;

//-----[ Forklifter Object ]-----	
new 
	VehicleObject[MAX_VEHICLES] = {-1, ...};

//-----[ Lumber Object Vehicle ]-----	
#define MAX_BOX 50
#define BOX_LIFETIME 100
#define BOX_LIMIT 5

enum    E_BOX
{
	boxDroppedBy[MAX_PLAYER_NAME],
	boxSeconds,
	boxObjID,
	boxTimer,
	boxType,
	Text3D: boxLabel
}
new BoxData[MAX_BOX][E_BOX],
	Iterator:Boxs<MAX_BOX>;

new
	BoxStorage[MAX_VEHICLES][BOX_LIMIT];

//-----[ Lumber Object Vehicle ]-----	
#define MAX_LUMBERS 50
#define LUMBER_LIFETIME 100
#define LUMBER_LIMIT 10

enum    E_LUMBER
{
	lumberDroppedBy[MAX_PLAYER_NAME],
	lumberSeconds,
	lumberObjID,
	lumberTimer,
	Text3D: lumberLabel
}
new LumberData[MAX_LUMBERS][E_LUMBER],
	Iterator:Lumbers<MAX_LUMBERS>;

new
	LumberObjects[MAX_VEHICLES][LUMBER_LIMIT];

	
new
	Float: LumberAttachOffsets[LUMBER_LIMIT][4] = {
	    {-0.223, -1.089, -0.230, -90.399},
		{-0.056, -1.091, -0.230, 90.399},
		{0.116, -1.092, -0.230, -90.399},
		{0.293, -1.088, -0.230, 90.399},
		{-0.123, -1.089, -0.099, -90.399},
		{0.043, -1.090, -0.099, 90.399},
		{0.216, -1.092, -0.099, -90.399},
		{-0.033, -1.090, 0.029, -90.399},
		{0.153, -1.089, 0.029, 90.399},
		{0.066, -1.091, 0.150, -90.399}
	};

//-----[ Ores Miner ]-----	
#define LOG_LIFETIME 100
#define LOG_LIMIT 10
#define MAX_LOG 100

enum    E_LOG
{
	bool:logExist,
	logType,
	logDroppedBy[MAX_PLAYER_NAME],
	logSeconds,
	logObjID,
	logTimer,
	Text3D:logLabel
}
new LogData[MAX_LOG][E_LOG];

new
	LogStorage[MAX_VEHICLES][2];

//-----[ Trucker ]-----	
new VehProduct[MAX_VEHICLES];
new VehGasOil[MAX_VEHICLES];
new VehParts[MAX_VEHICLES];


//-----[ Type Checkpoint ]-----	
enum
{
	CHECKPOINT_NONE = 0,
	CHECKPOINT_DRIVELIC,
	CHECKPOINT_MISC,
	CHECKPOINT_BUS
}

//-----[ Storage Limit ]-----	
enum
{
	LIMIT_SNACK,
	LIMIT_SPRUNK,
	LIMIT_MEDICINE,
	LIMIT_MEDKIT,
 	LIMIT_BANDAGE,
 	LIMIT_SEED,
	LIMIT_MATERIAL,
	LIMIT_COMPONENT,
	LIMIT_MARIJUANA
};

//-----[ eSelection Define ]-----	
#define 	SPAWN_SKIN_MALE 		1
#define 	SPAWN_SKIN_FEMALE 		2
#define 	SHOP_SKIN_MALE 			3
#define 	SHOP_SKIN_FEMALE 		4
#define 	VIP_SKIN_MALE 			5
#define 	VIP_SKIN_FEMALE 		6
#define 	SAPD_SKIN_MALE 			7
#define 	SAPD_SKIN_FEMALE 		8
#define 	SAPD_SKIN_WAR 			9
#define 	SAGS_SKIN_MALE 			10
#define 	SAGS_SKIN_FEMALE 		11
#define 	SAMD_SKIN_MALE 			12
#define 	SAMD_SKIN_FEMALE 		13
#define 	SANA_SKIN_MALE 			14
#define 	SANA_SKIN_FEMALE 		15
#define 	TOYS_MODEL 				16
#define 	VIPTOYS_MODEL 			17
#define 	PDG_SKIN_MALE 			18
#define 	PDG_SKIN_FEMALE 		19
#define 	vtoyslist 		20




//-----[ Modular ]-----	
main() 
{
	SetTimer("onlineTimer", 1000, true);
	SetTimer("TDUpdates", 8000, true);
}
new bool:Warung;
#include <textdraw-streamer>
//========= DATA =====================
#include "DATA\COLOR.pwn"
#include "DATA\LOADINGPROG.pwn"
#include "DATA\NOTIFIKASI.pwn"
#include "DATA\SHOWITEMBOX.pwn"
#include "DATA\PEMAINONLINE.pwn"
#include "DATA\UCP.pwn"
#include "DATA\TEXTDRAW.pwn"
#include "DATA\INVENTORY.pwn"
#include "DATA\ANIMS.pwn"
#include "DATA\RENTAL.pwn"
#include "DATA\KANABIS.pwn"
#include "DATA\PRIVATE_VEHICLE.pwn"
#include "DYNAMIC\HOUSE.pwn"
#include "DYNAMIC\BISNIS.pwn"
#include "DYNAMIC\GARKOT.pwn"
#include "DATA\GARASI_POLISI.pwn"
#include "DYNAMIC\DOOR.pwn"
#include "DYNAMIC\GAS_STATION.pwn"
#include "DYNAMIC\LOCKER.pwn"
#include "DYNAMIC\DEALERSHIP.pwn"
#include "DYNAMIC\GATE.pwn"
#include "DYNAMIC\WORKSHOP.pwn"
#include "DYNAMIC\SPEEDCAM.pwn"
#include "DYNAMIC\ACTOR.pwn"
#include "DYNAMIC\TRASH.pwn"
#include "DYNAMIC\ROBWARUNG.pwn"
#include "DATA\VSTORAGE.pwn"
#include "DATA\REPORT.pwn"
#include "DATA\ASK.pwn"
#include "DATA\WEAPON_ATTH.pwn"
#include "DATA\TOYS.pwn"
#include "DATA\HELMET.pwn"
#include "DATA\BILLS.pwn"
#include "DATA\SERVER.pwn"
#include "DATA\FAMILY.pwn"
#include "DATA\AUCTION.pwn"
#include "DATA\NATIVE.pwn"
#include "DATA\VOUCHER.pwn"
#include "DATA\SALARY.pwn"
#include "DATA\ATM.pwn"
#include "DATA\ARMS_DEALER.pwn"
#include "DATA\INGAMEMAP.pwn"
#include "DATA\ROB.pwn"
#include "DATA\ROBBANK.pwn"
#include "DATA\MDC.pwn"
#include "DATA\TEXTCLICK.pwn"
#include "DATA\PRIVATE_FARM.pwn"
#include "DATA\ROBBERY.pwn"
#include "DATA\DMV.pwn"
#include "DATA\ANTICHEAT.pwn"
#include "DATA\VENDING.pwn"
#include "DATA\CONTACT.pwn"
#include "DATA\TOLL.pwn"
#include "DATA\LADANG.pwn"
#include "DATA\SIREN.pwn"
#include "DATA\STORAGE.pwn"
#include "DATA\GUDANG_PEDAGANG.pwn"
#include "DATA\SAMD.pwn"
#include "DATA\SANA.pwn"
#include "DATA\SAPD.pwn"
//======[ JOB ARIVENA X DEWATA ]==========
#include "JOB\PEMOTONGAYAM.pwn"
#include "JOB\PENAMBANGMINYAK.pwn"
#include "JOB\PENAMBANG.pwn"
#include "JOB\PEMERAHSUSU.pwn"
#include "JOB\PRODUCTION.pwn"
#include "JOB\SMUGGLER.pwn"
#include "JOB\TRUCKER.pwn"
#include "JOB\LUMBER.pwn"
#include "JOB\FARMER.pwn"
#include "JOB\MINER.pwn"
#include "JOB\SPAREPART.pwn"
#include "JOB\CONTAINER.pwn"
#include "JOB\MECH.pwn"
#include "JOB\FISH.pwn"
#include "JOB\PENJAHIT.pwn"
#include "JOB\BUS.pwn"
// MODSHOP
#include "DATA\VTOYS.pwn"
#include "DATA\MODSHOP.pwn"
#include "MODSHOP\modshop.pwn"

#include "CMD\FACTION.pwn"
#include "CMD\PLAYER.pwn"
#include "CMD\ADMIN.pwn"


#include "DATA\SAPD_TASER.pwn"
#include "DATA\SAPD_SPIKE.pwn"

#include "DATA\DIALOG.pwn"
#include "DATA\MAPPING.pwn"

#include "CMD\ALIAS\ALIAS_PRIVATE_VEHICLE.pwn"
#include "CMD\ALIAS\ALIAS_PLAYER.pwn"
#include "CMD\ALIAS\ALIAS_BISNIS.pwn"
#include "CMD\ALIAS\ALIAS_ADMIN.pwn"
#include "CMD\ALIAS\ALIAS_HOUSE.pwn"

#include "DATA\EVENT.pwn"

#include "DATA\FUNCTION.pwn"

#include "DATA\TASK.pwn"

#include "CMD\DISCORD.pwn"


native SendClientCheck(playerid, type, arg, offset, size);

function AutoGmx()
{
	SetTimer("GmxNya", 60000, true);
	SendClientMessageToAll(COLOR_RED, "[Auto Gmx]"WHITE_E" - Server akan otomatis restar dalam "RED_E"60"WHITE_E" detik");
	//DCC_SendChannelMessage(g_Discord_Information, "```Server akan otomatis __Restar__ Dalam 60 detik```.");
	return 1;
}
function GmxNya()
{
	SendRconCommand("gmx");
}

//-----[ Discord Status ]-----	
forward BotStatus();
public BotStatus()
{
    new h = 0, m = 0, secs = 0, statuz[256];
	h = floatround(upt / 3600);
	m = floatround((upt / 60) - (h * 60));
	secs = floatround(upt - ((h * 3600) + (m * 60)));
	upt++;
	//format(statuz,sizeof(statuz),"!register [nama ucp]");
	format(statuz,sizeof(statuz),"%d/%d Warga | %02dj %02dm %02ds Uptime | Fivem Roleplay", pemainic, GetMaxPlayers(), h, m, secs);
	DCC_SetBotActivity(statuz);
}

forward splits(const strsrc[], strdest[][], delimiter);
public splits(const strsrc[], strdest[][], delimiter)
{
	new i, li;
	new aNum;
	new len;
	while(i <= strlen(strsrc)){
		if(strsrc[i]==delimiter || i==strlen(strsrc)){
			len = strmid(strdest[aNum], strsrc, li, i, 128);
			strdest[aNum][len] = 0;
			li = i+1;
			aNum++;
		}
		i++;
	}
	return 1;
}

stock FIXES_valstr(dest[], value, bool:pack = false)
{
    // format can't handle cellmin properly
    static const cellmin_value[] = !"-2147483648";

    if (value == cellmin)
        pack && strpack(dest, cellmin_value, 12) || strunpack(dest, cellmin_value, 12);
    else
        format(dest, 12, "%d", value) && pack && strpack(dest, dest, 12);
}

stock number_format(number)
{
	new i, string[15];
	FIXES_valstr(string, number);
	if(strfind(string, "-") != -1) i = strlen(string) - 4;
	else i = strlen(string) - 3;
	while (i >= 1)
 	{
		if(strfind(string, "-") != -1) strins(string, ",", i + 1);
		else strins(string, ",", i);
		i -= 3;
	}
	return string;
}

public DCC_OnMessageCreate(DCC_Message:message)
{
	new realMsg[100];
    DCC_GetMessageContent(message, realMsg, 100);
    new bool:IsBot;
    new DCC_Channel:g_Discord_Chat;
    g_Discord_Chat = DCC_FindChannelById("1044641419068969062");
    new DCC_Channel:channel;
 	DCC_GetMessageChannel(message, channel);
    new DCC_User:author;
	DCC_GetMessageAuthor(message, author);
    DCC_IsUserBot(author, IsBot);
    if(channel == g_Discord_Chat && !IsBot) //!IsBot will block BOT's message in game
    {
        new user_name[32 + 1], str[152];
       	DCC_GetUserName(author, user_name, 32);
        format(str,sizeof(str), "{8a6cd1}[DISCORD] {aa1bb5}%s: {ffffff}%s", user_name, realMsg);
        SendStaffMessage(-1, str);
    }

    return 1;
}

stock GetCS(playerid)
{
 	new astring[48];
 	if(pData[playerid][pCs] == 0)format(astring, sizeof(astring), ""RED_E"None");
	else if(pData[playerid][pCs] == 1)format(astring, sizeof(astring), ""LG_E"Approved");
	return astring;
}
function WaktuKeluar(playerid)
{
	DestroyDynamic3DTextLabel(pData[playerid][pLabelDisconnect]);
	return 1;
}
function RobWarung(playerid, tid)
{
	new value = 100 + random(50), str[500];
	for(new i = 0; i < MAX_ROBBERY; i++)
	{
  		if(IsPlayerInRangeOfPoint(playerid, 2.3, RobberyData[i][robberyX], RobberyData[i][robberyY], RobberyData[i][robberyZ]))
	{
		GivePlayerMoneyEx(playerid, value);
		format(str,sizeof(str),"Anda mendapatkan uang ~g~%s", FormatMoney(value));
		SuccesMsg(playerid, str);
		new duet[500];
		format(duet, sizeof(duet), "ADD_%sx", FormatMoney(value));
		ShowItemBox(playerid, "Uang", duet, 1212, 4);
		new aid = GetPVarInt(playerid, "RobberyAnim");
	 	ApplyActorAnimation(aid, "ped", "cower",4.0,0,0,0,1,0);
	 	DeletePVar(playerid, "RobArea");
	 	PlayerPlaySound(playerid, 3401, RobberyData[i][robberyX], RobberyData[i][robberyY], RobberyData[i][robberyZ]);
	 	if(IsValidDynamic3DTextLabel(RobberyData[i][robberyText]))
	  	DestroyDynamic3DTextLabel(RobberyData[i][robberyText]);
		}
	}
}
public OnGameModeInit()
{
	CreateTextDraw();
	CreateProgress();
    Create3DTextLabel("{3CB371}Hunter JOB {FFFAFA}\n Tasteaza {3CB371}[/getjob]{FFFAFA} pentru a lua jobul", -1, 2355.0962, -658.8605, 128.0284, 10.5, 0, 0);
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    warnings{i} = 0;
	}
	SetTimer("YANGTIM", 1000, true);
	SetTimer("UpdateNametag", 1000, true);
	////////////////////////////////
	//mysql_log(ALL);
	SetTimer("BackupDB", 3600000, true);
	new MySQLOpt: option_id = mysql_init_options();

    DCC_FindChannelById("973240252162506822"); //
    g_Discord_Serverstatus = DCC_FindChannelById("101010");

    g_Discord_CHENH4X = DCC_FindChannelById("992113672942002187");
    
	mysql_set_option(option_id, AUTO_RECONNECT, true);

	g_SQL = mysql_connect(gamma.optiklink.com, u286697_p7GXWPXVXb, r8NGkPi1!W^B7CTMm1maIQP3, s286697_daplun, option_id);
	if (g_SQL == MYSQL_INVALID_HANDLE || mysql_errno(g_SQL) != 0)
	{
		print("MySQL connection failed. Server is shutting down.");
		SendRconCommand("exit");
		return 1;
	}
	print("MySQL connection is successful.");

	mysql_tquery(g_SQL, "SELECT * FROM `server`", "LoadServer");
	mysql_tquery(g_SQL, "SELECT * FROM `doors`", "LoadDoors");
	mysql_tquery(g_SQL, "SELECT * FROM `familys`", "LoadFamilys");
	mysql_tquery(g_SQL, "SELECT * FROM `houses`", "LoadHouses");
	mysql_tquery(g_SQL, "SELECT * FROM `bisnis`", "LoadBisnis");
	mysql_tquery(g_SQL, "SELECT * FROM `lockers`", "LoadLockers");
	mysql_tquery(g_SQL, "SELECT * FROM `gstations`", "LoadGStations");
	mysql_tquery(g_SQL, "SELECT * FROM `atms`", "LoadATM");
	mysql_tquery(g_SQL, "SELECT * FROM `gates`", "LoadGates");
	mysql_tquery(g_SQL, "SELECT * FROM `vouchers`", "LoadVouchers");
	mysql_tquery(g_SQL, "SELECT * FROM `trees`", "LoadTrees");
	mysql_tquery(g_SQL, "SELECT * FROM `ores`", "LoadOres");
	mysql_tquery(g_SQL, "SELECT * FROM `object`", "Object_Load", "");
    mysql_tquery(g_SQL, "SELECT * FROM `matext`", "Matext_Load", "");
	mysql_tquery(g_SQL, "SELECT * FROM `plants`", "LoadPlants");
	mysql_tquery(g_SQL, "SELECT * FROM `workshop`", "LoadWorkshop");
	mysql_tquery(g_SQL, "SELECT * FROM `dealership`", "LoadDealership");
	mysql_tquery(g_SQL, "SELECT * FROM `parks`", "LoadGarkot");
	mysql_tquery(g_SQL, "SELECT * FROM `trash`", "LoadTrash");
	mysql_tquery(g_SQL, "SELECT * FROM `speedcameras`", "LoadSpeedCam");
	mysql_tquery(g_SQL, "SELECT * FROM `actor`", "LoadActor");
	mysql_tquery(g_SQL, "SELECT * FROM `vending`", "LoadVending");
	mysql_tquery(g_SQL, "SELECT * FROM `pedagang`", "LoadPedagang");
	mysql_tquery(g_SQL, "SELECT * FROM `farm`", "LoadFarm");
	mysql_tquery(g_SQL, "SELECT * FROM `robbery`", "Loadrobbery");

	ShowNameTags(0);
	EnableTirePopping(0);
	CreateServerPoint();
	CreateArmsPoint();
	CreateContainerPoint();
	LoadTazerSAPD();
	CreateJoinPartPoint();
	CreateJoinSmugglerPoint();

	CreateCarStealingPoint();
	LoadMap();
	CreateGateTollPoint();
	
	for (new i; i < sizeof(ColorList); i++) {
    format(color_string, sizeof(color_string), "%s{%06x}%03d %s", color_string, ColorList[i] >>> 8, i, ((i+1) % 16 == 0) ? ("\n") : (""));
    }

    for (new i; i < sizeof(FontNames); i++) {
        format(object_font, sizeof(object_font), "%s%s\n", object_font, FontNames[i]);
    }
	
	SpawnMale = LoadModelSelectionMenu("spawnmale.txt");
	SpawnFemale = LoadModelSelectionMenu("spawnfemale.txt");
	MaleSkins = LoadModelSelectionMenu("maleskin.txt");
	FemaleSkins = LoadModelSelectionMenu("femaleskin.txt");
	VIPMaleSkins = LoadModelSelectionMenu("maleskin.txt");
	VIPFemaleSkins = LoadModelSelectionMenu("femaleskin.txt");
	SAPDMale = LoadModelSelectionMenu("sapdmale.txt");
	SAPDFemale = LoadModelSelectionMenu("sapdfemale.txt");
	SAPDWar = LoadModelSelectionMenu("sapdwar.txt");
	SAGSMale = LoadModelSelectionMenu("sagsmale.txt");
	SAGSFemale = LoadModelSelectionMenu("sagsfemale.txt");
	SAMDMale = LoadModelSelectionMenu("samdmale.txt");
	SAMDFemale = LoadModelSelectionMenu("samdfemale.txt");
	SANEWMale = LoadModelSelectionMenu("sanewmale.txt");
	SANEWFemale = LoadModelSelectionMenu("sanewfemale.txt");
	toyslist = LoadModelSelectionMenu("toys.txt");
	viptoyslist = LoadModelSelectionMenu("viptoys.txt");
	vtoylist = LoadModelSelectionMenu("vtoylist.txt");
	PDGSkinMale = LoadModelSelectionMenu("pmale.txt");
	PDGSkinFemale = LoadModelSelectionMenu("pfemale.txt");
	TransFender = LoadModelSelectionMenu("transfender.txt");
	Waa = LoadModelSelectionMenu("waa.txt");
	LoCo = LoadModelSelectionMenu("loco.txt");

	
	ResetCarStealing();
	LoadModsPoint();

//	Ladang();
	Ladangtext();

	new gm[32];
	format(gm, sizeof(gm), "%s", TEXT_GAMEMODE);
	SetGameModeText(gm);
	format(gm, sizeof(gm), "weburl %s", TEXT_WEBURL);
	SendRconCommand(gm);
	format(gm, sizeof(gm), "language %s", TEXT_LANGUAGE);
	SendRconCommand(gm);
	//SendRconCommand("hostname Xero Gaming Roleplay");
	SendRconCommand("mapname Fivem");
	ManualVehicleEngineAndLights();
	EnableStuntBonusForAll(0);
	AllowInteriorWeapons(1);
	DisableInteriorEnterExits();
	LimitPlayerMarkerRadius(20.0);
	SetNameTagDrawDistance(1.0);
	//DisableNameTagLOS();
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_OFF);
	SetWorldTime(WorldTime);
	SetWeather(WorldWeather);
	BlockGarages(.text="NO ENTER");
	//Audio_SetPack("default_pack");	
	CreateDynamicObject(800, 1754.928588,-187.140090,80.490097, 0.000000, 0.000000, 133.731521, -1, -1, -1, 300.00, 300.00);//Kanabis
	CreateDynamicObject(800, 1754.928588,-187.140090,80.490097, 0.000000, 0.000000, 137.313674, -1, -1, -1, 300.00, 300.00);//Kanabis
	CreateDynamicMapIcon(2506.981933,-2637.118896,13.646511, 52, 0, -1, -1, -1, 7000.0, MAPICON_GLOBAL);
	new strings[150];
	
	for(new i = 0; i < sizeof(rentVehiclePolisi); i ++)
	{
	    CreateDynamicPickup(19606, 23, rentVehiclePolisi[i][0], rentVehiclePolisi[i][1], rentVehiclePolisi[i][2], -1, -1, -1, 50);
		format(strings, sizeof(strings), "Cmd: "LG_E"/garpol {ffffff}Untuk Ambil kendaraan");
		CreateDynamic3DTextLabel(strings, COLOR_WHITE, rentVehiclePolisi[i][0], rentVehiclePolisi[i][1], rentVehiclePolisi[i][2], 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // rent bike
	}
	//
	
	for(new i = 0; i < sizeof(rentVehicle); i ++)
	{
	    CreateDynamicPickup(2798, 23, rentVehicle[i][0], rentVehicle[i][1], rentVehicle[i][2], -1, -1, -1, 50);
		format(strings, sizeof(strings), "Tekan "LG_E"Y {ffffff}Untuk Rental Sepeda");
		CreateDynamic3DTextLabel(strings, COLOR_WHITE, rentVehicle[i][0], rentVehicle[i][1], rentVehicle[i][2], 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // rent bike
	}

	for(new i = 0; i < sizeof(rentBoat); i ++)
	{
	    CreateDynamicPickup(1239, 23, rentBoat[i][0], rentBoat[i][1], rentBoat[i][2], -1, -1, -1, 50);
		format(strings, sizeof(strings), "[Boat Rental]\n{FFFFFF}/rentboat");
		CreateDynamic3DTextLabel(strings, COLOR_LBLUE, rentBoat[i][0], rentBoat[i][1], rentBoat[i][2], 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // rent bike
	}

	for(new i = 0; i < sizeof(unrentVehicle); i ++)
	{
	    CreateDynamicPickup(1239, 23, unrentVehicle[i][0], unrentVehicle[i][1], unrentVehicle[i][2], -1, -1, -1, 50);
		format(strings, sizeof(strings), "[Unrent Vehicle]\n{FFFFFF}/unrentpv\n to unrent your vehicle");
		CreateDynamic3DTextLabel(strings, COLOR_LBLUE, unrentVehicle[i][0], unrentVehicle[i][1], unrentVehicle[i][2], 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // rent bike
	}
	
	//unrent kendaraan faction
	for(new i = 0; i < sizeof(unrentVehiclePolisi); i ++)
	{
	    CreateDynamicPickup(19605, 23, unrentVehiclePolisi[i][0], unrentVehiclePolisi[i][1], unrentVehiclePolisi[i][2], -1, -1, -1, 50);
		format(strings, sizeof(strings), "[Tempat Kasih Masuk]\n{FFFFFF}/kasimasuk\n untuk memasukan kendaraane");
		CreateDynamic3DTextLabel(strings, COLOR_LBLUE, unrentVehiclePolisi[i][0], unrentVehiclePolisi[i][1], unrentVehiclePolisi[i][2], 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // rent bike
	}

	//------[ PENJAHIT ]-----------
	new str[150];
    CreateDynamicPickup(1275, 23, 1302.190673,-1876.173828,13.763982, -1, -1, -1, 50);
    format(str, sizeof(str), "Tekan "LG_E"Y {ffffff}Untuk Membuat Pakaian");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 2313.817382,-2075.185546,17.644004, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
    format(str, sizeof(str), "Tekan "LG_E"Y {ffffff}Untuk Menjual Pakaian");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 1302.113769,-1876.048583,13.763982, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	format(str, sizeof(str), "Tekan "LG_E"Y {ffffff}Untuk Mengambil Wool");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 1925.521972,170.046707,37.281250, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	format(str, sizeof(str), "Tekan "LG_E"Y {ffffff}Untuk Akses Locker");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 2318.562744,-2070.840576,17.644752, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	format(str, sizeof(str), "Tekan "LG_E"Y {ffffff}Untuk Membuat Kain");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 2319.573730,-2080.727783,17.692657, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
    format(str, sizeof(str), "Tekan "LG_E"Y {ffffff}Untuk Membuat Kain");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 2321.482421,-2082.888671,17.652400, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	format(str, sizeof(str), "Tekan "LG_E"Y {ffffff}Untuk Membuat Kain");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 2317.667236,-2082.262939,17.694538, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	format(str, sizeof(str), "Tekan "LG_E"Y {ffffff}Untuk Membuat Kain");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 2319.653320,-2084.508544,17.652679, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

	// SANA GARAGE
	CreateDynamicPickup(1239, 23, 743.5262, -1332.2343, 13.8414, -1);
	format(strings, sizeof(strings), ""LB_E"Sana Vehicles\n"WHITE_E"use '"YELLOW_E"/spawnsana"WHITE_E"' to spawn vehicles\n"WHITE_E"use '"YELLOW_E"/despawnsana"WHITE_E"' to despawn vehicles");
	CreateDynamic3DTextLabel(strings, ARWIN, 743.5262, -1332.2343, 13.8414, 5.0); // Vehicles Stats Sana
	
	 // SAPD GARAGE
	CreateDynamicPickup(1239, 23, 397.9104,-1551.3491,33.1061, -1);
	format(strings, sizeof(strings), ""LB_E"Sapd Vehicles\n"WHITE_E"use '"YELLOW_E"/spawnpd"WHITE_E"' to spawn vehicles");
	CreateDynamic3DTextLabel(strings, ARWIN, 397.9104,-1551.3491,33.1061, 5.0); // Vehicles Stats Sapd

	// SAPD GARAGE
	CreateDynamicPickup(1239, 23, 1568.40, -1695.66, 5.89, -1);
	format(strings, sizeof(strings), ""LB_E"Sapd Vehicles\n"WHITE_E"use '"YELLOW_E"/spawnpd"WHITE_E"' to spawn vehicles\n"WHITE_E"use '"YELLOW_E"/despawnpd"WHITE_E"' to despawn vehicles");
	CreateDynamic3DTextLabel(strings, ARWIN, 1568.40, -1695.66, 5.89, 5.0); // Vehicles Stats Sapd

	 // SAMD GARAGE
	CreateDynamicPickup(1239, 23, 1131.5339, -1332.3248, 13.5797, -1);
	format(strings, sizeof(strings), ""LB_E"Samd Vehicles\n"WHITE_E"use '"YELLOW_E"/spawnmd"WHITE_E"' to spawn vehicles\n"WHITE_E"use '"YELLOW_E"/despawnmd"WHITE_E"' to despawn vehicles");
	CreateDynamic3DTextLabel(strings, ARWIN, 1131.5339, -1332.3248, 13.5797, 5.0); // Vehicles Stats Samd
	
	// SAPD DESPAWN HELICOPTER
	CreateDynamicPickup(1239, 23, 1564.8981,-1656.3313,28.3979, -1);
	format(strings, sizeof(strings), ""LB_E"Sapd Vehicles\n"WHITE_E"use '"YELLOW_E"/despawnpd"WHITE_E"' to despawn helicopter police");
	CreateDynamic3DTextLabel(strings, ARWIN, 1564.8981,-1656.3313,28.3979, 5.0);
	
	// SAMD DESPAWN HELICOPTER
	CreateDynamicPickup(1239, 23, 1162.8176, -1313.8239, 32.2215, -1);
	format(strings, sizeof(strings), ""LB_E"Samd Vehicles\n"WHITE_E"use '"YELLOW_E"/despawnmd"WHITE_E"' to despawn helicopter medical");
	CreateDynamic3DTextLabel(strings, ARWIN, 1162.8176, -1313.8239, 32.2215, 5.0);
	
	// SANA DESPAWN HELICOPTER
	CreateDynamicPickup(1239, 23, 741.9764,-1371.2441,25.8835, -1);
	format(strings, sizeof(strings), ""LB_E"Samd Vehicles\n"WHITE_E"use '"YELLOW_E"/despawnmd"WHITE_E"' to despawn helicopter agency");
	CreateDynamic3DTextLabel(strings, ARWIN, 741.9764,-1371.2441,25.8835, 5.0);

	//-----[ Toll System ]-----	
	for(new i;i < sizeof(BarrierInfo);i ++)
	{
		new
		Float:X = BarrierInfo[i][brPos_X],
		Float:Y = BarrierInfo[i][brPos_Y];

		ShiftCords(0, X, Y, BarrierInfo[i][brPos_A]+90.0, 3.5);
		CreateDynamicObject(966,BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z],0.00000000,0.00000000,BarrierInfo[i][brPos_A]);
		if(!BarrierInfo[i][brOpen])
		{
			gBarrier[i] = CreateDynamicObject(968,BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]+0.8,0.00000000,90.00000000,BarrierInfo[i][brPos_A]+180);
			MoveObject(gBarrier[i],BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]+0.7,BARRIER_SPEED,0.0,0.0,BarrierInfo[i][brPos_A]+180);
			MoveObject(gBarrier[i],BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]+0.75,BARRIER_SPEED,0.0,90.0,BarrierInfo[i][brPos_A]+180);
		}
		else gBarrier[i] = CreateDynamicObject(968,BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]+0.8,0.00000000,20.00000000,BarrierInfo[i][brPos_A]+180);
	}

	CreateDynamicPickup(1239, 23, 1415.843750,-33.066013,500.923828, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Kantor Pemerintah]\n{FFFFFF}/buatktp - untuk mendapatkan ktp\n/sellhouse - untuk menjual rumah anda\n/sellbusiness - untuk menjual bisnis anda");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 1415.843750,-33.066013,500.923828, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //

	//pemotong ayam
	format(strings, sizeof(strings), "[AYAM HIDUP]\n{FFFFFF}Tekan "LG_E"Y {FFFFFF}Untuk Ambil Ayam Hidup");
    CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -2107.4541,-2400.1042,31.4123, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
    CreateDynamicPickup(2992, 23, -2107.4541,-2400.1042,31.4123, -1, -1, -1, 5.0);

	format(strings, sizeof(strings), "[Pemotongan]\n{FFFFFF}Tekan "LG_E"Y {ffffff}Untuk Memotong Ayam Hidup");
    CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -2110.5706,-2408.4841,31.3079, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
    CreateDynamicPickup(2992, 23, -2110.5706,-2408.4841,31.3079, -1, -1, -1, 5.0);

    format(strings, sizeof(strings), "[Packing Ayam]\n{FFFFFF}Tekan "LG_E"Y {FFFFFF}Untuk Membungkus Ayam Potong");
    CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -2117.5095,-2414.5049,31.2266, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
    CreateDynamicPickup(2992, 23, -2117.5095,-2414.5049,31.2266, -1, -1, -1, 5.0);

	CreateDynamicPickup(1239, 23, 1545.033935,-2177.635498,13.582808, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Insurance]\n{ffffff}/claimpv - claim insurance\n/sellpv - menjual kendaraan");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 1545.033935,-2177.635498,13.582808, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Veh insurance

	CreateDynamicPickup(1239, 23, 801.12, -613.77, 16.33, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Sparepart]\n{FFFFFF}/sellpart\n");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 801.12, -613.77, 16.33, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Veh insurance
	
	CreateDynamicPickup(1239, 23, 1294.1837, -1267.9083, 20.6199, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Sparepart Shop]\n{FFFFFF}/buysparepart\n");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1294.1837, -1267.9083, 20.6199, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Veh insurance

	CreateDynamicPickup(1239, 23, 1330.39, 1566.83, 3010.90, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[BPJS]\n{FFFFFF}/newbpjs\n");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1330.39, 1566.83, 3010.90, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Veh insurance

	CreateDynamicPickup(1239, 23, 1386.3378,1537.9200,1510.9011, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "[License]\n{FFFFFF}/newdrivelic - membeli lisensi kendaraan");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 1386.3378,1537.9200,1510.9011, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Driving Lic
	
	CreateDynamicPickup(1239, 23, 1384.6998,1531.8773,1510.9011, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "[Plate]\n{FFFFFF}/buyplate - membuat plate kendaraan\n\n"BLUE_E"[Ticket]\n{FFFFFF}/payticket - untuk membayar denda");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 1384.6998,1531.8773,1510.9011, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Plate Kota LS
	
	CreateDynamicPickup(1239, 23, 1381.9929,1531.8798,1510.9011, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[License]\n{FFFFFF}/newweaponlic - untuk membayar licenses weapon");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 1381.9929,1531.8798,1510.9011, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Ticket Kota Dilimore

	CreateDynamicPickup(1239, 23, 59.6879, 1067.4708, -50.9141, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Arrest Point]\n{FFFFFF}/arrest - arrest wanted player");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 59.6879, 1067.4708, -50.9141, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // arrest
	
	CreateDynamicPickup(1239, 23, 1828.43, -1411.24, 13.60, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Hospital]\n{FFFFFF}/dropinjured");
	CreateDynamic3DTextLabel(strings, COLOR_PINK, 1828.43, -1411.24, 13.60, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // hospital
	
	/*CreateDynamicPickup(1239, 23, -2667.4021, 802.2328, 1500.9688, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[BANK]\n{FFFFFF}/newrek - create new rekening");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, -2667.4021, 802.2328, 1500.9688, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // bank
	*/
	CreateDynamicPickup(1239, 23, 1672.12, -1347.85, 18.21, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[BANK]\n{FFFFFF}/bank - access rekening\n/newrek - new rekening");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1672.12, -1347.85, 18.21, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // bank
	
	CreateDynamicPickup(1239, 23, -192.3483, 1338.7361, 1500.9823, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[IKLAN]\n{FFFFFF}/ads - public ads");
	CreateDynamic3DTextLabel(strings, COLOR_ORANGE2, -192.3483, 1338.7361, 1500.9823, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // iklan

	CreateDynamicPickup(1239, 23, 1229.49, -1427.36, 13.55, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Dapur]\n{FFFFFF}/menumasak");
	CreateDynamic3DTextLabel(strings, COLOR_ORANGE2, 1229.49, -1427.36, 13.55, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // pencucian uang haram

	CreateDynamicPickup(1239, 23, 1228.08, -1424.94, 13.50, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[PEDAGANG CENTER]\n{FFFFFF}/menu -  untuk membuka list menu");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1228.08, -1424.94, 13.50, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // bank

	CreateDynamicPickup(1241, 23, 1341.95, 1575.97, 3010.90, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[MYRICOUS PRODUCTION]\n{FFFFFF}/mix");
	CreateDynamic3DTextLabel(strings, COLOR_ORANGE2, 1341.95, 1575.97, 3010.90, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // racik obat

	CreateDynamicPickup(1239, 23, -427.3773, -392.3799, 16.5802, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Exchange Money]\n{FFFFFF}/washmoney");
	CreateDynamic3DTextLabel(strings, COLOR_ORANGE2, -427.3773, -392.3799, 16.5802, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // pencucian uang haram
	
	//-----[ Dynamic Checkpoint ]-----	
	ShowRoomCP = CreateDynamicCP(1324.29, -885.55, 39.66, 1.0, -1, -1, -1, 5.0);
	Disnaker = CreateDynamicCP(1412.915771,-33.065151,500.923828, 1.0, -1, -1, -1, 20.0);
	CreateDynamicPickup(1239, 23, 1324.29, -885.55, 39.66, -1, -1, -1, 50);
	CreateDynamic3DTextLabel("{7fffd4}Vehicle Showroom\n{ffffff}Stand Here!", COLOR_GREEN, 1324.29, -885.55, 39.66, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, -1);
	
	//--------[ ATM CP ]-------------
	atm1 = CreateDynamicCP(1690.892456,-2237.770751,13.539621, 1.0, -1, -1, -1, 5.0);
	atm2 = CreateDynamicCP(1550.266601,-2176.392578,13.546875, 1.0, -1, -1, -1, 5.0);
	atm3 = CreateDynamicCP(1125.240966,-2033.215698,69.883659, 1.0, -1, -1, -1, 5.0);
	
	ShowRoomCPRent = CreateDynamicCP(1321.33, -885.54, 39.66, 1.0, -1, -1, -1, 5.0);
	CreateDynamicPickup(1239, 23, 1321.33, -885.54, 39.66, -1, -1, -1, 50);
	CreateDynamic3DTextLabel("{7fff00}Rental Vehicle\n{ffffff}Stand Here!"YELLOW_E"\n/unrentpv", COLOR_LBLUE, 1321.33, -885.54, 39.66, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, -1);
	
	SAGSLobbyBtn[0] = CreateButton(-2688.83, 808.989, 1501.67, 180.0000);//bank
	SAGSLobbyBtn[1] = CreateButton(-2691.719238, 807.353333, 1501.422241, 0.000000); //bank
	SAGSLobbyBtn[2] = CreateButton(-2067.57, 2692.6, 1501.75, 90.0000);
	SAGSLobbyBtn[3] = CreateButton(-2067.81, 2692.64, 1501.64, -90.0000);
	SAGSLobbyBtn[4] = CreateButton(-2062.34, 2695.24, 1501.72, -90.0000);
	SAGSLobbyBtn[5] = CreateButton(-2062.09, 2695.21, 1501.7, 90.0000);
	SAGSLobbyBtn[6] = CreateButton(-2062.33, 2706.59, 1501.71, -90.0000);
	SAGSLobbyBtn[7] = CreateButton(-2062.08, 2706.69, 1501.73, 90.0000);
	SAGSLobbyDoor[0] = CreateDynamicObject(1569, -2689.33, 807.425, 1499.95, 0.000000, 0.000000, -179.877, -1, -1, -1, 300.00, 300.00);//Bank
	SAGSLobbyDoor[1] = CreateDynamicObject(1569, -2067.72, 2694.67, 1499.96, 0.000000, 0.000000, -89.6241, -1, -1, -1, 300.00, 300.00);
	SAGSLobbyDoor[2] = CreateDynamicObject(1569, -2062.2, 2693.16, 1499.98, 0.000000, 0.000000, 89.9741, -1, -1, -1, 300.00, 300.00);
	SAGSLobbyDoor[3] = CreateDynamicObject(1569, -2062.22, 2704.74, 1499.96, 0.000000, 0.000000, 90.2693, -1, -1, -1, 300.00, 300.00);

	SAMCLobbyBtn[0] = CreateButton(-1786.67, -1999.45, 1501.55, 90.0000);
	SAMCLobbyBtn[1] = CreateButton(-1786.89, -1999.48, 1501.56, -90.0000);
	SAMCLobbyBtn[2] = CreateButton(-1773.67, -1994.98, 1501.57, 180.0000);
	SAMCLobbyBtn[3] = CreateButton(-1773.71, -1995.25, 1501.56, 0.0000);
	SAMCLobbyBtn[4] = CreateButton(-1758.02, -1999.46, 1501.56, -90.0000);
	SAMCLobbyBtn[5] = CreateButton(-1757.81, -1999.46, 1501.57, 90.0000);
	SAMCLobbyDoor[0] = CreateDynamicObject(1569, -1786.8, -1997.48, 1499.77, 0.000000, 0.000000, -90.4041, -1, -1, -1, 300.00, 300.00);
	SAMCLobbyDoor[1] = CreateDynamicObject(1569, -1771.77, -1995.14, 1499.77, 0.000000, 0.000000, -179.415, -1, -1, -1, 300.00, 300.00);
	SAMCLobbyDoor[2] = CreateDynamicObject(1569, -1757.91, -1997.48, 1499.76, 0.000000, 0.000000, -91.6195, -1, -1, -1, 300.00, 300.00);
	
	chLogsRobbank = DCC_FindChannelById("1096840390025412608");
	
	// for(new x;x<sizeof(SAPDVehicles);x++)
	// {
	//     format(strings, sizeof(strings), "SAPD-%d", SAPDVehicles[x]);
	//     SetVehicleNumberPlate(SAPDVehicles[x], strings);
	//     SetVehicleToRespawn(SAPDVehicles[x]);
	// }

	// for(new x;x<sizeof(SAGSVehicles);x++)
	// {
	//     format(strings, sizeof(strings), "SAGS-%d", SAGSVehicles[x]);
	//     SetVehicleNumberPlate(SAGSVehicles[x], strings);
	//     SetVehicleToRespawn(SAGSVehicles[x]);
	// }
	
	// //-----[ SAMD Vehicle ]-----	
	// SAMDVehicles[0] = AddStaticVehicleEx(416, 1826.43, -1400.51, 13.72, 270.25, -1, 3, VEHICLE_RESPAWN, 1);
	// SAMDVehicles[1] = AddStaticVehicleEx(416, 1829.35, -1438.44, 13.74, 268.09, -1, 3, VEHICLE_RESPAWN, 1);
	// SAMDVehicles[2] = AddStaticVehicleEx(563, 1812.62, -1426.35, 36.18, 80.27, -1, 3, VEHICLE_RESPAWN, 1);
	// for(new x;x<sizeof(SAMDVehicles);x++)
	// {
	//     format(strings, sizeof(strings), "SAMD-%d", SAMDVehicles[x]);
	//     SetVehicleNumberPlate(SAMDVehicles[x], strings);
	//     SetVehicleToRespawn(SAMDVehicles[x]);
	// }
	
	// //-----[ SANA Vehicle ]-----	
	// SANAVehicles[0] = AddStaticVehicleEx(582, 781.4338, -1337.5022, 13.9482, 91.0000, -1, -1, VEHICLE_RESPAWN);
	// SANAVehicles[1] = AddStaticVehicleEx(582, 758.7664, -1336.1642, 13.9482, 179.0212, -1, -1, VEHICLE_RESPAWN);
	// SANAVehicles[2] = AddStaticVehicleEx(582, 764.4276, -1336.1959, 13.9482, 179.0212, -1, -1, VEHICLE_RESPAWN);
	// SANAVehicles[3] = AddStaticVehicleEx(582, 770.3247, -1335.9663, 13.9482, 179.0212, -1, -1, VEHICLE_RESPAWN);
	// SANAVehicles[4] = AddStaticVehicleEx(418, 737.3025, -1334.3344, 14.1711, 246.6513, -1, -1, VEHICLE_RESPAWN);
	// SANAVehicles[5] = AddStaticVehicleEx(413, 736.4621, -1338.6304, 13.7490, -113.0000, -1, -1, VEHICLE_RESPAWN);
	// SANAVehicles[6] = AddStaticVehicleEx(405, 737.4107, -1343.0820, 13.7357, -113.0000, -1, -1, VEHICLE_RESPAWN);
	// SANAVehicles[7] = AddStaticVehicleEx(461, 749.7194, -1334.2122, 13.2465, 178.0000, -1, -1, VEHICLE_RESPAWN);
	// SANAVehicles[8] = AddStaticVehicleEx(461, 753.8127, -1334.2727, 13.2465, 178.0000, -1, -1, VEHICLE_RESPAWN);
	// SANAVehicles[9] = AddStaticVehicleEx(488, 741.9925, -1371.2443, 25.8111, 0.0000, -1, -1, VEHICLE_RESPAWN);
	
	// for(new x;x<sizeof(SANAVehicles);x++)
	// {
	//     format(strings, sizeof(strings), "SANA-%d", SANAVehicles[x]);
	//     SetVehicleNumberPlate(SANAVehicles[x], strings);
	//     SetVehicleToRespawn(SANAVehicles[x]);
	// }
	
	new DCC_Channel:hidupp, DCC_Embed:logss;
	new yy, m, d, timestamp[200];
	getdate(yy, m , d);
	hidupp = DCC_FindChannelById("1096831419982037206");
	format(timestamp, sizeof(timestamp), "%02i%02i%02i", yy, m, d);
	logss = DCC_CreateEmbed("Fivem Roleplay");
	DCC_SetEmbedTitle(logss, "Fivem");
	DCC_SetEmbedTimestamp(logss, timestamp);
	DCC_SetEmbedColor(logss, 0x00ff00);
	DCC_SetEmbedFooter(logss, "Fivem Roleplay", "");
	new stroi[5000];
	format(stroi, sizeof(stroi), "Server Kembali Online @everyone");
	DCC_AddEmbedField(logss, "Server Status", stroi, true);
	DCC_SendChannelEmbedMessage(hidupp, logss);

	printf("[Objects]: %d Loaded.", CountDynamicObjects());
	

	return 1;
}
public OnGameModeExit()
{
   	print("-------------- [ Auto Gmx ] --------------");
	new count = 0, count1 = 0, user = 0;
	foreach(new gsid : GStation)
	{
		if(Iter_Contains(GStation, gsid))
		{
			count++;
			GStation_Save(gsid);
		}
	}
	printf("[Gas Station]: %d Saved.", count);
	
	foreach(new pid : Plants)
	{
		if(Iter_Contains(Plants, pid))
		{
			count1++;
			Plant_Save(pid);
		}
	}
	printf("[Farmer Plants]: %d Saved.", count1);
	for (new i = 0, j = GetPlayerPoolSize(); i <= j; i++) 
	{
		if (IsPlayerConnected(i))
		{
			OnPlayerDisconnect(i, 1);
		}
	}
	printf("[Database] User Saved: %d", user);
	print("-------------- [ Auto Gmx ] --------------");
	SendClientMessageToAll(COLOR_RED, "[!]"YELLOW_E" Sorry Server is Maintenance/Restart.{00FFFF} ~MORP BOTS");

	new DCC_Channel:mati, DCC_Embed:asu;
	new y, m, d, timestamp[200];
	getdate(y, m , d);
	mati = DCC_FindChannelById("1096831419982037206");
	format(timestamp, sizeof(timestamp), "%02i%02i%02i", y, m, d);
	asu = DCC_CreateEmbed("Fivem Roleplay");
	DCC_SetEmbedTitle(asu, "Fivem");
	DCC_SetEmbedTimestamp(asu, timestamp);
	DCC_SetEmbedColor(asu, 0xff0000);
	DCC_SetEmbedFooter(asu, "Fivem Roleplay", "");
	new stroi[5000];
	format(stroi, sizeof(stroi), "Server Maintenance/restart Harap Sabar @everyone");
	DCC_AddEmbedField(asu, "Server Status", stroi, true);
	DCC_SendChannelEmbedMessage(mati, asu);

	UnloadTazerSAPD();
	DestroyDynaimcRobBank();
	//Audio_DestroyTCPServer();
	mysql_close(g_SQL);
	return 1;
}

//-----[ Button System ]-----	
function SAGSLobbyDoorClose()
{
	MoveDynamicObject(SAGSLobbyDoor[0], -2689.33, 807.425, 1499.95, 3);
	MoveDynamicObject(SAGSLobbyDoor[1], -2067.72, 2694.67, 1499.96, 3);
	MoveDynamicObject(SAGSLobbyDoor[2], -2062.2, 2693.16, 1499.98, 3);
	MoveDynamicObject(SAGSLobbyDoor[3], -2062.22, 2704.74, 1499.96, 3);
	return 1;
}

function SAMCLobbyDoorClose()
{
	MoveDynamicObject(SAMCLobbyDoor[0], -1786.8, -1997.48, 1499.77, 3);
	MoveDynamicObject(SAMCLobbyDoor[1], -1771.77, -1995.14, 1499.77, 3);
	MoveDynamicObject(SAMCLobbyDoor[2], -1757.91, -1997.48, 1499.76, 3);
	return 1;
}

stock RefreshDGHbec(playerid)
{
	PlayerTextDrawSetPreviewModel(playerid, DGHBEC[playerid], GetVehicleModel(GetPlayerVehicleID(playerid)));
	PlayerTextDrawShow(playerid, DGHBEC[playerid]);
    return 1;
}

public OnPlayerPressButton(playerid, buttonid)
{
	if(buttonid == SAGSLobbyBtn[0] || buttonid == SAGSLobbyBtn[1])
	{
	    if(pData[playerid][pFaction] == 2)
	    {
	        MoveDynamicObject(SAGSLobbyDoor[0], -2687.77, 807.428, 1499.95, 3, -1000.0, -1000.0, -1000.0);
			SetTimer("SAGSLobbyDoorClose", 5000, 0);
	    }
		else
	    {
	        Error(playerid, "Akses ditolak.");
			return 1;
		}
	}
	if(buttonid == SAGSLobbyBtn[2] || buttonid == SAGSLobbyBtn[3])
	{
	    if(pData[playerid][pFaction] == 2)
	    {
	        MoveDynamicObject(SAGSLobbyDoor[1], -2067.73, 2696.24, 1499.96, 3, -1000.0, -1000.0, -1000.0);
			SetTimer("SAGSLobbyDoorClose", 5000, 0);
	    }
		else
	    {
	        Error(playerid, "Akses ditolak.");
			return 1;
		}
	}
	
	if(buttonid == SAGSLobbyBtn[4] || buttonid == SAGSLobbyBtn[5])
	{
	    if(pData[playerid][pFaction] == 2)
	    {
	        MoveDynamicObject(SAGSLobbyDoor[2], -2062.2, 2691.63, 1499.98, 3, -1000.0, -1000.0, -1000.0);
			SetTimer("SAGSLobbyDoorClose", 5000, 0);
	    }
		else
	    {
	        Error(playerid, "Akses ditolak.");
			return 1;
		}
	}
	if(buttonid == SAGSLobbyBtn[6] || buttonid == SAGSLobbyBtn[7])
	{
	    if(pData[playerid][pFaction] == 2)
	    {
	        MoveDynamicObject(SAGSLobbyDoor[3], -2062.21, 2703.22, 1499.96, 3, -1000.0, -1000.0, -1000.0);
			SetTimer("SAGSLobbyDoorClose", 5000, 0);
	    }
		else
	    {
	        Error(playerid, "Akses ditolak.");
			return 1;
		}
	}
	if(buttonid == SAMCLobbyBtn[0] || buttonid == SAMCLobbyBtn[1])
	{
		if(pData[playerid][pFaction] == 3)
		{
			MoveDynamicObject(SAMCLobbyDoor[0], -1786.79, -1995.97, 1499.77, 3, -1000.0, -1000.0, -1000.0);
			SetTimer("SAMCLobbyDoorClose", 5000, 0);
		}
		else
	    {
	        Error(playerid, "Akses ditolak.");
			return 1;
		}
	}
	if(buttonid == SAMCLobbyBtn[2] || buttonid == SAMCLobbyBtn[3])
	{
		if(pData[playerid][pFaction] == 3)
		{
			MoveDynamicObject(SAMCLobbyDoor[1], -1770.25, -1995.13, 1499.77, 3, -1000.0, -1000.0, -1000.0);
			SetTimer("SAMCLobbyDoorClose", 5000, 0);
		}
		else
	    {
	        Error(playerid, "Akses ditolak.");
			return 1;
		}
	}
	if(buttonid == SAMCLobbyBtn[4] || buttonid == SAMCLobbyBtn[5])
	{
		if(pData[playerid][pFaction] == 3)
		{
			MoveDynamicObject(SAMCLobbyDoor[2], -1757.87, -1995.95, 1499.76, 3, -1000.0, -1000.0, -1000.0);
			SetTimer("SAMCLobbyDoorClose", 5000, 0);
		}
		else
	    {
	        Error(playerid, "Akses ditolak.");
			return 1;
		}
	}
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
    if(vehicleid == Car_Job[playerid]) {
        KillTimer(timer_Car[playerid]);
        Seconds_timer[playerid] = 0;
        //SendClientMessage(playerid, ATENTIE, "* backup");
    }
	//RemovePlayerAttachedObject(playerid, BOX_INDEX);
	//angkatBox[playerid] = false;
	if(!ispassenger)
	{
		if(IsSAPDCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 1)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "Anda bukan SAPD!");
			}
		}
		if(IsGovCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 2)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "Anda bukan SAGS!");
			}
		}
		if(IsSAMDCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 3)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "Anda bukan SAMD!");
			}
		}
		if(IsSANACar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 4)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "Anda bukan SANEWS!");
			}
		}
	}
	return 1;
}

stock SGetName(playerid)
{
    new name[ 64 ];
    GetPlayerName(playerid, name, sizeof( name ));
    return name;
}

public OnPlayerText(playerid, text[])
{
	if(isnull(text)) return 0;
	new str[150];
	format(str,sizeof(str),"[CHAT] %s: %s", GetRPName(playerid), text);
	LogServer("Chat", str);
	printf(str);
	
	/*if(pData[playerid][pAdminDuty] == 1)
	{
		new lstr[200];
		format(lstr, sizeof(lstr), "{FF0000}%s : {FFFFFF}(( %s ))", ReturnName(playerid), text);
		ProxDetector(25, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
	}*/
	
	if(pData[playerid][pSpawned] == 0 && pData[playerid][IsLoggedIn] == false)
	{
	    Error(playerid, "You must be spawned or logged in to use chat.");
	    return 0;
	}
	//-----[ Auto RP ]-----	
	if(!strcmp(text, "rpgun", true) || !strcmp(text, "gunrp", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s lepaskan senjatanya dari sabuk dan siap untuk menembak kapan saja.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpcrash", true) || !strcmp(text, "crashrp", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s kaget setelah kecelakaan.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpfish", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memancing dengan kedua tangannya.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpfall", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s jatuh dan merasakan sakit.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpmad", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s merasa kesal dan ingin mengeluarkan amarah.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rprob", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s menggeledah sesuatu dan siap untuk merampok.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpcj", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s mencuri kendaraan seseorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpwar", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s berperang dengan sesorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpdie", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s pingsan dan tidak sadarkan diri.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpfixmeka", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memperbaiki mesin kendaraan.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpcheckmeka", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memeriksa kondisi kendaraan.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpfight", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ribut dan memukul seseorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpcry", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s sedang bersedih dan menangis.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rprun", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s berlari dan kabur.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpfear", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s merasa ketakutan.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpdropgun", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s meletakkan senjata kebawah.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rptakegun", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s mengamnbil senjata.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpgivegun", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memberikan kendaraan kepada seseorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpshy", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s merasa malu.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpnusuk", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s menusuk dan membunuh seseorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpharvest", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memanen tanaman.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rplockhouse", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s sedang mengunci rumah.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rplockcar", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s sedang mengunci kendaraan.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpnodong", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memulai menodong seseorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpeat", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s makan makanan yang ia beli.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpdrink", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s meminum minuman yang ia beli.", ReturnName(playerid));
		return 0;
	}
	if(text[0] == '@')
	{
		if(pData[playerid][pSMS] != 0)
		{
			if(pData[playerid][pPhoneCredit] < 1)
			{
				Error(playerid, "Anda tidak memiliki Credit!");
				return 0;
			}
			if(pData[playerid][pInjured] != 0)
			{
				Error(playerid, "Tidak dapat melakukan saat ini.");
				return 0;
			}
			new tmp[512];
			foreach(new ii : Player)
			{
				if(text[1] == ' ')
				{
			 		format(tmp, sizeof(tmp), "%s", text[2]);
				}
				else
				{
				    format(tmp, sizeof(tmp), "%s", text[1]);
				}
				if(pData[ii][pPhone] == pData[playerid][pSMS])
				{
					if(ii == INVALID_PLAYER_ID || !IsPlayerConnected(ii))
					{
						Error(playerid, "Nomor ini tidak aktif!");
						return 0;
					}
					SendClientMessageEx(playerid, COLOR_YELLOW, "[SMS to %d]"WHITE_E" %s", pData[playerid][pSMS], tmp);
					SendClientMessageEx(ii, COLOR_YELLOW, "[SMS from %d]"WHITE_E" %s", pData[playerid][pPhone], tmp);
					PlayerPlaySound(ii, 6003, 0,0,0);
					pData[ii][pSMS] = pData[playerid][pPhone];
					
					pData[playerid][pPhoneCredit] -= 1;
					return 0;
				}
			}
		}
	}
	if(pData[playerid][pCall] != INVALID_PLAYER_ID)
	{
		// Anti-Caps
		if(GetPVarType(playerid, "Caps"))
			UpperToLower(text);
		new lstr[1024];
		format(lstr, sizeof(lstr), "[CellPhone] %s says: %s", ReturnName(playerid), text);
		ProxDetector(10, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
		SetPlayerChatBubble(playerid, text, COLOR_WHITE, 10.0, 3000);
		SendClientMessageEx(pData[playerid][pCall], COLOR_YELLOW, "[CELLPHONE] "WHITE_E"%s.", text);
		return 0;
	}
	else
	{
		// Anti-Caps
		if(GetPVarType(playerid, "Caps"))
			UpperToLower(text);
		new lstr[1024];
		if(!IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		{
			if(pData[playerid][pAdminDuty] == 1)
			{
				if(strlen(text) > 64)
				{
					SendNearbyMessage(playerid, 20.0, COLOR_RED, "%s:"WHITE_E" (( %.64s ..", ReturnName(playerid), text);
					SendNearbyMessage(playerid, 20.0, COLOR_WHITE, ".. %s ))", text[64]);
					return 0;
				}
				else
				{
					SendNearbyMessage(playerid, 20.0, COLOR_RED, "%s:"WHITE_E" (( %s ))", ReturnName(playerid), text);
					return 0;
				}
			}

			format(lstr, sizeof(lstr), "%s says: %s", ReturnName(playerid), text);
			ProxDetector(25, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
			SetPlayerChatBubble(playerid, text, COLOR_WHITE, 10.0, 3000);
			new dc[128];
			format(dc, sizeof(dc),  "```\n[CHAT] %s: %s```", ReturnName(playerid), text);
			SendDiscordMessage(2, dc);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		{
			if(pData[playerid][pAdmin] < 1)
			{
				format(lstr, sizeof(lstr), "[OOC ZONE] %s: (( %s ))", ReturnName(playerid), text);
				ProxDetector(40, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
			}
			else if(pData[playerid][pAdmin] > 1 || pData[playerid][pHelper] > 1)
			{
				format(lstr, sizeof(lstr), "[OOC ZONE] %s: %s", pData[playerid][pAdminname], text);
				ProxDetector(40, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
			}
		}
		return 0;
	}
}

public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags)
{
    new str[1500];
    if (result == -1)
    {
	    format(str,sizeof(str),"Perintah ~y~/%s ~w~Tidak Ditemukan Gunakan ~y~/help", cmd);
		ErrorMsg(playerid, str);
        return 0;
    }
	
	format(str,sizeof(str),"[CMD] %s: [%s] [%s]", GetRPName(playerid), cmd, params);
	LogServer("Command", str);
	printf(str);
	new dc[128];
	format(dc, sizeof(dc),  "```\n[CMD] %s: [%s] [%s]```", GetRPName(playerid), cmd);
	SendDiscordMessage(1, dc);
    return 1;
}

public OnPlayerCommandReceived(playerid, cmd[], params[], flags)
{
	return 1;
}

//Kecubung
forward KecubungHideTD(playerid);
public KecubungHideTD(playerid)
{
	HideKecubung1(playerid);
	return 1;
}

stock ShowKecubung1(playerid)
{
	PlayerTextDrawShow(playerid, KecubungTD[playerid][0]);
    PlayerTextDrawShow(playerid, KecubungTD[playerid][1]);
    PlayerTextDrawShow(playerid, KecubungTD[playerid][2]);
    PlayerTextDrawShow(playerid, KecubungTD[playerid][3]);
	PlayerTextDrawShow(playerid, KecubungTD[playerid][4]);
    PlayerTextDrawShow(playerid, KecubungTD[playerid][5]);
    return 1;
}
stock HideKecubung1(playerid)
{
	PlayerTextDrawHide(playerid, KecubungTD[playerid][0]);
    PlayerTextDrawHide(playerid, KecubungTD[playerid][1]);
    PlayerTextDrawHide(playerid, KecubungTD[playerid][2]);
    PlayerTextDrawHide(playerid, KecubungTD[playerid][3]);
	PlayerTextDrawHide(playerid, KecubungTD[playerid][4]);
    PlayerTextDrawHide(playerid, KecubungTD[playerid][5]);
    return 1;
}
//Borax
forward BoraxHideTD(playerid);
public BoraxHideTD(playerid)
{
	HideBorax1(playerid);
	return 1;
}

stock ShowBorax1(playerid)
{
	PlayerTextDrawShow(playerid, BoraxTD[playerid][0]);
    PlayerTextDrawShow(playerid, BoraxTD[playerid][1]);
    PlayerTextDrawShow(playerid, BoraxTD[playerid][2]);
    PlayerTextDrawShow(playerid, BoraxTD[playerid][3]);
	PlayerTextDrawShow(playerid, BoraxTD[playerid][4]);
    PlayerTextDrawShow(playerid, BoraxTD[playerid][5]);
    return 1;
}
stock HideBorax1(playerid)
{
	PlayerTextDrawHide(playerid, BoraxTD[playerid][0]);
    PlayerTextDrawHide(playerid, BoraxTD[playerid][1]);
    PlayerTextDrawHide(playerid, BoraxTD[playerid][2]);
    PlayerTextDrawHide(playerid, BoraxTD[playerid][3]);
	PlayerTextDrawHide(playerid, BoraxTD[playerid][4]);
    PlayerTextDrawHide(playerid, BoraxTD[playerid][5]);
    return 1;
}

//TD DEATH
stock ShowTdDeath(playerid)
{
	PlayerTextDrawShow(playerid, DeathTD[playerid][0]);
    PlayerTextDrawShow(playerid, DeathTD[playerid][1]);
    PlayerTextDrawShow(playerid, DeathTD[playerid][2]);
    PlayerTextDrawShow(playerid, DeathTD[playerid][3]);
	PlayerTextDrawShow(playerid, DeathTD[playerid][4]);
    PlayerTextDrawShow(playerid, DeathTD[playerid][5]);
    PlayerTextDrawShow(playerid, DeathTD[playerid][6]);
    PlayerTextDrawShow(playerid, DeathTD[playerid][7]);
    return 1;
}
stock HideTdDeath(playerid)
{
	PlayerTextDrawHide(playerid, DeathTD[playerid][0]);
    PlayerTextDrawHide(playerid, DeathTD[playerid][1]);
    PlayerTextDrawHide(playerid, DeathTD[playerid][2]);
    PlayerTextDrawHide(playerid, DeathTD[playerid][3]);
	PlayerTextDrawHide(playerid, DeathTD[playerid][4]);
    PlayerTextDrawHide(playerid, DeathTD[playerid][5]);
    PlayerTextDrawHide(playerid, DeathTD[playerid][6]);
    PlayerTextDrawHide(playerid, DeathTD[playerid][7]);
    return 1;
}

public OnPlayerConnect(playerid)
{
    pTemp[playerid][FuelLabel] = Text3D:INVALID_3DTEXT_ID;
    PakaiSenjata[playerid] = 0;
    CreatePlayerInv(playerid);
    PlayerInfo[playerid][pSelectItem] = 0;
    for (new i = 0; i != MAX_INVENTORY; i ++)
	{
	    InventoryData[playerid][i][invExists] = false;
	    InventoryData[playerid][i][invModel] = 0;
	}
	Player_EditVehicleObject[playerid] = -1;
    Player_EditVehicleObjectSlot[playerid] = -1;
    Player_EditingObject[playerid] = 0;

    JOB[playerid] = 0;
    inJOB[playerid] = 0;
	warnings{playerid} = 0;

	cNametag[playerid] = CreateDynamic3DTextLabel("Loading nametag...", 0xFFFFFFFF, 0.0, 0.0, 0.1, NT_DISTANCE, .attachedplayer = playerid, .testlos = 1);
	SendClientCheck(playerid, 0x48, 0, 0, 2);
	new PlayerIP[16], country[MAX_COUNTRY_LENGTH], city[MAX_CITY_LENGTH];
	g_MysqlRaceCheck[playerid]++;
	pemainic++;
	AntiBHOP[playerid] = 0;
	IsAtEvent[playerid] = 0;
	takingselfie[playerid] = 0;
	pData[playerid][pDriveLicApp] = 0;
	//AntiCheat
	pData[playerid][pJetpack] = 0;
	pData[playerid][pLastUpdate] = 0;
	pData[playerid][pArmorTime] = 0;
	pData[playerid][pACTime] = 0;
	pData[playerid][pToggleBank] = 0;
	//Anim
	pData[playerid][pLoopAnim] = 0;
	//Rob
	pData[playerid][pLastChop] = 0;
	//seatblet
	PlayerInfo[playerid][pSeatbelt] = 0;
	//Pengganti IsValidTimer
	pData[playerid][pProductingStatus] = 0;
	pData[playerid][pPartStatus] = 0;
	pData[playerid][pPemotongStatus] = 0;
	pData[playerid][pCookingStatus] = 0;
	pData[playerid][pMechanicStatus] = 0;
	pData[playerid][pActivityStatus] = 0;
	pData[playerid][pArmsDealerStatus] = 0;
	pData[playerid][pFillStatus] = 0;
	pData[playerid][pPemotongStatus] = 0;
	pData[playerid][pActivityTime] = 0;
	//

	ClearAnimations(playerid);

	ResetVariables(playerid);
	RemoveMappingGreenland(playerid);
	CreatePlayerTextDraws(playerid);

	GetPlayerName(playerid, pData[playerid][pUCP], MAX_PLAYER_NAME);
	GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
	pData[playerid][pIP] = PlayerIP;
	pData[playerid][pID] = playerid;
	InterpolateCameraPos(playerid, 698.826049, -1404.027099, 16.206615, 2045.292480, -1425.237182, 128.337753, 60000);
	InterpolateCameraLookAt(playerid, 703.825317, -1404.041990, 500000681, 2050.291992, -1425.306762, 128.361190, 50000);

	GetPlayerCountry(playerid, country, MAX_COUNTRY_LENGTH);
	GetPlayerCity(playerid, city, MAX_CITY_LENGTH);
	
	SetTimerEx("SafeLogin", 1000, 0, "i", playerid);
	//Prose Load Data
	new query[103];
	mysql_format(g_SQL, query, sizeof query, "SELECT * FROM `playerucp` WHERE `ucp` = '%e' LIMIT 1", pData[playerid][pUCP]);
	mysql_pquery(g_SQL, query, "OnPlayerDataLoaded", "dd", playerid, g_MysqlRaceCheck[playerid]);
	SetPlayerColor(playerid, COLOR_WHITE);

	pData[playerid][activitybar] = CreatePlayerProgressBar(playerid, 273.500000, 157.333541, 88.000000, 8.000000, 5930683, 100, 0);
	
	//HBE textdraw Simple
	pData[playerid][pInjuredLabel] = CreateDynamic3DTextLabel("", COLOR_ORANGE, 0.0, 0.0, -0.3, 10, .attachedplayer = playerid, .testlos = 1);

    if(pData[playerid][pHead] < 0) return pData[playerid][pHead] = 20;

    if(pData[playerid][pPerut] < 0) return pData[playerid][pPerut] = 20;

    if(pData[playerid][pRFoot] < 0) return pData[playerid][pRFoot] = 20;

    if(pData[playerid][pLFoot] < 0) return pData[playerid][pLFoot] = 20;

    if(pData[playerid][pLHand] < 0) return pData[playerid][pLHand] = 20;
   
    if(pData[playerid][pRHand] < 0) return pData[playerid][pRHand] = 20;

	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    if(pData[playerid][pJob] == 1)
	{
	    Sopirbus--;
	}
	else if(pData[playerid][pJob] == 2)
	{
    	tukangayam--;
	}
	else if(pData[playerid][pJob] == 3)
	{
    	tukangtebang--;
	}
	else if(pData[playerid][pJob] == 4)
	{
    	penambangminyak--;
	}
	else if(pData[playerid][pJob] == 5)
	{
    	pemerah--;
	}
	else if(pData[playerid][pJob] == 6)
	{
    	penambang--;
	}
	else if(pData[playerid][pJob] == 7)
	{
    	tukangfarmer--;
	}
	else if(pData[playerid][pJob] == 8)
	{
    	Trucker--;
	}
	else if(pData[playerid][pJob] == 9)
	{
    	kerjasparepart--;
	}
	else if(pData[playerid][pJob] == 10)
	{
    	penjahit--;
	}
	explosive{playerid} = false;
	//////////
	warnings{playerid} = 0;
    if(IsValidDynamic3DTextLabel(cNametag[playerid]))
        DestroyDynamic3DTextLabel(cNametag[playerid]);

	pemainic--;


	SetPlayerName(playerid, pData[playerid][pUCP]);
	//Pengganti IsValidTimer
	pData[playerid][pProductingStatus] = 0;
	pData[playerid][pPartStatus] = 0;
	pData[playerid][pCookingStatus] = 0;
	pData[playerid][pMechanicStatus] = 0;
	pData[playerid][pActivityStatus] = 0;
	pData[playerid][pArmsDealerStatus] = 0;
	pData[playerid][pFillStatus] = 0;
	pData[playerid][pHBEMode] = 1;
	pData[playerid][pPemotongStatus] = 0;
	pData[playerid][pActivityTime] = 0;

	DestroyDynamic3DTextLabel(pData[playerid][pInjuredLabel]);
	pData[playerid][pDriveLicApp] = 0;
	// pData[playerid][pSpawnList] = 0;
	takingselfie[playerid] = 0;
	//KillTimer(Unload_Timer[playerid]);
	
	if(IsPlayerInAnyVehicle(playerid))
	{
        RemovePlayerFromVehicle(playerid);
    }
	
    if(IsValidVehicle(BusVeh[playerid]))
   	DestroyVehicle(BusVeh[playerid]);  //jika player disconnect maka bus akan ilang
   	if(IsValidVehicle(MobilKerja[playerid]))
   	DestroyVehicle(MobilKerja[playerid]);  //jika player disconnect maka mobil akan ilang
   	
    TextDrawHideForPlayer(playerid, IndoTD[0]);
	TextDrawHideForPlayer(playerid, IndoTD[1]);
	TextDrawHideForPlayer(playerid, IndoTD[2]);
	TextDrawHideForPlayer(playerid, IndoTD[3]);
	TextDrawHideForPlayer(playerid, IndoTD[4]);
	TextDrawHideForPlayer(playerid, IndoTD[5]);
	TextDrawHideForPlayer(playerid, IndoTD[6]);
	TextDrawHideForPlayer(playerid, IndoTD[7]);
	TextDrawHideForPlayer(playerid, IndoTD[8]);
	//UpdateWeapons(playerid);
	g_MysqlRaceCheck[playerid]++;
	
	if(pData[playerid][IsLoggedIn] == true)
	{
		/*if(IsAtEvent[playerid] == 0)
		{
			UpdatePlayerData(playerid);
		}*/
		UpdatePlayerData(playerid);
		RemovePlayerVehicle(playerid);
		Report_Clear(playerid);
		Ask_Clear(playerid);
		Player_ResetMining(playerid);
		Player_ResetCutting(playerid);
		Player_RemoveLumber(playerid);
		Player_ResetHarvest(playerid);
		KillTazerTimer(playerid);
		if(IsValidVehicle(pData[playerid][pTrailer]))
			DestroyVehicle(pData[playerid][pTrailer]);

		pData[playerid][pTrailer] = INVALID_VEHICLE_ID;
		if(IsAtEvent[playerid] == 1)
		{
			if(GetPlayerTeam(playerid) == 1)
			{
				if(EventStarted == 1)
				{
					RedTeam -= 1;
					foreach(new ii : Player)
					{
						if(GetPlayerTeam(ii) == 2)
						{
							GivePlayerMoneyEx(ii, EventPrize);
							Servers(ii, "Selamat, Tim Anda berhasil memenangkan Event dan Mendapatkan Hadiah $%d per orang", EventPrize);
							SetPlayerPos(ii, pData[ii][pPosX], pData[ii][pPosY], pData[ii][pPosZ]);
							pData[playerid][pHospital] = 0;
							ClearAnimations(ii);
							BlueTeam = 0;
						}
						else if(GetPlayerTeam(ii) == 1)
						{
							Servers(ii, "Maaf, Tim anda sudah terkalahkan, Harap Coba Lagi lain waktu");
							SetPlayerPos(ii, pData[ii][pPosX], pData[ii][pPosY], pData[ii][pPosZ]);
							pData[playerid][pHospital] = 0;
							ClearAnimations(ii);
							RedTeam = 0;
						}
					}
				}
			}
			if(GetPlayerTeam(playerid) == 2)
			{
				if(EventStarted == 1)
				{
					BlueTeam -= 1;
					foreach(new ii : Player)
					{
						if(GetPlayerTeam(ii) == 1)
						{
							GivePlayerMoneyEx(ii, EventPrize);
							Servers(ii, "Selamat, Tim Anda berhasil memenangkan Event dan Mendapatkan Hadiah $%d per orang", EventPrize);
							SetPlayerPos(ii, pData[ii][pPosX], pData[ii][pPosY], pData[ii][pPosZ]);
							pData[playerid][pHospital] = 0;
							ClearAnimations(ii);
							BlueTeam = 0;
						}
						else if(GetPlayerTeam(ii) == 2)
						{
							Servers(ii, "Maaf, Tim anda sudah terkalahkan, Harap Coba Lagi lain waktu");
							SetPlayerPos(ii, pData[ii][pPosX], pData[ii][pPosY], pData[ii][pPosZ]);
							pData[playerid][pHospital] = 0;
							ClearAnimations(ii);
							BlueTeam = 0;
						}
					}
				}
			}
			SetPlayerTeam(playerid, 0);
			IsAtEvent[playerid] = 0;
			pData[playerid][pInjured] = 0;
			pData[playerid][pSpawned] = 1;
			UpdateDynamic3DTextLabelText(pData[playerid][pInjuredLabel], COLOR_ORANGE, "");
	    }
	    if(GetPVarType(playerid, "PlacedBB"))
    	{
        	DestroyDynamicObject(GetPVarInt(playerid, "PlacedBB"));
        	DestroyDynamic3DTextLabel(Text3D:GetPVarInt(playerid, "BBLabel"));
        	if(GetPVarType(playerid, "BBArea"))
        	{
            	foreach(new i : Player)
            	{
                	if(IsPlayerInDynamicArea(i, GetPVarInt(playerid, "BBArea")))
                	{
                    	StopAudioStreamForPlayer(i);
                    	SendClientMessage(i, COLOR_PURPLE, " The boombox creator has disconnected from the server.");
                	}
            	}
        	}
        }
		if(pData[playerid][pRobLeader] == 1)
		{
			foreach(new ii : Player) 
			{
				if(pData[ii][pMemberRob] > 1)
				{
					Servers(ii, "* Pemimpin Perampokan anda telah keluar! [ MISI GAGAL ]");
					pData[ii][pMemberRob] = 0;
					RobMember = 0;
					pData[ii][pRobLeader] = 0;
					ServerMoney += robmoney;
				}
			}
		}
		if(pData[playerid][pMemberRob] == 1)
		{
			pData[playerid][pMemberRob] = 0;
			foreach(new ii : Player) 
			{
				if(pData[ii][pRobLeader] > 1)
				{
					Servers(ii, "* Member berkurang 1");
					pData[ii][pMemberRob] -= 1;
					RobMember -= 1;
				}
			}
		}
	}

	if(IsValidDynamic3DTextLabel(pData[playerid][pAdoTag]))
            DestroyDynamic3DTextLabel(pData[playerid][pAdoTag]);

    if(IsValidDynamic3DTextLabel(pData[playerid][pBTag]))
            DestroyDynamic3DTextLabel(pData[playerid][pBTag]);
			
	if(IsValidDynamicObject(pData[playerid][pFlare]))
            DestroyDynamicObject(pData[playerid][pFlare]);
    

    pData[playerid][pAdoActive] = false;
	

	if (pData[playerid][LoginTimer])
	{
		KillTimer(pData[playerid][LoginTimer]);
		pData[playerid][LoginTimer] = 0;
	}

	pData[playerid][IsLoggedIn] = false;
	
	new Float:x, Float:y, Float:z, strings[500];
	GetPlayerPos(playerid, x, y, z);

	foreach(new ii : Player)
	{
		if(IsPlayerInRangeOfPoint(ii, 40.0, x, y, z))
		{
			switch(reason)
			{
				case 0:
				{
					SendClientMessageEx(ii, COLOR_RED, "[SERVER]:"YELLOW_E" %s disconnected from the server.{7fffd4}(FC/Crash/Timeout)", pData[playerid][pName]);
				}
				case 1:
				{
					SendClientMessageEx(ii, COLOR_RED, "[SERVER]:"YELLOW_E" %s disconnected from the server.{7fffd4}(Disconnected)", pData[playerid][pName]);
				}
				case 2:
				{
					SendClientMessageEx(ii, COLOR_RED, "[SERVER]:"YELLOW_E" %s disconnected from the server.{7fffd4}(Kick/Banned)", pData[playerid][pName]);
				}
			}
		}
	}
	new reasontext[526];
	switch(reason)
	{
	    case 0: reasontext = "Timeout/ Crash";
	    case 1: reasontext = "Quit";
	    case 2: reasontext = "Kicked/ Banned";
	}
	format(strings, sizeof(strings), "[%s | %s (%d) Telah Keluar Dari Kota\nAlasan: [%s]", pData[playerid][pName], pData[playerid][pUCP], playerid, reasontext);
	pData[playerid][pLabelDisconnect] = CreateDynamic3DTextLabel(strings, COLOR_WHITE, x, y, z, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Text Jika Player Disconnect
 	pData[playerid][pTimerDisconnect] = SetTimerEx("WaktuKeluar", 3000, true, "d", playerid);
	new dc[100];
	format(dc, sizeof(dc),  "```\n%s disconnected from the server(%s).```", pData[playerid][pName], reasontext);
	SendDiscordMessage(0, dc);
	return 1;
}

public OnPlayerSpawn(playerid)
{
    SetTimerEx("UpdateStress", 90000, true, "d", playerid);
	StopAudioStreamForPlayer(playerid);
	SetPlayerInterior(playerid, pData[playerid][pInt]);
	SetPlayerVirtualWorld(playerid, pData[playerid][pWorld]);
	SetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
	SetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
	SetCameraBehindPlayer(playerid);
	TogglePlayerControllable(playerid, 0);
	SetPlayerSpawn(playerid);
	LoadAnims(playerid);

	vpara[playerid]=0;
	
	SetPlayerSkillLevel(playerid, WEAPON_COLT45, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SILENCED, 1);
	SetPlayerSkillLevel(playerid, WEAPON_DEAGLE, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SHOTGUN, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SAWEDOFF, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SHOTGSPA, 1);
	SetPlayerSkillLevel(playerid, WEAPON_UZI, 1);
	SetPlayerSkillLevel(playerid, WEAPON_MP5, 1);
	SetPlayerSkillLevel(playerid, WEAPON_AK47, 1);
	SetPlayerSkillLevel(playerid, WEAPON_M4, 1);
	SetPlayerSkillLevel(playerid, WEAPON_TEC9, 1);
	SetPlayerSkillLevel(playerid, WEAPON_RIFLE, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SNIPER, 1);
	return 1;
}

SetPlayerSpawn(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		if(pData[playerid][pGender] == 0)
		{
			TogglePlayerControllable(playerid,0);
			SetPlayerHealth(playerid, 100.0);
			SetPlayerArmour(playerid, 0.0);
			SetPlayerPos(playerid, 2823.21,-2440.34,12.08);
			SetPlayerCameraPos(playerid,1058.544433, -1086.021362, 41);
			SetPlayerCameraLookAt(playerid,1055.534057, -1082.029296, 39.802570);
			SetPlayerVirtualWorld(playerid, 0);
			ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "{FFB6C1}Fivem- {ffffff}Tanggal Lahir", "Masukan tanggal lahir (Tgl/Bulan/Tahun): 15/04/1998", "Oke", "Batal");
		}
		else
		{
			SetPlayerColor(playerid, COLOR_WHITE);
			// CheckPlayerSpawn3Titik(playerid);
			if(pData[playerid][pHBEMode] == 1)
			{
				for(new i = 0; i < 25; i++)
				{
					UpdatePlayerHBE(playerid);
					PlayerTextDrawShow(playerid, HBEFIVEM[playerid][i]);
					PlayerTextDrawShow(playerid, BarDarah[playerid]);
					PlayerTextDrawShow(playerid, BarArmor[playerid]);
					PlayerTextDrawShow(playerid, BarMakan[playerid]);
					PlayerTextDrawShow(playerid, BarMinum[playerid]);
					PlayerTextDrawShow(playerid, BarPusing[playerid]);
					PlayerTextDrawShow(playerid, VOICE_1[playerid]);
					PlayerTextDrawShow(playerid, VOICE_2[playerid]);
				}
			}
			else
			{
				
			}
			TextDrawShowForPlayer(playerid, ServerName);
			CheckPlayerSpawn3Titik(playerid);
			SetPlayerSkin(playerid, pData[playerid][pSkin]);
			if(pData[playerid][pOnDuty] >= 1)
			{
				SetPlayerSkin(playerid, pData[playerid][pFacSkin]);
				SetFactionColor(playerid);
			}
			if(pData[playerid][pAdminDuty] > 0)
			{
				SetPlayerColor(playerid, COLOR_RED);
			}
			SetTimerEx("SpawnTimer", 6000, false, "i", playerid);
		}
	}
}

function SpawnTimer(playerid)
{
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, pData[playerid][pMoney]);
	SetPlayerScore(playerid, pData[playerid][pLevel]);
	SetPlayerHealth(playerid, pData[playerid][pHealth]);
	SetPlayerArmour(playerid, pData[playerid][pArmour]);
	pData[playerid][pSpawned] = 1;
	TogglePlayerControllable(playerid, 1);
	SetCameraBehindPlayer(playerid);
	AttachPlayerToys(playerid);
	SetWeapons(playerid);
	if(pData[playerid][pJail] > 0)
	{
		JailPlayer(playerid); 
	}
	if(pData[playerid][pArrestTime] > 0)
	{
		SetPlayerArrest(playerid, pData[playerid][pArrest]);
	}
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
    InterpolateCameraPos(playerid, 583.33, -2149.81, 99.26, 467.62, -2022.67, 27.38, 60000);
	InterpolateCameraLookAt(playerid, 583.33, -2149.81, 99.26, 467.62, -2022.67, 27.38, 50000);
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	Info(playerid, "{ff0000}Jangan di pencet spawn adik adik!!!");
	KickEx(playerid);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	if(killerid != INVALID_PLAYER_ID)
	{
		new reasontext[526];
		switch(reason)
		{
	        case 0: reasontext = "Fist";
	        case 1: reasontext = "Brass Knuckles";
	        case 2: reasontext = "Golf Club";
	        case 3: reasontext = "Nite Stick";
	        case 4: reasontext = "Knife";
	        case 5: reasontext = "Basebal Bat";
	        case 6: reasontext = "Shovel";
	        case 7: reasontext = "Pool Cue";
	        case 8: reasontext = "Katana";
	        case 9: reasontext = "Chain Shaw";
	        case 14: reasontext = "Cane";
	        case 18: reasontext = "Molotov";
	        case 22: reasontext = "Pistol";
	        case 25: reasontext = "Shotgan";
	        case 28: reasontext = "Laras long";
		    case 49: reasontext = "Rammed by Car";
		    case 50: reasontext = "Helicopter blades";
		    case 51: reasontext = "Explosion";
		    case 53: reasontext = "Drowned";
		    case 54: reasontext = "Splat";
		    case 255: reasontext = "Suicide";
		}
		new h, m, s;
		new day, month, year;
	    gettime(h, m, s);
	    getdate(year,month,day);

        new dc[128];
        format(dc, sizeof dc, "```%02d.%02d.%d - %02d:%02d:%02d```\n```\n%s [ID: %d] killed %s [ID: %d] (%s)\n```",day, month, year, h, m, s, pData[killerid][pName], killerid, pData[playerid][pName], playerid, reasontext);
        SendDiscordMessage(9, dc);
	}
    else
	{
		new reasontext[526];
		switch(reason)
		{
	        case 0: reasontext = "Fist";
	        case 1: reasontext = "Brass Knuckles";
	        case 2: reasontext = "Golf Club";
	        case 3: reasontext = "Nite Stick";
	        case 4: reasontext = "Knife";
	        case 5: reasontext = "Basebal Bat";
	        case 6: reasontext = "Shovel";
	        case 7: reasontext = "Pool Cue";
	        case 8: reasontext = "Katana";
	        case 9: reasontext = "Chain Shaw";
	        case 14: reasontext = "Cane";
	        case 18: reasontext = "Molotov";
	        case 22..24: reasontext = "Pistol";
	        case 25..27: reasontext = "Shotgan";
	        case 28..34: reasontext = "Laras long";
		    case 49: reasontext = "Rammed by Car";
		    case 50: reasontext = "Helicopter blades";
		    case 51: reasontext = "Explosion";
		    case 53: reasontext = "Drowned";
		    case 54: reasontext = "Splat";
		    case 255: reasontext = "Suicide";
		}
	    new h, m, s;
	    new day, month, year;
	    gettime(h, m, s);
	    getdate(year,month,day);
	    new name[MAX_PLAYER_NAME + 1];
	    GetPlayerName(playerid, name, sizeof name);

	    new dc[128];
	    format(dc, sizeof dc, "```%02d.%02d.%d - %02d:%02d:%02d```\n```\n%s [ID: %d] death(%s)\n```",day, month, year, h, m, s, name, playerid, reasontext);
	    SendDiscordMessage(9, dc);
	}

	DeletePVar(playerid, "UsingSprunk");
	SetPVarInt(playerid, "GiveUptime", -1);
	pData[playerid][pSpawned] = 0;
	Player_ResetCutting(playerid);
	Player_RemoveLumber(playerid);
	Player_ResetMining(playerid);
	Player_ResetHarvest(playerid);
	
	pData[playerid][CarryProduct] = 0;
	pData[playerid][CarryPart] = 0;
	pData[playerid][pProductingStatus] = 0;
	pData[playerid][pPemotongStatus] = 0;
	pData[playerid][pPartStatus] = 0;
	pData[playerid][pCookingStatus] = 0;
	pData[playerid][pMechanicStatus] = 0;
	pData[playerid][pActivityStatus] = 0;
	pData[playerid][pArmsDealerStatus] = 0;
	pData[playerid][pFillStatus] = 0;
	
	KillTimer(pData[playerid][pActivity]);
	KillTimer(pData[playerid][pMechanic]);
	KillTimer(pData[playerid][pProducting]);
	KillTimer(pData[playerid][pCooking]);
	KillTimer(pData[playerid][pPemotong]);
	KillTimer(pData[playerid][pCheckpointTarget]);
	KillTimer(pData[playerid][pPart]);
	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
	PlayerTextDrawHide(playerid, ActiveTD[playerid]);
	pData[playerid][pMechVeh] = INVALID_VEHICLE_ID;
	pData[playerid][pActivityTime] = 0;
	
	pData[playerid][pMechDuty] = 0;
	pData[playerid][pMission] = -1;
	
	pData[playerid][pSideJob] = 0;
	DisablePlayerCheckpoint(playerid);
	DisablePlayerRaceCheckpoint(playerid);
	SetPlayerColor(playerid, COLOR_WHITE);
	RemovePlayerAttachedObject(playerid, 9);
	GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
	UpdatePlayerData(playerid);
	/*foreach(new ii : Player)
    {
        if(pData[ii][pAdmin] > 0)
        {
            SendDeathMessageToPlayer(ii, killerid, playerid, reason);
			new dc[128];
			format(dc, sizeof(dc),  "%s :skull_crossbones: %s :gun: %s", GetRPName(playerid), GetRPName(killerid), ReturnWeaponName(reason));
			SendDiscordMessage(9, dc);
			return 1;
        }
    }*/
    if(IsAtEvent[playerid] == 1)
    {
    	SetPlayerPos(playerid, 1474.65, -1736.36, 13.38);
    	SetPlayerVirtualWorld(playerid, 0);
    	SetPlayerInterior(playerid, 0);
    	ClearAnimations(playerid);
    	ResetPlayerWeaponsEx(playerid);
       	SetPlayerColor(playerid, COLOR_WHITE);
    	if(GetPlayerTeam(playerid) == 1)
    	{
    		Servers(playerid, "Anda sudah terkalahkan");
    		RedTeam -= 1;
    	}
    	else if(GetPlayerTeam(playerid) == 2)
    	{
    		Servers(playerid, "Anda sudah terkalahkan");
    		BlueTeam -= 1;
    	}
    	if(BlueTeam == 0)
    	{
    		foreach(new ii : Player)
    		{
    			if(GetPlayerTeam(ii) == 1)
    			{
    				GivePlayerMoneyEx(ii, EventPrize);
    				Servers(ii, "Selamat, Tim Anda berhasil memenangkan Event dan Mendapatkan Hadiah $%d per orang", EventPrize);
    				pData[playerid][pHospital] = 0;
    				ClearAnimations(ii);
    				BlueTeam = 0;
    			}
    			else if(GetPlayerTeam(ii) == 2)
    			{
    				Servers(ii, "Maaf, Tim anda sudah terkalahkan, Harap Coba Lagi lain waktu");
    				pData[playerid][pHospital] = 0;
    				ClearAnimations(ii);
    				BlueTeam = 0;
    			}
    		}
    	}
    	if(RedTeam == 0)
    	{
    		foreach(new ii : Player)
    		{
    			if(GetPlayerTeam(ii) == 2)
    			{
    				GivePlayerMoneyEx(ii, EventPrize);
    				Servers(ii, "Selamat, Tim Anda berhasil memenangkan Event dan Mendapatkan Hadiah $%d per orang", EventPrize);
    				pData[playerid][pHospital] = 0;
    				ClearAnimations(ii);
    				BlueTeam = 0;
    			}
    			else if(GetPlayerTeam(ii) == 1)
    			{
    				Servers(ii, "Maaf, Tim anda sudah terkalahkan, Harap Coba Lagi lain waktu");
    				pData[playerid][pHospital] = 0;
    				ClearAnimations(ii);
    				RedTeam = 0;
    			}
    		}
    	}
    	SetPlayerTeam(playerid, 0);
    	IsAtEvent[playerid] = 0;
    	pData[playerid][pInjured] = 0;
    	pData[playerid][pSpawned] = 1;
		UpdateDynamic3DTextLabelText(pData[playerid][pInjuredLabel], COLOR_ORANGE, "");
    }
    if(IsAtEvent[playerid] == 0)
    {
    	new asakit = RandomEx(0, 5);
    	new bsakit = RandomEx(0, 9);
    	new csakit = RandomEx(0, 7);
    	new dsakit = RandomEx(0, 6);
    	pData[playerid][pLFoot] -= dsakit;
    	pData[playerid][pLHand] -= bsakit;
    	pData[playerid][pRFoot] -= csakit;
    	pData[playerid][pRHand] -= dsakit;
    	pData[playerid][pHead] -= asakit;
    }
	return 1;
}

public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ,Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
	new weaponid = EditingWeapon[playerid];
    if(weaponid)
    {
        if(response == 1)
        {
            new enum_index = weaponid - 22, weaponname[18], string[340];
 
            GetWeaponName(weaponid, weaponname, sizeof(weaponname));
           
            WeaponSettings[playerid][enum_index][Position][0] = fOffsetX;
            WeaponSettings[playerid][enum_index][Position][1] = fOffsetY;
            WeaponSettings[playerid][enum_index][Position][2] = fOffsetZ;
            WeaponSettings[playerid][enum_index][Position][3] = fRotX;
            WeaponSettings[playerid][enum_index][Position][4] = fRotY;
            WeaponSettings[playerid][enum_index][Position][5] = fRotZ;
 
            RemovePlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid));
            SetPlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid), GetWeaponModel(weaponid), WeaponSettings[playerid][enum_index][Bone], fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, 1.0, 1.0, 1.0);
 
            Servers(playerid, "You have successfully adjusted the position of your %s.", weaponname);
           
            mysql_format(g_SQL, string, sizeof(string), "INSERT INTO weaponsettings (Owner, WeaponID, PosX, PosY, PosZ, RotX, RotY, RotZ) VALUES ('%d', %d, %.3f, %.3f, %.3f, %.3f, %.3f, %.3f) ON DUPLICATE KEY UPDATE PosX = VALUES(PosX), PosY = VALUES(PosY), PosZ = VALUES(PosZ), RotX = VALUES(RotX), RotY = VALUES(RotY), RotZ = VALUES(RotZ)", pData[playerid][pID], weaponid, fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ);
            mysql_tquery(g_SQL, string);
        }
		else if(response == 0)
		{
			new enum_index = weaponid - 22;
			SetPlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid), GetWeaponModel(weaponid), WeaponSettings[playerid][enum_index][Bone], fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, 1.0, 1.0, 1.0);
		}
        EditingWeapon[playerid] = 0;
		return 1;
    }
	else
	{
		if(response == 1)
		{
			InfoTD_MSG(playerid, 4000, "~g~~h~Toy Position Updated~y~!");

			pToys[playerid][index][toy_x] = fOffsetX;
			pToys[playerid][index][toy_y] = fOffsetY;
			pToys[playerid][index][toy_z] = fOffsetZ;
			pToys[playerid][index][toy_rx] = fRotX;
			pToys[playerid][index][toy_ry] = fRotY;
			pToys[playerid][index][toy_rz] = fRotZ;
			pToys[playerid][index][toy_sx] = fScaleX;
			pToys[playerid][index][toy_sy] = fScaleY;
			pToys[playerid][index][toy_sz] = fScaleZ;
			
			MySQL_SavePlayerToys(playerid);
		}
		else if(response == 0)
		{
			InfoTD_MSG(playerid, 4000, "~r~~h~Selection Cancelled~y~!");

			SetPlayerAttachedObject(playerid,
				index,
				modelid,
				boneid,
				pToys[playerid][index][toy_x],
				pToys[playerid][index][toy_y],
				pToys[playerid][index][toy_z],
				pToys[playerid][index][toy_rx],
				pToys[playerid][index][toy_ry],
				pToys[playerid][index][toy_rz],
				pToys[playerid][index][toy_sx],
				pToys[playerid][index][toy_sy],
				pToys[playerid][index][toy_sz]);
		}
		SetPVarInt(playerid, "UpdatedToy", 1);
		TogglePlayerControllable(playerid, true);
	}
	return 1;
}

public OnPlayerEditDynamicObject(playerid, STREAMER_TAG_OBJECT: objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if(Player_EditingObject[playerid])
	{
		if (response == EDIT_RESPONSE_FINAL)
		{
			new
                vehicleid = Player_EditVehicleObject[playerid],
                vehid = GetPlayerVehicleID(playerid),
                slot = Player_EditVehicleObjectSlot[playerid],
                Float:vx,
                Float:vy,
                Float:vz,
                Float:va,
                Float:real_x,
                Float:real_y,
                Float:real_z,
                Float:real_a
            ;

            GetVehiclePos(vehid, vx, vy, vz);
            GetVehicleZAngle(vehid, va); // Coba lagi

            real_x = x - vx;
            real_y = y - vy;
            real_z = z - vz;
            real_a = rz - va;

            new Float:v_size[3];
            GetVehicleModelInfo(pvData[vehicleid][cModel], VEHICLE_MODEL_INFO_SIZE, v_size[0], v_size[1], v_size[2]);
            if(	(real_x >= v_size[0] || -v_size[0] >= real_x) ||
                (real_y >= v_size[1] || -v_size[1] >= real_y) ||
                (real_z >= v_size[2] || -v_size[2] >= real_z))
            {
                SendClientMessageEx(playerid, COLOR_ARWIN,"MODSHOP: "WHITE_E"Posisi object terlal jauh dari body kendaraan.");
                ResetEditing(playerid);
                return 1;
            }

            VehicleObjects[vehicleid][slot][vehObjectPosX] = real_x;
            VehicleObjects[vehicleid][slot][vehObjectPosY] = real_y;
            VehicleObjects[vehicleid][slot][vehObjectPosZ] = real_z;
            VehicleObjects[vehicleid][slot][vehObjectPosRX] = rx;
            VehicleObjects[vehicleid][slot][vehObjectPosRY] = ry;
            VehicleObjects[vehicleid][slot][vehObjectPosRZ] = real_a;
		
			Streamer_UpdateEx(playerid, VehicleObjects[vehicleid][slot][vehObjectPosX], VehicleObjects[vehicleid][slot][vehObjectPosY], VehicleObjects[vehicleid][slot][vehObjectPosZ]);
			if(VehicleObjects[vehicleid][slot][vehObjectType] == OBJECT_TYPE_BODY)
			{
				SetDynamicObjectMaterial(VehicleObjects[vehicleid][slot][vehObject], 0, VehicleObjects[vehicleid][slot][vehObjectModel], "none", "none", RGBAToARGB(ColorList[VehicleObjects[vehicleid][slot][vehObjectColor]]));
			}
			else if(VehicleObjects[vehicleid][slot][vehObjectType] == OBJECT_TYPE_TEXT)
			{
				SetDynamicObjectMaterialText(VehicleObjects[vehicleid][slot][vehObject], 0, VehicleObjects[vehicleid][slot][vehObjectText], 130, VehicleObjects[vehicleid][slot][vehObjectFont], VehicleObjects[vehicleid][slot][vehObjectFontSize], 1, RGBAToARGB(ColorList[VehicleObjects[vehicleid][slot][vehObjectFontColor]]), 0, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
			}
			AttachDynamicObjectToVehicle(VehicleObjects[vehicleid][slot][vehObject], pvData[vehicleid][cVeh], real_x, real_y, real_z, rx, ry, real_a);
        	Vehicle_ObjectUpdate(vehicleid, slot);
			//Vehicle_AttachObject(vehicleid, slot);
            Vehicle_ObjectSave(vehicleid, slot);
			
            if(VehicleObjects[vehicleid][slot][vehObjectType] == OBJECT_TYPE_BODY)
            {
                Dialog_Show(playerid, VACCSE, DIALOG_STYLE_LIST, "Edit Component", "Position\nPosition (Manual)\nChange Color\nRemove Modification\nSave", "Select", "Back");
            }
            else if(VehicleObjects[vehicleid][slot][vehObjectType] == OBJECT_TYPE_TEXT)
            {
                Dialog_Show(playerid, VACCSE1, DIALOG_STYLE_LIST, "Edit Component", "Position\nPosition (Manual)\nText Name\nText Size\nText Font\nText Color\nRemove Modification\nSave", "Select", "Back");
            }
            else if(VehicleObjects[vehicleid][slot][vehObjectType] == OBJECT_TYPE_LIGHT)
            {
                Dialog_Show(playerid, VACCSE2, DIALOG_STYLE_LIST, "Edit Component", "Position\nPosition (Manual)\nRemove Modification\nSave", "Select", "Back");
            }
			return 1;
		}

		if(response == EDIT_RESPONSE_CANCEL)
		{
			ResetEditing(playerid);
			return 1;
		}
	}
    if (response == EDIT_RESPONSE_FINAL)
	{
		if (EditingObject[playerid] != -1 && ObjectData[EditingObject[playerid]][objExists])
	    {
			ObjectData[EditingObject[playerid]][objPos][0] = x;
			ObjectData[EditingObject[playerid]][objPos][1] = y;
			ObjectData[EditingObject[playerid]][objPos][2] = z;
			ObjectData[EditingObject[playerid]][objPos][3] = rx;
			ObjectData[EditingObject[playerid]][objPos][4] = ry;
			ObjectData[EditingObject[playerid]][objPos][5] = rz;

			Object_Refresh(EditingObject[playerid]);
			Object_Save(EditingObject[playerid]);

			SendClientMessageEx(playerid, COLOR_WHITE, "OBJECT: {FFFFFF}You've edited the position of Object ID: %d.", EditingObject[playerid]);
	    }
		else if (EditingMatext[playerid] != -1 && MatextData[EditingMatext[playerid]][mtExists])
	    {
			MatextData[EditingMatext[playerid]][mtPos][0] = x;
			MatextData[EditingMatext[playerid]][mtPos][1] = y;
			MatextData[EditingMatext[playerid]][mtPos][2] = z;
			MatextData[EditingMatext[playerid]][mtPos][3] = rx;
			MatextData[EditingMatext[playerid]][mtPos][4] = ry;
			MatextData[EditingMatext[playerid]][mtPos][5] = rz;

			Matext_Refresh(EditingMatext[playerid]);
			Matext_Save(EditingMatext[playerid]);

			SendClientMessageEx(playerid, COLOR_WHITE, "MATEXT: {FFFFFF}You've edited the position of Material Text ID: %d.", EditingMatext[playerid]);
	    }

	    
	}
	if(pData[playerid][EditingTreeID] != -1 && Iter_Contains(Trees, pData[playerid][EditingTreeID]))
	{
	    if(response == EDIT_RESPONSE_FINAL)
	    {
	        new etid = pData[playerid][EditingTreeID];
	        TreeData[etid][treeX] = x;
	        TreeData[etid][treeY] = y;
	        TreeData[etid][treeZ] = z;
	        TreeData[etid][treeRX] = rx;
	        TreeData[etid][treeRY] = ry;
	        TreeData[etid][treeRZ] = rz;

	        SetDynamicObjectPos(objectid, TreeData[etid][treeX], TreeData[etid][treeY], TreeData[etid][treeZ]);
	        SetDynamicObjectRot(objectid, TreeData[etid][treeRX], TreeData[etid][treeRY], TreeData[etid][treeRZ]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, TreeData[etid][treeLabel], E_STREAMER_X, TreeData[etid][treeX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, TreeData[etid][treeLabel], E_STREAMER_Y, TreeData[etid][treeY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, TreeData[etid][treeLabel], E_STREAMER_Z, TreeData[etid][treeZ] + 1.5);

		    Tree_Save(etid);
	        pData[playerid][EditingTreeID] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new etid = pData[playerid][EditingTreeID];
	        SetDynamicObjectPos(objectid, TreeData[etid][treeX], TreeData[etid][treeY], TreeData[etid][treeZ]);
	        SetDynamicObjectRot(objectid, TreeData[etid][treeRX], TreeData[etid][treeRY], TreeData[etid][treeRZ]);
	        pData[playerid][EditingTreeID] = -1;
	    }
	}
	if(pData[playerid][EditingGarkot] != -1 && Iter_Contains(Garkot, pData[playerid][EditingGarkot]))
	{
	    if(response == EDIT_RESPONSE_FINAL)
	    {
	        new etid = pData[playerid][EditingGarkot];
	        gkData[etid][gkX] = x;
	        gkData[etid][gkY] = y;
	        gkData[etid][gkZ] = z;

	        SetDynamicObjectPos(objectid, gkData[etid][gkX], gkData[etid][gkY], gkData[etid][gkZ]);

		    Garkot_Save(etid);
	        pData[playerid][EditingGarkot] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new etid = pData[playerid][EditingGarkot];
	        SetDynamicObjectPos(objectid, gkData[etid][gkX], gkData[etid][gkY], gkData[etid][gkZ]);
	        pData[playerid][EditingGarkot] = -1;
	    }
	}
	if(pData[playerid][EditingOreID] != -1 && Iter_Contains(Ores, pData[playerid][EditingOreID]))
	{
	    if(response == EDIT_RESPONSE_FINAL)
	    {
	        new etid = pData[playerid][EditingOreID];
	        OreData[etid][oreX] = x;
	        OreData[etid][oreY] = y;
	        OreData[etid][oreZ] = z;
	        OreData[etid][oreRX] = rx;
	        OreData[etid][oreRY] = ry;
	        OreData[etid][oreRZ] = rz;

	        SetDynamicObjectPos(objectid, OreData[etid][oreX], OreData[etid][oreY], OreData[etid][oreZ]);
	        SetDynamicObjectRot(objectid, OreData[etid][oreRX], OreData[etid][oreRY], OreData[etid][oreRZ]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, OreData[etid][oreLabel], E_STREAMER_X, OreData[etid][oreX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, OreData[etid][oreLabel], E_STREAMER_Y, OreData[etid][oreY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, OreData[etid][oreLabel], E_STREAMER_Z, OreData[etid][oreZ] + 1.5);

		    Ore_Save(etid);
	        pData[playerid][EditingOreID] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new etid = pData[playerid][EditingOreID];
	        SetDynamicObjectPos(objectid, OreData[etid][oreX], OreData[etid][oreY], OreData[etid][oreZ]);
	        SetDynamicObjectRot(objectid, OreData[etid][oreRX], OreData[etid][oreRY], OreData[etid][oreRZ]);
	        pData[playerid][EditingOreID] = -1;
	    }
	}
	if(pData[playerid][EditingATMID] != -1 && Iter_Contains(ATMS, pData[playerid][EditingATMID]))
	{
		if(response == EDIT_RESPONSE_FINAL)
	    {
	        new etid = pData[playerid][EditingATMID];
	        AtmData[etid][atmX] = x;
	        AtmData[etid][atmY] = y;
	        AtmData[etid][atmZ] = z;
	        AtmData[etid][atmRX] = rx;
	        AtmData[etid][atmRY] = ry;
	        AtmData[etid][atmRZ] = rz;

	        SetDynamicObjectPos(objectid, AtmData[etid][atmX], AtmData[etid][atmY], AtmData[etid][atmZ]);
	        SetDynamicObjectRot(objectid, AtmData[etid][atmRX], AtmData[etid][atmRY], AtmData[etid][atmRZ]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_X, AtmData[etid][atmX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_Y, AtmData[etid][atmY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_Z, AtmData[etid][atmZ] + 0.3);

		    Atm_Save(etid);
	        pData[playerid][EditingATMID] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new etid = pData[playerid][EditingATMID];
	        SetDynamicObjectPos(objectid, AtmData[etid][atmX], AtmData[etid][atmY], AtmData[etid][atmZ]);
	        SetDynamicObjectRot(objectid, AtmData[etid][atmRX], AtmData[etid][atmRY], AtmData[etid][atmRZ]);
	        pData[playerid][EditingATMID] = -1;
	    }
	}
	if(pData[playerid][EditingVending] != -1 && Iter_Contains(Vendings, pData[playerid][EditingVending]))
	{
		if(response == EDIT_RESPONSE_FINAL)
	    {
	        new venid = pData[playerid][EditingVending];
	        VendingData[venid][vendingX] = x;
	        VendingData[venid][vendingY] = y;
	        VendingData[venid][vendingZ] = z;
	        VendingData[venid][vendingRX] = rx;
	        VendingData[venid][vendingRY] = ry;
	        VendingData[venid][vendingRZ] = rz;

	        SetDynamicObjectPos(objectid, VendingData[venid][vendingX], VendingData[venid][vendingY], VendingData[venid][vendingZ]);
	        SetDynamicObjectRot(objectid, VendingData[venid][vendingRX], VendingData[venid][vendingRY], VendingData[venid][vendingRZ]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, VendingData[venid][vendingText], E_STREAMER_X, VendingData[venid][vendingX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, VendingData[venid][vendingText], E_STREAMER_Y, VendingData[venid][vendingY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, VendingData[venid][vendingText], E_STREAMER_Z, VendingData[venid][vendingZ] + 0.3);

		    Vending_Save(venid);
	        pData[playerid][EditingVending] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new venid = pData[playerid][EditingVending];
	        SetDynamicObjectPos(objectid, VendingData[venid][vendingX], VendingData[venid][vendingY], VendingData[venid][vendingZ]);
	        SetDynamicObjectRot(objectid, VendingData[venid][vendingRX], VendingData[venid][vendingRY], VendingData[venid][vendingRZ]);
	    	pData[playerid][EditingVending] = -1;
	    }
	}
	if(pData[playerid][gEditID] != -1 && Iter_Contains(Gates, pData[playerid][gEditID]))
	{
		new id = pData[playerid][gEditID];
		if(response == EDIT_RESPONSE_UPDATE)
		{
			SetDynamicObjectPos(objectid, x, y, z);
			SetDynamicObjectRot(objectid, rx, ry, rz);
		}
		else if(response == EDIT_RESPONSE_CANCEL)
		{
			SetDynamicObjectPos(objectid, gPosX[playerid], gPosY[playerid], gPosZ[playerid]);
			SetDynamicObjectRot(objectid, gRotX[playerid], gRotY[playerid], gRotZ[playerid]);
			gPosX[playerid] = 0; gPosY[playerid] = 0; gPosZ[playerid] = 0;
			gRotX[playerid] = 0; gRotY[playerid] = 0; gRotZ[playerid] = 0;
			Servers(playerid, " You have canceled editing gate ID %d.", id);
			Gate_Save(id);
		}
		else if(response == EDIT_RESPONSE_FINAL)
		{
			SetDynamicObjectPos(objectid, x, y, z);
			SetDynamicObjectRot(objectid, rx, ry, rz);
			if(pData[playerid][gEdit] == 1)
			{
				gData[id][gCX] = x;
				gData[id][gCY] = y;
				gData[id][gCZ] = z;
				gData[id][gCRX] = rx;
				gData[id][gCRY] = ry;
				gData[id][gCRZ] = rz;
				if(IsValidDynamic3DTextLabel(gData[id][gText])) DestroyDynamic3DTextLabel(gData[id][gText]);
				new str[64];
				format(str, sizeof(str), "Gate ID: %d", id);
				gData[id][gText] = CreateDynamic3DTextLabel(str, COLOR_WHITE, gData[id][gCX], gData[id][gCY], gData[id][gCZ], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 10.0);
				
				pData[playerid][gEditID] = -1;
				pData[playerid][gEdit] = 0;
				Servers(playerid, " You have finished editing gate ID %d's closing position.", id);
				gData[id][gStatus] = 0;
				Gate_Save(id);
			}
			else if(pData[playerid][gEdit] == 2)
			{
				gData[id][gOX] = x;
				gData[id][gOY] = y;
				gData[id][gOZ] = z;
				gData[id][gORX] = rx;
				gData[id][gORY] = ry;
				gData[id][gORZ] = rz;
				
				pData[playerid][gEditID] = -1;
				pData[playerid][gEdit] = 0;
				Servers(playerid, " You have finished editing gate ID %d's opening position.", id);

				gData[id][gStatus] = 1;
				Gate_Save(id);
			}
		}
	}
	return 1;
}

public DoGMX()
{
	SendRconCommand("gmx");
	return 1;
}

public OnPlayerEnterDynamicCP(playerid, checkpointid)
{
	if(checkpointid == atm1)
	{
		Jembut(playerid, "Menggunakan Atm", 5);
	}
	if(checkpointid == atm2)
	{
		Jembut(playerid, "Menggunakan Atm", 5);
	}
	if(checkpointid == atm3)
	{
		Jembut(playerid, "Menggunakan Atm", 5);
	}
	if(checkpointid == pData[playerid][LoadingPoint])
	{
	    if(GetPVarInt(playerid, "LoadingCooldown") > gettime()) return 1;
		new vehicleid = GetPVarInt(playerid, "LastVehicleID"), type[64], carid = -1;
		if(pData[playerid][CarryingLog] == 0)
		{
			type = "Metal";
		}
		else if(pData[playerid][CarryingLog] == 1)
		{
			type = "Coal";
		}
		else
		{
			type = "Unknown";
		}
		if(Vehicle_LogCount(vehicleid) >= LOG_LIMIT) return Error(playerid, "You can't load any more ores to this vehicle.");
		if((carid = Vehicle_Nearest2(playerid)) != -1)
		{
			if(pData[playerid][CarryingLog] == 0)
			{
				pvData[carid][cMetal] += 1;
			}
			else if(pData[playerid][CarryingLog] == 1)
			{
				pvData[carid][cCoal] += 1;
			}
		}
		LogStorage[vehicleid][ pData[playerid][CarryingLog] ]++;
		Info(playerid, "MINING: Loaded %s.", type);
		ApplyAnimation(playerid, "CARRY", "putdwn05", 4.1, 0, 1, 1, 0, 0, 1);
		Player_RemoveLog(playerid);
		return 1;
	}
	if(checkpointid == Disnaker)
	{
		Jembut(playerid, "Untuk Ambil Job", 5);
	}
	if(checkpointid == ShowRoomCP)
	{
		ShowPlayerDialog(playerid, DIALOG_BUYPVCP, DIALOG_STYLE_LIST, "{7fffd4}FivemShowroom", "Motorcycle\nMobil\nKendaraan Sport\nKendaraan Job", "Select", "Cancel");
	}
	if(checkpointid == BusCP)
	{
		Jembut(playerid, "For Spawn Bus", 5);
	}
	if(checkpointid == PemotongArea[playerid][LockerPemotong])
	{
		Jembut(playerid, "Untuk Akses Locker", 5);
	}
	if(checkpointid == PenambangArea[playerid][LockerTambang])
	{
		Jembut(playerid, "Untuk Akses Locker", 5);
	}
	if(checkpointid == PenambangArea[playerid][CuciBatu])
	{
		Jembut(playerid, "Untuk Mencuci Batu", 5);
	}
	if(checkpointid == PenambangArea[playerid][Peleburan])
	{
		Jembut(playerid, "Untuk Meleburkan Batu", 5);
	}
	if(checkpointid == PenambangArea[playerid][Penjualan])
	{
		Jembut(playerid, "Untuk Menjual Emas", 5);
	}
	if(checkpointid == PenambangArea[playerid][Nambang])
	{
		Jembut(playerid, "Untuk Menambang", 5);
	}
	if(checkpointid == PenambangArea[playerid][TakeCarTambang])
	{
		Jembut(playerid, "For Spawn Vehicle", 5);
	}
	if(checkpointid == MinyakArea[playerid][OlahMinyak])
	{
	    Jembut(playerid, "Untuk Olah Minyak", 5);
	}
	if(checkpointid == MinyakArea[playerid][LockerTambang])
	{
	    Jembut(playerid, "Untuk Akses Locker", 5);
	}
	if(checkpointid == PemerahCP)
	{
		Jembut(playerid, "Untuk Akses ~p~Locker", 5);
	}
	if(checkpointid == MinyakArea[playerid][Nambangg])
	{
	    Jembut(playerid, "Untuk Ambil Minyak", 5);
	}
	if(checkpointid == MinyakArea[playerid][Nambang])
	{
	    Jembut(playerid, "Untuk Ambil Minyak", 5);
	}
	if(checkpointid == ShowRoomCPRent)
	{
		new str[1024];
		format(str, sizeof(str), "Kendaraan\tHarga\n"WHITE_E"%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days",
		GetVehicleModelName(414), 
		GetVehicleModelName(455), 
		GetVehicleModelName(456),
		GetVehicleModelName(498),
		GetVehicleModelName(499),
		GetVehicleModelName(609),
		GetVehicleModelName(478),
		GetVehicleModelName(422),
		GetVehicleModelName(543),
		GetVehicleModelName(554),
		GetVehicleModelName(525),
		GetVehicleModelName(438),
		GetVehicleModelName(420),
		GetVehicleModelName(403)
		);
		
		ShowPlayerDialog(playerid, DIALOG_RENT_JOBCARS, DIALOG_STYLE_TABLIST_HEADERS, "Rent Job Cars", str, "Rent", "Close");
	}
	return 1;
}
public OnPlayerLeaveCheckpoint(playerid)
{
	if(pData[playerid][pBus] && IsABusVeh(GetPlayerVehicleID(playerid)))
	{
		pData[playerid][pBuswaiting] = false;
		InfoTD_Hide(playerid);
	}
	return 1;
}
public OnPlayerEnterRaceCheckpoint(playerid)
{
	if(pData[playerid][pSedangContainer] > 0)
	{
		if(pData[playerid][pSedangContainer] == 1)
		{
			new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid, COLOR_ARWIN, "CONTAINER: {FFFFFF}Bring the container to the destination.");
			PlayerPlaySound(playerid, 6003, 0,0,0);
			TrailerContainer[vehicleid] = CreateDynamicObject(2935, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
			AttachDynamicObjectToVehicle(TrailerContainer[vehicleid], vehicleid, 0.000, -1.330, 1.190, 0.000, 0.000, 180.0);
			pData[playerid][pSedangContainer] = 2;
			SetPlayerRaceCheckpoint(playerid, 1, 2791.4016, -2494.5452, 14.2522, 2791.4016, -2494.5452, 14.2522, 10.0);
		}
		else if(pData[playerid][pSedangContainer] == 2)
		{
			new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);
			DisablePlayerRaceCheckpoint(playerid);
			pData[playerid][pSedangContainer] = 0;
			DialogHauling[0] = false; // Dialog 0 telah di pilih
			DialogSaya[playerid][0] = false;
			DestroyDynamicObject(TrailerContainer[vehicleid]);
			AddPlayerSalary(playerid, "Job(Trucker)", 300);
			pData[playerid][pJobTime] = 360;
			Info(playerid, "Job(Truck) telah masuk ke pending salary anda!");
		}
		else if(pData[playerid][pSedangContainer] == 3)
		{
			new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid, COLOR_ARWIN, "CONTAINER: {FFFFFF}Bring the container to the destination.");
			PlayerPlaySound(playerid, 6003, 0,0,0);
			TrailerContainer[vehicleid] = CreateDynamicObject(2935, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
			AttachDynamicObjectToVehicle(TrailerContainer[vehicleid], vehicleid, 0.000, -1.330, 1.190, 0.000, 0.000, 180.0);
			pData[playerid][pSedangContainer] = 4;
			SetPlayerRaceCheckpoint(playerid, 1, -1963.0142, -2436.3079, 31.2311, -1963.0142, -2436.3079, 31.2311, 10.0);
		}
		else if(pData[playerid][pSedangContainer] == 4)
		{
			new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);
			DisablePlayerRaceCheckpoint(playerid);
			pData[playerid][pSedangContainer] = 0;
			DialogHauling[1] = false; // Dialog 0 telah di pilih
			DialogSaya[playerid][1] = false;
			DestroyDynamicObject(TrailerContainer[vehicleid]);
			GivePlayerMoney(playerid, 300);
			ShowItemBox(playerid, "Uang", "ADD_$300", 1212, 4);
			pData[playerid][pJobTime] = 360;
			InfoMsg(playerid, "Anda diupah sebanyak $300");
		}
		else if(pData[playerid][pSedangContainer] == 5)
		{
			new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid, COLOR_ARWIN, "CONTAINER: {FFFFFF}Bring the container to the destination.");
			PlayerPlaySound(playerid, 6003, 0,0,0);
			TrailerContainer[vehicleid] = CreateDynamicObject(2935, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
			AttachDynamicObjectToVehicle(TrailerContainer[vehicleid], vehicleid, 0.000, -1.330, 1.190, 0.000, 0.000, 180.0);
			pData[playerid][pSedangContainer] = 6;
			SetPlayerRaceCheckpoint(playerid, 1, -1863.1541, -1720.5603, 22.3558, -1863.1541, -1720.5603, 22.3558, 10.0);
		}
		else if(pData[playerid][pSedangContainer] == 6)
		{
			new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);
			DisablePlayerRaceCheckpoint(playerid);
			pData[playerid][pSedangContainer] = 0;
			DialogHauling[2] = false; // Dialog 0 telah di pilih
			DialogSaya[playerid][2] = false;
			DestroyDynamicObject(TrailerContainer[vehicleid]);
			AddPlayerSalary(playerid, "Job(Trucker)", 300);
			pData[playerid][pJobTime] = 360;
			Info(playerid, "Job(Truck) telah masuk ke pending salary anda!");
		}
		else if(pData[playerid][pSedangContainer] == 7)
		{
			new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid, COLOR_ARWIN, "CONTAINER: {FFFFFF}Bring the container to the destination.");
			PlayerPlaySound(playerid, 6003, 0,0,0);
			TrailerContainer[vehicleid] = CreateDynamicObject(2935, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
			AttachDynamicObjectToVehicle(TrailerContainer[vehicleid], vehicleid, 0.000, -1.330, 1.190, 0.000, 0.000, 180.0);
			pData[playerid][pSedangContainer] = 8;
			pData[playerid][pJobTime] = 360;
			SetPlayerRaceCheckpoint(playerid, 1, -1053.6145, -658.6473, 32.6319, -1053.6145, -658.6473, 32.6319, 10.0);
		}
		else if(pData[playerid][pSedangContainer] == 8)
		{
			new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);
			DisablePlayerRaceCheckpoint(playerid);
			pData[playerid][pSedangContainer] = 0;
			DialogHauling[3] = false; // Dialog 0 telah di pilih
			DialogSaya[playerid][3] = false;
			DestroyDynamicObject(TrailerContainer[vehicleid]);
			AddPlayerSalary(playerid, "Job(Trucker)", 300);
			pData[playerid][pJobTime] = 360;
			Info(playerid, "Job(Truck) telah masuk ke pending salary anda!");
		}
		else if(pData[playerid][pSedangContainer] == 9)
		{
			new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid, COLOR_ARWIN, "CONTAINER: {FFFFFF}Bring the container to the destination.");
			PlayerPlaySound(playerid, 6003, 0,0,0);
			TrailerContainer[vehicleid] = CreateDynamicObject(2935, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
			AttachDynamicObjectToVehicle(TrailerContainer[vehicleid], vehicleid, 0.000, -1.330, 1.190, 0.000, 0.000, 180.0);
			pData[playerid][pSedangContainer] = 10;
			SetPlayerRaceCheckpoint(playerid, 1, -459.3511, -48.3457, 60.5507, -459.3511, -48.3457, 60.5507, 10.0);
		}
		else if(pData[playerid][pSedangContainer] == 10)
		{
			new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);
			DisablePlayerRaceCheckpoint(playerid);
			pData[playerid][pSedangContainer] = 0;
			DialogHauling[4] = false; // Dialog 0 telah di pilih
			DialogSaya[playerid][4] = false;
			DestroyDynamicObject(TrailerContainer[vehicleid]);
			GivePlayerMoney(playerid, 300);
			ShowItemBox(playerid, "Uang", "ADD_$300", 1212, 4);
			pData[playerid][pJobTime] = 360;
			InfoMsg(playerid, "Anda diupah sebanyak $300");
		}
		else if(pData[playerid][pSedangContainer] == 11)
		{
			new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid, COLOR_ARWIN, "CONTAINER: {FFFFFF}Bring the container to the destination.");
			PlayerPlaySound(playerid, 6003, 0,0,0);
			TrailerContainer[vehicleid] = CreateDynamicObject(2935, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
			AttachDynamicObjectToVehicle(TrailerContainer[vehicleid], vehicleid, 0.000, -1.330, 1.190, 0.000, 0.000, 180.0);
			pData[playerid][pSedangContainer] = 12;
			SetPlayerRaceCheckpoint(playerid, 1, 847.0450, 921.0422, 13.9579, 847.0450, 921.0422, 13.9579, 10.0);
		}
		else if(pData[playerid][pSedangContainer] == 12)
		{
			new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);
			DisablePlayerRaceCheckpoint(playerid);
			pData[playerid][pSedangContainer] = 0;
			DialogHauling[5] = false; // Dialog 0 telah di pilih
			DialogSaya[playerid][5] = false;
			DestroyDynamicObject(TrailerContainer[vehicleid]);
			AddPlayerSalary(playerid, "Job(Trucker)", 300);
			pData[playerid][pJobTime] = 360;
			Info(playerid, "Job(Truck) telah masuk ke pending salary anda!");
		}
		else if(pData[playerid][pSedangContainer] == 13)
		{
			new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid, COLOR_ARWIN, "CONTAINER: {FFFFFF}Bring the container to the destination.");
			PlayerPlaySound(playerid, 6003, 0,0,0);
			TrailerContainer[vehicleid] = CreateDynamicObject(2935, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
			AttachDynamicObjectToVehicle(TrailerContainer[vehicleid], vehicleid, 0.000, -1.330, 1.190, 0.000, 0.000, 180.0);
			pData[playerid][pSedangContainer] = 14;
			SetPlayerRaceCheckpoint(playerid, 1, 249.6713, 1395.7150, 11.1923, 249.6713, 1395.7150, 11.1923, 10.0);
		}
		else if(pData[playerid][pSedangContainer] == 14)
		{
			new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);
			DisablePlayerRaceCheckpoint(playerid);
			pData[playerid][pSedangContainer] = 0;
			DialogHauling[6] = false; // Dialog 0 telah di pilih
			DialogSaya[playerid][6] = false;
			DestroyDynamicObject(TrailerContainer[vehicleid]);
			GivePlayerMoney(playerid, 300);
			ShowItemBox(playerid, "Uang", "ADD_$300", 1212, 4);
			pData[playerid][pJobTime] = 360;
			InfoMsg(playerid, "Anda diupah sebanyak $300");
		}
	}
	switch(pData[playerid][pCheckPoint])
	{
		case CHECKPOINT_BUS:
		{
			if(pData[playerid][pSideJob] == 2)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 431)
				{
					if(pData[playerid][pBus] == 1)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 2;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint2, buspoint2, 5.0);
					}
					else if(pData[playerid][pBus] == 2)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 3;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint3, buspoint3, 5.0);
					}
					else if(pData[playerid][pBus] == 3)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 4;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint4, buspoint4, 5.0);
					}
					else if(pData[playerid][pBus] == 4)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 5;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint5, buspoint5, 5.0);
					}
					else if(pData[playerid][pBus] == 5)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 6;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint6, buspoint6, 5.0);
					}
					else if(pData[playerid][pBus] == 6)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 7;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint7, buspoint7, 5.0);
					}
					else if(pData[playerid][pBus] == 7)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 8;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint8, buspoint8, 5.0);
					}
					else if(pData[playerid][pBus] == 8)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 9;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint9, buspoint9, 5.0);
					}
					else if(pData[playerid][pBus] == 9)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 10;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint10, buspoint10, 5.0);
					}
					else if(pData[playerid][pBus] == 10)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 11;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint11, buspoint11, 5.0);
					}
					else if(pData[playerid][pBus] == 11)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 12;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint12, buspoint12, 5.0);
					}
					else if(pData[playerid][pBus] == 12)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 13;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint13, buspoint13, 5.0);
					}
					else if(pData[playerid][pBus] == 13)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 14;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint14, buspoint14, 5.0);
					}
					else if(pData[playerid][pBus] == 14)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 15;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint15, buspoint15, 5.0);
					}
					else if(pData[playerid][pBus] == 15)
					{
						pData[playerid][pBuswaiting] = true;
						pData[playerid][pBustime] = 10;
						PlayerPlaySound(playerid, 43000, 1965.075073,-1779.868530,13.479113);
					}
					else if(pData[playerid][pBus] == 16)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 17;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint17, buspoint17, 5.0);
					}
					else if(pData[playerid][pBus] == 17)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 18;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint18, buspoint18, 5.0);
					}
					else if(pData[playerid][pBus] == 18)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 19;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint19, buspoint19, 5.0);
					}
					else if(pData[playerid][pBus] == 19)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 20;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint20, buspoint20, 5.0);
					}
					else if(pData[playerid][pBus] == 20)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 21;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint21, buspoint21, 5.0);
					}
					else if(pData[playerid][pBus] == 21)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 22;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint22, buspoint22, 5.0);
					}
					else if(pData[playerid][pBus] == 22)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 23;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint23, buspoint23, 5.0);
					}
					else if(pData[playerid][pBus] == 23)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 24;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint24, buspoint24, 5.0);
					}
					else if(pData[playerid][pBus] == 24)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 25;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint25, buspoint25, 5.0);
					}
					else if(pData[playerid][pBus] == 25)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 26;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint26, buspoint26, 5.0);
					}
					else if(pData[playerid][pBus] == 26)
					{
						pData[playerid][pBuswaiting] = true;
						pData[playerid][pBustime] = 10;
						PlayerPlaySound(playerid, 43000, 2763.975097,-2479.834228,13.575368);
					}
					else if(pData[playerid][pBus] == 27)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 28;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint28, buspoint28, 5.0);
					}
					else if(pData[playerid][pBus] == 28)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 29;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint29, buspoint29, 5.0);
					}
					else if(pData[playerid][pBus] == 29)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 30;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint30, buspoint30, 5.0);
					}
					else if(pData[playerid][pBus] == 30)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 31;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint31, buspoint31, 5.0);
					}
					else if(pData[playerid][pBus] == 31)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 32;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint32, buspoint32, 5.0);
					}
					else if(pData[playerid][pBus] == 32)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 33;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint33, buspoint33, 5.0);
					}
					else if(pData[playerid][pBus] == 33)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 34;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint34, buspoint34, 5.0);
					}
					else if(pData[playerid][pBus] == 34)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 35;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint35, buspoint35, 5.0);
					}
					else if(pData[playerid][pBus] == 35)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 36;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint36, buspoint36, 5.0);
					}
					else if(pData[playerid][pBus] == 36)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 37;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint37, buspoint37, 5.0);
					}
					else if(pData[playerid][pBus] == 37)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 38;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint38, buspoint38, 5.0);
					}
					else if(pData[playerid][pBus] == 38)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 39;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint39, buspoint39, 5.0);
					}
					else if(pData[playerid][pBus] == 39)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 40;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint40, buspoint40, 5.0);
					}
					else if(pData[playerid][pBus] == 40)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 41;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint41, buspoint41, 5.0);
					}
					else if(pData[playerid][pBus] == 41)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 42;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint42, buspoint42, 5.0);
					}
					else if(pData[playerid][pBus] == 42)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 43;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint43, buspoint43, 5.0);
					}
					else if(pData[playerid][pBus] == 43)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 44;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint44, buspoint44, 5.0);
					}
					else if(pData[playerid][pBus] == 44)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 45;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint45, buspoint45, 5.0);
					}
					else if(pData[playerid][pBus] == 45)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 46;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint46, buspoint46, 5.0);
					}
					else if(pData[playerid][pBus] == 46)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 47;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint47, buspoint47, 5.0);
					}
					else if(pData[playerid][pBus] == 47)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 48;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint48, buspoint48, 5.0);
					}
					else if(pData[playerid][pBus] == 48)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 49;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint49, buspoint49, 5.0);
					}
					else if(pData[playerid][pBus] == 49)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 50;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint50, buspoint50, 5.0);
					}
					else if(pData[playerid][pBus] == 50)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 51;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint51, buspoint51, 5.0);
					}
					else if(pData[playerid][pBus] == 51)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 52;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint52, buspoint52, 5.0);
					}
					else if(pData[playerid][pBus] == 52)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 53;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint53, buspoint53, 5.0);
					}
					else if(pData[playerid][pBus] == 53)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 54;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint54, buspoint54, 5.0);
					}
					else if(pData[playerid][pBus] == 54)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 55;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint55, buspoint55, 5.0);
					}
					else if(pData[playerid][pBus] == 55)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 56;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint56, buspoint56, 5.0);
					}
					else if(pData[playerid][pBus] == 56)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 57;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint57, buspoint57, 5.0);
					}
					else if(pData[playerid][pBus] == 57)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 58;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint58, buspoint58, 5.0);
					}
					else if(pData[playerid][pBus] == 58)
					{
						pData[playerid][pBuswaiting] = true;
						pData[playerid][pBustime] = 10;
						PlayerPlaySound(playerid, 43000, 1235.685913,-1855.510986,13.481544);
					}
					else if(pData[playerid][pBus] == 59)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 60;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint60, buspoint60, 5.0);
					}
					else if(pData[playerid][pBus] == 60)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 61;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint61, buspoint61, 5.0);
					}
					else if(pData[playerid][pBus] == 61)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 62;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint62, buspoint62, 5.0);
					}
					else if(pData[playerid][pBus] == 62)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 63;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint63, buspoint63, 5.0);
					}
					else if(pData[playerid][pBus] == 63)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 64;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint64, buspoint64, 5.0);
					}
					else if(pData[playerid][pBus] == 64)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 65;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint65, buspoint65, 5.0);
					}
					else if(pData[playerid][pBus] == 65)
					{
						pData[playerid][pBus] = 0;
						pData[playerid][pSideJob] = 0;
						pData[playerid][pCheckPoint] = CHECKPOINT_NONE;
						pData[playerid][pBusTime] = 400;
						DisablePlayerRaceCheckpoint(playerid);
					    GivePlayerMoneyEx(playerid, 750);
					    ShowItemBox(playerid, "Uang", "ADD_$750", 1212, 4);
						RemovePlayerFromVehicle(playerid);
						DestroyVehicle(BusVeh[playerid]);  //jika player udah selesai kerja maka bus akan ilang
					}
					else if(pData[playerid][pBus] == 28)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 29;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus3, cpbus3, 5.0);
					}
					else if(pData[playerid][pBus] == 29)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 30;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus4, cpbus4, 5.0);
					}
					else if(pData[playerid][pBus] == 30)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 31;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus5, cpbus5, 5.0);
					}
					else if(pData[playerid][pBus] == 31)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 32;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus6, cpbus6, 5.0);
					}
					else if(pData[playerid][pBus] == 32)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 33;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus7, cpbus7, 5.0);
					}
					else if(pData[playerid][pBus] == 33)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 34;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus8, cpbus8, 5.0);
					}
					else if(pData[playerid][pBus] == 34)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 35;
						SetPlayerRaceCheckpoint(playerid, 1, cpbus9, cpbus9, 5.0);
					}
					else if(pData[playerid][pBus] == 35)
					{
						pData[playerid][pBus] = 0;
						pData[playerid][pSideJob] = 0;
						pData[playerid][pBusTime] = 400;
						pData[playerid][pCheckPoint] = CHECKPOINT_NONE;
						DisablePlayerRaceCheckpoint(playerid);
						AddPlayerSalary(playerid, "Sidejob(Bus)", 300);
						InfoMsg(playerid, "Sidejob(Bus) telah masuk ke pending salary anda!");
						RemovePlayerFromVehicle(playerid);
   						DestroyVehicle(BusVeh[playerid]);  //jika player udah selesai kerja maka bus akan ilang
					}
				}
			}
		}
		case CHECKPOINT_MISC:
		{
			pData[playerid][pCheckPoint] = CHECKPOINT_NONE;
			DisablePlayerRaceCheckpoint(playerid);
		}
	}
	if(pData[playerid][pGpsActive] == 1)
	{
		pData[playerid][pGpsActive] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackCar] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan kendaraan anda!");
		pData[playerid][pTrackCar] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackHouse] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan rumah anda!");
		pData[playerid][pTrackHouse] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackVending] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan mesin vending anda!");
		pData[playerid][pTrackVending] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackBisnis] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan bisnis!");
		pData[playerid][pTrackBisnis] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pMission] > -1)
	{
		DisablePlayerRaceCheckpoint(playerid);
		Info(playerid, "/buy , /gps(My Mission) , /storeproduct.");
	}
	if(pData[playerid][pHauling] > -1)
	{
		if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
		{
			DisablePlayerRaceCheckpoint(playerid);
			Info(playerid, "'/storegas' untuk menyetor GasOilnya!");
		}
		else
		{
			if(IsPlayerInRangeOfPoint(playerid, 10.0, 335.66, 861.02, 21.01))
			{
				DisablePlayerRaceCheckpoint(playerid);
				SetPlayerCheckpoint(playerid, 336.70, 895.54, 20.40, 5.5);
				Info(playerid, "Silahkan ambil trailer dan menuju ke checkpoint untuk membeli GasOil!");
			}
			else
			{
				Error(playerid, "Anda tidak membawa Trailer Gasnya, Silahkan ambil kembali trailernnya!");
			}
		}
	}
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	if (PlayerInfo[playerid][pWaypoint])
	{
		PlayerInfo[playerid][pWaypoint] = 0;

		DisablePlayerCheckpoint(playerid);
		PlayerTextDrawHide(playerid, PlayerInfo[playerid][pTextdraws][69]);
	}
	new playerState = GetPlayerState(playerid);
	if(pData[playerid][pHauling] > -1)
	{
		if(IsPlayerInRangeOfPoint(playerid, 5.5, 336.70, 895.54, 20.40))
		{
			DisablePlayerCheckpoint(playerid);
			Info(playerid, "/buy, /gps(My Hauling), /storegas.");
		}
	}
	if(pData[playerid][CarryingLog] != -1)
	{
		if(GetPVarInt(playerid, "LoadingCooldown") > gettime()) return 1;
		new vehicleid = GetPVarInt(playerid, "LastVehicleID"), type[64], carid = -1;
		if(pData[playerid][CarryingLog] == 0)
		{
			type = "Metal";
		}
		else if(pData[playerid][CarryingLog] == 1)
		{
			type = "Coal";
		}
		else
		{
			type = "Unknown";
		}
		if(Vehicle_LogCount(vehicleid) >= LOG_LIMIT) return Error(playerid, "You can't load any more ores to this vehicle.");
		if((carid = Vehicle_Nearest2(playerid)) != -1)
		{
			if(pData[playerid][CarryingLog] == 0)
			{
				pvData[carid][cMetal] += 1;
			}
			else if(pData[playerid][CarryingLog] == 1)
			{
				pvData[carid][cCoal] += 1;
			}
		}
		LogStorage[vehicleid][ pData[playerid][CarryingLog] ]++;
		Info(playerid, "MINING: Loaded %s.", type);
		ApplyAnimation(playerid, "CARRY", "putdwn05", 4.1, 0, 1, 1, 0, 0, 1);
		Player_RemoveLog(playerid);
		DisablePlayerCheckpoint(playerid);
		return 1;
	}
	if(pData[playerid][pFindEms] != INVALID_PLAYER_ID)
	{
		pData[playerid][pFindEms] = INVALID_PLAYER_ID;
		DisablePlayerCheckpoint(playerid);
	}
	if(pData[playerid][pSideJob] == 2)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 431)
		{
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint1))
			{
				SetPlayerCheckpoint(playerid, buspoint2, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint2))
			{
				SetPlayerCheckpoint(playerid, buspoint3, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint3))
			{
				SetPlayerCheckpoint(playerid, buspoint4, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint4))
			{
				SetPlayerCheckpoint(playerid, buspoint5, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint5))
			{
				SetPlayerCheckpoint(playerid, buspoint6, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint6))
			{
				SetPlayerCheckpoint(playerid, buspoint7, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint7))
			{
				SetPlayerCheckpoint(playerid, buspoint8, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint8))
			{
				SetPlayerCheckpoint(playerid, buspoint9, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint9))
			{
				SetPlayerCheckpoint(playerid, buspoint10, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint10))
			{
				SetPlayerCheckpoint(playerid, buspoint11, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint11))
			{
				SetPlayerCheckpoint(playerid, buspoint12, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint12))
			{
				SetPlayerCheckpoint(playerid, buspoint13, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint13))
			{
				SetPlayerCheckpoint(playerid, buspoint14, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint14))
			{
				SetPlayerCheckpoint(playerid, buspoint15, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint15))
			{
				SetPlayerCheckpoint(playerid, buspoint16, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint16))
			{
				SetPlayerCheckpoint(playerid, buspoint17, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint17))
			{
				SetPlayerCheckpoint(playerid, buspoint18, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint18))
			{
				SetPlayerCheckpoint(playerid, buspoint19, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint19))
			{
				SetPlayerCheckpoint(playerid, buspoint20, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint20))
			{
				SetPlayerCheckpoint(playerid, buspoint21, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint21))
			{
				SetPlayerCheckpoint(playerid, buspoint22, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint22))
			{
				SetPlayerCheckpoint(playerid, buspoint23, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint23))
			{
				SetPlayerCheckpoint(playerid, buspoint24, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint24))
			{
				SetPlayerCheckpoint(playerid, buspoint25, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint25))
			{
				SetPlayerCheckpoint(playerid, buspoint26, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint26))
			{
				SetPlayerCheckpoint(playerid, buspoint27, 7.0);
			}
			if(IsPlayerInRangeOfPoint(playerid, 7.0,buspoint27))
			{
				pData[playerid][pSideJob] = 0;
				pData[playerid][pBusTime] = 280;
				DisablePlayerCheckpoint(playerid);
				AddPlayerSalary(playerid, "Sidejob(Bus)", 300);
				Info(playerid, "Sidejob(Bus) telah masuk ke pending salary anda!");
				RemovePlayerFromVehicle(playerid);
				SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			}
		}
	}
	//Borax
	if(IsPlayerInRangeOfPoint(playerid, 1.0, -367.70,-1052.94,59.30))
   	{
   		if(pData[playerid][pBorax] == 500) return Error(playerid, "Anda sudah 500 buah Borax");
   		{
   			ShowBorax1(playerid);
   			SetTimerEx("BoraxHideTD", 600, 0, "i", playerid);
	        SetPlayerCheckpoint(playerid, -353.78,-1047.93,59.35, 1.0);
            pData[playerid][pBorax] += 1;
            GameTextForPlayer(playerid, "~w~+1 Borax", 1000, 3);
	        ApplyAnimation(playerid, "CARRY", "putdwn", 4.0, 0, 0, 0, 0, 0, 1);
	   	}
    }
    if(IsPlayerInRangeOfPoint(playerid, 1.0,-353.78,-1047.93,59.35))
   	{
   		if(pData[playerid][pBorax] == 500) return Error(playerid, "Anda sudah 500 buah Borax");
   		{
   			ShowBorax1(playerid);
   			SetTimerEx("BoraxHideTD", 600, 0, "i", playerid);
	        SetPlayerCheckpoint(playerid, -357.89,-1058.77,59.26, 1.0);
            pData[playerid][pBorax] += 1;
            GameTextForPlayer(playerid, "~w~+1 Borax", 1000, 3);
	        ApplyAnimation(playerid, "CARRY", "putdwn", 4.0, 0, 0, 0, 0, 0, 1);
	    }
 	}
  	if(IsPlayerInRangeOfPoint(playerid, 1.0,-357.89,-1058.77,59.26))
	{
		if(pData[playerid][pBorax] == 500) return Error(playerid, "Anda sudah 500 buah Borax");
   		{
   			ShowBorax1(playerid);
   			SetTimerEx("BoraxHideTD", 600, 0, "i", playerid);
	        SetPlayerCheckpoint(playerid, -359.71,-1043.81,59.38, 1.0);
            pData[playerid][pBorax] += 1;
            GameTextForPlayer(playerid, "~w~+1 Borax", 1000, 3);
	        ApplyAnimation(playerid, "CARRY", "putdwn", 4.0, 0, 0, 0, 0, 0, 1);
	    }
	}
    if(IsPlayerInRangeOfPoint(playerid, 1.0,-359.71,-1043.81,59.38))
   	{
   		if(pData[playerid][pBorax] == 500) return Error(playerid, "Anda sudah 500 buah Borax");
   		{
   			ShowBorax1(playerid);
   			SetTimerEx("BoraxHideTD", 600, 0, "i", playerid);
	        SetPlayerCheckpoint(playerid, -368.66,-1044.45,59.36, 1.0);
            pData[playerid][pBorax] += 1;
            GameTextForPlayer(playerid, "~w~+1 Borax", 1000, 3);
	       	ApplyAnimation(playerid, "CARRY", "putdwn", 4.0, 0, 0, 0, 0, 0, 1);
	    }
    }
    if(IsPlayerInRangeOfPoint(playerid, 1.0,-368.66,-1044.45,59.36))
   	{
   		if(pData[playerid][pBorax] == 500) return Error(playerid, "Anda sudah 500 buah Borax");
   		{
   			ShowBorax1(playerid);
   			SetTimerEx("BoraxHideTD", 600, 0, "i", playerid);
	        SetPlayerCheckpoint(playerid, -375.07,-1048.77,59.19, 1.0);
            pData[playerid][pBorax] += 1;
            GameTextForPlayer(playerid, "~w~+1 Borax", 1000, 3);
	        ApplyAnimation(playerid, "CARRY", "putdwn", 4.0, 0, 0, 0, 0, 0, 1);
	    }
	}
    if(IsPlayerInRangeOfPoint(playerid, 1.0,-375.07,-1048.77,59.19))
   	{
   		if(pData[playerid][pBorax] == 500) return Error(playerid, "Anda sudah 500 buah Borax");
   		{
   			ShowBorax1(playerid);
   			SetTimerEx("BoraxHideTD", 600, 0, "i", playerid);
 			SetPlayerCheckpoint(playerid, -367.49,-1053.63,59.30, 1.0);
        	pData[playerid][pBorax] += 1;
        	GameTextForPlayer(playerid, "~w~+1 Borax", 1000, 3);
   			ApplyAnimation(playerid, "CARRY", "putdwn", 4.0, 0, 0, 0, 0, 0, 1);
   		}
	}
    if(IsPlayerInRangeOfPoint(playerid, 1.0,-367.49,-1053.63,59.30))
   	{
   		if(pData[playerid][pBorax] == 500) return Error(playerid, "Anda sudah 500 buah Borax");
   		{
   			ShowBorax1(playerid);
   			SetTimerEx("BoraxHideTD", 600, 0, "i", playerid);
      		ApplyAnimation(playerid, "CARRY", "putdwn", 4.0, 0, 0, 0, 0, 0, 1);
      		SetPlayerCheckpoint(playerid, -357.89,-1058.77,59.26, 1.0);
			pData[playerid][pBorax] += 1;
			GameTextForPlayer(playerid, "~w~+1 Borax", 1000, 3);
		}
    }
    //end Borax
    //Kecubung
    if (IsPlayerInRangeOfPoint(playerid, 1.0,-1004.36,-1625.78,76.36))
   	{
   		if(pData[playerid][pKecubung] == 500) return Error(playerid, "Anda sudah 500 buah Kecubung");
   		{
   			ShowKecubung1(playerid);
   			SetTimerEx("KecubungHideTD", 600, 0, "i", playerid);
	        SetPlayerCheckpoint(playerid, -1011.65,-1619.78,76.36, 1.0);
            pData[playerid][pKecubung] += 1;
            GameTextForPlayer(playerid, "~w~+1 kecubung", 1000, 3);
	        ApplyAnimation(playerid, "CARRY", "putdwn", 4.0, 0, 0, 0, 0, 0, 1);
	    }
    }
    if (IsPlayerInRangeOfPoint(playerid, 1.0,-1011.65,-1619.78,76.36))
   	{
   		if(pData[playerid][pKecubung] == 500) return Error(playerid, "Anda sudah 500 buah Kecubung");
   		{
   			ShowKecubung1(playerid);
   			SetTimerEx("KecubungHideTD", 600, 0, "i", playerid);
	        SetPlayerCheckpoint(playerid, -1000.04,-1612.26,76.36, 1.0);
            pData[playerid][pKecubung] += 1;
            GameTextForPlayer(playerid, "~w~+1 kecubung", 1000, 3);
	        ApplyAnimation(playerid, "CARRY", "putdwn", 4.0, 0, 0, 0, 0, 0, 1);
	    }
 	}
  	if (IsPlayerInRangeOfPoint(playerid, 1.0,-1000.04,-1612.26,76.36))
	{
		if(pData[playerid][pKecubung] == 500) return Error(playerid, "Anda sudah 500 buah Kecubung");
   		{
   			ShowKecubung1(playerid);
   			SetTimerEx("KecubungHideTD", 600, 0, "i", playerid);
	        SetPlayerCheckpoint(playerid, -1016.29,-1615.27,76.36, 1.0);
            pData[playerid][pKecubung] += 1;
            GameTextForPlayer(playerid, "~w~+1 kecubung", 1000, 3);
		   	ApplyAnimation(playerid, "CARRY", "putdwn", 4.0, 0, 0, 0, 0, 0, 1);
	   	}
	}
    if (IsPlayerInRangeOfPoint(playerid, 1.0,-1016.29,-1615.27,76.36))
   	{
   		if(pData[playerid][pKecubung] == 500) return Error(playerid, "Anda sudah 500 buah Kecubung");
   		{
   			ShowKecubung1(playerid);
   			SetTimerEx("KecubungHideTD", 600, 0, "i", playerid);
	        SetPlayerCheckpoint(playerid, -1003.12,-1619.72,76.36, 1.0);
            pData[playerid][pKecubung] += 1;
            GameTextForPlayer(playerid, "~w~+1 kecubung", 1000, 3);
	       	ApplyAnimation(playerid, "CARRY", "putdwn", 4.0, 0, 0, 0, 0, 0, 1);
	    }
    }
    if (IsPlayerInRangeOfPoint(playerid, 1.0,-1003.12,-1619.72,76.36))
   	{
   		if(pData[playerid][pKecubung] == 500) return Error(playerid, "Anda sudah 500 buah Kecubung");
   		{
   			ShowKecubung1(playerid);
   			SetTimerEx("KecubungHideTD", 600, 0, "i", playerid);
	        SetPlayerCheckpoint(playerid, -1016.59,-1624.34,76.36, 1.0);
            pData[playerid][pKecubung] += 1;
            GameTextForPlayer(playerid, "~w~+1 kecubung", 1000, 3);
	        ApplyAnimation(playerid, "CARRY", "putdwn", 4.0, 0, 0, 0, 0, 0, 1);
	    }
	}
    if (IsPlayerInRangeOfPoint(playerid, 1.0,-1016.59,-1624.34,76.36))
   	{
   		if(pData[playerid][pKecubung] == 500) return Error(playerid, "Anda sudah 500 buah Kecubung");
   		{
   			ShowKecubung1(playerid);
   			SetTimerEx("KecubungHideTD", 600, 0, "i", playerid);
 			SetPlayerCheckpoint(playerid, -1010.56,-1629.95,76.36, 1.0);
        	pData[playerid][pKecubung] += 1;
        	GameTextForPlayer(playerid, "~w~+1 kecubung", 1000, 3);
   			ApplyAnimation(playerid, "CARRY", "putdwn", 4.0, 0, 0, 0, 0, 0, 1);
   		}
	}
    if (IsPlayerInRangeOfPoint(playerid, 1.0,-1010.56,-1629.95,76.36))
   	{
   		if(pData[playerid][pKecubung] == 500) return Error(playerid, "Anda sudah 500 buah Kecubung");
   		{
   			ShowKecubung1(playerid);
   			SetTimerEx("KecubungHideTD", 600, 0, "i", playerid);
      		ApplyAnimation(playerid, "CARRY", "putdwn", 4.0, 0, 0, 0, 0, 0, 1);
      		SetPlayerCheckpoint(playerid, -1004.36,-1625.78,76.36, 1.0);
			pData[playerid][pKecubung] += 1;
			GameTextForPlayer(playerid, "~w~+1 kecubung", 1000, 3);
		}
    }
	//DisablePlayerCheckpoint(playerid);
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
     if(PRESSED(KEY_SECONDARY_ATTACK)) {
        if(Deep_Deer[playerid] == 1) {
            if(IsPlayerInRangeOfPoint(playerid, 3.5, 2046.7698, -799.4532, 126.7188) && Deer[playerid] == 1) {
                TogglePlayerControllable(playerid, 0);
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, 1, 0);
                Deep_Deer[playerid] = 0;
                KillTimer(Meeters_BTWDeer[playerid]);
                Shoot_Deer[playerid] = 0;
                SetTimer("Done_Deer", 3500, false);
            }else if(IsPlayerInRangeOfPoint(playerid, 3.5, 2021.1818, -494.0207, 76.1904) && Deer[playerid] == 2) {
                TogglePlayerControllable(playerid, 0);
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, 1, 0);
                Deep_Deer[playerid] = 0;
                KillTimer(Meeters_BTWDeer[playerid]);
                Shoot_Deer[playerid] = 0;
                SetTimer("Done_Deer", 3500, false);
            }else if(IsPlayerInRangeOfPoint(playerid, 3.5, 1632.5769, -599.7444, 61.8233) && Deer[playerid] == 3) {
                TogglePlayerControllable(playerid, 0);
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, 1, 0);
                Deep_Deer[playerid] = 0;
                KillTimer(Meeters_BTWDeer[playerid]);
                Shoot_Deer[playerid] = 0;
                SetTimer("Done_Deer", 3500, false); 
            }else if(IsPlayerInRangeOfPoint(playerid, 3.5, 1741.4386, -979.5817, 36.6115) && Deer[playerid] == 4) {
                TogglePlayerControllable(playerid, 0);
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, 1, 0);
                Deep_Deer[playerid] = 0;
                KillTimer(Meeters_BTWDeer[playerid]);
                Shoot_Deer[playerid] = 0;
                SetTimer("Done_Deer", 3500, false); 
            }else if(IsPlayerInRangeOfPoint(playerid, 3.5, 2553.6780, -963.4338, 81.6685) && Deer[playerid] == 5) {
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, 1, 0);
                TogglePlayerControllable(playerid, 0);
                Deep_Deer[playerid] = 0;
                KillTimer(Meeters_BTWDeer[playerid]);
                Shoot_Deer[playerid] = 0;
                SetTimer("Done_Deer", 3500, false); 
            }else if(IsPlayerInRangeOfPoint(playerid, 3.5, 2637.4963, -380.2195, 57.9261) && Deer[playerid] == 6) {
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, 1, 0);
                TogglePlayerControllable(playerid, 0);
                Deep_Deer[playerid] = 0;
                KillTimer(Meeters_BTWDeer[playerid]);
                Shoot_Deer[playerid] = 0;
                SetTimer("Done_Deer", 3500, false); 
            }else if(IsPlayerInRangeOfPoint(playerid, 3.5, 2406.9773, -403.4681, 72.1762) && Deer[playerid] == 7) {
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, 1, 0);
                TogglePlayerControllable(playerid, 0);
                Deep_Deer[playerid] = 0;
                KillTimer(Meeters_BTWDeer[playerid]);
                Shoot_Deer[playerid] = 0;
                SetTimer("Done_Deer", 3500, false); 
            }
         }
     }

    if((newkeys & KEY_JUMP) && !IsPlayerInAnyVehicle(playerid))
    {
        AntiBHOP[playerid] ++;
        if(pData[playerid][pRFoot] <= 70 || pData[playerid][pLFoot] <= 70)
        {
        	SetTimerEx("AppuiePasJump", 1700, false, "i", playerid);
        	if(AntiBHOP[playerid] == 3)
        	{
        		ApplyAnimation(playerid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 1, 0, 1);
        		new jpName[MAX_PLAYER_NAME];
        		GetPlayerName(playerid,jpName,MAX_PLAYER_NAME);
        		SetTimerEx("AppuieJump", 3000, false, "i", playerid);
        	}
        	return 1;
        }
        if(pData[playerid][pRFoot] <= 90 || pData[playerid][pLFoot] <= 90)
        {
        	SetTimerEx("AppuiePasJump", 700, false, "i", playerid);
        	if(AntiBHOP[playerid] == 3)
        	{
        		ApplyAnimation(playerid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 1, 0, 1);
        		new jpName[MAX_PLAYER_NAME];
        		GetPlayerName(playerid,jpName,MAX_PLAYER_NAME);
        		SetTimerEx("AppuieJump", 3000, false, "i", playerid);
        	}
        	return 1;
        }
        if(pData[playerid][pRFoot] <= 40 || pData[playerid][pLFoot] <= 40)
        {
        	SetTimerEx("AppuiePasJump", 3200, false, "i", playerid);
        	if(AntiBHOP[playerid] == 3)
        	{
        		ApplyAnimation(playerid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 1, 0, 1);
        		new jpName[MAX_PLAYER_NAME];
        		GetPlayerName(playerid,jpName,MAX_PLAYER_NAME);
        		SetTimerEx("AppuieJump", 3000, false, "i", playerid);
        	}
        	return 1;
        }
    }
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && (newkeys & KEY_NO))
	{
	    if(pData[playerid][CarryingLumber])
		{
			Player_DropLumber(playerid);
		}
		else if(pData[playerid][CarryingBox])
		{
			Player_DropBox(playerid);
		}
		else if(pData[playerid][CarryingLog] == 0)
		{
			Player_DropLog(playerid, pData[playerid][CarryingLog]);
			Info(playerid, "You dropping metal ore.");
			DisablePlayerCheckpoint(playerid);
		}
		else if(pData[playerid][CarryingLog] == 1)
		{
			Player_DropLog(playerid, pData[playerid][CarryingLog]);
			Info(playerid, "You dropping coal ore.");
			DisablePlayerCheckpoint(playerid);
		}
	}
	if((newkeys & KEY_SECONDARY_ATTACK))
    {
		foreach(new did : Doors)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ]))
			{
				if(dData[did][dIntposX] == 0.0 && dData[did][dIntposY] == 0.0 && dData[did][dIntposZ] == 0.0)
					return ErrorMsg(playerid, "Interior entrance masih kosong, atau tidak memiliki interior.");

				if(dData[did][dLocked])
					return ErrorMsg(playerid, "This entrance is locked at the moment.");
					
				if(dData[did][dFaction] > 0)
				{
					if(dData[did][dFaction] != pData[playerid][pFaction])
						return ErrorMsg(playerid, "This door only for faction.");
				}
				if(dData[did][dFamily] > 0)
				{
					if(dData[did][dFamily] != pData[playerid][pFamily])
						return ErrorMsg(playerid, "This door only for family.");
				}
				
				if(dData[did][dVip] > pData[playerid][pVip])
					return ErrorMsg(playerid, "Your VIP level not enough to enter this door.");
				
				if(dData[did][dAdmin] > pData[playerid][pAdmin])
					return ErrorMsg(playerid, "Your admin level not enough to enter this door.");
					
				if(strlen(dData[did][dPass]))
				{
					new params[256];
					if(sscanf(params, "s[256]", params)) return SyntaxMsg(playerid, "/enter [password]");
					if(strcmp(params, dData[did][dPass])) return Error(playerid, "Invalid door password.");
					
					if(dData[did][dCustom])
					{
						SetPlayerPositionEx(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					else
					{
						SetPlayerPosition(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid, "Tunggu Sebentar");
					pData[playerid][pInDoor] = did;
					ShowProgressbar(playerid, "Loading Rendering", 3);
					SetPlayerInterior(playerid, dData[did][dIntint]);
					SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
					SetCameraBehindPlayer(playerid);
					SetPlayerWeather(playerid, 0);
				}
				else
				{
					if(dData[did][dCustom])
					{
						SetPlayerPositionEx(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					else
					{
						SetPlayerPosition(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid, "Tunggu Sebentar");
					pData[playerid][pInDoor] = did;
					ShowProgressbar(playerid, "Loading Rendering", 3);
					SetPlayerInterior(playerid, dData[did][dIntint]);
					SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
					SetCameraBehindPlayer(playerid);
					SetPlayerWeather(playerid, 0);
				}
			}
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ]))
			{
				if(dData[did][dFaction] > 0)
				{
					if(dData[did][dFaction] != pData[playerid][pFaction])
						return Error(playerid, "This door only for faction.");
				}
				
				if(dData[did][dCustom])
				{
					SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
				}
				else
				{
					SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
				}
				pData[playerid][pInDoor] = -1;
				if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid, "Tunggu Sebentar");
				ShowProgressbar(playerid, "Loading Rendering", 3);
				SetPlayerInterior(playerid, dData[did][dExtint]);
				SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, WorldWeather);
			}
        }
		//Houses
		foreach(new hid : Houses)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, hData[hid][hExtposX], hData[hid][hExtposY], hData[hid][hExtposZ]))
			{
				if(hData[hid][hIntposX] == 0.0 && hData[hid][hIntposY] == 0.0 && hData[hid][hIntposZ] == 0.0)
					return Error(playerid, "Interior house masih kosong, atau tidak memiliki interior.");

				if(hData[hid][hLocked])
					return Error(playerid, "This house is locked!");
				
				pData[playerid][pInHouse] = hid;
				SetPlayerPositionEx(playerid, hData[hid][hIntposX], hData[hid][hIntposY], hData[hid][hIntposZ], hData[hid][hIntposA]);

				SetPlayerInterior(playerid, hData[hid][hInt]);
				SetPlayerVirtualWorld(playerid, hid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
        }
		new inhouseid = pData[playerid][pInHouse];
		if(pData[playerid][pInHouse] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, hData[inhouseid][hIntposX], hData[inhouseid][hIntposY], hData[inhouseid][hIntposZ]))
		{
			pData[playerid][pInHouse] = -1;
			SetPlayerPositionEx(playerid, hData[inhouseid][hExtposX], hData[inhouseid][hExtposY], hData[inhouseid][hExtposZ], hData[inhouseid][hExtposA]);
			
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			SetPlayerWeather(playerid, WorldWeather);
		}
		//Family
		foreach(new fid : FAMILYS)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, fData[fid][fExtposX], fData[fid][fExtposY], fData[fid][fExtposZ]))
			{
				if(fData[fid][fIntposX] == 0.0 && fData[fid][fIntposY] == 0.0 && fData[fid][fIntposZ] == 0.0)
					return Error(playerid, "Interior masih kosong, atau tidak memiliki interior.");

				if(pData[playerid][pFaction] == 0)
					if(pData[playerid][pFamily] == -1)
						return Error(playerid, "You dont have registered for this door!");
					
				pData[playerid][pInFamily] = fid;	
				SetPlayerPositionEx(playerid, fData[fid][fIntposX], fData[fid][fIntposY], fData[fid][fIntposZ], fData[fid][fIntposA]);

				SetPlayerInterior(playerid, fData[fid][fInt]);
				SetPlayerVirtualWorld(playerid, fid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
			new difamily = pData[playerid][pInFamily];
			if(pData[playerid][pInFamily] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, fData[difamily][fIntposX], fData[difamily][fIntposY], fData[difamily][fIntposZ]))
			{
				pData[playerid][pInFamily] = -1;	
				SetPlayerPositionEx(playerid, fData[difamily][fExtposX], fData[difamily][fExtposY], fData[difamily][fExtposZ], fData[difamily][fExtposA]);

				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, WorldWeather);
			}
        }
		foreach(new vid : Vendings)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, VendingData[vid][vendingX], VendingData[vid][vendingY], VendingData[vid][vendingZ]) && strcmp(VendingData[vid][vendingOwner], "-"))
			{
				SetPlayerFacingAngle(playerid, VendingData[vid][vendingA]);
				ApplyAnimation(playerid, "VENDING", "VEND_USE", 10.0, 0, 0, 0, 0, 0, 1);
				SetTimerEx("VendingNgentot", 3000, false, "i", playerid);
			}
		}
	}

	//SAPD Taser/Tazer
	if(newkeys & KEY_FIRE && TaserData[playerid][TaserEnabled] && GetPlayerWeapon(playerid) == 0 && !IsPlayerInAnyVehicle(playerid) && TaserData[playerid][TaserCharged])
	{
  		TaserData[playerid][TaserCharged] = false;

	    new Float: x, Float: y, Float: z, Float: health;
     	GetPlayerPos(playerid, x, y, z);
	    PlayerPlaySound(playerid, 6003, 0.0, 0.0, 0.0);
	    ApplyAnimation(playerid, "KNIFE", "KNIFE_3", 4.1, 0, 1, 1, 0, 0, 1);
		pData[playerid][pActivityTime] = 0;
	    TaserData[playerid][ChargeTimer] = SetTimerEx("ChargeUp", 1000, true, "i", playerid);
		PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Recharge...");
		PlayerTextDrawShow(playerid, ActiveTD[playerid]);
		ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);

	    for(new i, maxp = GetPlayerPoolSize(); i <= maxp; ++i)
		{
	        if(!IsPlayerConnected(i)) continue;
          	if(playerid == i) continue;
          	if(TaserData[i][TaserCountdown] != 0) continue;
          	if(IsPlayerInAnyVehicle(i)) continue;
			if(GetPlayerDistanceFromPoint(i, x, y, z) > 2.0) continue;
			ClearAnimations(i, 1);
			TogglePlayerControllable(i, false);
   			ApplyAnimation(i, "CRACK", "crckdeth2", 4.1, 0, 0, 0, 1, 0, 1);
			PlayerPlaySound(i, 6003, 0.0, 0.0, 0.0);

			GetPlayerHealth(i, health);
			TaserData[i][TaserCountdown] = TASER_BASETIME + floatround((100 - health) / 12);
   			Info(i, "Anda bisa memakai Taser setelah %d detik!", TaserData[i][TaserCountdown]);
			TaserData[i][GetupTimer] = SetTimerEx("TaserGetUp", 1000, true, "i", i);
			break;
	    }
	}
	if((newkeys & KEY_CTRL_BACK))
	{
	    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
		ShowPlayerDialog(playerid, DIALOG_RADIAL, DIALOG_STYLE_LIST, "Radial Menu -{BABABA} FivemCity", "{BABABA}Dokumen Pribadi\t-> Untuk melihat dokumen pribadi\n{ffffff}Phone\t-> Untuk membuka smartphone\n{BABABA}Inventory\t-> Untuk membuka tas\n{ffffff}Walkie Talkie\t-> Untuk membuka walkie talkie\n{BABABA}Faction Menu\t-> Untuk membuka menu faction\n{BABABA}Kendaraan\t-> Untuk membuka menu kendaraan\n{ffffff}Aksesoris\t-> Untuk mengatur aksesoris", "Pilih", "Tutup");
	}
	if(newkeys & KEY_WALK && IsPlayerSpawned(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER && GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_CARRY) //Key Y
    {   
        if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
		Info(playerid, "Gunakan /cursor Jika TextDraw Tidak Bisa Di Klik");
		Inventory_Show(playerid);
        return 1;
    }
	if(newkeys & KEY_HANDBRAKE && GetPlayerWeapon(playerid) == 24 && GetNearbyRobbery(playerid) >= 0)
	{
	    for(new i = 0; i < MAX_ROBBERY; i++)
		{
		    if(IsPlayerInRangeOfPoint(playerid, 2.3, RobberyData[i][robberyX], RobberyData[i][robberyY], RobberyData[i][robberyZ]))
		{
			if(Warung == true) return 1;
		    SetPVarInt(playerid, "RobberyAnim", i);
		    new aid = GetPVarInt(playerid, "RobberyAnim");
			SetTimerEx("RobWarung", 10000, false, "d", playerid);
			ApplyActorAnimation(aid, "ROB_BANK","SHP_HandsUp_Scr",4.0,0,0,0,1,0);
			Warung = true;
			new label[100];
			format(label, sizeof label, "Penjaga : Jangan sakiti aku tuan, aku akan memberikanmu uangnya");
			RobberyData[i][robberyText] = CreateDynamic3DTextLabel(label, COLOR_WHITE, RobberyData[i][robberyX], RobberyData[i][robberyY], RobberyData[i][robberyZ]+1.5, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, RobberyData[i][robberyWorld], RobberyData[i][robberyInt], -1, 10.0);
		}
	}
}
	//-----[ Vehicle ]-----	
	if((newkeys & KEY_NO ))
	{
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			return callcmd::light(playerid, "");
		}
 	}
	if((newkeys & KEY_YES))
	{
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			return callcmd::vpanel(playerid, "");
		}
 	}
	if((newkeys & KEY_YES ))
	{
		foreach(new lid : Lockers)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, lData[lid][lPosX], lData[lid][lPosY], lData[lid][lPosZ]))
			{
				if(pData[playerid][pVip] > 0 && lData[lid][lType] == 7)
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERVIP, DIALOG_STYLE_LIST, "VIP Locker", "Health\nWeapons\nClothing\nVip Toys", "Okay", "Cancel");
				}
				else if(pData[playerid][pFaction] == 1 && pData[playerid][pFaction] == lData[lid][lType])
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERSAPD, DIALOG_STYLE_LIST, "Fivem- Locker Kepolisian", "Toggle Duty\nHealth\nArmour\nWeapons\nClothing\nClothing War", "Proceed", "Cancel");
				}
				else if(pData[playerid][pFaction] == 2 && pData[playerid][pFaction] == lData[lid][lType])
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERSAGS, DIALOG_STYLE_LIST, "Fivem- Locker Pemerintah", "Toggle Duty\nHealth\nArmour\nWeapons\nClothing", "Proceed", "Cancel");
				}
				else if(pData[playerid][pFaction] == 3 && pData[playerid][pFaction] == lData[lid][lType])
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERSAMD, DIALOG_STYLE_LIST, "Fivem- Locker Medis", "Toggle Duty\nHealth\nArmour\nWeapons\nDrugs\nClothing", "Proceed", "Cancel");
				}
				else if(pData[playerid][pFaction] == 4 && pData[playerid][pFaction] == lData[lid][lType])
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERSANEW, DIALOG_STYLE_LIST, "Fivem- Locker Pembawa Berita", "Toggle Duty\nHealth\nArmour\nWeapons\nClothing", "Proceed", "Cancel");
				}
				else if(pData[playerid][pFaction] == 5 && pData[playerid][pFaction] == lData[lid][lType])
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERPEDAGANG, DIALOG_STYLE_LIST, "Fivem- Locker Pedagang", "Toggle Duty\nHealth\nArmor\nWeapons\nClothing", "Pilih", "Batal");
				}
				else if(pData[playerid][pFaction] == 6 && pData[playerid][pFaction] == lData[lid][lType])
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERGOJEK, DIALOG_STYLE_LIST, "Fivem- Locker Gojek", "Seragam Driver Gojek\nHelm Gojek", "Pilih", "Batal");
				}
				else if(pData[playerid][pFamily] > 0 && lData[lid][lType] == 7)
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKFAMS, DIALOG_STYLE_LIST, "Family Lockers", "Health\nArmor\nClothing", "Proceed", "Cancel");
				}
				else return ErrorMsg(playerid, "Anda tidak mengakses locker ini!");
			}
		}
	}
	//-----[ Bisnis ]-----
	if((newkeys & KEY_YES))
	{
	    foreach(new bid : Bisnis)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, bData[bid][bExtposX], bData[bid][bExtposY], bData[bid][bExtposZ]))
			{
				if(bData[bid][bLocked])
					return ErrorMsg(playerid, "Bisnis Ini Sedang Tutup!");

					pData[playerid][pInBiz] = bid;
					Bisnis_BuyMenu(playerid, pData[playerid][pInBiz]);
				}
			}
		}
	if((newkeys & KEY_NO))
	{
		foreach(new id : Bisnis)
		{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, bData[id][bExtposX], bData[id][bExtposY], bData[id][bExtposZ]))
		{
			if(bData[id][bPrice] > GetPlayerMoney(playerid)) return ErrorMsg(playerid, "Uang anda tidak cukup, anda tidak dapat membeli bisnis ini!.");
			if(strcmp(bData[id][bOwner], "-")) return ErrorMsg(playerid, "Someone already owns this bisnis.");
			if(pData[playerid][pVip] == 1)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 2) return ErrorMsg(playerid, "You can't buy any more bisnis.");
				#endif
			}
			else if(pData[playerid][pVip] == 2)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 3) return ErrorMsg(playerid, "You can't buy any more bisnis.");
				#endif
			}
			else if(pData[playerid][pVip] == 3)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 4) return Error(playerid, "You can't buy any more bisnis.");
				#endif
			}
			else
			{
				#if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 1) return ErrorMsg(playerid, "You can't buy any more bisnis.");
				#endif
			}
			GivePlayerMoneyEx(playerid, -bData[id][bPrice]);
			GetPlayerName(playerid, bData[id][bOwner], MAX_PLAYER_NAME);
			bData[id][bOwnerID] = pData[playerid][pID];
			bData[id][bVisit] = gettime();
			new str[522], query[500];
			format(str,sizeof(str),"[BIZ]: %s membeli bisnis id %d seharga %s!", GetRPName(playerid), id, FormatMoney(bData[id][bPrice]));
			SuccesMsg(playerid, str);
			LogServer("Property", str);
			mysql_format(g_SQL, query, sizeof(query), "UPDATE bisnis SET owner='%s', ownerid='%d', visit='%d' WHERE ID='%d'", bData[id][bOwner], bData[id][bOwnerID], bData[id][bVisit], id);
			mysql_tquery(g_SQL, query);
			Bisnis_Refresh(id);
			Bisnis_Save(id);
		}
	}
}
	if(newkeys & KEY_YES)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 5, 2507.899414,-2205.798828,13.546875))
		{
		    if(pData[playerid][pJob] == 4)
			ShowPlayerDialog(playerid, DIALOG_LOCKERMINYAK, DIALOG_STYLE_LIST, "Fivem- Locker Minyak", "Baju Kerja\nBaju Warga", "Pilih", "Batal");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, 435.119323,1264.405517,9.370626))
        {
        	callcmd::kerjaminyak1(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, 490.874359,1294.272338,9.020936))
        {
        	callcmd::kerjaminyak2(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, 223.657287,1390.214721,10.585937))
        {
        	callcmd::saringminyak(playerid, "");
        }
	}
	if(newkeys & KEY_YES)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 2, 2318.562744,-2070.840576,17.644752))//penjahit
		{
		    if(pData[playerid][pJob] == 10)
			ShowPlayerDialog(playerid, DIALOG_LOCKERPENJAHIT, DIALOG_STYLE_LIST, "Fivem- Locker Penjahit", "Baju Kerja\nBaju Warga", "Pilih", "Batal");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 2, 2319.573730,-2080.727783,17.692657))
        {
        	callcmd::buatkain(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 2321.482421,-2082.888671,17.652400))
        {
        	callcmd::buatkain(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 2317.667236,-2082.262939,17.694538))
        {
        	callcmd::buatkain(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 2319.653320,-2084.508544,17.652679))
        {
        	callcmd::buatkain(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 1925.521972,170.046707,37.281250))
        {
        	callcmd::ambilwool(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 2313.817382,-2075.185546,17.644004))
        {
        	callcmd::buatbaju(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 1302.113769,-1876.048583,13.763982))
		{
            callcmd::jualpakaian(playerid, "");
        }
	}
	if(newkeys & KEY_YES)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 2, 1690.892456,-2237.770751,13.539621))
		{
			new AtmInfo[560];
	    	format(AtmInfo,1000,"Welcome back, %s", GetName(playerid));
	    	TextDrawSetString(AtmTD[8], AtmInfo);
	    	format(AtmInfo,1000,"%s", FormatMoney(pData[playerid][pBankMoney]));
	 		TextDrawSetString(AtmTD[12], AtmInfo);
	    	format(AtmInfo,1000,"%s", FormatMoney(pData[playerid][pMoney]));
	    	TextDrawSetString(AtmTD[16], AtmInfo);
	    	for(new i = 0; i < 66; i++)
			{
				TextDrawShowForPlayer(playerid, AtmTD[i]);
			}
			SelectTextDraw(playerid, COLOR_YELLOW);
        }
		if(IsPlayerInRangeOfPoint(playerid, 2, 1550.266601,-2176.392578,13.546875))
        {
			new AtmInfo[560];
	    	format(AtmInfo,1000,"Welcome back, %s", GetName(playerid));
	    	TextDrawSetString(AtmTD[8], AtmInfo);
	    	format(AtmInfo,1000,"%s", FormatMoney(pData[playerid][pBankMoney]));
	 		TextDrawSetString(AtmTD[12], AtmInfo);
	    	format(AtmInfo,1000,"%s", FormatMoney(pData[playerid][pMoney]));
	    	TextDrawSetString(AtmTD[16], AtmInfo);
	    	for(new i = 0; i < 66; i++)
			{
				TextDrawShowForPlayer(playerid, AtmTD[i]);
			}
			SelectTextDraw(playerid, COLOR_YELLOW);
        }
        if(IsPlayerInRangeOfPoint(playerid, 2, 1125.240966,-2033.215698,69.883659))
        {
			new AtmInfo[560];
	    	format(AtmInfo,1000,"Welcome back, %s", GetName(playerid));
	    	TextDrawSetString(AtmTD[8], AtmInfo);
	    	format(AtmInfo,1000,"%s", FormatMoney(pData[playerid][pBankMoney]));
	 		TextDrawSetString(AtmTD[12], AtmInfo);
	    	format(AtmInfo,1000,"%s", FormatMoney(pData[playerid][pMoney]));
	    	TextDrawSetString(AtmTD[16], AtmInfo);
	    	for(new i = 0; i < 66; i++)
			{
				TextDrawShowForPlayer(playerid, AtmTD[i]);
			}
			SelectTextDraw(playerid, COLOR_YELLOW);
        }
	}
	if((newkeys & KEY_CTRL_BACK))
	{
		callcmd::teriak(playerid, "");
	}
	if((newkeys & KEY_YES))
	{
		if(GetNearbyTrash(playerid) >= 0)
		{
		    for(new i = 0; i < MAX_Trash; i++)
			{
			    if(IsPlayerInRangeOfPoint(playerid, 2.3, TrashData[i][TrashX], TrashData[i][TrashY], TrashData[i][TrashZ]))
			{
			if(TrashData[i][Sampah] > 99) return ErrorMsg(playerid, "Sampah penuh!!");
			if(pData[playerid][sampahsaya] < 1) return 1;
			new total = Inventory_Count(playerid, "Sampah");
			ShowProgressbar(playerid, "Membuang Sampah..", total);
			pData[playerid][sampahsaya] -= total;
			ShowItemBox(playerid, "Sampah", "REMOVED_1x", 2840, total);
		    Inventory_Update(playerid);
		    TrashData[i][Sampah] += total;
			new query[128], str[512];
			mysql_format(g_SQL, query, sizeof(query), "UPDATE trash SET sampah='%d' WHERE ID='%d'", TrashData[i][Sampah], i);
			mysql_tquery(g_SQL, query);
			Trash_Save(i);
			if(IsValidDynamic3DTextLabel(TrashData[i][TrashLabel]))
            DestroyDynamic3DTextLabel(TrashData[i][TrashLabel]);
            format(str, sizeof(str), "Trash Capacity {FFFF00}%d/100\n{ffffff}Tekan {00FF00}[ Y ] {ffffff}Untuk Membuang Sampah\nGunakan /bin untuk memungut sampah", TrashData[i][Sampah]);
            TrashData[i][TrashLabel] = CreateDynamic3DTextLabel(str, ARWIN, TrashData[i][TrashX], TrashData[i][TrashY], TrashData[i][TrashZ]+1.0, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, TrashData[i][TrashWorld], TrashData[i][TrashInt], -1, 10.0);
			}
		}
	}
}
	if((newkeys & KEY_YES))
	{
	    if(IsPlayerInRangeOfPoint(playerid, 3.0, 2772.847900,-2398.968750,13.632812))
		{
			new str[1024];
			format(str, sizeof(str), "Jenis Sepeda & Series\tHarga Rental\n"WHITE_E"TDR-3000\t"LG_E"$75\n{ffffff}Sepeda Gunung Aviator 2690 XT Steel\t"LG_E"$150\n{FFB6C1}> Pilih ini untuk mengembalikan kendaraan yang disewa dari negara");			
			ShowPlayerDialog(playerid, DIALOG_RENT_BIKE, DIALOG_STYLE_TABLIST_HEADERS, "Fivem- Rental Sepeda", str, "Rent", "Close");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, 1688.049560,-2259.662353,13.530823))
        {
        	new str[1024];
			format(str, sizeof(str), "Jenis Sepeda & Series\tHarga Rental\n"WHITE_E"TDR-3000\t"LG_E"$75\n{ffffff}Sepeda Gunung Aviator 2690 XT Steel\t"LG_E"$150\n{FFB6C1}> Pilih ini untuk mengembalikan kendaraan yang disewa dari negara");
			ShowPlayerDialog(playerid, DIALOG_RENT_BIKE, DIALOG_STYLE_TABLIST_HEADERS, "Fivem- Rental Sepeda", str, "Rent", "Close");
		}
	}
	if(newkeys & KEY_YES)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 2, 874.795104,-13.976298,63.195312))//Olah kanabis
		{
  			callcmd::olahkanabis(playerid, "");
		}
		if(IsPlayerInRangeOfPoint(playerid, 2, 1776.616943,-163.841506,76.604492))//ambilkanabis
        {
        	callcmd::ambilkanabis(playerid, "");
        }
        if(IsPlayerInRangeOfPoint(playerid, 2, 1754.928588,-187.140090,80.490097))//ambilkanabis
        {
        	callcmd::ambilkanabis(playerid, "");
        }
	}
	if((newkeys & KEY_YES))
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.0, 1412.915771,-33.065151,500.923828))
		{
		    if(pData[playerid][pIDCard] == 0) return ErrorMsg(playerid, "Anda tidak memiliki ID Card!");
			PlayerPlaySound(playerid, 5202, 0,0,0);
			new string[1000];
		    format(string, sizeof(string), "Pekerjaan\t\tSedang Bekerja\n{ffffff}Supir Bus\t\t{FFFF00}%d Orang\n{ffffff}Tukang Ayam\t\t{FFFF00}%d Orang\n{ffffff}Penebang Kayu\t\t{FFFF00}%d Orang\n{ffffff}Farmer\t\t{FFFF00}%d Orang\n{ffffff}Penambang Minyak\t\t{FFFF00}%d Orang\n{ffffff}Pemerah Susu\t\t{FFFF00}%d Orang\n{ffffff}Penambang\t\t{FFFF00}%d Orang\n{ffffff}Trucker\t\t{FFFF00}%d Orang\n{ffffff}Sparepart\t\t{FFFF00}%d Orang\n{ffffff}Penjahit\t\t{FFFF00}%d Orang\n"RED_E"Keluar dari pekerjaan",
			Sopirbus,
			tukangayam,
			tukangtebang,
			tukangfarmer,
			penambangminyak,
		 	pemerah,
		 	penambang,
		 	Trucker,
			kerjasparepart,
			penjahit
		    );
	    	ShowPlayerDialog(playerid, DIALOG_DISNAKER, DIALOG_STYLE_TABLIST_HEADERS, "Dinas Tenaga Kerja Fivem", string, "Pilih", "Batal");
		}
	}
	//-----[ Toll System ]-----	
	if(newkeys & KEY_CROUCH)
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_SPECTATING)
		{
			new forcount = MuchNumber(sizeof(BarrierInfo));
			for(new i;i < forcount;i ++)
			{
				if(i < sizeof(BarrierInfo))
				{
					if(IsPlayerInRangeOfPoint(playerid,8,BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]))
					{
						if(BarrierInfo[i][brOrg] == TEAM_NONE)
						{
							if(!BarrierInfo[i][brOpen])
							{
								if(pData[playerid][pMoney] < 5)
								{
									Toll(playerid, "Uangmu tidak cukup untuk membayar toll");
								}
								else
								{
									MoveDynamicObject(gBarrier[i],BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]+0.7,BARRIER_SPEED,0.0,0.0,BarrierInfo[i][brPos_A]+180);
									SetTimerEx("BarrierClose",15000,0,"i",i);
									BarrierInfo[i][brOpen] = true;
									Toll(playerid, "Cepat!!! Toll akan menutup Kembali setelah 15 detik");
									GivePlayerMoneyEx(playerid, -5);
									if(BarrierInfo[i][brForBarrierID] != -1)
									{
										new barrierid = BarrierInfo[i][brForBarrierID];
										MoveDynamicObject(gBarrier[barrierid],BarrierInfo[barrierid][brPos_X],BarrierInfo[barrierid][brPos_Y],BarrierInfo[barrierid][brPos_Z]+0.7,BARRIER_SPEED,0.0,0.0,BarrierInfo[barrierid][brPos_A]+180);
										BarrierInfo[barrierid][brOpen] = true;

									}
								}
							}
						}
						else Toll(playerid, "Anda tidak bisa membuka pintu Toll ini!");
						break;
					}
				}
			}
		}
		return true;		
	}
	if(GetPVarInt(playerid, "UsingSprunk"))
	{
		if(pData[playerid][pEnergy] >= 100 )
		{
  			Info(playerid, " Anda terlalu banyak minum.");
	   	}
	   	else
	   	{
		    pData[playerid][pEnergy] += 5;
		}
	}
	if(PRESSED( KEY_YES))
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && IsPlayerInAnyVehicle(playerid))
		{
			foreach(new did : Doors)
			{
				if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ]))
				{
					if(dData[did][dGarage] == 1)
					{
						if(dData[did][dIntposX] == 0.0 && dData[did][dIntposY] == 0.0 && dData[did][dIntposZ] == 0.0)
							return Error(playerid, "Interior entrance masih kosong, atau tidak memiliki interior.");

						if(dData[did][dLocked])
							return Error(playerid, "This entrance is locked at the moment.");
							
						if(dData[did][dFaction] > 0)
						{
							if(dData[did][dFaction] != pData[playerid][pFaction])
								return Error(playerid, "This door only for faction.");
						}
						if(dData[did][dFamily] > 0)
						{
							if(dData[did][dFamily] != pData[playerid][pFamily])
								return Error(playerid, "This door only for family.");
						}
						
						if(dData[did][dVip] > pData[playerid][pVip])
							return Error(playerid, "Your VIP level not enough to enter this door.");
						
						if(dData[did][dAdmin] > pData[playerid][pAdmin])
							return Error(playerid, "Your admin level not enough to enter this door.");
							
						if(strlen(dData[did][dPass]))
						{
							new params[256];
							if(sscanf(params, "s[256]", params)) return SyntaxMsg(playerid, "/enter [password]");
							if(strcmp(params, dData[did][dPass])) return Error(playerid, "Invalid door password.");
							
							if(dData[did][dCustom])
							{
								SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
							}
							else
							{
								SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
							}
							pData[playerid][pInDoor] = did;
							SetPlayerInterior(playerid, dData[did][dIntint]);
							SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
							SetCameraBehindPlayer(playerid);
							SetPlayerWeather(playerid, 0);
						}
						else
						{
							if(dData[did][dCustom])
							{
								SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
							}
							else
							{
								SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
							}
							pData[playerid][pInDoor] = did;
							SetPlayerInterior(playerid, dData[did][dIntint]);
							SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
							SetCameraBehindPlayer(playerid);
							SetPlayerWeather(playerid, 0);
						}
					}
				}
				if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ]))
				{
					if(dData[did][dGarage] == 1)
					{
						if(dData[did][dFaction] > 0)
						{
							if(dData[did][dFaction] != pData[playerid][pFaction])
								return Error(playerid, "This door only for faction.");
						}
					
						if(dData[did][dCustom])
						{
							SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
						}
						else
						{
							SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
						}
						pData[playerid][pInDoor] = -1;
						SetPlayerInterior(playerid, dData[did][dExtint]);
						SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
						SetCameraBehindPlayer(playerid);
						SetPlayerWeather(playerid, WorldWeather);
					}
				}
			}
		}
	}
	// if(IsKeyJustDown(KEY_CTRL_BACK,newkeys,oldkeys))
	if(IsKeyJustDown(KEY_SECONDARY_ATTACK, newkeys, oldkeys))
	{
		if(GetPVarInt(playerid, "UsingSprunk"))
		{
			DeletePVar(playerid, "UsingSprunk");
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		}
	}
	if(takingselfie[playerid] == 1)
	{
		if(PRESSED(KEY_ANALOG_RIGHT))
		{
			GetPlayerPos(playerid,lX[playerid],lY[playerid],lZ[playerid]);
			static Float: n1X, Float: n1Y;
		    if(Degree[playerid] >= 360) Degree[playerid] = 0;
		    Degree[playerid] += Speed;
		    n1X = lX[playerid] + Radius * floatcos(Degree[playerid], degrees);
		    n1Y = lY[playerid] + Radius * floatsin(Degree[playerid], degrees);
		    SetPlayerCameraPos(playerid, n1X, n1Y, lZ[playerid] + Height);
		    SetPlayerCameraLookAt(playerid, lX[playerid], lY[playerid], lZ[playerid]+1);
		    SetPlayerFacingAngle(playerid, Degree[playerid] - 90.0);
		}
		if(PRESSED(KEY_ANALOG_LEFT))
		{
		    GetPlayerPos(playerid,lX[playerid],lY[playerid],lZ[playerid]);
			static Float: n1X, Float: n1Y;
		    if(Degree[playerid] >= 360) Degree[playerid] = 0;
		    Degree[playerid] -= Speed;
		    n1X = lX[playerid] + Radius * floatcos(Degree[playerid], degrees);
		    n1Y = lY[playerid] + Radius * floatsin(Degree[playerid], degrees);
		    SetPlayerCameraPos(playerid, n1X, n1Y, lZ[playerid] + Height);
		    SetPlayerCameraLookAt(playerid, lX[playerid], lY[playerid], lZ[playerid]+1);
		    SetPlayerFacingAngle(playerid, Degree[playerid] - 90.0);
		}
	}

    if(PRESSED( KEY_WALK ) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
    	foreach(new pid : Pedagang)
		{
    		if(IsPlayerInRangeOfPoint(playerid, 4.0, pdgDATA[pid][pdgPosX], pdgDATA[pid][pdgPosY], pdgDATA[pid][pdgPosZ]))
			{
				if(pData[playerid][pFaction] != 5)
    				return Error(playerid, "You must be part of a Pedagang faction.");
				ShowPedagangMenu(playerid, pid);
			}
		}
    }
    if(PRESSED( KEY_WALK ))
    {
    		if(IsPlayerInRangeOfPoint(playerid, 2.0, 2506.981933,-2637.118896,13.646511))
			{
			    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
				PlayerPlaySound(playerid, 5202, 0,0,0);
				new string[1000];
			    format(string, sizeof(string), "Barang\t\tHarga\nAyam Fillet\t\t"LG_E"$50/{ffffff}1 Paket\nSusu Olahan\t\t"LG_E"$30/{ffffff}1 Botol\nEssence\t\t"LG_E"$75/{ffffff}1 Kotak\nBulu Ayam\t\t"LG_E"$2/{ffffff}1 bulu\n");
		    	ShowPlayerDialog(playerid, DIALOG_HOLIMARKET, DIALOG_STYLE_TABLIST_HEADERS, "FivemMarket - Penjualan", string, "Jual", "Batal");
			}
    	}
    if(PRESSED(KEY_YES) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
		if(IsPlayerInRangeOfPoint(playerid, 5, -1433.7598,-964.9735,200.9849))
        {
        	return callcmd::olahborax(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 5, 1550.1710,-33.4645,21.3340))
        {
        	return callcmd::olahkecubung(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 5, -1425.7248,-1529.2584,102.2175))
        {
        	return callcmd::jualborax(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 5, 2847.6291,983.4310,10.7500))
        {
        	return callcmd::jualkecubung(playerid, "");
        }
        if(IsPlayerInRangeOfPoint(playerid, 5, -2107.4541,-2400.1042,31.4123))
        {
        	return callcmd::ambilayam(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 5, -2110.355712,-2408.482910,31.308656))
        {
        	return callcmd::potongayam(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 5, -2117.5095,-2414.5049,31.2266))
        {
        	return callcmd::packingayam(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 5, 2395.137695,-1495.538696,23.834865))
        {
        	return callcmd::jualayam(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 5, 1186.41, -891.32, 43.30))
        {
        	return callcmd::menumasak(playerid, "");
        }
    }
    if((newkeys & KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid, 3, 1244.857910,-2020.113891,59.894012))
		{
            if(pData[playerid][pJob] != 1) return 1;
		    if(pData[playerid][pBusTime] > 0)
		    	return	ErrorMsg(playerid, "Anda harus menunggu.");
		    	
	    	BusVeh[playerid] = CreateVehicle(431, 1244.857910, -2020.113891, 59.894012, 180.118698, 0, 126, 120000, 1);
			//busobject
			new busobject;
		    busobject = CreateDynamicObject(7313,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
		    SetObjectMaterialText(busobject, "{ff0000}FivemTransit", 0, 70, "Quartz MS", 15, 0, 0x00FFFF00, 0x00010101, 1);
		    AttachDynamicObjectToVehicle(busobject, BusVeh[playerid], 1.259, 2.109, 0.000, 0.000, 0.000, 449.929);
		    busobject = CreateDynamicObject(7313,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
		    SetObjectMaterialText(busobject, "{ff0000}FivemTransit", 0, 70, "Quartz MS", 15, 0, 0x00FFFF00, 0x00010101, 1);
    		AttachDynamicObjectToVehicle(busobject, BusVeh[playerid], -1.280, 2.099, 0.000, 0.000, 0.000, 270.000);
			PutPlayerInVehicle(playerid, BusVeh[playerid], 0);
			pData[playerid][pBusTime] = 360;
		}
	}
	if((newkeys & KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid, 3, 2368.814208,-2253.272216,13.541325))
		{
            if(pData[playerid][pDutyJob] != 2) return 1;
	    	MobilKerja[playerid] = CreateVehicle(543, 2372.156005, -2251.534667, 13.541325, 228.014785, 1, 1, 120000, 1);

			PutPlayerInVehicle(playerid, MobilKerja[playerid], 0);
		}
	}
	
	if((newkeys & KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid, 3, 2183.178466,-2668.562744,17.882808))
		{
		    if(pData[playerid][pJob] == 2)
			ShowPlayerDialog(playerid, DIALOG_LOCKERAYAM, DIALOG_STYLE_LIST, "{FFB6C1}Fivem{ffffff}- Locker Ayam", "Baju Kerja\nBaju Warga", "Select", "Back");
		}
	}

	if(newkeys & KEY_WALK)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 3, 2379.717285,-2265.723632,13.546875))
		{
		    if(pData[playerid][pJob] == 6)
			ShowPlayerDialog(playerid, DIALOG_LOCKERPENAMBANG, DIALOG_STYLE_LIST, "{FFB6C1}Fivem{ffffff}- Locker Penambang", "Baju Kerja\nBaju Warga", "Select", "Back");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, 671.845703,842.036743,-42.960937))
        {
        	callcmd::nambangdentot1(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, -795.673522,-1928.231567,5.612922))
        {
        	callcmd::cucibatudentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, 2152.539062,-2263.646972,13.300081))
        {
        	callcmd::peleburanbatudentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, 2550.082519,-2403.520996,13.633594))
        {
        	callcmd::jualemasdentot(playerid, "");
        }
	}
	if((newkeys & KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid, 3, 300.121429,1141.311645,9.137485))
		{
		    if(pData[playerid][pJob] == 5)
			ShowPlayerDialog(playerid, DIALOG_LOCKERPEMERAH, DIALOG_STYLE_LIST, "{FFB6C1}Fivem{ffffff}- Locker Pemerah", "Baju Kerja\nBaju Warga", "Select", "Back");
		}
	}

	if(PRESSED( KEY_CTRL_BACK ))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1 || pData[playerid][pCuffed] == 1) return Error(playerid, "You can't do at this moment.");
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && pData[playerid][pCuffed] == 0)
		{
			if(pData[playerid][pLoopAnim])
	    	{	
	        	pData[playerid][pLoopAnim] = 0;

				ClearAnimations(playerid);
				StopLoopingAnim(playerid);
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
				TogglePlayerControllable(playerid, 1);
		    	TextDrawHideForPlayer(playerid, AnimationTD);
			}
		}
    }
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_WASTED && pData[playerid][pJail] < 1)
    {	
		if(pData[playerid][pInjured] == 0)
        {
            pData[playerid][pInjured] = 1;
            SetPlayerHealthEx(playerid, 99999);

            pData[playerid][pInt] = GetPlayerInterior(playerid);
            pData[playerid][pWorld] = GetPlayerVirtualWorld(playerid);

            GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
            GetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
        }
        else
        {
            pData[playerid][pHospital] = 1;
        }
	}
	//Spec Player
	new vehicleid = GetPlayerVehicleID(playerid);
	if(newstate == PLAYER_STATE_ONFOOT)
	{
		if(pData[playerid][playerSpectated] != 0)
		{
			foreach(new ii : Player)
			{
				if(pData[ii][pSpec] == playerid)
				{
					PlayerSpectatePlayer(ii, playerid);
					Servers(ii, ,"%s(%i) is now on foot.", pData[playerid][pName], playerid);
				}
			}
		}
	}
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
    {
		if(pData[playerid][pInjured] == 1)
        {
            //RemoveFromVehicle(playerid);
			RemovePlayerFromVehicle(playerid);
            SetPlayerHealthEx(playerid, 99999);
        }
		foreach (new ii : Player) if(pData[ii][pSpec] == playerid) 
		{
            PlayerSpectateVehicle(ii, GetPlayerVehicleID(playerid));
        }
	}
	if(oldstate == PLAYER_STATE_PASSENGER)
	{
		//TextDrawHideForPlayer(playerid, TDEditor_TD[11]);
		TextDrawHideForPlayer(playerid, DPvehfare[playerid]);
	}
	if(oldstate == PLAYER_STATE_DRIVER)
    {	
		if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CARRY || GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CUFFED)
            return RemovePlayerFromVehicle(playerid);/*RemoveFromVehicle(playerid);*/
		
		for(new i = 0; i < 7; i++)
		{
		    PlayerTextDrawHide(playerid, VEHFIVEM[playerid][i]);
		}
			
		if(pData[playerid][pIsStealing] == 1)
		{
			pData[playerid][pIsStealing] = 0;
			pData[playerid][pLastChopTime] = 0;
			Info(playerid, "Anda gagal mencuri kendaraan ini, di karenakan Anda keluar kendaraan saat proses pencurian!");
			KillTimer(MalingKendaraan);

		}
        
		HidePlayerProgressBar(playerid, pData[playerid][spfuelbar]);
        HidePlayerProgressBar(playerid, pData[playerid][spdamagebar]);
	}
	else if(newstate == PLAYER_STATE_DRIVER)
    {
		foreach(new pv : PVehicles)
		{
			if(vehicleid == pvData[pv][cVeh])
			{
				if(IsABike(vehicleid) || GetVehicleModel(vehicleid) == 424)
				{
					if(pvData[pv][cLocked] == 1)
					{
						RemovePlayerFromVehicle(playerid);
						//new Float:slx, Float:sly, Float:slz;
						//GetPlayerPos(playerid, slx, sly, slz);
						//SetPlayerPos(playerid, slx, sly, slz);
						Error(playerid, "This bike is locked by owner.");
						return 1;
					}
				}
			}
		}
		if(IsABusVeh(vehicleid))
		{
			pData[playerid][pSideJob] = 2;
			pData[playerid][pBus] = 1;
			DisablePlayerRaceCheckpoint(playerid);
			SetPlayerRaceCheckpoint(playerid, 2, buspoint1, buspoint1, 4.0);
			pData[playerid][pCheckPoint] = CHECKPOINT_BUS;
			InfoTD_MSG(playerid, 3000, "Ikuti Checkpoint!");
		}
		if(IsSAPDCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 1)
			{
			    RemovePlayerFromVehicle(playerid);
			    ErrorMsg(playerid, "Anda bukan SAPD!");
			}
		}
		if(IsGovCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 2)
			{
			    RemovePlayerFromVehicle(playerid);
			    ErrorMsg(playerid, "Anda bukan SAGS!");
			}
		}
		if(IsSAMDCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 3)
			{
			    RemovePlayerFromVehicle(playerid);
			    ErrorMsg(playerid, "Anda bukan SAMD!");
			}
		}
		if(IsSANACar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 4)
			{
			    RemovePlayerFromVehicle(playerid);
			    ErrorMsg(playerid, "Anda bukan SANEWS!");
			}
		}
		if(!IsEngineVehicle(vehicleid))
        {
            SwitchVehicleEngine(vehicleid, true);
        }
		if(IsEngineVehicle(vehicleid) && pData[playerid][pDriveLic] <= 0)
        {
            WarningMsg(playerid, "Anda tidak memiliki surat izin mengemudi, berhati-hatilah.");
        }
		if(pData[playerid][pHBEMode] == 1)
		{
			for(new i = 0; i < 7; i++)
			{
			    PlayerTextDrawShow(playerid, VEHFIVEM[playerid][i]);
			}
		}
		else
		{
		
		}
		new Float:health;
        GetVehicleHealth(GetPlayerVehicleID(playerid), health);
        VehicleHealthSecurityData[GetPlayerVehicleID(playerid)] = health;
        VehicleHealthSecurity[GetPlayerVehicleID(playerid)] = true;
		
		if(pData[playerid][playerSpectated] != 0)
  		{
			foreach(new ii : Player)
			{
    			if(pData[ii][pSpec] == playerid)
			    {
        			PlayerSpectateVehicle(ii, vehicleid);
				    Servers(ii, "%s(%i) is now driving a %s(%d).", pData[playerid][pName], playerid, GetVehicleModelName(GetVehicleModel(vehicleid)), vehicleid);
				}
			}
		}
		SetPVarInt(playerid, "LastVehicleID", vehicleid);
	}
	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	if(explosive{playerid})
	{
	    CreateExplosion(fX, fY, fZ, 12, 5.0);
	}
	//////////////////////////////////////////
    if(Deer[playerid] == 1) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 2046.76978, -799.45319, 127.07957) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
 
                    if(Meeter_Kill[playerid] >= 20) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 2046.7698, -799.4532, 126.7188, 3.5, -90.0000, 0.0000, 0.0000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}Go and peel the skin off it by pressing F. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        }
    }else if(Deer[playerid] == 2) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 2021.1818, -494.0207, 76.1904) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
 
                    if(Meeter_Kill[playerid] >= 20) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 2021.18176, -494.02069, 76.19040, 3.5, -90.0000, 0.0000, 0.0000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}m. Du-te si jupoaiei pielea de pe ea apasat CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        }
    }else if(Deer[playerid] == 3) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 1632.5769, -599.7444, 62.0889) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
 
                    if(Meeter_Kill[playerid] >= 20) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 1632.57690, -599.74438, 61.82332, 3.5, 90.00000, 0.00000, -54.66002);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}Go and peel the skin off it by pressing CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
 
                }
            }
        }
    }else if(Deer[playerid] == 4) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 1741.4386, -979.5817, 36.9209) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
 
                    if(Meeter_Kill[playerid] >= 20) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 1741.43860, -979.58173, 36.61147, 3.5, 90.00000, 0.00000, -7.38000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}Go and peel the skin off it by pressing CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        } 
    }else if(Deer[playerid] == 5) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 2553.6780, -963.4338, 82.0169) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
 
                    if(Meeter_Kill[playerid] >= 20) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 2553.67798, -963.43378, 81.66848, 3.5, 90.00000, 0.00000, 0.00000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}Go and peel the skin off it by pressing CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        } 
    }else if(Deer[playerid] == 6) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 2637.4963, -380.2195, 58.2060) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
 
                    if(Meeter_Kill[playerid] >= 20) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 2637.49634, -380.21951, 57.92605, 3.5, 90.00000, 0.00000, -49.26000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}Go and peel the skin off it by pressing CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        }
    }else if(Deer[playerid] == 7) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 2406.9773, -403.4681, 72.4926) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
 
                    if(Meeter_Kill[playerid] >= 20) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid],  2406.97729, -403.46811, 72.17617, 3.5, 90.00000, 0.00000, 0.00000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}Go and peel the skin off it by pressing CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        }
    }

	switch(weaponid){ case 0..18, 39..54: return 1;} //invalid weapons
	if(1 <= weaponid <= 46 && pData[playerid][pGuns][g_aWeaponSlots[weaponid]] == weaponid)
	{
		pData[playerid][pAmmo][g_aWeaponSlots[weaponid]]--;
		if(pData[playerid][pGuns][g_aWeaponSlots[weaponid]] != 0 && !pData[playerid][pAmmo][g_aWeaponSlots[weaponid]])
		{
			pData[playerid][pGuns][g_aWeaponSlots[weaponid]] = 0;
		}
	}
	return 1;
}

stock GivePlayerHealth(playerid,Float:Health)
{
	new Float:health; GetPlayerHealth(playerid,health);
	SetPlayerHealth(playerid,health+Health);
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
   	new Float: p_HP;
    GetPlayerHealth(playerid, p_HP);
	if(!pData[playerid][pSeatbelt])
	{
		SetPlayerHealth(playerid, p_HP-3);
		PlayerPlaySoundEx(playerid, 1130);
		SetTimerEx("HidePlayerBox", 500, false, "dd", playerid, _:ShowPlayerBox(playerid, 0xFF000066));
	}

	new
        Float: vehicleHealth,
        playerVehicleId = GetPlayerVehicleID(playerid);

    new Float: health;
	health = GetPlayerHealth(playerid, health);
    GetVehicleHealth(playerVehicleId, vehicleHealth);
    if(pData[playerid][pSeatbelt] == 0 || pData[playerid][pHelmetOn] == 0)
    {
    	if(GetVehicleSpeed(vehicleid) <= 20)
    	{
    		new asakit = RandomEx(0, 1);
    		new bsakit = RandomEx(0, 1);
    		new csakit = RandomEx(0, 1);
    		pData[playerid][pLFoot] -= csakit;
    		pData[playerid][pLHand] -= bsakit;
    		pData[playerid][pRFoot] -= csakit;
    		pData[playerid][pRHand] -= bsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -1);
    		return 1;
    	}
    	if(GetVehicleSpeed(vehicleid) <= 50)
    	{
    		new asakit = RandomEx(0, 2);
    		new bsakit = RandomEx(0, 2);
    		new csakit = RandomEx(0, 2);
    		new dsakit = RandomEx(0, 2);
    		pData[playerid][pLFoot] -= dsakit;
    		pData[playerid][pLHand] -= bsakit;
    		pData[playerid][pRFoot] -= csakit;
    		pData[playerid][pRHand] -= dsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -2);
    		return 1;
    	}
    	if(GetVehicleSpeed(vehicleid) <= 100)
    	{
    		new asakit = RandomEx(0, 3);
    		new bsakit = RandomEx(0, 3);
    		new csakit = RandomEx(0, 3);
    		new dsakit = RandomEx(0, 3);
    		pData[playerid][pLFoot] -= csakit;
    		pData[playerid][pLHand] -= csakit;
    		pData[playerid][pRFoot] -= dsakit;
    		pData[playerid][pRHand] -= bsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -5);
    		RemovePlayerFromVehicle(playerid);
    		return 1;
    	}
    	return 1;
    }
    if(pData[playerid][pSeatbelt] == 1 || pData[playerid][pHelmetOn] == 1)
    {
    	if(GetVehicleSpeed(vehicleid) <= 20)
    	{
    		new asakit = RandomEx(0, 1);
    		new bsakit = RandomEx(0, 1);
    		new csakit = RandomEx(0, 1);
    		pData[playerid][pLFoot] -= csakit;
    		pData[playerid][pLHand] -= bsakit;
    		pData[playerid][pRFoot] -= csakit;
    		pData[playerid][pRHand] -= bsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -1);
    		return 1;
    	}
    	if(GetVehicleSpeed(vehicleid) <= 50)
    	{
    		new asakit = RandomEx(0, 1);
    		new bsakit = RandomEx(0, 1);
    		new csakit = RandomEx(0, 1);
    		new dsakit = RandomEx(0, 1);
    		pData[playerid][pLFoot] -= dsakit;
    		pData[playerid][pLHand] -= bsakit;
    		pData[playerid][pRFoot] -= csakit;
    		pData[playerid][pRHand] -= dsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -1);
    		return 1;
    	}
    	if(GetVehicleSpeed(vehicleid) <= 90)
    	{
    		new asakit = RandomEx(0, 1);
    		new bsakit = RandomEx(0, 1);
    		new csakit = RandomEx(0, 1);
    		new dsakit = RandomEx(0, 1);
    		pData[playerid][pLFoot] -= csakit;
    		pData[playerid][pLHand] -= csakit;
    		pData[playerid][pRFoot] -= dsakit;
    		pData[playerid][pRHand] -= bsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -3);
    		return 1;
    	}
    }
    return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	new str[60];
	new Float:hp;
	GetPlayerHealth(playerid, hp);
	if(IsPlayerNPC(issuerid) || !IsPlayerInAnyVehicle(issuerid)) return 0;
	if(weaponid > 21 && weaponid < 34 || weaponid == 38)
	{
	    SetPlayerHealth(playerid, hp);
		TogglePlayerControllable(issuerid, 0);
		warnings{issuerid} ++;
		if(warnings{issuerid} < MAX_WARININGS)
		{
		    format(str, sizeof(str), "{FFFFFF}Jangan lakukan drive-by {FF0000}%d{FFFFFF}/{FF0000}%d", warnings{issuerid}, MAX_WARININGS);
		    ShowPlayerDialog(issuerid, 12221, DIALOG_STYLE_MSGBOX, "{FF0000}Drive-By", str, "Ok", "");
		    TogglePlayerControllable(issuerid, 1);
		}
		if(warnings{issuerid} >= MAX_WARININGS)
		{
		    ShowPlayerDialog(issuerid, 12221, DIALOG_STYLE_MSGBOX, "{FF0000}Drive-By", "{FF0000}Anda telah di tendang karna drive-by", "Ok", "");
		    KickEx(issuerid);
		}
	}

	if(IsAtEvent[playerid] == 0)
	{
		new sakit = RandomEx(1, 4);
		new asakit = RandomEx(1, 5);
		new bsakit = RandomEx(1, 7);
		new csakit = RandomEx(1, 4);
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 9)
		{
			pData[playerid][pHead] -= 20;
		}
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 3)
		{
			pData[playerid][pPerut] -= sakit;
		}
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 6)
		{
			pData[playerid][pRHand] -= bsakit;
		}
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 5)
		{
			pData[playerid][pLHand] -= asakit;
		}
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 8)
		{
			pData[playerid][pRFoot] -= csakit;
		}
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 7)
		{
			pData[playerid][pLFoot] -= bsakit;
		}
	}
	else if(IsAtEvent[playerid] == 1)
	{
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 9)
		{
			GivePlayerHealth(playerid, -90);
			SendClientMessage(issuerid, -1,"{7fffd4}[ TDM ]{ffffff} Headshot!");
		}
	}
    return 1;
}

public OnPlayerUpdate(playerid)
{
	if(vpara[playerid] == 1) 
    { 
        if(IsPlayerInAnyVehicle(playerid)) 
        { 
            if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) 
            { 
                static vid, Float:x, Float:y, Float:z; 
               	vid = GetPlayerVehicleID(playerid); 
                GetVehicleVelocity(vid,x,y,z); 
                SetVehicleVelocity(vid,x,y,-0.2); 
            } 
        } 
    } 
	static str[500];
	if (PlayerInfo[playerid][pWaypoint])
	{
		format(str, sizeof(str), "~b~GPS:~w~ %s (%.2f meters)", PlayerInfo[playerid][pLocation], GetPlayerDistanceFromPoint(playerid, PlayerInfo[playerid][pWaypointPos][0], PlayerInfo[playerid][pWaypointPos][1], PlayerInfo[playerid][pWaypointPos][2]));
		PlayerTextDrawSetString(playerid, PlayerInfo[playerid][pTextdraws][69], str);
	}
	//SAPD Tazer/Taser
	UpdateTazer(playerid);
	
	//SAPD Road Spike
	CheckPlayerInSpike(playerid);

	//Report ask
	//GetPlayerName(playerid, g_player_name[playerid], MAX_PLAYER_NAME);

	//AntiCheat
	pData[playerid][pLastUpdate] = gettime();

	//SpeedCam
	static id;
	new vehicled = Vehicle_Nearest2(playerid), query[326];
	if ((id = SpeedCam_Nearest(playerid)) != -1 && GetPlayerSpeedCam(playerid) > CamData[id][CamLimit] && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && pvData[vehicled][cOwner] == pData[playerid][pID] && GetEngineStatus(vehicled) && !pData[playerid][pSpeedTime])
	{
	    if (!IsACruiser(vehicled) && !IsABoat(vehicled) && !IsAPlane(vehicled) && !IsAHelicopter(vehicled))
	    {
	 		new price = 30 + floatround(GetPlayerSpeedCam(playerid) - CamData[id][CamLimit]);
	   		format(str, sizeof(str), "Kecepatan (%.0f/%.0f mph)", GetPlayerSpeedCam(playerid), CamData[id][CamLimit]);
	        SetTimerEx("HidePlayerBox", 500, false, "dd", playerid, _:ShowPlayerBox(playerid, 0xFFFFFF66));
    		format(str, sizeof(str), "{ff0000}>!<{ffffff}Anda telah melebihi kecepatan dan mendapatkan denda sebesar {3BBD44}%s", FormatMoney(price));
     		SendClientMessage(playerid, -1, str);
			pvData[vehicled][cTicket] += price;

			mysql_format(g_SQL, query, sizeof(query), "UPDATE vehicle SET ticket = '%d' WHERE id = '%d'", pvData[vehicled][cTicket], pvData[vehicled][cID]);
			mysql_tquery(g_SQL, query);
			pData[playerid][pSpeedTime] = 5;
		}
	}
	return 1;
}

task VehicleUpdate[40000]()
{
	for (new i = 1; i != MAX_VEHICLES; i ++) if(IsEngineVehicle(i) && GetEngineStatus(i))
    {
        if(GetVehicleFuel(i) > 0)
        {
			new fuel = GetVehicleFuel(i);
            SetVehicleFuel(i, fuel - 1);

            if(GetVehicleFuel(i) >= 1 && GetVehicleFuel(i) <= 10)
            {
               Info(GetVehicleDriver(i), "Kendaraan ingin habis bensin, Harap pergi ke SPBU ( Gas Station )");
            }
        }
        if(GetVehicleFuel(i) <= 0)
        {
            SetVehicleFuel(i, 0);
            SwitchVehicleEngine(i, false);
        }
    }
	foreach(new ii : PVehicles)
	{
		if(IsValidVehicle(pvData[ii][cVeh]))
		{
			if(pvData[ii][cPlateTime] != 0 && pvData[ii][cPlateTime] <= gettime())
			{
				format(pvData[ii][cPlate], 32, "NoHave");
				SetVehicleNumberPlate(pvData[ii][cVeh], pvData[ii][cPlate]);
				pvData[ii][cPlateTime] = 0;
			}
			if(pvData[ii][cRent] != 0 && pvData[ii][cRent] <= gettime())
			{
				pvData[ii][cRent] = 0;
				new query[128], xuery[128];
				mysql_format(g_SQL, query, sizeof(query), "DELETE FROM vehicle WHERE id = '%d'", pvData[ii][cID]);
				mysql_tquery(g_SQL, query);

				mysql_format(g_SQL, xuery, sizeof(xuery), "DELETE FROM vstorage WHERE owner = '%d'", pvData[ii][cID]);
				mysql_tquery(g_SQL, xuery);
				if(IsValidVehicle(pvData[ii][cVeh])) DestroyVehicle(pvData[ii][cVeh]);
				pvData[ii][cVeh] = INVALID_VEHICLE_ID;
				Iter_SafeRemove(PVehicles, ii, ii);
			}
		}
		if(pvData[ii][cClaimTime] != 0 && pvData[ii][cClaimTime] <= gettime())
		{
			pvData[ii][cClaimTime] = 0;
		}
	}
}
public OnVehicleDeath(vehicleid, killerid)
{
    foreach(new i : PVehicles)
    {
        if(pvData[i][cVeh] == vehicleid)
        {
            pvData[i][cStolen] = gettime() + 15;
        }
    }
    return 1;
}

public OnVehicleSpawn(vehicleid)
{
    //LoadedTrash[vehicleid] = 0;
    foreach(new ii : PVehicles)
    {
        if(vehicleid == pvData[ii][cVeh] && pvData[ii][cRent] == 0 && pvData[ii][cStolen] > gettime())
        {
            if(pvData[ii][cInsu] > 0)
            {
                pvData[ii][cStolen] = 0;
                pvData[ii][cInsu]--;
                pvData[ii][cClaim] = 1;
                pvData[ii][cClaimTime] = gettime() + (1 * 1200);
                foreach(new pid : Player) if (pvData[ii][cOwner] == pData[pid][pID])
                {
                    Info(pid, "Kendaraan anda hancur dan anda masih memiliki insuransi, silahkan ambil di kantor insurance setelah 20 minute.");
                }
                if(IsValidVehicle(pvData[ii][cVeh]))
                    DestroyVehicle(pvData[ii][cVeh]);

                pvData[ii][cVeh] = INVALID_VEHICLE_ID;
            }
            else
            {
                foreach(new pid : Player) if (pvData[ii][cOwner] == pData[pid][pID])
                {
                    new query[128];
                    mysql_format(g_SQL, query, sizeof(query), "DELETE FROM vehicle WHERE id = '%d'", pvData[pid][cID]);
                    mysql_tquery(g_SQL, query);
                    if(IsValidVehicle(pvData[ii][cVeh]))
                        DestroyVehicle(pvData[ii][cVeh]);

                    pvData[ii][cVeh] = INVALID_VEHICLE_ID;
                    Info(pid, "Kendaraan anda hancur dan tidak memiliki insuransi.");
                    Iter_SafeRemove(PVehicles, ii, ii);
				}
               	pvData[ii][cStolen] = 0;
            }
            return 1;
        }
    }
    return 1;
}
ptask PlayerVehicleUpdate[200](playerid)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if(IsValidVehicle(vehicleid))
	{
		if(!GetEngineStatus(vehicleid) && IsEngineVehicle(vehicleid))
		{	
			SwitchVehicleEngine(vehicleid, false);
		}
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new Float:fHealth;
			GetVehicleHealth(vehicleid, fHealth);
			if(IsValidVehicle(vehicleid) && fHealth <= 250.0)
			{
				SetValidVehicleHealth(vehicleid, 300.0);
				SwitchVehicleEngine(vehicleid, false);
				InfoTD_MSG(playerid, 2500, "~r~Totalled");
			}
		}
		new Float:fHealth;
		GetVehicleHealth(vehicleid, fHealth);
		if(IsValidVehicle(vehicleid) && fHealth <= 350.0)
		{
		    SetVehicleSpeedCap(GetPlayerVehicleID(playerid), 95);
		}
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new Float:fHealth;
			GetVehicleHealth(vehicleid, fHealth);
			if(IsValidVehicle(vehicleid) && fHealth >= 350.0)
			{
				DisableVehicleSpeedCap(GetPlayerVehicleID(playerid));
			}
		}
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			if(pData[playerid][pHBEMode] == 1)
			{
				new Float:fDamage, Float:fFuel, color1, color2, fuelstr[50], veh[50];
				new tstr[64];

				GetVehicleColor(vehicleid, color1, color2);

				GetVehicleHealth(vehicleid, fDamage);

				//fDamage = floatdiv(1000 - fDamage, 10) * 1.42999;

				if(fDamage <= 350.0) fDamage = 0.0;
				else if(fDamage > 8000.0) fDamage = 8000.0;

				fFuel = GetVehicleFuel(vehicleid);

				// if(fFuel < 0.0) fFuel = 0.0;
				// else if(fFuel > 300.0) fFuel = 300.0;

				if(fFuel <= 100.0) veh = "~g~";
				else if(fFuel <= 70.0) veh = "~y~";
				else if(fFuel <= 45.0) veh = "~r~";

				if(!GetEngineStatus(vehicleid))
				{
					PlayerTextDrawSetString(playerid, VEHFIVEM[playerid][0], "STATUS : OFF");
				}
				else
				{
					PlayerTextDrawSetString(playerid, VEHFIVEM[playerid][0], "STATUS : ON");
				}

				format(fuelstr, sizeof(fuelstr), "%s%.0f", veh, fFuel);
				PlayerTextDrawSetString(playerid, VEHFIVEM[playerid][4], fuelstr);

				format(tstr, sizeof(tstr), "%.0f", GetVehicleSpeed(vehicleid));
				PlayerTextDrawSetString(playerid, VEHFIVEM[playerid][2], tstr);
			}
			else
			{
			
			}
		}
	}
}
forward UpdateStress(playerid);
public UpdateStress(playerid)
{
    if(pData[playerid][pBladder] > 99) return Info(playerid, "Karakter anda stress, pergi ke pantai untuk menghilangkannya");
    if(pData[playerid][pBladder] < 95)
    {
        pData[playerid][pBladder] ++;
    }
    return 1;
}

ptask AdzanUpdate[100](playerid)
{
	new hours,
	minutes,
	seconds;
 	gettime(hours, minutes, seconds);
	if(hours == 4)
	{
		if(minutes == 20)
		{
			if(seconds == 0)
			{
				Info(playerid, "[Adzan] Jawa dan sekitarnya.");
				PlayAudioStreamForPlayer(playerid, "https://b.top4top.io/m_2659c1q4f1.mp3");
				SetTimerEx("StopAdzan", 29000, false, "d", playerid);
			}

		}
	}
	else if(hours == 12)
	{
		if(minutes == 00)
		{
			if(seconds == 0)
			{
				Info(playerid, "[Adzan] Jawa dan sekitarnya.");
				PlayAudioStreamForPlayer(playerid, "https://b.top4top.io/m_2659c1q4f1.mp3");
				SetTimerEx("StopAdzan", 29000, false, "d", playerid);
			}
		}
	}
	else if(hours == 15)
	{
		if(minutes == 20)
		{
			if(seconds == 0)
			{
				Info(playerid, "[Adzan] Jawa dan sekitarnya.");
				PlayAudioStreamForPlayer(playerid, "https://b.top4top.io/m_2659c1q4f1.mp3");
				SetTimerEx("StopAdzan", 29000, false, "d", playerid);
			}
		}
	}
	else if(hours == 17)
	{
		if(minutes == 49)
		{
			if(seconds == 0)
			{
				Info(playerid, "[Adzan] Jawa dan sekitarnya.");
				PlayAudioStreamForPlayer(playerid, "https://b.top4top.io/m_2659c1q4f1.mp3");
				SetTimerEx("StopAdzan", 29000, false, "d", playerid);
			}
		}
	}
	else if(hours == 18)
	{
		if(minutes == 50)
		{
			if(seconds == 0)
			{
				Info(playerid, "[Adzan] Jawa dan sekitarnya.");
				PlayAudioStreamForPlayer(playerid, "https://b.top4top.io/m_2659c1q4f1.mp3");
				SetTimerEx("StopAdzan", 29000, false, "d", playerid);
			}
		}
	}
	return 1;
}

function StopAdzan(playerid)
{
	StopAudioStreamForPlayer(playerid);
	return 1;
}
UpdatePlayerHBE(playerid)
{
	new Float:health, Float:armour, Float:hunger, Float:energy, Float:stress;
	health = pData[playerid][pHealth] * 0.32500000;
	PlayerTextDrawTextSize(playerid, BarDarah[playerid], health, 13.0);
 	PlayerTextDrawShow(playerid, BarDarah[playerid]);

 	armour = pData[playerid][pArmour] * 0.33500000;
	PlayerTextDrawTextSize(playerid, BarArmor[playerid], armour, 13.0);
 	PlayerTextDrawShow(playerid, BarArmor[playerid]);

  	hunger = pData[playerid][pHunger] * 12.0/100;
	PlayerTextDrawTextSize(playerid, BarMakan[playerid], 12.5, -hunger);
 	PlayerTextDrawShow(playerid, BarMakan[playerid]);

 	energy = pData[playerid][pEnergy] * 12.0/100;
	PlayerTextDrawTextSize(playerid, BarMinum[playerid], 12.5, -energy);
 	PlayerTextDrawShow(playerid, BarMinum[playerid]);

	stress = pData[playerid][pBladder] * 12.0/100;
	PlayerTextDrawTextSize(playerid, BarPusing[playerid], 12.5, -stress);
 	PlayerTextDrawShow(playerid, BarPusing[playerid]);
}
ptask PlayerUpdate[999](playerid)
{
    //JOB BUS
	if(pData[playerid][pBus] && IsABusVeh(GetPlayerVehicleID(playerid)) && pData[playerid][pBuswaiting])
	{
		if(pData[playerid][pBustime] > 0)
		{
			pData[playerid][pBustime]--;
			new str[512];
			format(str, sizeof(str), "Mohon Tunggu Selama %d Detik Untuk Melakukan Perjalanan", pData[playerid][pBustime]);
			InfoTD_MSG(playerid, 1000, str);
		}
		else
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.0, 1965.075073,-1779.868530,13.479113))
			{
				pData[playerid][pBuswaiting] = false;
				pData[playerid][pBustime] = 0;
				pData[playerid][pBus] = 16;
				DisablePlayerRaceCheckpoint(playerid);
				SetPlayerRaceCheckpoint(playerid, 2, buspoint16, buspoint16, 5.0);
				PlayerPlaySound(playerid, 43000, 0.0,0.0,0.0);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2.0, 2763.975097,-2479.834228,13.575368))
			{
				pData[playerid][pBuswaiting] = false;
				pData[playerid][pBustime] = 0;
				pData[playerid][pBus] = 27;
				DisablePlayerRaceCheckpoint(playerid);
				SetPlayerRaceCheckpoint(playerid, 1, buspoint27, buspoint27, 5.0);
				PlayerPlaySound(playerid, 43000, 0.0,0.0,0.0);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2.0, 1235.685913,-1855.510986,13.481544))
			{
				pData[playerid][pBuswaiting] = false;
				pData[playerid][pBustime] = 0;
				pData[playerid][pBus] = 59;
				DisablePlayerRaceCheckpoint(playerid);
				SetPlayerRaceCheckpoint(playerid, 1, buspoint59, buspoint59, 5.0);
				PlayerPlaySound(playerid, 43000, 0.0,0.0,0.0);
			}
	}
	return 1;
}
	if(GetPlayerScore(playerid) < 3)//artinya kalau level dibawah 2 bakalan ke kick terkena anti cheat weapon hack
 	{
		if(GetPlayerWeapon(playerid) == 10)//id 25 sama dengan senjata shotgun
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 11)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 12)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 13)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 14)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 15)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 16)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
        if(GetPlayerWeapon(playerid) == 17)//id 38 sama dengan senjata minigun
		{	
			ResetPlayerWeaponsEx(playerid); 
		   	Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 18)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 19)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 20)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 21)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 22)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 23)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 24)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 25)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 26)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 27)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 28)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 29)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 30)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 32)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 32)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 33)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 34)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 35)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 36)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 37)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 38)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 39)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 40)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
	}
	//Anti-Cheat Vehicle health hack
	if(pData[playerid][pAdmin] < 2)
	{
		for(new v, j = GetVehiclePoolSize(); v <= j; v++) if(GetVehicleModel(v))
		{
			new Float:health;
			GetVehicleHealth(v, health);
			if( (health > VehicleHealthSecurityData[v]) && VehicleHealthSecurity[v] == false)
			{
				if(GetPlayerVehicleID(playerid) == v)
				{
					new playerState = GetPlayerState(playerid);
					if(playerState == PLAYER_STATE_DRIVER)
					{
						SetValidVehicleHealth(v, VehicleHealthSecurityData[v]);
						SendClientMessageToAllEx(COLOR_RED, "[ANTICHEAT]: "GREY2_E"%s have been auto kicked for vehicle health hack!", pData[playerid][pName]);
						KickEx(playerid);
					}
				}
			}
			if(VehicleHealthSecurity[v] == true)
			{
				VehicleHealthSecurity[v] = false;
			}
			VehicleHealthSecurityData[v] = health;
		}
	}	
	//Anti-Money Hack
	if(GetPlayerMoney(playerid) > pData[playerid][pMoney])
	{
		ResetPlayerMoney(playerid);
		GivePlayerMoney(playerid, pData[playerid][pMoney]);
		//SendAdminMessage(COLOR_RED, "Possible money hacks detected on %s(%i). Check on this player. "LG_E"($%d).", pData[playerid][pName], playerid, GetPlayerMoney(playerid) - pData[playerid][pMoney]);
	}
	//Weapon AC
	if(pData[playerid][pAdmin] < 2)
	{
		if(pData[playerid][pSpawned] == 1)
		{
			if(GetPlayerWeapon(playerid) != pData[playerid][pWeapon])
			{
				pData[playerid][pWeapon] = GetPlayerWeapon(playerid);

				if(pData[playerid][pWeapon] >= 1 && pData[playerid][pWeapon] <= 45 && pData[playerid][pWeapon] != 40 && pData[playerid][pWeapon] != 2 && pData[playerid][pGuns][g_aWeaponSlots[pData[playerid][pWeapon]]] != GetPlayerWeapon(playerid))
				{
					pData[playerid][pACWarns]++;

					if(pData[playerid][pACWarns] < MAX_ANTICHEAT_WARNINGS)
					{
						new dc[128];
						SendAnticheat(COLOR_RED, "%s(%d) has possibly used weapon hacks (%s), Please to check /spec this player first!", pData[playerid][pName], playerid, ReturnWeaponName(pData[playerid][pWeapon]));
						SetWeapons(playerid); 
						format(dc, sizeof(dc),  "```\n<!> %s kemungkinan Weapon hacks (%s) ```", ReturnName(playerid), ReturnWeaponName(pData[playerid][pWeapon]));
						SendDiscordMessage(3, dc);					
					}
					else
					{
						new dc[128], PlayerIP[16];
						SendClientMessageToAllEx(COLOR_RED, "[ANTICHEAT]: %s"WHITE_E" telah dibanned otomatis oleh %s, Alasan: Weapon hacks", pData[playerid][pName], SERVER_BOT);
						format(dc, sizeof(dc),  "```\n<!> %s telah diban oleh %s\nAlasan: Weapon Hack```", ReturnName(playerid), SERVER_BOT);
						SendDiscordMessage(3, dc);

						GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
						new query[300], tmp[40], ban_time = 0;
						format(tmp, sizeof (tmp), "Weapon Hack (%s)", ReturnWeaponName(pData[playerid][pWeapon]));
						mysql_format(g_SQL, query, sizeof(query), "INSERT INTO banneds(name, ip, admin, reason, ban_date, ban_expire) VALUES ('%s', '%s', '%s', '%s', %i, %d)", pData[playerid][pUCP], PlayerIP, SERVER_BOT, tmp, gettime(), ban_time);
						mysql_tquery(g_SQL, query);
						KickEx(playerid);
					}
				}
			}
		}
	}	
	//Weapon Atth
	if(NetStats_GetConnectedTime(playerid) - WeaponTick[playerid] >= 250)
	{
		static weaponid, ammo, objectslot, count, index;
 
		for (new i = 2; i <= 7; i++) //Loop only through the slots that may contain the wearable weapons
		{
			GetPlayerWeaponData(playerid, i, weaponid, ammo);
			index = weaponid - 22;
		   
			if (weaponid && ammo && !WeaponSettings[playerid][index][Hidden] && IsWeaponWearable(weaponid) && EditingWeapon[playerid] != weaponid)
			{
				objectslot = GetWeaponObjectSlot(weaponid);
 
				if (GetPlayerWeapon(playerid) != weaponid)
					SetPlayerAttachedObject(playerid, objectslot, GetWeaponModel(weaponid), WeaponSettings[playerid][index][Bone], WeaponSettings[playerid][index][Position][0], WeaponSettings[playerid][index][Position][1], WeaponSettings[playerid][index][Position][2], WeaponSettings[playerid][index][Position][3], WeaponSettings[playerid][index][Position][4], WeaponSettings[playerid][index][Position][5], 1.0, 1.0, 1.0);
 
				else if (IsPlayerAttachedObjectSlotUsed(playerid, objectslot)) RemovePlayerAttachedObject(playerid, objectslot);
			}
		}
		for (new i = 4; i <= 8; i++) if (IsPlayerAttachedObjectSlotUsed(playerid, i))
		{
			count = 0;
 
			for (new j = 22; j <= 38; j++) if (PlayerHasWeapon(playerid, j) && GetWeaponObjectSlot(j) == i)
				count++;
 
			if(!count) RemovePlayerAttachedObject(playerid, i);
		}
		WeaponTick[playerid] = NetStats_GetConnectedTime(playerid);
	}
	
	//Player Update Online Data
	//GetPlayerHealth(playerid, pData[playerid][pHealth]);
    //GetPlayerArmour(playerid, pData[playerid][pArmour]);
	
	if(pData[playerid][pJail] <= 0)
	{
		if(pData[playerid][pHunger] > 100)
		{
			pData[playerid][pHunger] = 100;
		}
		if(pData[playerid][pHunger] < 0)
		{
			pData[playerid][pHunger] = 0;
		}
		if(pData[playerid][pEnergy] > 100)
		{
			pData[playerid][pEnergy] = 100;
		}
		if(pData[playerid][pEnergy] < 0)
		{
			pData[playerid][pEnergy] = 0;
		}
		/*if(pData[playerid][pHealth] > 100)
		{
			SetPlayerHealthEx(playerid, 100);
		}*/
	}
	
	if(pData[playerid][pHBEMode] == 1 && pData[playerid][IsLoggedIn] == true)
	{
		UpdatePlayerHBE(playerid);
        PlayerTextDrawShow(playerid, BarDarah[playerid]);
		PlayerTextDrawShow(playerid, BarArmor[playerid]);
		PlayerTextDrawShow(playerid, BarMakan[playerid]);
		PlayerTextDrawShow(playerid, BarMinum[playerid]);
		PlayerTextDrawShow(playerid, BarPusing[playerid]);
	}
	else
	{
	
	}
	
	if(pData[playerid][pHospital] == 1)
    {
		if(pData[playerid][pInjured] == 1)
		{
			SetPlayerPosition(playerid, -2028.32, -92.87, 1067.43, 275.78, 1);
		
			SetPlayerInterior(playerid, 1);
			SetPlayerVirtualWorld(playerid, playerid + 100);

			SetPlayerCameraPos(playerid, -2024.67, -93.13, 1066.78);
			SetPlayerCameraLookAt(playerid, -2028.32, -92.87, 1067.43);
			TogglePlayerControllable(playerid, 0);
			pData[playerid][pInjured] = 0;
			UpdateDynamic3DTextLabelText(pData[playerid][pInjuredLabel], COLOR_ORANGE, "");
			ResetPlayerWeaponsEx(playerid);
			if(pData[playerid][pWeaponLic] != 1)
			{
				ResetPlayerWeaponsEx(playerid);
			}
		}
		pData[playerid][pHospitalTime]++;
		new mstr[64];
		format(mstr, sizeof(mstr), "~n~~n~~n~~w~Recovering... %d", 15 - pData[playerid][pHospitalTime]);
		InfoTD_MSG(playerid, 1000, mstr);

		ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
		ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
        if(pData[playerid][pHospitalTime] >= 15)
        {
            pData[playerid][pHospitalTime] = 0;
            pData[playerid][pHospital] = 0;
			pData[playerid][pHunger] = 100;
			pData[playerid][pEnergy] = 100;
			SetPlayerHealthEx(playerid, 100);
			pData[playerid][pBladder] = 0;
			pData[playerid][pSick] = 0;
			GivePlayerMoneyEx(playerid, -150);
			SetPlayerHealthEx(playerid, 100);
			HideTdDeath(playerid);

            for (new i; i < 20; i++)
            {
                SendClientMessage(playerid, -1, "");
            }

            InfoMsg(playerid, "Anda telah keluar dari rumah sakit, Anda membayar $150 kerumah sakit.");
 
			SetPlayerPosition(playerid, 1830.15, -1422.53, 13.60, 266.25);

            TogglePlayerControllable(playerid, 1);
            SetCameraBehindPlayer(playerid);

            SetPlayerVirtualWorld(playerid, 0);
            SetPlayerInterior(playerid, 0);
			ClearAnimations(playerid);
			pData[playerid][pSpawned] = 1;
			SetPVarInt(playerid, "GiveUptime", -1);
		}
    }
	if(pData[playerid][pInjured] == 1 && pData[playerid][pHospital] != 1)
    {
		new mstr[64];
		new string[30];
        format(mstr, sizeof(mstr), "/death for spawn to hospital");
		InfoTD_MSG(playerid, 1000, mstr);
		format(string, sizeof(string), "(( Pingsan ))");
		UpdateDynamic3DTextLabelText(pData[playerid][pInjuredLabel], COLOR_ORANGE, string);

		ShowTdDeath(playerid);
		
		if(GetPVarInt(playerid, "GiveUptime") == -1)
		{
			SetPVarInt(playerid, "GiveUptime", gettime());
		}
		
		if(GetPVarInt(playerid,"GiveUptime"))
        {
            if((gettime()-GetPVarInt(playerid, "GiveUptime")) > 100)
            {
                Info(playerid, "Now you can spawn, type '/death' for spawn to hospital.");
                SetPVarInt(playerid, "GiveUptime", 0);
            }
        }
		
        ApplyAnimation(playerid, "CRACK", "null", 4.0, 0, 0, 0, 1, 0, 1);
        ApplyAnimation(playerid, "CRACK", "crckdeth4", 4.0, 0, 0, 0, 1, 0, 1);
        SetPlayerHealthEx(playerid, 99999);
    }
	if(pData[playerid][pInjured] == 0 && pData[playerid][pGender] != 0) //Pengurangan Data
	{
		if(++ pData[playerid][pHungerTime] >= 150)
        {
            if(pData[playerid][pHunger] > 0)
            {
                pData[playerid][pHunger]--;
            }
            else if(pData[playerid][pHunger] <= 0)
            {
          		pData[playerid][pSick] = 1;
            }
            pData[playerid][pHungerTime] = 0;
        }
        if(++ pData[playerid][pEnergyTime] >= 120)
        {
            if(pData[playerid][pEnergy] > 0)
            {
                pData[playerid][pEnergy]--;
            }
            else if(pData[playerid][pEnergy] <= 0)
            {
          		pData[playerid][pSick] = 1;
            }
            pData[playerid][pEnergyTime] = 0;
        }
		if(pData[playerid][pSick] == 1)
		{
			if(++ pData[playerid][pSickTime] >= 200)
			{
				if(pData[playerid][pSick] >= 1)
				{
					new Float:hp;
					GetPlayerHealth(playerid, hp);
					Info(playerid, "Sepertinya anda sakit, segeralah pergi ke dokter.");
					SetPlayerHealth(playerid, hp - 3);
					pData[playerid][pSickTime] = 0;
				}
			}
		}
	}
	if (pData[playerid][pSpeedTime] > 0)
	{
	    pData[playerid][pSpeedTime]--;
	}
	if(pData[playerid][pLastChopTime] > 0)
    {
		pData[playerid][pLastChopTime]--;
		new mstr[64];
        format(mstr, sizeof(mstr), "Waktu Pencurian ~r~%d ~w~detik", pData[playerid][pLastChopTime]);
        InfoTD_MSG(playerid, 1000, mstr);
	}
	//Jail Player
	if(pData[playerid][pJail] > 0)
	{
		if(pData[playerid][pJailTime] > 0)
		{
			pData[playerid][pJailTime]--;
			new mstr[128];
			format(mstr, sizeof(mstr), "~b~~h~You will be unjail in ~w~%d ~b~~h~seconds.", pData[playerid][pJailTime]);
			InfoTD_MSG(playerid, 1000, mstr);
		}
		else
		{
			pData[playerid][pJail] = 0;
			pData[playerid][pJailTime] = 0;
			//SpawnPlayer(playerid);
			SetPlayerPositionEx(playerid, 1482.0356,-1724.5726,13.5469,750, 2000);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E" %s(%d) have been un-jailed by the server. (times up)", pData[playerid][pName], playerid);
		}
	}
	//Arreset Player
	if(pData[playerid][pArrest] > 0)
	{
		if(pData[playerid][pArrestTime] > 0)
		{
			pData[playerid][pArrestTime]--;
			new mstr[128];
			format(mstr, sizeof(mstr), "~b~~h~Anda dipenjara selama ~w~%d ~b~~h~detik.", pData[playerid][pArrestTime]);
			InfoTD_MSG(playerid, 1000, mstr);
		}
		else
		{
			pData[playerid][pArrest] = 0;
			pData[playerid][pArrestTime] = 0;
			//SpawnPlayer(playerid);
			SetPlayerPositionEx(playerid, 1526.69, -1678.05, 5.89, 267.76, 2000);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			Info(playerid, "You have been auto release. (times up)");
		}
	}
}

forward AppuieJump(playerid);
public AppuieJump(playerid)
{
    AntiBHOP[playerid] = 0;
    ClearAnimations(playerid);
    return 1;
}
forward AppuiePasJump(playerid);
public AppuiePasJump(playerid)
{
    AntiBHOP[playerid] = 0;
    return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
    if(vehicleid == Car_Job[playerid]) {
        timer_Car[playerid] = SetTimerEx("Detectare_Intrare", 1000, true, "i", playerid);
        Seconds_timer[playerid] = 0;
        SendClientMessage(playerid, ATENTIE, "* Ai la dispozitie 120secunde pentru a te intoarce in vehiculul de JOB.");
    }

	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) 
    { 
        vpara[playerid]=0; 
        DestroyDynamicObject(para[vehicleid]); 
    } 
    if(pData[playerid][pDriveLicApp] > 0)
	{
		//new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 602)
		{
		    DisablePlayerCheckpoint(playerid);
			DisablePlayerRaceCheckpoint(playerid);
		    Info(playerid, "Anda Dengan Sengaja Keluar Dari Mobil Latihan, Anda Telah "RED_E"DIDISKUALIFIKASI.");
		    RemovePlayerFromVehicle(playerid);
		    pData[playerid][pDriveLicApp] = 0;
		    SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
		}
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	if(PlayerData[playerid][pAdmin] > 0)
	{
		DisplayStats(clickedplayerid, playerid);
	}
	return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	Waypoint_Set(playerid, GetLocation(fX, fY, fZ), fX, fY, fZ);
    if (pData[playerid][pAdmin] >= 4 && PlayerInfo[playerid][pAdminDuty] == 1)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
        if(vehicleid > 0 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
        {
                SetVehiclePos(vehicleid, fX, fY, fZ+10);
        }
        else
        {
                SetPlayerPosFindZ(playerid, fX, fY, 999.0);
                SetPlayerVirtualWorld(playerid, 0);
                SetPlayerInterior(playerid, 0);
        }
    }
    foreach (new i : Player)
	{
		if(pData[i][pClikmap] == pData[playerid][pClikmap] && pData[playerid][pClikmap] != 0 && pData[i][pClikmap] != 0)
		{
			SetPlayerCheckpoint(i, fX, fY, fZ, 3.0);
			Info(i, "Waypoint Sharing, Lihat pada map.");
		}
    }
    return 1;
}

stock SenjataHilang(playerid)
{
	new cQuery[4028];
	pData[playerid][pPeluru][0] = 0;
	pData[playerid][pPeluru][1] = 0;
	pData[playerid][pDe] = 0;
	pData[playerid][pKatana] = 0;
	pData[playerid][pMolotov] = 0;
	pData[playerid][p9mm] = 0;
	pData[playerid][pSg] = 0;
	pData[playerid][pSpas] = 0;
	pData[playerid][pMp5] = 0;
	pData[playerid][pM4] = 0;
	pData[playerid][pClip] = 0;
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE players SET peluru_0 = 0, peluru_1 = 0 WHERE reg_id = %i", pData[playerid][pPeluru][0], pData[playerid][pPeluru][1], pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE players SET de = 0 WHERE reg_id = %i", pData[playerid][pDe], pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE players SET katana = 0 WHERE reg_id = %i", pData[playerid][pKatana], pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE players SET molotov = 0 WHERE reg_id = %i", pData[playerid][pMolotov], pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE players SET 9mm = 0 WHERE reg_id = %i", pData[playerid][p9mm], pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE players SET sg = 0 WHERE reg_id = %i", pData[playerid][pSg], pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE players SET spas = 0 WHERE reg_id = %i", pData[playerid][pSpas], pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE players SET mp5 = 0 WHERE reg_id = %i", pData[playerid][pMp5], pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE players SET m4 = 0 WHERE reg_id = %i", pData[playerid][pM4], pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE players SET clip = 0 WHERE reg_id = %i", pData[playerid][pClip], pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	return 1;
}

stock SenjataTerpakai(playerid)
{
	if(PakaiSenjata[playerid] == 0)
	{
		if(pData[playerid][pDe] == 1)
		{
			if(IsPlayerAttachedObjectSlotUsed(playerid, 5)) SetPlayerArmedWeapon(playerid, 0), ResetPlayerWeapons(playerid);

			SetPlayerAttachedObject( playerid, 5, 348, 8, -0.040643, -0.048525, 0.085376, 270.000000, 8.253683, 0.000000, 1.000000, 1.000000, 1.000000 );
		}
		if(pData[playerid][pDe] <= 0)
		{
			if(IsPlayerAttachedObjectSlotUsed(playerid, 5)) RemovePlayerAttachedObject(playerid, 5);

			SetPlayerArmedWeapon(playerid, 0);
			ResetPlayerWeapons(playerid);
		}
		if(pData[playerid][pM4] >= 1)
		{
			if(IsPlayerAttachedObjectSlotUsed(playerid, 8)) SetPlayerArmedWeapon(playerid, 0), ResetPlayerWeapons(playerid);

			SetPlayerAttachedObject( playerid, 8, 356, 16, 0.019280, 0.118553, 0.396286, 70.920410, 274.673919, 253.978057, 1.000000, 1.000000, 1.000000 );
		}
		if(pData[playerid][pM4] <= 0)
		{
			if(IsPlayerAttachedObjectSlotUsed(playerid, 8)) RemovePlayerAttachedObject(playerid, 8);

			SetPlayerArmedWeapon(playerid, 0);
			ResetPlayerWeapons(playerid);
		}
		if(pData[playerid][pKatana] >= 1)
		{
			if(IsPlayerAttachedObjectSlotUsed(playerid, 7)) SetPlayerArmedWeapon(playerid, 0), ResetPlayerWeapons(playerid);

			SetPlayerAttachedObject( playerid, 7, 339, 15, 0.088326, 0.066626, 0.148351, 191.990447, 341.412963, 0.000000, 1.000000, 1.000000, 1.000000 );
		}
		if(pData[playerid][pKatana] <= 0)
		{
			if(IsPlayerAttachedObjectSlotUsed(playerid, 7)) RemovePlayerAttachedObject(playerid, 7);

			SetPlayerArmedWeapon(playerid, 0);
			ResetPlayerWeapons(playerid);
		}
		else
		{
			SetPlayerArmedWeapon(playerid, 0);
			ResetPlayerWeapons(playerid);
		}

	}
	else if(PakaiSenjata[playerid] == 1)
	{
		if(pData[playerid][pDe] == 1)
		{
			if(IsPlayerAttachedObjectSlotUsed(playerid, 5)) RemovePlayerAttachedObject(playerid, 5);
			SetPlayerArmedWeapon(playerid, WEAPON_DEAGLE);
			return 1;
		}
		SetPlayerArmedWeapon(playerid, 0);
		ResetPlayerWeapons(playerid);
		PakaiSenjata[playerid] = 0;
	}
	else if(PakaiSenjata[playerid] == 2)
	{
		if(pData[playerid][pSg] == 1)
		{
			SetPlayerArmedWeapon(playerid, WEAPON_SHOTGUN);
			return 1;
		}
		SetPlayerArmedWeapon(playerid, 0);
		ResetPlayerWeapons(playerid);
		PakaiSenjata[playerid] = 0;
	}
	else if(PakaiSenjata[playerid] == 3)
	{
		if(pData[playerid][pSpas] == 1)
		{
			SetPlayerArmedWeapon(playerid, WEAPON_SHOTGSPA);
			return 1;
		}
		SetPlayerArmedWeapon(playerid, 0);
		ResetPlayerWeapons(playerid);
		PakaiSenjata[playerid] = 0;
	}
	else if(PakaiSenjata[playerid] == 4)
	{
		if(pData[playerid][pMp5] == 1)
		{
			SetPlayerArmedWeapon(playerid, WEAPON_MP5);
			return 1;
		}
		SetPlayerArmedWeapon(playerid, 0);
		ResetPlayerWeapons(playerid);
		PakaiSenjata[playerid] = 0;
	}
	else if(PakaiSenjata[playerid] == 5)
	{
		if(pData[playerid][pM4] == 1)
		{
			if(IsPlayerAttachedObjectSlotUsed(playerid, 8)) RemovePlayerAttachedObject(playerid, 8);
			SetPlayerArmedWeapon(playerid, WEAPON_M4);
			return 1;
		}
		SetPlayerArmedWeapon(playerid, 0);
		ResetPlayerWeapons(playerid);
		PakaiSenjata[playerid] = 0;
	}
	else if(PakaiSenjata[playerid] == 6)
	{
		if(pData[playerid][pKatana] >= 1)
		{
			SetPlayerArmedWeapon(playerid, WEAPON_KATANA);
			return 1;
		}
		SetPlayerArmedWeapon(playerid, 0);
		ResetPlayerWeapons(playerid);
		PakaiSenjata[playerid] = 0;
	}
	else if(PakaiSenjata[playerid] == 7)
	{
		if(pData[playerid][pMolotov] >= 1)
		{
			return SetPlayerArmedWeapon(playerid, WEAPON_MOLTOV);
		}
		SetPlayerArmedWeapon(playerid, 0);
		ResetPlayerWeapons(playerid);
		PakaiSenjata[playerid] = 0;
	}
	else if(PakaiSenjata[playerid] == 8)
	{
		if(pData[playerid][p9mm] >= 1)
		{
			SetPlayerArmedWeapon(playerid, WEAPON_SILENCED);
			return 1;
		}
		SetPlayerArmedWeapon(playerid, 0);
		ResetPlayerWeapons(playerid);
		PakaiSenjata[playerid] = 0;
	}
	else if(PakaiSenjata[playerid] == 9)
	{
		if(pData[playerid][pTazer] >= 1)
		{
			SetPlayerArmedWeapon(playerid, WEAPON_SILENCED);
			return 1;
		}
		SetPlayerArmedWeapon(playerid, 0);
		ResetPlayerWeapons(playerid);
		PakaiSenjata[playerid] = 0;
	}
	else if(PakaiSenjata[playerid] == 10)
	{
		if(pData[playerid][pKamera] >= 1)
		{
			if(IsPlayerAttachedObjectSlotUsed(playerid, 6)) RemovePlayerAttachedObject(playerid, 6);
			SetPlayerArmedWeapon(playerid, WEAPON_CAMERA);
			return 1;
		}
		SetPlayerArmedWeapon(playerid, 0);
		ResetPlayerWeapons(playerid);
		PakaiSenjata[playerid] = 0;
	}
	else
	{
		if(GetPlayerWeapon(playerid) == WEAPON_POOLSTICK)
		{
			return 0;
		}
	}
	return 1;
}

stock SendDiscordMessage(channel, message[]) {
	new DCC_Channel:ChannelId;
	switch(channel)
	{
		//==[ Log Join & Leave ]
		case 0:
		{
			ChannelId = DCC_FindChannelById("985458687336415353");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log Command ]
		case 1:
		{
			ChannelId = DCC_FindChannelById("1096794488363561000");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log Chat IC ]
		case 2:
		{
			ChannelId = DCC_FindChannelById("1096794488363561000");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Warning & Banned ]
		case 3:
		{
			ChannelId = DCC_FindChannelById("1097166158114869288");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log Death ]
		case 4:
		{
			ChannelId = DCC_FindChannelById("1096832607934754827");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Ucp ]
		case 5:
		{
			ChannelId = DCC_FindChannelById("1091330982549930054");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		case 6://Korup
		{
			ChannelId = DCC_FindChannelById("985459255127732244");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		case 7://Register
		{
			ChannelId = DCC_FindChannelById("1108659697600438312");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		case 8://Bot Admin
		{
			ChannelId = DCC_FindChannelById("1096794488363561000");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log Death ]
		case 9:
		{
			ChannelId = DCC_FindChannelById("1096832607934754827");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log CMD Admin ]
		case 10:
		{
			ChannelId = DCC_FindChannelById("1096794488363561000");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ LOG STATUS SERVER ]==
		case 11:
		{
			ChannelId = DCC_FindChannelById("1096831419982037206");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ PAY LOGS ]==
		case 12:
		{
			ChannelId = DCC_FindChannelById("1097203147493097512");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Aduty ]==
		case 13:
		{
			ChannelId = DCC_FindChannelById("1097210649286815924");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
	}
	return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if(clickedid == AtmTD[19])// ATM
	{
        ShowPlayerDialog(playerid, DIALOG_BANKDEPOSIT, DIALOG_STYLE_INPUT, "Fivem- Deposit", "Mohon masukan berapa jumlah yang ingin disimpan:", "Simpan", "Batal");
	}
	if(clickedid == AtmTD[23])
	{
        ShowPlayerDialog(playerid, DIALOG_BANKWITHDRAW, DIALOG_STYLE_INPUT, "Fivem- Withdraw", "Mohon masukan berapa jumlah yang ingin ditarik:", "Tarik", "Batal");
	}
	if(clickedid == AtmTD[24])
	{
        ShowPlayerDialog(playerid, DIALOG_BANKREKENING, DIALOG_STYLE_INPUT, "Fivem- Transfer", "Mohon masukan jumlah uang yang ingin di transfer:", "Transfer", "Batal");
	}
	if(clickedid == AtmTD[32])
	{
	    if(pData[playerid][pBankMoney] < 10) return ErrorMsg(playerid, "Anda tidak memiliki $10 di dalam rekening");
		pData[playerid][pBankMoney] -= 10;
		GivePlayerMoneyEx(playerid, 10);
		SuccesMsg(playerid, "Anda menarik $10 dari akun rekening");
		ShowItemBox(playerid, "Uang", "ADD_$10", 1212, 4);
	}
    if(clickedid == AtmTD[33])
	{
	    if(pData[playerid][pBankMoney] < 50) return ErrorMsg(playerid, "Anda tidak memiliki $10 di dalam rekening");
        pData[playerid][pBankMoney] -= 50;
		GivePlayerMoneyEx(playerid, 50);
		SuccesMsg(playerid, "Anda menarik $50 dari akun rekening");
		ShowItemBox(playerid, "Uang", "ADD_$50", 1212, 4);
	}
	if(clickedid == AtmTD[34])
	{
	    if(pData[playerid][pBankMoney] < 250) return ErrorMsg(playerid, "Anda tidak memiliki $10 di dalam rekening");
        pData[playerid][pBankMoney] -= 250;
		GivePlayerMoneyEx(playerid, 250);
		SuccesMsg(playerid, "Anda menarik $250 dari akun rekening");
		ShowItemBox(playerid, "Uang", "ADD_$250", 1212, 4);
	}
	if(clickedid == AtmTD[35])
	{
	    if(pData[playerid][pBankMoney] < 500) return ErrorMsg(playerid, "Anda tidak memiliki $10 di dalam rekening");
        pData[playerid][pBankMoney] -= 500;
		GivePlayerMoneyEx(playerid, 500);
		SuccesMsg(playerid, "Anda menarik $500 dari akun rekening");
		ShowItemBox(playerid, "Uang", "ADD_$500", 1212, 4);
	}
	if(clickedid == AtmTD[37])
	{
	    if(pData[playerid][pMoney] < 10) return ErrorMsg(playerid, "Anda tidak memiliki $10 di dalam kantong");
        pData[playerid][pBankMoney] += 10;
		GivePlayerMoneyEx(playerid, -10);
		SuccesMsg(playerid, "Anda menabung $10 ke dalam akun rekening");
	}
	if(clickedid == AtmTD[38])
	{
	    if(pData[playerid][pMoney] < 50) return ErrorMsg(playerid, "Anda tidak memiliki $50 di dalam kantong");
        pData[playerid][pBankMoney] += 50;
		GivePlayerMoneyEx(playerid, -50);
		SuccesMsg(playerid, "Anda menabung $50 ke dalam akun rekening");
	}
	if(clickedid == AtmTD[39])
	{
	    if(pData[playerid][pMoney] < 250) return ErrorMsg(playerid, "Anda tidak memiliki $250 di dalam kantong");
        pData[playerid][pBankMoney] += 250;
		GivePlayerMoneyEx(playerid, -250);
		SuccesMsg(playerid, "Anda menabung $250 ke dalam akun rekening");
	}
	if(clickedid == AtmTD[40])
	{
        if(pData[playerid][pMoney] < 500) return ErrorMsg(playerid, "Anda tidak memiliki $500 di dalam kantong");
        pData[playerid][pBankMoney] += 500;
		GivePlayerMoneyEx(playerid, -500);
		SuccesMsg(playerid, "Anda menabung $500 ke dalam akun rekening");
	}
	if(clickedid == AtmTD[50])
	{
         for(new i = 0; i < 66; i++)
		{
			TextDrawHideForPlayer(playerid, AtmTD[i]);
		}
		CancelSelectTextDraw(playerid);
	}
	//DEWATA HOME
	if(clickedid == DewataHome[13])
	{
        for(new i = 0; i < 48; i++)
		{
			TextDrawShowForPlayer(playerid, DewataPhone[i]);
		}
  		PunyaMap(playerid);
  		PunyaMbanking(playerid);
		PunyaTwitter(playerid);
		SelectTextDraw(playerid, COLOR_WHITE);
		PunyaGojek(playerid);
		for(new i = 0; i < 24; i++)
		{
			TextDrawHideForPlayer(playerid, DewataHome[i]);
		}
	}
	if(clickedid == DewataHome[15])
	{
  		for(new i = 0; i < 24; i++)
		{
			TextDrawHideForPlayer(playerid, DewataHome[i]);
		}
		CancelSelectTextDraw(playerid);
	}
	//DEWATA APPSTORE
	if(clickedid == DewataPhone[21])
	{
        for(new i = 0; i < 42; i++)
		{
			TextDrawShowForPlayer(playerid, DewataAppStore[i]);
		}
		TweetAppStore(playerid);
		MapAppStore(playerid);
		BankAppStore(playerid);
		GojekAppStore(playerid);
		for(new i = 0; i < 48; i++)
		{
			TextDrawHideForPlayer(playerid, DewataPhone[i]);
		}
		SelectTextDraw(playerid, COLOR_WHITE);
	}
	if(clickedid == DewataAppStore[18])
	{
        for(new i = 0; i < 42; i++)
		{
			TextDrawHideForPlayer(playerid, DewataAppStore[i]);
		}
		for(new i = 0; i < 48; i++)
		{
			TextDrawShowForPlayer(playerid, DewataPhone[i]);
		}
  		PunyaMap(playerid);
  		PunyaMbanking(playerid);
		PunyaTwitter(playerid);
		PunyaGojek(playerid);
		SelectTextDraw(playerid, COLOR_WHITE);
	}
	if(clickedid == DewataAppStore[26])
	{
	    if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid,"Sabar Blok, lu masih ada progress");
	    if(PlayerInfo[playerid][pInstallBank] == 1) return ErrorMsg(playerid,"Lu udah punya mbanking blok!");
		ShowProgressbar(playerid, "Menginstall Mbanking..", 10);
		SetTimerEx("DownloadBank", 10000, false, "d", playerid);
	}
	if(clickedid == DewataAppStore[27])
	{
	    if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid,"Sabar Blok, lu masih ada progress");
	    if(PlayerInfo[playerid][pInstallGojek] == 1) return ErrorMsg(playerid,"Lu udah punya Gojek blok!");
		ShowProgressbar(playerid, "Menginstall Gojek..", 10);
		SetTimerEx("DownloadGojek", 10000, false, "d", playerid);
	}
	if(clickedid == DewataAppStore[28])
	{
	    if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid,"Sabar Blok, lu masih ada progress");
	    if(PlayerInfo[playerid][pInstallTweet] == 1) return ErrorMsg(playerid,"Lu udah punya twitter blok!");
		ShowProgressbar(playerid, "Menginstall Twitter..", 10);
		SetTimerEx("DownloadTweet", 10000, false, "d", playerid);
	}
	if(clickedid == DewataAppStore[29])
	{
	    if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid,"Sabar Blok, lu masih ada progress");
	    if(PlayerInfo[playerid][pInstallMap] == 1) return ErrorMsg(playerid,"Lu udah punya google map blok!");
		ShowProgressbar(playerid, "Menginstall Google Map..", 10);
		SetTimerEx("DownloadMap", 10000, false, "d", playerid);
	}
	//======== DEWATA PHONE SYSTEM ======
	if(clickedid == DewataPhone[15])
	{
        for(new i = 0; i < 48; i++)
		{
			TextDrawHideForPlayer(playerid, DewataPhone[i]);
		}
		CancelSelectTextDraw(playerid);
	}
	if(clickedid == DewataPhone[24])
	{
		ShowPlayerDialog(playerid, DIALOG_GPS, DIALOG_STYLE_LIST, "Fivem- GPS", "Lokasi Pekerjaan\nLokasi Umum\nToko Di Kota\nGarasi Kota\n"RED_E"(Hapus Checkpoint GPS)", "Pilih", "Batal");
	}
	//MBANKING SYSTEM
	if(clickedid == DewataPhone[25])
	{
		for(new i = 0; i < 36; i++)
		{
			TextDrawShowForPlayer(playerid, ArivenaBank[i]);
		}
		new Mbanking[560];
 		format(Mbanking,1000,"%s", GetName(playerid));
 		TextDrawSetString(ArivenaBank[28], Mbanking);
 		format(Mbanking,1000,"%s", FormatMoney(pData[playerid][pBankMoney]));
 		TextDrawSetString(ArivenaBank[32], Mbanking);
 		format(Mbanking,1000,"%d", pData[playerid][pBankRek]);
 		TextDrawSetString(ArivenaBank[26], Mbanking);
		for(new i = 0; i < 48; i++)
		{
			TextDrawHideForPlayer(playerid, DewataPhone[i]);
		}
		SelectTextDraw(playerid, COLOR_WHITE);
	}
	if(clickedid == ArivenaBank[35])
	{
	    for(new i = 0; i < 36; i++)
		{
			TextDrawHideForPlayer(playerid, ArivenaBank[i]);
		}
		for(new i = 0; i < 48; i++)
		{
			TextDrawShowForPlayer(playerid, DewataPhone[i]);
		}
  		PunyaMap(playerid);
  		PunyaMbanking(playerid);
		PunyaTwitter(playerid);
		PunyaGojek(playerid);
	}
	if(clickedid == ArivenaBank[22])
	{
	    ShowPlayerDialog(playerid, DIALOG_BANKREKENING, DIALOG_STYLE_INPUT, "Fivem- Transfer", "Mohon masukan jumlah uang yang ingin di transfer:", "Transfer", "Batal");
	}
	//===================================
	if(clickedid == DewataPhone[22])
	{
		ShowPlayerDialog(playerid, DIALOG_TOGGLEPHONE, DIALOG_STYLE_LIST, "HoliPhone - Setting", "Phone On\nPhone Off", "Pilih", "Kembali");
	}
	if(clickedid == DewataPhone[23])
	{
		callcmd::selfie(playerid, "");
	}
	//========[ GOJEK ]==========
	if(clickedid == DewataPhone[27])
	{
		for(new i = 0; i < 53; i++)
		{
			TextDrawShowForPlayer(playerid, DewataJek[i]);
		}
		for(new i = 0; i < 48; i++)
		{
			TextDrawHideForPlayer(playerid, DewataPhone[i]);
		}
		SelectTextDraw(playerid, COLOR_WHITE);
	}
	if(clickedid == DewataJek[52])
	{
		for(new i = 0; i < 53; i++)
		{
			TextDrawHideForPlayer(playerid, DewataJek[i]);
		}
        for(new i = 0; i < 48; i++)
		{
			TextDrawShowForPlayer(playerid, DewataPhone[i]);
		}
  		PunyaMap(playerid);
  		PunyaMbanking(playerid);
		PunyaTwitter(playerid);
		PunyaGojek(playerid);
		SelectTextDraw(playerid, COLOR_WHITE);
	}
	if(clickedid == DewataJek[28])
	{
	    ShowPlayerDialog(playerid, DIALOG_GOPAY, DIALOG_STYLE_INPUT, "GoJek App - GoPay", "Masukan jumlah uang yang ingin anda bayar", "Input", "Kembali");
	}
	if(clickedid == DewataJek[29])
	{
	    ShowPlayerDialog(playerid, DIALOG_GOTOPUP, DIALOG_STYLE_INPUT, "GoJek App - TopUp", "Masukan jumlah gopay yang ingin anda topup", "Input", "Kembali");
	}
	if(clickedid == DewataJek[49])
	{
	    ShowPlayerDialog(playerid, DIALOG_GOJEK, DIALOG_STYLE_INPUT, "GoJek App - Pesan GoJek", "Hai, kamu akan memesan GoJek. Mau kemana hari ini?", "Input", "Kembali");
	}
	//===========================================
	if(clickedid == DewataPhone[26])
	{
        new string[100];
        format(string, sizeof(string), "Tweet\nChangename Twitter({0099ff}%s{ffffff})", pData[playerid][pTwittername]);
        ShowPlayerDialog(playerid, DIALOG_TWITTER, DIALOG_STYLE_LIST, "Twitter", string, "Select", "Close");
	}
	if(clickedid == DewataPhone[18])
	{
		if(pData[playerid][pPhoneBook] == 0)
			return ErrorMsg(playerid, "Anda Tidak memiliki buku telepon");

		ShowContacts(playerid);
	}
	if(clickedid == DewataPhone[19])
	{
		ShowPlayerDialog(playerid, DIALOG_PHONE_SENDSMS, DIALOG_STYLE_INPUT, "HoliPhone - Kirim Pesan", "Masukan nomor yang akan anda kirimkan:", "Kirim", "Kembali");
	}
	if(clickedid == DewataPhone[20])
	{
		ShowPlayerDialog(playerid, DIALOG_PHONE_DIALUMBER, DIALOG_STYLE_INPUT, "HoliPhone - Telepon", "Masukan nomor yang akan anda hubungi:", "Kirim", "Kembali");
	}
    
	//SPAWN FIVEM
	if(clickedid == SPAWNFIVEM[1]) // BANDARA
	{
		pData[playerid][SPAWNMENU] = 2;
		InterpolateCameraPos(playerid, 2710.07,-2378.50,145.47,2746.96,-2416.59,45.71, 3000);
		InterpolateCameraLookAt(playerid, 2710.07,-2378.50,145.47,2746.96,-2416.59,45.71, 3000);
        SelectTextDraw(playerid, 0xC6E2FFFF);
	}
	if(clickedid == SPAWNFIVEM[2]) // PELABUHAN
	{
		pData[playerid][SPAWNMENU] = 1;
		InterpolateCameraPos(playerid, 1735.29, -2226.49, 131.22, 1723.28, -2251.33, 23.26, 3000);
		InterpolateCameraLookAt(playerid, 1735.29, -2226.49, 131.22, 1723.28, -2251.33, 23.26, 3000);
        SelectTextDraw(playerid, 0xC6E2FFFF);
	}
	if(clickedid == SPAWNFIVEM[8]) // LOKASI TERAKHIR
	{
		pData[playerid][SPAWNMENU] = 3;
		SetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
		SetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
		SetPlayerInterior(playerid, pData[playerid][pInt]);
		SetPlayerVirtualWorld(playerid, pData[playerid][pWorld]);
		SetCameraBehindPlayer(playerid);
        SelectTextDraw(playerid, 0xC6E2FFFF);
	}
	if(clickedid == SPAWNFIVEM[6]) // MENDARAT
	{
		if(pData[playerid][SPAWNMENU] == 0) // GAK MILIH
			return Error(playerid, "Kamu belum memilih tempat mendarat");

   		if(pData[playerid][SPAWNMENU] == 1) // BANDARA
   		{
			pData[playerid][SPAWNMENU] = 0;
			SetPlayerPos(playerid, 1685.559448,-2239.149658,13.546875);
			SetPlayerFacingAngle(playerid, 175.810470);
			SetCameraBehindPlayer(playerid);
			TogglePlayerControllable(playerid, 1);
		}
		else if(pData[playerid][SPAWNMENU] == 2) // PELABUHAN
		{
		    pData[playerid][SPAWNMENU] = 0;
			SetPlayerPos(playerid, 2432.8511,-2699.4453,3.0000);
		    SetPlayerFacingAngle(playerid, 262.3953);
			SetCameraBehindPlayer(playerid);
			TogglePlayerControllable(playerid, 1);
		}
		else if(pData[playerid][SPAWNMENU] == 3) // LOKASI TERAKHIR
		{
		    pData[playerid][SPAWNMENU] = 0;
		    StopAudioStreamForPlayer(playerid);
			SetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
			SetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
			SetPlayerInterior(playerid, pData[playerid][pInt]);
			SetPlayerVirtualWorld(playerid, pData[playerid][pWorld]);
			SetCameraBehindPlayer(playerid);
			TogglePlayerControllable(playerid, 1);
			SetPlayerSpawn(playerid);
		}
        //SelectTextDraw(playerid, 0xFFA500FF);
        for(new i = 0; i < 10; i++)
		{
			TextDrawHideForPlayer(playerid, SPAWNFIVEM[i]);
			CancelSelectTextDraw(playerid);
		}
	}

	return 1;
}

stock RefreshVModel(playerid)
{

    return 1;
}

stock RefreshPSkin(playerid)
{

    return 1;
}

public OnPlayerModelSelection(playerid, response, listid, modelid)
{
	if(listid == SpawnMale)
	{
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 2823.21,-2440.34,12.08,85.07, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
		}
	}
	
	if(listid == SpawnFemale)
	{
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 2823.21,-2440.34,12.08,85.07, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
		}
   }

   //Locker Faction Skin
	if(listid == SAPDMale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}
	
	if(listid == SAPDFemale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SAPDWar)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SAGSMale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SAGSFemale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SAMDMale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SAMDFemale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SANEWMale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SANEWFemale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}
	if(listid == MaleSkins)
	{
		if(response)
		{
			new bizid = pData[playerid][pInBiz], price;
			price = bData[bizid][bP][0];
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			GivePlayerMoneyEx(playerid, -price);
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli pakaian ID %d seharga %s.", ReturnName(playerid), modelid, FormatMoney(price));
			bData[bizid][bProd]--;
			bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);
			Bisnis_Save(bizid);
			SuccesMsg(playerid, "Anda telah membeli pakaian baru");
		}
		else return Info(playerid, "Anda tidak jadi membeli pakaian");
	}

	if(listid == FemaleSkins)
	{
		if(response)
		{
			new bizid = pData[playerid][pInBiz], price;
			price = bData[bizid][bP][0];
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			GivePlayerMoneyEx(playerid, -price);
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli skin ID %d seharga %s.", ReturnName(playerid), modelid, FormatMoney(price));
			bData[bizid][bProd]--;
			bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);
			Bisnis_Save(bizid);
			SuccesMsg(playerid, "Anda telah membeli pakaian baru");
		}
		else return Info(playerid, "Anda tidak jadi membeli pakaian");
	}
	if(listid == VIPMaleSkins)
	{
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah mengganti skin ID %d.", ReturnName(playerid), modelid);
			Info(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
		}
		else return Servers(playerid, "Canceled buy skin");
	}

	if(listid == VIPFemaleSkins)
	{
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli skin ID %d.", ReturnName(playerid), modelid);
			SuccesMsg(playerid, "Anda telah membeli pakaian baru");
		}
		else return Servers(playerid, "Canceled buy skin");
	}
	if(listid == VIPMaleSkins)
	{
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah mengganti skin ID %d.", ReturnName(playerid), modelid);
			SuccesMsg(playerid, "Anda telah membeli pakaian baru");
		}
		else return Servers(playerid, "Canceled buy skin");
	}

	if(listid == VIPFemaleSkins)
	{
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli skin ID %d.", ReturnName(playerid), modelid);
			SuccesMsg(playerid, "Anda telah membeli pakaian baru");
		}
		else return Servers(playerid, "Canceled buy skin");
	}
	if(listid == toyslist)
	{
		if(response)
		{
			new bizid = pData[playerid][pInBiz], price;
			price = bData[bizid][bP][1];
			
			GivePlayerMoneyEx(playerid, -price);
			if(pData[playerid][PurchasedToy] == false) MySQL_CreatePlayerToy(playerid);
			pToys[playerid][pData[playerid][toySelected]][toy_model] = modelid;
			pToys[playerid][pData[playerid][toySelected]][toy_status] = 1;
			new finstring[750];
			strcat(finstring, ""dot"Spine\n"dot"Head\n"dot"Left upper arm\n"dot"Right upper arm\n"dot"Left hand\n"dot"Right hand\n"dot"Left thigh\n"dot"Right tigh\n"dot"Left foot\n"dot"Right foot");
			strcat(finstring, "\n"dot"Right calf\n"dot"Left calf\n"dot"Left forearm\n"dot"Right forearm\n"dot"Left clavicle\n"dot"Right clavicle\n"dot"Neck\n"dot"Jaw");
			ShowPlayerDialog(playerid, DIALOG_TOYPOSISIBUY, DIALOG_STYLE_LIST, ""WHITE_E"Select Bone", finstring, "Select", "Cancel");
			
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli object ID %d seharga %s.", ReturnName(playerid), modelid, FormatMoney(price));
			bData[bizid][bProd]--;
			bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);
            SuccesMsg(playerid, "Anda telah membeli aksesoris baru");
			new query[128];
			mysql_format(g_SQL, query, sizeof(query), "UPDATE bisnis SET prod='%d', money='%d' WHERE ID='%d'", bData[bizid][bProd], bData[bizid][bMoney], bizid);
			mysql_tquery(g_SQL, query);
		}
		else return Servers(playerid, "Canceled buy toys");
	}

	//modshop
	if(listid == TransFender)
	{
		if(response)
        {
            new
            price = 5000,
            vehicleid
            ;

            if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
                return Error(playerid, "You need to be inside vehicle as driver");

            vehicleid = Vehicle_Nearest(playerid);

            if(vehicleid == -1)
                return 0;

            Vehicle_ObjectAddObjects(playerid, vehicleid, modelid, OBJECT_TYPE_BODY);

            SendClientMessageEx(playerid, COLOR_ARWIN,"MODSHOP: "WHITE_E"You have purchased a {00FFFF}%s "WHITE_E"for "GREEN_E"$%s.", GetVehObjectNameByModel(modelid), FormatMoney(price));
        }
	}

	if(listid == Waa)
	{
		if(response)
        {
            new
            price = 5000,
            vehicleid
            ;

            if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
                return Error(playerid, "You need to be inside vehicle as driver");

            vehicleid = Vehicle_Nearest(playerid);

            if(vehicleid == -1)
                return 0;

            Vehicle_ObjectAddObjects(playerid, vehicleid, modelid, OBJECT_TYPE_BODY);

            SendClientMessageEx(playerid, COLOR_ARWIN,"MODSHOP: "WHITE_E"You have purchased a {00FFFF}%s "WHITE_E"for "GREEN_E"$%s.", GetVehObjectNameByModel(modelid), FormatMoney(price));
        }
	}

	if(listid == LoCo)
	{
		if(response)
        {
            new
            price = 5000,
            vehicleid
            ;

            if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
                return Error(playerid, "You need to be inside vehicle as driver");

            vehicleid = Vehicle_Nearest(playerid);

            if(vehicleid == -1)
                return 0;

            Vehicle_ObjectAddObjects(playerid, vehicleid, modelid, OBJECT_TYPE_BODY);

            SendClientMessageEx(playerid, COLOR_ARWIN,"MODSHOP: "WHITE_E"You have purchased a {00FFFF}%s "WHITE_E"for "GREEN_E"$%s.", GetVehObjectNameByModel(modelid), FormatMoney(price));
        }
	}

	if(listid == viptoyslist)
	{
		if(response)
		{
			if(pData[playerid][PurchasedToy] == false) MySQL_CreatePlayerToy(playerid);
			pToys[playerid][pData[playerid][toySelected]][toy_model] = modelid;
			pToys[playerid][pData[playerid][toySelected]][toy_status] = 1;
			new finstring[750];
			strcat(finstring, ""dot"Spine\n"dot"Head\n"dot"Left upper arm\n"dot"Right upper arm\n"dot"Left hand\n"dot"Right hand\n"dot"Left thigh\n"dot"Right tigh\n"dot"Left foot\n"dot"Right foot");
			strcat(finstring, "\n"dot"Right calf\n"dot"Left calf\n"dot"Left forearm\n"dot"Right forearm\n"dot"Left clavicle\n"dot"Right clavicle\n"dot"Neck\n"dot"Jaw");
			ShowPlayerDialog(playerid, DIALOG_TOYPOSISIBUY, DIALOG_STYLE_LIST, ""WHITE_E"Select Bone", finstring, "Select", "Cancel");
			
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah mengambil object ID %d dilocker.", ReturnName(playerid), modelid);
		}
		else return Servers(playerid, "Canceled toys");
	}
	if(listid == PDGSkinMale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
			RefreshPSkin(playerid);
		}
	}

	if(listid == PDGSkinFemale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
			RefreshPSkin(playerid);
		}
	}

	if(listid == vtoylist)
	{
		if(response)
		{
			new x = pData[playerid][VehicleID], Float:vPosx, Float:vPosy, Float:vPosz;
			GetVehiclePos(x, vPosx, vPosy, vPosz);
			foreach(new i: PVehicles)
			if(x == pvData[i][cVeh])
			{
				new vehid = pvData[i][cVeh];
				new toyslotid = pvData[vehid][vtoySelected];
				vtData[vehid][toyslotid][vtoy_modelid] = modelid;

				if(pvData[vehid][PurchasedvToy] == false) 			// Cek kalo gada database di mysql auto di buat
				{
					MySQL_CreateVehicleToy(i);
				}

				printf("VehicleID: %d, Object: %d, Pos: (%f ,%f, %f), ToySlotID: %d", vehid, vtData[vehid][toyslotid][vtoy_modelid], vPosx, vPosy, vPosz, toyslotid);

				vtData[vehid][toyslotid][vtoy_model] = CreateObject(modelid, vPosx, vPosy, vPosz, 0.0, 0.0, 0.0);
				AttachObjectToVehicle(vtData[vehid][toyslotid][vtoy_model], vehid, vtData[vehid][toyslotid][vtoy_x], vtData[vehid][toyslotid][vtoy_y], vtData[vehid][toyslotid][vtoy_z], vtData[vehid][toyslotid][vtoy_rx], vtData[vehid][toyslotid][vtoy_ry], vtData[vehid][toyslotid][vtoy_rz]);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memasang toys untuk vehicleid(%d) object ID %d", ReturnName(playerid), vehid, modelid);
				ShowPlayerDialog(playerid, DIALOG_MODTACCEPT, DIALOG_STYLE_MSGBOX, "Vehicle Toys", "Do You Want To Save it?", "Yes", "Cancel");
			}
		}
		else return Servers(playerid, "Canceled buy toys");
	}
	return 1;
}
stock DisplayDokumen(playerid)
{
    new ktpstatus[36];
	if(pData[playerid][pIDCard] == 1)
	{
		format(ktpstatus, 36, ""LG_E"Ada");
	}
	else
	{
		format(ktpstatus, 36, ""RED_E"Tidak");
	}

	new simstatus[36];
	if(pData[playerid][pDriveLic] == 1)
	{
		format(simstatus, 36, ""LG_E"Ada");
	}
	else
	{
		format(simstatus, 36, ""RED_E"Tidak");
	}
	
	new weaponstatus[36];
	if(pData[playerid][pWeaponLic] == 1)
	{
		format(weaponstatus, 36, ""LG_E"Ada");
	}
	else
	{
		format(weaponstatus, 36, ""RED_E"Tidak");
	}
	new string[2048];
	format(string, sizeof(string),"Kartu Tanda Penduduk\t[%s]\nSurat Izin Mengemudi\t[%s]\nLisensi Senjata\t[%s]",
    ktpstatus,
	simstatus,
	weaponstatus);
	ShowPlayerDialog(playerid, DIALOG_DOKUMEN, DIALOG_STYLE_LIST, "Fivem- Dokumen", string, "Tutup","");
}
// CMD:resetbensin(playerid, params[])
// {
//     new vehicleid = GetPlayerVehicleID(playerid);
//     new fuels = GetVehicleFuel(vehicleid);
// 	SetVehicleFuel(vehicleid, 30);
// 	return 1;
// }
function PunyaMap(playerid)
{
	if(pData[playerid][pInstallMap])
	{
	    TextDrawShowForPlayer(playerid, DewataPhone[24]);
	    TextDrawShowForPlayer(playerid, DewataPhone[34]);
	    TextDrawShowForPlayer(playerid, DewataPhone[45]);
	}
	else
	{
 		TextDrawHideForPlayer(playerid, DewataPhone[24]);
	    TextDrawHideForPlayer(playerid, DewataPhone[34]);
	    TextDrawHideForPlayer(playerid, DewataPhone[45]);
	}
}
function PunyaMbanking(playerid)
{
	if(pData[playerid][pInstallBank])
	{
	    TextDrawShowForPlayer(playerid, DewataPhone[25]);
	    TextDrawShowForPlayer(playerid, DewataPhone[35]);
	    TextDrawShowForPlayer(playerid, DewataPhone[44]);
	}
	else
	{
 		TextDrawHideForPlayer(playerid, DewataPhone[25]);
	    TextDrawHideForPlayer(playerid, DewataPhone[35]);
	    TextDrawHideForPlayer(playerid, DewataPhone[44]);
	}
}
function PunyaTwitter(playerid)
{
	if(pData[playerid][pInstallTweet])
	{
	    TextDrawShowForPlayer(playerid, DewataPhone[26]);
	    TextDrawShowForPlayer(playerid, DewataPhone[36]);
	    TextDrawShowForPlayer(playerid, DewataPhone[46]);
	}
	else
	{
 		TextDrawHideForPlayer(playerid, DewataPhone[26]);
	    TextDrawHideForPlayer(playerid, DewataPhone[36]);
	    TextDrawHideForPlayer(playerid, DewataPhone[46]);
	}
}
function PunyaGojek(playerid)
{
	if(pData[playerid][pInstallGojek])
	{
	    TextDrawShowForPlayer(playerid, DewataPhone[27]);
	    TextDrawShowForPlayer(playerid, DewataPhone[37]);
	    TextDrawShowForPlayer(playerid, DewataPhone[47]);
	}
	else
	{
 		TextDrawHideForPlayer(playerid, DewataPhone[27]);
	    TextDrawHideForPlayer(playerid, DewataPhone[37]);
	    TextDrawHideForPlayer(playerid, DewataPhone[47]);
	}
}
function DownloadTweet(playerid)
{
	pData[playerid][pInstallTweet] = 1;
	SuccesMsg(playerid, "AppStore telah selesai menginstall Twitter");
	TextDrawHideForPlayer(playerid, DewataAppStore[37]);
	TextDrawSetString(DewataAppStore[37], "Terinstall");
	TextDrawShowForPlayer(playerid, DewataAppStore[37]);
	return 1;
}
function DownloadMap(playerid)
{
	pData[playerid][pInstallMap] = 1;
	SuccesMsg(playerid, "AppStore telah selesai menginstall Google Map");
	TextDrawHideForPlayer(playerid, DewataAppStore[35]);
	TextDrawSetString(DewataAppStore[35], "Terinstall");
	TextDrawShowForPlayer(playerid, DewataAppStore[35]);
	return 1;
}
function DownloadBank(playerid)
{
	pData[playerid][pInstallBank] = 1;
	SuccesMsg(playerid, "AppStore telah selesai menginstall Mbanking");
	TextDrawHideForPlayer(playerid, DewataAppStore[41]);
	TextDrawSetString(DewataAppStore[41], "Terinstall");
	TextDrawShowForPlayer(playerid, DewataAppStore[41]);
	return 1;
}
function DownloadGojek(playerid)
{
	pData[playerid][pInstallGojek] = 1;
	SuccesMsg(playerid, "AppStore telah selesai menginstall Gojek");
	TextDrawHideForPlayer(playerid, DewataAppStore[39]);
	TextDrawSetString(DewataAppStore[39], "Terinstall");
	TextDrawShowForPlayer(playerid, DewataAppStore[39]);
	return 1;
}
function GojekAppStore(playerid)
{
	if(pData[playerid][pInstallGojek])
	{
	    TextDrawSetString(DewataAppStore[39], "Terinstall");
	}
	else
	{
 		TextDrawSetString(DewataAppStore[39], "Install");
	}
}
function BankAppStore(playerid)
{
	if(pData[playerid][pInstallBank])
	{
	    TextDrawSetString(DewataAppStore[41], "Terinstall");
	}
	else
	{
 		TextDrawSetString(DewataAppStore[41], "Install");
	}
}
function MapAppStore(playerid)
{
	if(pData[playerid][pInstallMap])
	{
	    TextDrawSetString(DewataAppStore[35], "Terinstall");
	}
	else
	{
 		TextDrawSetString(DewataAppStore[35], "Install");
	}
}
function TweetAppStore(playerid)
{
	if(pData[playerid][pInstallTweet])
	{
	    TextDrawSetString(DewataAppStore[37], "Terinstall");
	}
	else
	{
 		TextDrawSetString(DewataAppStore[37], "Install");
	}
}

CMD:fill(playerid, params[])
{
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
		return Error(playerid, "You must driver a vehicle engine.");
	
	new vehid = GetPlayerVehicleID(playerid);
	if(!IsEngineVehicle(vehid))
        return Error(playerid, "You are not in engine vehicle.");
	
	if(GetEngineStatus(vehid))
		return Error(playerid, "Turn off vehicle engine.");
			
	if(GetVehicleFuel(vehid) >= 99.0)
		return Error(playerid, "This vehicle gas is full.");
	
	if(pData[playerid][pFill] != -1)
		return Error(playerid, "You already filling vehicle. please wait!");
		
	foreach(new gsid : GStation)
	{
		if(IsPlayerInRangeOfPoint(playerid, 4.0, gsData[gsid][gsPosX], gsData[gsid][gsPosY], gsData[gsid][gsPosZ]))
		{
			if(gsData[gsid][gsStock] < 1)
				return Error(playerid, "This Gas station is out of stock!");
			
			pData[playerid][pFill] = gsid;
			pData[playerid][pFillStatus] = 1;
			pData[playerid][pFillTime] = SetTimerEx("Filling", 7000, true, "i", playerid);
			ShowProgressbar(playerid, "Refuel", 7);
		}
	}
	return 1;
}

function Filling(playerid)
{
	if(pData[playerid][pFillStatus] != 1) return 0;
	foreach(new gsid : GStation)
	{
		if(!IsPlayerInRangeOfPoint(playerid, 4.0, gsData[gsid][gsPosX], gsData[gsid][gsPosY], gsData[gsid][gsPosZ]) && !IsPlayerInAnyVehicle(playerid) || GetVehicleFuel(GetPlayerVehicleID(playerid)) >= 999.0 || GetPlayerMoney(playerid) < GStationPrice)
		{
			StopFilling(playerid);
			return 1;
		}
		else
		{
			if(GetEngineStatus(GetPlayerVehicleID(playerid)))
				return StopFilling(playerid);
			new old = GetVehicleFuel(GetPlayerVehicleID(playerid));
			SetVehicleFuel(GetPlayerVehicleID(playerid), old + 20);
			pData[playerid][pFillPrice] += GStationPrice;
			gsData[pData[playerid][pFill]][gsStock] -= 10;
			if(GetVehicleFuel(GetPlayerVehicleID(playerid)) >= 99)
			{
				SetVehicleFuel(GetPlayerVehicleID(playerid), 100);
			}
			return 1;
		}
	}
	return 1;
}

StopFilling(playerid)
{
	new gsid = pData[playerid][pFill];
	GivePlayerMoneyEx(playerid, -pData[playerid][pFillPrice]);
	GStation_Refresh(gsid);
	Info(playerid,"Tangki kendaraan anda sudah terisi seharga "RED_E"%s.", FormatMoney(pData[playerid][pFillPrice]));
	KillTimer(pData[playerid][pFillTime]);
	pData[playerid][pFillStatus] = 0;
	pData[playerid][pFillPrice] = 0;
	pData[playerid][pFill] = -1;
	return 1;
}
