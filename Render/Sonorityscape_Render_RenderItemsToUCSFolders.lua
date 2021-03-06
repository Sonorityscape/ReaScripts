--[[ 
@version 1.0
Script Name: Render Items To UCS Folders
Author: Daniel Petras
Contact: daniel@sonorityscape.com
Website: http://sonorityscape.com/
Repository: https://github.com/Sonorityscape/ReaScripts.git
Version Last Tested: REAPER v6.25
Description: Renders selected items with UCS compliant names to UCS folders
Instructions: Be sure to set your UCS root folder in the 'User Settings"
--]]


--------------User Settings--------------

ucs_root_folder = "C:\\Users\\Sonorityscape\\Desktop\\test" -- Change to your UCS root directory
open_to_file = true -- Ppens to the file in explorer after it has been rendered
sample_rate = 48000
channels = 2
format = "ffia"
--[[
WAV = "evaw"
MP3 = "l3pm"
FLAC = "calf"
AIFF = "ffia"
--]]

-----------------------------------------


ucs_table = 
{ 
["AIRMisc"] = "\\AIR\\MISC",
["AIRBlow"] = "\\AIR\\BLOW",
["AIRBrst"] = "\\AIR\\BURST",
["AIRHiss"] = "\\AIR\\HISS",
["AIRSuck"] = "\\AIR\\SUCTION",
["AEROMisc"] = "\\AERO\\MISC",
["AEROHeli"] = "\\AERO\\HELICOPTER",
["AEROJet"] = "\\AERO\\JET",
["AEROMech"] = "\\AERO\\MECHANISM",
["AEROMil"] = "\\AERO\\MILITARY",
["AEROProp"] = "\\AERO\\PROP",
["AERORadio"] = "\\AERO\\RADIO CONTROLLED",
["AERORckt"] = "\\AERO\\ROCKET",
["ALRMMisc"] = "\\ALRM\\MISC",
["ALRMBell"] = "\\ALRM\\BELL",
["ALRMBuzr"] = "\\ALRM\\BUZZER",
["ALRMClok"] = "\\ALRM\\CLOCK",
["ALRMElec"] = "\\ALRM\\ELECTRONIC",
["ALRMSirn"] = "\\ALRM\\SIREN",
["AMBMisc"] = "\\AMB\\MISC",
["AMBAmus"] = "\\AMB\\AMUSEMENT",
["AMBBird"] = "\\AMB\\BIRDSONG",
["AMBCele"] = "\\AMB\\CELEBRATION",
["AMBCnst"] = "\\AMB\\CONSTRUCTION",
["AMBDsrt"] = "\\AMB\\DESERT",
["AMBDsgn"] = "\\AMB\\DESIGNED",
["AMBEmrg"] = "\\AMB\\EMERGENCY",
["AMBFarm"] = "\\AMB\\FARM",
["AMBForst"] = "\\AMB\\FOREST",
["AMBHist"] = "\\AMB\\HISTORICAL",
["AMBTech"] = "\\AMB\\HITECH",
["AMBHosp"] = "\\AMB\\HOSPITAL",
["AMBInd"] = "\\AMB\\INDUSTRIAL",
["AMBMrkt"] = "\\AMB\\MARKET",
["AMBNaut"] = "\\AMB\\NAUTICAL",
["AMBOffc"] = "\\AMB\\OFFICE",
["AMBPrisn"] = "\\AMB\\PRISON",
["AMBPubl"] = "\\AMB\\PUBLIC PLACE",
["AMBRlgn"] = "\\AMB\\RELIGIOUS",
["AMBRest"] = "\\AMB\\RESTAURANT _ BAR",
["AMBRoom"] = "\\AMB\\ROOM TONE",
["AMBRurl"] = "\\AMB\\RURAL",
["AMBSchl"] = "\\AMB\\SCHOOL",
["AMBSea"] = "\\AMB\\SEASIDE",
["AMBSprt"] = "\\AMB\\SPORT",
["AMBSubn"] = "\\AMB\\SUBURBAN",
["AMBSwmp"] = "\\AMB\\SWAMP",
["AMBTraf"] = "\\AMB\\TRAFFIC",
["AMBTran"] = "\\AMB\\TRANSPORTATION",
["AMBTrop"] = "\\AMB\\TROPICAL",
["AMBUndr"] = "\\AMB\\UNDERGROUND",
["AMBUndwtr"] = "\\AMB\\UNDERWATER",
["AMBUrbn"] = "\\AMB\\URBAN",
["AMBWar"] = "\\AMB\\WARFARE",
["ANMLMisc"] = "\\ANML\\MISC",
["ANMLAmph"] = "\\ANML\\AMPHIBIAN",
["ANMLAqua"] = "\\ANML\\AQUATIC",
["ANMLBat"] = "\\ANML\\BAT",
["ANMLCat"] = "\\ANML\\CAT DOMESTIC",
["ANMLWcat"] = "\\ANML\\CAT WILD",
["ANMLDog"] = "\\ANML\\DOG",
["ANMLFarm"] = "\\ANML\\FARM",
["ANMLHors"] = "\\ANML\\HORSE",
["ANMLInsc"] = "\\ANML\\INSECT",
["ANMLPrim"] = "\\ANML\\PRIMATE",
["ANMLRept"] = "\\ANML\\REPTILE",
["ANMLRdnt"] = "\\ANML\\RODENT",
["ANMLWild"] = "\\ANML\\WILD",
["MIX"] = "\\MIX\\MIX",
["BNCE"] = "\\BNCE\\BOUNCE",
["IR"] = "\\IR\\IMPULSE RESPONSE",
["PFX"] = "\\PFX\\PFX",
["RAW"] = "\\RAW\\RAW",
["REF"] = "\\REF\\REFERENCE",
["SCNE"] = "\\SCNE\\SCENE",
["TEST"] = "\\TEST\\TEST TONE",
["TMARK"] = "\\TMARK\\TRADEMARKED",
["WIP"] = "\\WIP\\WORK IN PROGRESS",
["WTF"] = "\\WTF\\WTF",
["BEEP"] = "\\BEEP\\GENERAL",
["BEEPAppl"] = "\\BEEP\\APPLIANCE",
["BEEPLofi"] = "\\BEEP\\LOFI",
["BEEPMed"] = "\\BEEP\\MEDICAL",
["BEEPTimer"] = "\\BEEP\\TIMER",
["BEEPVeh"] = "\\BEEP\\VEHICLE",
["BELLMisc"] = "\\BELL\\MISC",
["BELLAnml"] = "\\BELL\\ANIMAL",
["BELLDoor"] = "\\BELL\\DOORBELL",
["BELLGong"] = "\\BELL\\GONG",
["BELLHand"] = "\\BELL\\HANDBELL",
["BELLLrg"] = "\\BELL\\LARGE",
["BIRDMisc"] = "\\BIRD\\MISC",
["BIRDPrey"] = "\\BIRD\\BIRD OF PREY",
["BIRDCrow"] = "\\BIRD\\CROW",
["BIRDFowl"] = "\\BIRD\\FOWL",
["BIRDSong"] = "\\BIRD\\SONGBIRD",
["BIRDSea"] = "\\BIRD\\SEA",
["BIRDTrop"] = "\\BIRD\\TROPICAL",
["BIRDWade"] = "\\BIRD\\WADING",
["BOATMisc"] = "\\BOAT\\MISC",
["BOATAir"] = "\\BOAT\\AIR BOAT",
["BOATWash"] = "\\BOAT\\BOW WASH",
["BOATElec"] = "\\BOAT\\ELECTRIC",
["BOATFish"] = "\\BOAT\\FISHING",
["BOATHorn"] = "\\BOAT\\HORN",
["BOATMech"] = "\\BOAT\\MECHANISM",
["BOATMil"] = "\\BOAT\\MILITARY",
["BOATMotr"] = "\\BOAT\\MOTORBOAT",
["BOATRace"] = "\\BOAT\\RACING",
["BOATRow"] = "\\BOAT\\ROWBOAT",
["BOATSail"] = "\\BOAT\\SAILBOAT",
["BOATShip"] = "\\BOAT\\SHIP",
["BOATStm"] = "\\BOAT\\STEAM",
["BOATSub"] = "\\BOAT\\SUBMARINE",
["BLLTMisc"] = "\\BLLT\\MISC",
["BLLTBy"] = "\\BLLT\\BY",
["BLLTImpt"] = "\\BLLT\\IMPACT",
["BLLTShel"] = "\\BLLT\\SHELL",
["BLLTRico"] = "\\BLLT\\RICOCHET",
["TOONMisc"] = "\\TOON\\MISC",
["TOONBoing"] = "\\TOON\\BOING",
["TOONClang"] = "\\TOON\\CLANG",
["TOONCreak"] = "\\TOON\\CREAK",
["TOONHorn"] = "\\TOON\\HORN",
["TOONImpt"] = "\\TOON\\IMPACT",
["TOONMx"] = "\\TOON\\MUSICAL",
["TOONPop"] = "\\TOON\\POP",
["TOONPluk"] = "\\TOON\\PLUCK",
["TOONShake"] = "\\TOON\\SHAKE",
["TOONSplt"] = "\\TOON\\SPLAT",
["TOONSqk"] = "\\TOON\\SQUEAK",
["TOONStrch"] = "\\TOON\\STRETCH",
["TOONSwsh"] = "\\TOON\\SWISH",
["TOONTwang"] = "\\TOON\\TWANG",
["TOONWarb"] = "\\TOON\\WARBLE",
["TOONWhis"] = "\\TOON\\WHISTLE",
["TOONZip"] = "\\TOON\\ZIP",
["CERMMisc"] = "\\CERM\\MISC",
["CERMBrk"] = "\\CERM\\BREAK",
["CERMCrsh"] = "\\CERM\\CRASH _ DEBRIS",
["CERMFric"] = "\\CERM\\FRICTION",
["CERMImpt"] = "\\CERM\\IMPACT",
["CERMMvmt"] = "\\CERM\\MOVEMENT",
["CERMTonl"] = "\\CERM\\TONAL",
["CHAINMisc"] = "\\CHAIN\\MISC",
["CHAINBrk"] = "\\CHAIN\\BREAK",
["CHAINImpt"] = "\\CHAIN\\IMPACT",
["CHAINMvmt"] = "\\CHAIN\\MOVEMENT",
["CHEMMisc"] = "\\CHEM\\MISC",
["CHEMAcid"] = "\\CHEM\\ACID",
["CHEMReac"] = "\\CHEM\\REACTION",
["CLOCKMisc"] = "\\CLOCK\\MISC",
["CLOCKMech"] = "\\CLOCK\\MECHANICS",
["CLOCKChim"] = "\\CLOCK\\CHIME",
["CLOCKTick"] = "\\CLOCK\\TICK",
["CLOTHMisc"] = "\\CLOTH\\MISC",
["CLOTHFlp"] = "\\CLOTH\\FLAP",
["CLOTHMvmt"] = "\\CLOTH\\MOVEMENT",
["CLOTHRip"] = "\\CLOTH\\RIP",
["COMMisc"] = "\\COM\\MISC",
["COMAv"] = "\\COM\\AUDIO VISUAL",
["COMCam"] = "\\COM\\CAMERA",
["COMCell"] = "\\COM\\CELLPHONE",
["COMMic"] = "\\COM\\MICROPHONE",
["COMPhono"] = "\\COM\\PHONOGRAPH",
["COMRadio"] = "\\COM\\RADIO",
["COMStatic"] = "\\COM\\STATIC",
["COMTelm"] = "\\COM\\TELEMETRY",
["COMTelph"] = "\\COM\\TELEPHONE",
["COMTv"] = "\\COM\\TELEVISION",
["COMTran"] = "\\COM\\TRANSCEIVER",
["COMType"] = "\\COM\\TYPEWRITER",
["CMPTMisc"] = "\\CMPT\\MISC",
["CMPTDriv"] = "\\CMPT\\HARD DRIVE",
["CMPTKey"] = "\\CMPT\\KEYBOARD _ MOUSE",
["CREAMisc"] = "\\CREA\\MISC",
["CREAAqua"] = "\\CREA\\AQUATIC",
["CREABeast"] = "\\CREA\\BEAST",
["CREABlob"] = "\\CREA\\BLOB",
["CREADino"] = "\\CREA\\DINOSAUR",
["CREADrgn"] = "\\CREA\\DRAGON",
["CREAElem"] = "\\CREA\\ELEMENTAL",
["CREAEthr"] = "\\CREA\\ETHEREAL",
["CREAHmn"] = "\\CREA\\HUMANOID",
["CREAInsc"] = "\\CREA\\INSECTOID",
["CREAMnstr"] = "\\CREA\\MONSTER",
["CREARept"] = "\\CREA\\REPTILIAN",
["CREASmall"] = "\\CREA\\SMALL",
["CREASrce"] = "\\CREA\\SOURCE",
["CREAAvian"] = "\\CREA\\AVIAN",
["CRWDMisc"] = "\\CRWD\\MISC",
["CRWDAngr"] = "\\CRWD\\ANGRY",
["CRWDApls"] = "\\CRWD\\APPLAUSE",
["CRWDBatl"] = "\\CRWD\\BATTLE",
["CRWDCele"] = "\\CRWD\\CELEBRATION",
["CRWDCheer"] = "\\CRWD\\CHEERING",
["CRWDChld"] = "\\CRWD\\CHILDREN",
["CRWDConv"] = "\\CRWD\\CONVERSATION",
["CRWDLaff"] = "\\CRWD\\LAUGHTER",
["CRWDLoop"] = "\\CRWD\\LOOP GROUP",
["CRWDPanic"] = "\\CRWD\\PANIC",
["CRWDQuiet"] = "\\CRWD\\QUIET",
["CRWDReac"] = "\\CRWD\\REACTION",
["CRWDSing"] = "\\CRWD\\SINGING",
["CRWDSprt"] = "\\CRWD\\SPORT",
["CRWDWalla"] = "\\CRWD\\WALLA",
["DSGNMisc"] = "\\DSGN\\MISC",
["DSGNBass"] = "\\DSGN\\BASS DIVE",
["DSGNBoom"] = "\\DSGN\\BOOM",
["DSGNBram"] = "\\DSGN\\BRAAM",
["DSGNDron"] = "\\DSGN\\DRONE",
["DSGNErie"] = "\\DSGN\\EERIE",
["DSGNEthr"] = "\\DSGN\\ETHEREAL",
["DSGNRise"] = "\\DSGN\\RISER",
["DSGNRmbl"] = "\\DSGN\\RUMBLE",
["DSGNStngr"] = "\\DSGN\\STINGER",
["DSGNSynth"] = "\\DSGN\\SYNTHETIC",
["DSGNTonl"] = "\\DSGN\\TONAL",
["DESTRMisc"] = "\\DESTR\\MISC",
["DESTRCrsh"] = "\\DESTR\\CRASH _ DEBRIS",
["DESTRClpse"] = "\\DESTR\\COLLAPSE",
["DIRTMisc"] = "\\DIRT\\MISC",
["DIRTCrsh"] = "\\DIRT\\CRASH _ DEBRIS",
["DIRTDust"] = "\\DIRT\\DUST",
["DIRTImpt"] = "\\DIRT\\IMPACT",
["DIRTMvmt"] = "\\DIRT\\MOVEMENT",
["DOORMisc"] = "\\DOOR\\MISC",
["DOORAntq"] = "\\DOOR\\ANTIQUE",
["DOORAppl"] = "\\DOOR\\APPLIANCE",
["DOORCab"] = "\\DOOR\\CABINET",
["DOORDungn"] = "\\DOOR\\DUNGEON",
["DOORElec"] = "\\DOOR\\ELECTRIC",
["DOORGate"] = "\\DOOR\\GATE",
["DOORGlas"] = "\\DOOR\\GLASS",
["DOORHdwr"] = "\\DOOR\\HARDWARE",
["DOORTech"] = "\\DOOR\\HITECH",
["DOORHydr"] = "\\DOOR\\HYDRAULIC _ PNEUMATIC",
["DOORKnck"] = "\\DOOR\\KNOCK",
["DOORMetl"] = "\\DOOR\\METAL",
["DOORPlas"] = "\\DOOR\\PLASTIC",
["DOORPrisn"] = "\\DOOR\\PRISON",
["DOORRevl"] = "\\DOOR\\REVOLVING",
["DOORSlid"] = "\\DOOR\\SLIDING",
["DOORSton"] = "\\DOOR\\STONE",
["DOORSwng"] = "\\DOOR\\SWINGING",
["DOORWood"] = "\\DOOR\\WOOD",
["DRWRMisc"] = "\\DRWR\\MISC",
["DRWRMetl"] = "\\DRWR\\METAL",
["DRWRPlas"] = "\\DRWR\\PLASTIC",
["DRWRWood"] = "\\DRWR\\WOOD",
["ELECMisc"] = "\\ELEC\\MISC",
["ELECArc"] = "\\ELEC\\ARC",
["ELECEmf"] = "\\ELEC\\ELECTROMAGNETIC",
["ELECBuzz"] = "\\ELEC\\BUZZ _ HUM",
["ELECSprk"] = "\\ELEC\\SPARKS",
["ELECZap"] = "\\ELEC\\ZAP",
["EQUIPMisc"] = "\\EQUIP\\MISC",
["EQUIPBridle"] = "\\EQUIP\\BRIDLE _ TACK",
["EQUIPTech"] = "\\EQUIP\\HITECH",
["EQUIPRec"] = "\\EQUIP\\RECREATIONAL",
["EQUISprt"] = "\\EQUIP\\SPORT",
["EQUIPTact"] = "\\EQUIP\\TACTICAL",
["EXPLMisc"] = "\\EXPL\\MISC",
["EXPLReal"] = "\\EXPL\\REAL",
["EXPLDsgn"] = "\\EXPL\\DESIGNED",
["FARTMisc"] = "\\FART\\MISC",
["FARTReal"] = "\\FART\\REAL",
["FARTDsgn"] = "\\FART\\DESIGNED",
["FGHTMisc"] = "\\FGHT\\MISC",
["FGHTBf"] = "\\FGHT\\BODYFALL",
["FGHTClth"] = "\\FGHT\\CLOTH",
["FGHTGrab"] = "\\FGHT\\GRAB",
["FGHTImpt"] = "\\FGHT\\IMPACT",
["FIREMisc"] = "\\FIRE\\MISC",
["FIREBurn"] = "\\FIRE\\BURNING",
["FIREBrst"] = "\\FIRE\\BURST",
["FIRECrkl"] = "\\FIRE\\CRACKLE",
["FIREIgn"] = "\\FIRE\\IGNITE",
["FIREGas"] = "\\FIRE\\GAS",
["FIRESizz"] = "\\FIRE\\SIZZLE",
["FIRETrch"] = "\\FIRE\\TORCH",
["FIREWhsh"] = "\\FIRE\\WHOOSH",
["FRWKMisc"] = "\\FRWK\\MISC",
["FRWKComr"] = "\\FRWK\\COMMERCIAL",
["FRWKRec"] = "\\FRWK\\RECREATIONAL",
["FOLYMisc"] = "\\FOLY\\MISC",
["FOLYClth"] = "\\FOLY\\CLOTH",
["FOLYFeet"] = "\\FOLY\\FEET",
["FOLYHand"] = "\\FOLY\\HANDS",
["FOLYProp"] = "\\FOLY\\PROP",
["FOODMisc"] = "\\FOOD\\MISC",
["FOODCook"] = "\\FOOD\\COOKING",
["FOODDrnk"] = "\\FOOD\\DRINKING",
["FOODEat"] = "\\FOOD\\EATING",
["FOODGware"] = "\\FOOD\\GLASSWARE",
["FOODIngr"] = "\\FOOD\\INGREDIENTS",
["FOODKware"] = "\\FOOD\\KITCHENWARE",
["FOODTware"] = "\\FOOD\\TABLEWARE",
["FEETMisc"] = "\\FEET\\MISC",
["FEETAnml"] = "\\FEET\\ANIMAL",
["FEETCrea"] = "\\FEET\\CREATURE",
["FEETHors"] = "\\FEET\\HORSE",
["FEETHmn"] = "\\FEET\\HUMAN",
["GAMEMisc"] = "\\GAME\\MISC",
["GAMEArcd"] = "\\GAME\\ARCADE",
["GAMEBoard"] = "\\GAME\\BOARD",
["GAMECas"] = "\\GAME\\CASINO",
["GAMEVideo"] = "\\GAME\\VIDEO",
["GEOMisc"] = "\\GEO\\MISC",
["GEOLava"] = "\\GEO\\LAVA",
["GEOGeyser"] = "\\GEO\\GEYSER",
["GEOMudpot"] = "\\GEO\\MUD POTS",
["GEOFuma"] = "\\GEO\\FUMAROLE",
["GLASMisc"] = "\\GLAS\\MISC",
["GLASBrk"] = "\\GLAS\\BREAK",
["GLASCrsh"] = "\\GLAS\\CRASH _ DEBRIS",
["GLASFric"] = "\\GLAS\\FRICTION",
["GLASImpt"] = "\\GLAS\\IMPACT",
["GLASMvmt"] = "\\GLAS\\MOVEMENT",
["GLASTonl"] = "\\GLAS\\TONAL",
["GOREMisc"] = "\\GORE\\MISC",
["GOREBlood"] = "\\GORE\\BLOOD",
["GOREBone"] = "\\GORE\\BONE",
["GOREBurn"] = "\\GORE\\BURN",
["GOREFlsh"] = "\\GORE\\FLESH",
["GOREOoze"] = "\\GORE\\OOZE",
["GORESplt"] = "\\GORE\\SPLAT",
["GORESqsh"] = "\\GORE\\SQUISH",
["GOREStab"] = "\\GORE\\STAB",
["GUNMisc"] = "\\GUN\\MISC",
["GUNAntq"] = "\\GUN\\ANTIQUE",
["GUNArtl"] = "\\GUN\\ARTILLERY",
["GUNAuto"] = "\\GUN\\AUTOMATIC",
["GUNCano"] = "\\GUN\\CANNON",
["GUNTech"] = "\\GUN\\HITECH",
["GUNMech"] = "\\GUN\\MECHANISM",
["GUNPis"] = "\\GUN\\PISTOL",
["GUNRif"] = "\\GUN\\RIFLE",
["GUNShotg"] = "\\GUN\\SHOTGUN",
["GUNSupr"] = "\\GUN\\SUPPRESSED",
["HORNMisc"] = "\\HORN\\MISC",
["HORNAir"] = "\\HORN\\AIR POWERED",
["HORNCele"] = "\\HORN\\CELEBRATION",
["HORNTrad"] = "\\HORN\\TRADITIONAL",
["HMNMisc"] = "\\HMN\\MISC",
["HMNBrth"] = "\\HMN\\BREATH",
["HMNBurp"] = "\\HMN\\BURP",
["HMNCough"] = "\\HMN\\COUGH",
["HMNHart"] = "\\HMN\\HEARTBEAT",
["HMNKiss"] = "\\HMN\\KISS",
["HMNSneez"] = "\\HMN\\SNEEZE",
["HMNSnor"] = "\\HMN\\SNORE",
["HMNSpit"] = "\\HMN\\SPIT",
["ICEMisc"] = "\\ICE\\MISC",
["ICEBrk"] = "\\ICE\\BREAK",
["ICECrsh"] = "\\ICE\\CRASH _ DEBRIS",
["ICEFric"] = "\\ICE\\FRICTION",
["ICEImpt"] = "\\ICE\\IMPACT",
["ICEMvmt"] = "\\ICE\\MOVEMENT",
["ICETonl"] = "\\ICE\\TONAL",
["LASRMisc"] = "\\LASR\\MISC",
["LASRBeam"] = "\\LASR\\BEAM",
["LASRGun"] = "\\LASR\\GUN",
["LASRImpt"] = "\\LASR\\IMPACT",
["LETHRMisc"] = "\\LETHR\\MISC",
["LETHRCreak"] = "\\LETHR\\CREAK",
["LETHRImpt"] = "\\LETHR\\IMPACT",
["LETHRMvmt"] = "\\LETHR\\MOVEMENT",
["LIQMisc"] = "\\LIQ\\MISC",
["LIQBubl"] = "\\LIQ\\BUBBLES",
["LIQImpt"] = "\\LIQ\\IMPACT",
["LIQMvmt"] = "\\LIQ\\MOVEMENT",
["LIQSuct"] = "\\LIQ\\SUCTION",
["MACHMisc"] = "\\MACH\\MISC",
["MACHAmus"] = "\\MACH\\AMUSEMENT",
["MACHAntq"] = "\\MACH\\ANTIQUE",
["MACHAppl"] = "\\MACH\\APPLIANCE",
["MACHCnst"] = "\\MACH\\CONSTRUCTION",
["MACHElev"] = "\\MACH\\ELEVATOR",
["MACHEscl"] = "\\MACH\\ESCALATOR",
["MACHFan"] = "\\MACH\\FAN",
["MACHTech"] = "\\MACH\\HITECH",
["MACHHvac"] = "\\MACH\\HVAC",
["MACHInd"] = "\\MACH\\INDUSTRIAL",
["MACHMech"] = "\\MACH\\MECHANISM",
["MACHMed"] = "\\MACH\\MEDICAL",
["MACHOffi"] = "\\MACH\\OFFICE",
["MACHPump"] = "\\MACH\\PUMP",
["MAGMisc"] = "\\MAG\\MISC",
["MAGAngl"] = "\\MAG\\ANGELIC",
["MAGElem"] = "\\MAG\\ELEMENTAL",
["MAGEvil"] = "\\MAG\\EVIL",
["MAGPoof"] = "\\MAG\\POOF",
["MAGShim"] = "\\MAG\\SHIMMER",
["MAGSpel"] = "\\MAG\\SPELL",
["MECHMisc"] = "\\MECH\\MISC",
["MECHClik"] = "\\MECH\\CLICK",
["MECHGear"] = "\\MECH\\GEARS",
["MECHHydr"] = "\\MECH\\HYDRAULIC _ PNEUMATIC",
["MECHLtch"] = "\\MECH\\LATCH",
["MECHLvr"] = "\\MECH\\LEVER",
["MECHLock"] = "\\MECH\\LOCK",
["MECHPuly"] = "\\MECH\\PULLEY",
["MECHRtch"] = "\\MECH\\RATCHET",
["MECHRelay"] = "\\MECH\\RELAY",
["MECHRolr"] = "\\MECH\\ROLLER",
["MECHSwtch"] = "\\MECH\\SWITCH",
["METLMisc"] = "\\METL\\MISC",
["METLBrk"] = "\\METL\\BREAK",
["METLCrsh"] = "\\METL\\CRASH _ DEBRIS",
["METLFric"] = "\\METL\\FRICTION",
["METLImpt"] = "\\METL\\IMPACT",
["METLMvmt"] = "\\METL\\MOVEMENT",
["METLTonl"] = "\\METL\\TONAL",
["MOTRMisc"] = "\\MOTR\\MISC",
["MOTRAntq"] = "\\MOTR\\ANTIQUE",
["MOTRComb"] = "\\MOTR\\COMBUSTION",
["MOTRElec"] = "\\MOTR\\ELECTRIC",
["MOTRSrvo"] = "\\MOTR\\SERVO",
["MOTRTurb"] = "\\MOTR\\TURBINE",
["MOVEMisc"] = "\\MOVE\\MISC",
["MOVEActv"] = "\\MOVE\\ACTIVITY",
["MOVEAnml"] = "\\MOVE\\ANIMAL",
["MOVECrea"] = "\\MOVE\\CREATURE",
["MOVECrwd"] = "\\MOVE\\CROWD",
["MOVEInsc"] = "\\MOVE\\INSECT",
["MOVEPres"] = "\\MOVE\\PRESENCE",
["MUSCMisc"] = "\\MUSC\\MISC",
["MUSCBrass"] = "\\MUSC\\BRASS",
["MUSCChim"] = "\\MUSC\\CHIME",
["MUSCChor"] = "\\MUSC\\CHORAL",
["MUSCInst"] = "\\MUSC\\INSTRUMENT",
["MUSCLoop"] = "\\MUSC\\LOOP",
["MUSCPerc"] = "\\MUSC\\PERCUSSION",
["MUSCSmpl"] = "\\MUSC\\SAMPLE",
["MUSCSong"] = "\\MUSC\\SONG _ PHRASE",
["MUSCStngr"] = "\\MUSC\\STINGER",
["MUSCStr"] = "\\MUSC\\STRINGED",
["MUSCWind"] = "\\MUSC\\WOODWIND",
["MUSCToy"] = "\\MUSC\\TOY",
["NATDMisc"] = "\\NATD\\MISC",
["NATDAval"] = "\\NATD\\AVALANCHE",
["NATDQuak"] = "\\NATD\\EARTHQUAKE",
["NATDTorn"] = "\\NATD\\TORNADO",
["NATDTsun"] = "\\NATD\\TSUNAMI",
["NATDThyp"] = "\\NATD\\TYPHOON",
["NATDVolc"] = "\\NATD\\VOLCANO",
["OBJMisc"] = "\\OBJ\\MISC",
["OBJBag"] = "\\OBJ\\BAG",
["OBJCoin"] = "\\OBJ\\COIN",
["OBJFurn"] = "\\OBJ\\FURNITURE",
["OBJHsehld"] = "\\OBJ\\HOUSEHOLD",
["OBJJewl"] = "\\OBJ\\JEWELRY",
["OBJLug"] = "\\OBJ\\LUGGAGE",
["OBJKey"] = "\\OBJ\\KEYS",
["OBJMed"] = "\\OBJ\\MEDICAL",
["OBJPack"] = "\\OBJ\\PACKAGING",
["OBJTape"] = "\\OBJ\\TAPE",
["OBJUmbr"] = "\\OBJ\\UMBRELLA",
["OBJWhled"] = "\\OBJ\\WHEELED",
["OBJWrite"] = "\\OBJ\\WRITING",
["OBJZipr"] = "\\OBJ\\ZIPPER",
["PAPRMisc"] = "\\PAPR\\MISC",
["PAPRFltr"] = "\\PAPR\\FLUTTER",
["PAPRHndl"] = "\\PAPR\\HANDLE",
["PAPRRip"] = "\\PAPR\\RIP",
["PLASMisc"] = "\\PLAS\\MISC",
["PLASBrk"] = "\\PLAS\\BREAK",
["PLASCrsh"] = "\\PLAS\\CRASH _ DEBRIS",
["PLASFric"] = "\\PLAS\\FRICTION",
["PLASImpt"] = "\\PLAS\\IMPACT",
["PLASMvmt"] = "\\PLAS\\MOVEMENT",
["RAIN"] = "\\RAIN\\GENERAL",
["RAINClth"] = "\\RAIN\\CLOTH",
["RAINConc"] = "\\RAIN\\CONCRETE",
["RAINGlas"] = "\\RAIN\\GLASS",
["RAINMetl"] = "\\RAIN\\METAL",
["RAINPlas"] = "\\RAIN\\PLASTIC",
["RAINVege"] = "\\RAIN\\VEGETATION",
["RAINWood"] = "\\RAIN\\WOOD",
["RAINWatr"] = "\\RAIN\\WATER",
["ROBTMisc"] = "\\ROBT\\MISC",
["ROBTMvmt"] = "\\ROBT\\MOVEMENT",
["ROBTVox"] = "\\ROBT\\VOCAL",
["ROCKMisc"] = "\\ROCK\\MISC",
["ROCKBrk"] = "\\ROCK\\BREAK",
["ROCKCrsh"] = "\\ROCK\\CRASH _ DEBRIS",
["ROCKFric"] = "\\ROCK\\FRICTION",
["ROCKImpt"] = "\\ROCK\\IMPACT",
["ROCKMvmt"] = "\\ROCK\\MOVEMENT",
["ROCKTonl"] = "\\ROCK\\TONAL",
["ROPEMisc"] = "\\ROPE\\MISC",
["ROPECreak"] = "\\ROPE\\CREAK",
["ROPEMvmt"] = "\\ROPE\\MOVEMENT",
["RUBRMisc"] = "\\RUBR\\MISC",
["RUBRCrsh"] = "\\RUBR\\CRASH _ DEBRIS",
["RUBRFric"] = "\\RUBR\\FRICTION",
["RUBRImpt"] = "\\RUBR\\IMPACT",
["RUBRMvmt"] = "\\RUBR\\MOVEMENT",
["SCIMisc"] = "\\SCI\\MISC",
["SCIAlrm"] = "\\SCI\\ALARM",
["SCICmpt"] = "\\SCI\\COMPUTER",
["SCIDoor"] = "\\SCI\\DOOR",
["SCIEnrg"] = "\\SCI\\ENERGY",
["SCIMach"] = "\\SCI\\MACHINE",
["SCIRetro"] = "\\SCI\\RETRO",
["SCIShip"] = "\\SCI\\SPACESHIP",
["SCIVeh"] = "\\SCI\\VEHICLE",
["SCIWeap"] = "\\SCI\\WEAPON",
["SNOWMisc"] = "\\SNOW\\MISC",
["SNOWCrsh"] = "\\SNOW\\CRASH _ DEBRIS",
["SNOWFric"] = "\\SNOW\\FRICTION",
["SNOWImpt"] = "\\SNOW\\IMPACT",
["SNOWMvmt"] = "\\SNOW\\MOVEMENT",
["SPRTMisc"] = "\\SPRT\\MISC",
["SPRTCourt"] = "\\SPRT\\COURT",
["SPRTField"] = "\\SPRT\\FIELD",
["SPRTGym"] = "\\SPRT\\GYM",
["SPRTIndor"] = "\\SPRT\\INDOOR",
["SPRTSkate"] = "\\SPRT\\SKATE",
["SPRTTrck"] = "\\SPRT\\TRACK _ FIELD",
["SPRTWatr"] = "\\SPRT\\WATER",
["SPRTWntr"] = "\\SPRT\\WINTER",
["SWSH"] = "\\SWSH\\SWISH",
["WHSH"] = "\\WHSH\\WHOOSH",
["TOOLMisc"] = "\\TOOL\\MISC",
["TOOLHand"] = "\\TOOL\\HAND",
["TOOLPneu"] = "\\TOOL\\PNEUMATIC",
["TOOLPowr"] = "\\TOOL\\POWER",
["TOYMisc"] = "\\TOY\\MISC",
["TOYMech"] = "\\TOY\\MECHANICAL",
["TOYElec"] = "\\TOY\\ELECTRONIC",
["TRNMisc"] = "\\TRN\\MISC",
["TRNBrake"] = "\\TRN\\BRAKE",
["TRNClak"] = "\\TRN\\CLACK",
["TRNDiesl"] = "\\TRN\\DIESEL",
["TRNElec"] = "\\TRN\\ELECTRIC",
["TRNHspd"] = "\\TRN\\HIGH SPEED",
["TRNHorn"] = "\\TRN\\HORN",
["TRNMech"] = "\\TRN\\MECHANISM",
["TRNSteam"] = "\\TRN\\STEAM",
["TRNSbwy"] = "\\TRN\\SUBWAY",
["TRNTram"] = "\\TRN\\TRAM",
["UIMisc"] = "\\UI\\MISC",
["UIAlert"] = "\\UI\\ALERT",
["UIBeep"] = "\\UI\\BEEP",
["UIClick"] = "\\UI\\CLICK",
["UIData"] = "\\UI\\DATA",
["UIGlitch"] = "\\UI\\GLITCH",
["UIMvmt"] = "\\UI\\MOTION",
["VEGEMisc"] = "\\VEGE\\MISC",
["VEGEGras"] = "\\VEGE\\GRASS",
["VEGELeaf"] = "\\VEGE\\LEAVES",
["VEGETree"] = "\\VEGE\\TREE",
["VEHMisc"] = "\\VEH\\MISC",
["VEHAlrm"] = "\\VEH\\ALARM",
["VEHAntq"] = "\\VEH\\ANTIQUE",
["VEHAtv"] = "\\VEH\\ATV",
["VEHBike"] = "\\VEH\\BICYCLE",
["VEHBrake"] = "\\VEH\\BRAKE",
["VEHBus"] = "\\VEH\\BUS",
["VEHCar"] = "\\VEH\\CAR",
["VEHCnst"] = "\\VEH\\CONSTRUCTION",
["VEHDoor"] = "\\VEH\\DOOR",
["VEHElec"] = "\\VEH\\ELECTRIC",
["VEHFarm"] = "\\VEH\\FARM",
["VEHFrght"] = "\\VEH\\FREIGHT",
["VEHHorn"] = "\\VEH\\HORN",
["VEHBy"] = "\\VEH\\GENERIC BY",
["VEHJalop"] = "\\VEH\\JALOPY",
["VEHMech"] = "\\VEH\\MECHANISM",
["VEHMil"] = "\\VEH\\MILITARY",
["VEHMoto"] = "\\VEH\\MOTORCYCLE",
["VEHRace"] = "\\VEH\\RACING",
["VEHSkid"] = "\\VEH\\SKID",
["VEHSirn"] = "\\VEH\\SIREN",
["VEHSusp"] = "\\VEH\\SUSPENSION",
["VEHTire"] = "\\VEH\\TIRE",
["VEHTruck"] = "\\VEH\\TRUCK VAN _ SUV",
["VEHUtil"] = "\\VEH\\UTILITY",
["VEHWagn"] = "\\VEH\\WAGON",
["VEHWndw"] = "\\VEH\\WINDOW",
["VOXMisc"] = "\\VOX\\MISC",
["VOXAlien"] = "\\VOX\\ALIEN",
["VOXBaby"] = "\\VOX\\BABY",
["VOXCheer"] = "\\VOX\\CHEER",
["VOXChld"] = "\\VOX\\CHILD",
["VOXCry"] = "\\VOX\\CRYING",
["VOXEfrt"] = "\\VOX\\EFFORTS",
["VOXFem"] = "\\VOX\\FEMALE",
["VOXFutz"] = "\\VOX\\FUTZED",
["VOXHist"] = "\\VOX\\HISTORICAL",
["VOXLaff"] = "\\VOX\\LAUGH",
["VOXMale"] = "\\VOX\\MALE",
["VOXReac"] = "\\VOX\\REACTION",
["VOXScrm"] = "\\VOX\\SCREAM",
["VOXSing"] = "\\VOX\\SINGING",
["WATRMisc"] = "\\WATR\\MISC",
["WATRBubl"] = "\\WATR\\BUBBLES",
["WATRDran"] = "\\WATR\\DRAIN",
["WATRDrip"] = "\\WATR\\DRIP",
["WATRFizz"] = "\\WATR\\FIZZ",
["WATRFlow"] = "\\WATR\\FLOW",
["WATRFoun"] = "\\WATR\\FOUNTAIN",
["WATRImpt"] = "\\WATR\\IMPACT",
["WATRLap"] = "\\WATR\\LAP",
["WATRMvmt"] = "\\WATR\\MOVEMENT",
["WATRPlmb"] = "\\WATR\\PLUMBING",
["WATRPour"] = "\\WATR\\POUR",
["WATRSplsh"] = "\\WATR\\SPLASH",
["WATRSpray"] = "\\WATR\\SPRAY",
["WATRStm"] = "\\WATR\\STEAM",
["WATRSurf"] = "\\WATR\\SURF",
["WATRTurb"] = "\\WATR\\TURBULENT",
["WATRFall"] = "\\WATR\\WATERFALL",
["WATRWave"] = "\\WATR\\WAVE",
["WEAPMisc"] = "\\WEAP\\MISC",
["WEAPArmr"] = "\\WEAP\\ARMOR",
["WEAPArro"] = "\\WEAP\\ARROW",
["WEAPBlnt"] = "\\WEAP\\BLUNT",
["WEAPBow"] = "\\WEAP\\BOW",
["WEAPKnif"] = "\\WEAP\\KNIFE",
["WEAPPole"] = "\\WEAP\\POLEARM",
["WEAPSiege"] = "\\WEAP\\SIEGE",
["WEAPSwrd"] = "\\WEAP\\SWORD",
["WEAPWhip"] = "\\WEAP\\WHIP",
["WTHR"] = "\\WTHR\\MISC",
["HAIL"] = "\\HAIL\\HAIL",
["STORM"] = "\\STORM\\STORM",
["THUN"] = "\\THUN\\THUNDER",
["WHSTMisc"] = "\\WHST\\MISC",
["WHSTHmn"] = "\\WHST\\HUMAN",
["WHSTMech"] = "\\WHST\\MECHANICAL",
["WIND"] = "\\WIND\\GENERAL",
["WINDDsgn"] = "\\WIND\\DESIGNED",
["WINDGust"] = "\\WIND\\GUST",
["WINDInt"] = "\\WIND\\INTERIOR",
["WINDTonl"] = "\\WIND\\TONAL",
["WINDVege"] = "\\WIND\\VEGETATION",
["WNDWMisc"] = "\\WNDW\\MISC",
["WNDWCover"] = "\\WNDW\\COVERING",
["WNDWHdwr"] = "\\WNDW\\HARDWARE",
["WNDWKnck"] = "\\WNDW\\KNOCK",
["WNDWMetl"] = "\\WNDW\\METAL",
["WNDWPlas"] = "\\WNDW\\PLASTIC",
["WNDWWood"] = "\\WNDW\\WOOD",
["WINGMisc"] = "\\WING\\MISC",
["WINGBird"] = "\\WING\\BIRD",
["WINGCrea"] = "\\WING\\CREATURE",
["WINGInsc"] = "\\WING\\INSECT",
["WOODMisc"] = "\\WOOD\\MISC",
["WOODBrk"] = "\\WOOD\\BREAK",
["WOODCrsh"] = "\\WOOD\\CRASH _ DEBRIS",
["WOODFric"] = "\\WOOD\\FRICTION",
["WOODImpt"] = "\\WOOD\\IMPACT",
["WOODMvmt"] = "\\WOOD\\MOVEMENT",
["WOODTonl"] = "\\WOOD\\TONAL"
}


function Msg(message)

  reaper.ShowConsoleMsg(tostring(message))

end


function set_render_info()
  
  reaper.GetSetProjectInfo_String(0, "RENDER_PATTERN", "$item", true)
  reaper.GetSetProjectInfo_String(0, "RENDER_FORMAT", format, true)
  reaper.GetSetProjectInfo(0, "RENDER_SETTINGS", 64, true)
  reaper.GetSetProjectInfo(0, "RENDER_BOUNDSFLAG ", 4, true)
  reaper.GetSetProjectInfo(0, "RENDER_CHANNELS", channels, true)
  reaper.GetSetProjectInfo(0, "RENDER_SRATE", sample_rate, true)

end


function get_all_items()

  local items = {}
  
  for i = 0, reaper.CountSelectedMediaItems(0) - 1 do
  
    local item = reaper.GetSelectedMediaItem(0, i)
    table.insert(items, item)
  
  end
  
  return items

end


function Render_Items(items, ucs_table)

  reaper.Main_OnCommand(40289, 1) -- Unselect all items

  for i = 1, #items do
  
    local item_prefix, take_name = Get_Item_Prefix(items[i])
    
      if item_prefix == nil or Is_Full_UCS_Name(items[i]) == false then
      
        Render_Item(ucs_root_folder, items[i], take_name)
        goto continue
          
      end
    
    for k, v in pairs(ucs_table) do
    
      if item_prefix == k then
        
        Render_Item(ucs_root_folder..v, items[i], take_name)
      
      end
    
    end
    
    ::continue::
  
  end

end


function Get_Item_Prefix(item)

  local item_prefix_search = "%u+%l+"
  local take = reaper.GetMediaItemTake(item, 0)
  local retval, take_name = reaper.GetSetMediaItemTakeInfo_String(take, "P_NAME", "name", false)
  
  if string.find(take_name, item_prefix_search) == nil then
  
    return nil
  
  else
  
    take_prefix = string.sub(take_name, string.find(take_name, item_prefix_search))
    return take_prefix, take_name
  
  end

end


function Is_Full_UCS_Name(item)

  local file_name_search = "%u+%l+-?%w?_%w?-?%w+_%w+_%w+_?%w?"
  local take = reaper.GetMediaItemTake(item, 0)
  local retval, take_name = reaper.GetSetMediaItemTakeInfo_String(take, "P_NAME", "name", false)
  
  
  if string.find(take_name, file_name_search) == nil then
  
    return false
    
  else
    
    return true
  
  end

end


function Render_Item(path, item, take_name)

  file_extension = Get_File_Extension()
  
  reaper.GetSetProjectInfo_String(0, "RENDER_FILE", path, true)
  reaper.SetMediaItemSelected(item, true)
  reaper.Main_OnCommand(42230, 1) -- File: Render project, using the most recent render settings, auto-close render dialog
  
  if open_to_file and Get_File_Extension() ~= nil then
    
    reaper.CF_LocateInExplorer(path.."\\"..take_name..file_extension)
  
  end
  
  reaper.SetMediaItemSelected(item, false)

end


function Get_File_Extension()

  if format == "evaw" then return ".wav"
  elseif format == "l3pm" then return ".mp3"
  elseif format == "calf" then return ".flac"
  elseif format == "ffia" then return ".aif"
  else return nil end

end


function Main()

  set_render_info()

  local items = get_all_items()
  
  Render_Items(items, ucs_table)

end


reaper.Undo_BeginBlock()
reaper.PreventUIRefresh(1)
Main()
reaper.PreventUIRefresh(-1)
reaper.Undo_EndBlock("Render Selected Tracks and Reposition", -1)



