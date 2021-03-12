--[[ 
@version 1.0
Script Name: Render Items To UCS Folders
Author: Daniel Petras
Contact: daniel@sonorityscape.com
Website: http://sonorityscape.com/
Repository: https://github.com/Sonorityscape/ReaScripts/raw/master/index.xml
Version Last Tested: REAPER v6.25 on Windows
Description: Renders selected items with UCS compliant names to UCS folders
Instructions: Be sure to set your UCS root folder in the 'User Settings"
--]]


--------------User Settings--------------

ucs_root_folder = "F:\\Sounds\\Daniel Petras\\My Sounds" -- Change to your UCS root directory
open_to_file = true -- Opens to the file in explorer after it has been rendered
sample_rate = 48000
channels = 2
format = "evaw"
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
["AEROMisc"] = "\\AIRCRAFT\\MISC",
["AEROHeli"] = "\\AIRCRAFT\\HELICOPTER",
["AEROJet"] = "\\AIRCRAFT\\JET",
["AEROMech"] = "\\AIRCRAFT\\MECHANISM",
["AEROMil"] = "\\AIRCRAFT\\MILITARY",
["AEROProp"] = "\\AIRCRAFT\\PROP",
["AERORadio"] = "\\AIRCRAFT\\RADIO CONTROLLED",
["AERORckt"] = "\\AIRCRAFT\\ROCKET",
["ALRMMisc"] = "\\ALARMS\\MISC",
["ALRMBell"] = "\\ALARMS\\BELL",
["ALRMBuzr"] = "\\ALARMS\\BUZZER",
["ALRMClok"] = "\\ALARMS\\CLOCK",
["ALRMElec"] = "\\ALARMS\\ELECTRONIC",
["ALRMSirn"] = "\\ALARMS\\SIREN",
["AMBMisc"] = "\\AMBIENCE\\MISC",
["AMBAmus"] = "\\AMBIENCE\\AMUSEMENT",
["AMBBird"] = "\\AMBIENCE\\BIRDSONG",
["AMBCele"] = "\\AMBIENCE\\CELEBRATION",
["AMBCnst"] = "\\AMBIENCE\\CONSTRUCTION",
["AMBDsrt"] = "\\AMBIENCE\\DESERT",
["AMBDsgn"] = "\\AMBIENCE\\DESIGNED",
["AMBEmrg"] = "\\AMBIENCE\\EMERGENCY",
["AMBFarm"] = "\\AMBIENCE\\FARM",
["AMBForst"] = "\\AMBIENCE\\FOREST",
["AMBHist"] = "\\AMBIENCE\\HISTORICAL",
["AMBTech"] = "\\AMBIENCE\\HITECH",
["AMBHosp"] = "\\AMBIENCE\\HOSPITAL",
["AMBInd"] = "\\AMBIENCE\\INDUSTRIAL",
["AMBMrkt"] = "\\AMBIENCE\\MARKET",
["AMBNaut"] = "\\AMBIENCE\\NAUTICAL",
["AMBOffc"] = "\\AMBIENCE\\OFFICE",
["AMBPrisn"] = "\\AMBIENCE\\PRISON",
["AMBPubl"] = "\\AMBIENCE\\PUBLIC PLACE",
["AMBRlgn"] = "\\AMBIENCE\\RELIGIOUS",
["AMBRest"] = "\\AMBIENCE\\RESTAURANT & BAR",
["AMBRoom"] = "\\AMBIENCE\\ROOM TONE",
["AMBRurl"] = "\\AMBIENCE\\RURAL",
["AMBSchl"] = "\\AMBIENCE\\SCHOOL",
["AMBSea"] = "\\AMBIENCE\\SEASIDE",
["AMBSprt"] = "\\AMBIENCE\\SPORT",
["AMBSubn"] = "\\AMBIENCE\\SUBURBAN",
["AMBSwmp"] = "\\AMBIENCE\\SWAMP",
["AMBTraf"] = "\\AMBIENCE\\TRAFFIC",
["AMBTran"] = "\\AMBIENCE\\TRANSPORTATION",
["AMBTrop"] = "\\AMBIENCE\\TROPICAL",
["AMBUndr"] = "\\AMBIENCE\\UNDERGROUND",
["AMBUndwtr"] = "\\AMBIENCE\\UNDERWATER",
["AMBUrbn"] = "\\AMBIENCE\\URBAN",
["AMBWar"] = "\\AMBIENCE\\WARFARE",
["ANMLMisc"] = "\\ANIMALS\\MISC",
["ANMLAmph"] = "\\ANIMALS\\AMPHIBIAN",
["ANMLAqua"] = "\\ANIMALS\\AQUATIC",
["ANMLBat"] = "\\ANIMALS\\BAT",
["ANMLCat"] = "\\ANIMALS\\CAT DOMESTIC",
["ANMLWcat"] = "\\ANIMALS\\CAT WILD",
["ANMLDog"] = "\\ANIMALS\\DOG",
["ANMLFarm"] = "\\ANIMALS\\FARM",
["ANMLHors"] = "\\ANIMALS\\HORSE",
["ANMLInsc"] = "\\ANIMALS\\INSECT",
["ANMLPrim"] = "\\ANIMALS\\PRIMATE",
["ANMLRept"] = "\\ANIMALS\\REPTILE",
["ANMLRdnt"] = "\\ANIMALS\\RODENT",
["ANMLWild"] = "\\ANIMALS\\WILD",
["MIX"] = "\\ARCHIVED\\MIX",
["BNCE"] = "\\ARCHIVED\\BOUNCE",
["IR"] = "\\ARCHIVED\\IMPULSE RESPONSE",
["PFX"] = "\\ARCHIVED\\PFX",
["RAW"] = "\\ARCHIVED\\RAW",
["REF"] = "\\ARCHIVED\\REFERENCE",
["SCNE"] = "\\ARCHIVED\\SCENE",
["TEST"] = "\\ARCHIVED\\TEST TONE",
["TMARK"] = "\\ARCHIVED\\TRADEMARKED",
["WIP"] = "\\ARCHIVED\\WORK IN PROGRESS",
["WTF"] = "\\ARCHIVED\\WTF",
["BEEP"] = "\\BEEPS\\GENERAL",
["BEEPAppl"] = "\\BEEPS\\APPLIANCE",
["BEEPLofi"] = "\\BEEPS\\LOFI",
["BEEPMed"] = "\\BEEPS\\MEDICAL",
["BEEPTimer"] = "\\BEEPS\\TIMER",
["BEEPVeh"] = "\\BEEPS\\VEHICLE",
["BELLMisc"] = "\\BELLS\\MISC",
["BELLAnml"] = "\\BELLS\\ANIMAL",
["BELLDoor"] = "\\BELLS\\DOORBELL",
["BELLGong"] = "\\BELLS\\GONG",
["BELLHand"] = "\\BELLS\\HANDBELL",
["BELLLrg"] = "\\BELLS\\LARGE",
["BIRDMisc"] = "\\BIRDS\\MISC",
["BIRDPrey"] = "\\BIRDS\\BIRD OF PREY",
["BIRDCrow"] = "\\BIRDS\\CROW",
["BIRDFowl"] = "\\BIRDS\\FOWL",
["BIRDSong"] = "\\BIRDS\\SONGBIRD",
["BIRDSea"] = "\\BIRDS\\SEA",
["BIRDTrop"] = "\\BIRDS\\TROPICAL",
["BIRDWade"] = "\\BIRDS\\WADING",
["BOATMisc"] = "\\BOATS\\MISC",
["BOATAir"] = "\\BOATS\\AIR BOAT",
["BOATWash"] = "\\BOATS\\BOW WASH",
["BOATElec"] = "\\BOATS\\ELECTRIC",
["BOATFish"] = "\\BOATS\\FISHING",
["BOATHorn"] = "\\BOATS\\HORN",
["BOATMech"] = "\\BOATS\\MECHANISM",
["BOATMil"] = "\\BOATS\\MILITARY",
["BOATMotr"] = "\\BOATS\\MOTORBOAT",
["BOATRace"] = "\\BOATS\\RACING",
["BOATRow"] = "\\BOATS\\ROWBOAT",
["BOATSail"] = "\\BOATS\\SAILBOAT",
["BOATShip"] = "\\BOATS\\SHIP",
["BOATStm"] = "\\BOATS\\STEAM",
["BOATSub"] = "\\BOATS\\SUBMARINE",
["BLLTMisc"] = "\\BULLETS\\MISC",
["BLLTBy"] = "\\BULLETS\\BY",
["BLLTImpt"] = "\\BULLETS\\IMPACT",
["BLLTShel"] = "\\BULLETS\\SHELL",
["BLLTRico"] = "\\BULLETS\\RICOCHET",
["TOONMisc"] = "\\CARTOON\\MISC",
["TOONBoing"] = "\\CARTOON\\BOING",
["TOONClang"] = "\\CARTOON\\CLANG",
["TOONCreak"] = "\\CARTOON\\CREAK",
["TOONHorn"] = "\\CARTOON\\HORN",
["TOONImpt"] = "\\CARTOON\\IMPACT",
["TOONMx"] = "\\CARTOON\\MUSICAL",
["TOONPop"] = "\\CARTOON\\POP",
["TOONPluk"] = "\\CARTOON\\PLUCK",
["TOONShake"] = "\\CARTOON\\SHAKE",
["TOONSplt"] = "\\CARTOON\\SPLAT",
["TOONSqk"] = "\\CARTOON\\SQUEAK",
["TOONStrch"] = "\\CARTOON\\STRETCH",
["TOONSwsh"] = "\\CARTOON\\SWISH",
["TOONTwang"] = "\\CARTOON\\TWANG",
["TOONWarb"] = "\\CARTOON\\WARBLE",
["TOONWhis"] = "\\CARTOON\\WHISTLE",
["TOONZip"] = "\\CARTOON\\ZIP",
["CERMMisc"] = "\\CERAMICS\\MISC",
["CERMBrk"] = "\\CERAMICS\\BREAK",
["CERMCrsh"] = "\\CERAMICS\\CRASH & DEBRIS",
["CERMFric"] = "\\CERAMICS\\FRICTION",
["CERMImpt"] = "\\CERAMICS\\IMPACT",
["CERMMvmt"] = "\\CERAMICS\\MOVEMENT",
["CERMTonl"] = "\\CERAMICS\\TONAL",
["CHAINMisc"] = "\\CHAINS\\MISC",
["CHAINBrk"] = "\\CHAINS\\BREAK",
["CHAINImpt"] = "\\CHAINS\\IMPACT",
["CHAINMvmt"] = "\\CHAINS\\MOVEMENT",
["CHEMMisc"] = "\\CHEMICALS\\MISC",
["CHEMAcid"] = "\\CHEMICALS\\ACID",
["CHEMReac"] = "\\CHEMICALS\\REACTION",
["CLOCKMisc"] = "\\CLOCKS\\MISC",
["CLOCKMech"] = "\\CLOCKS\\MECHANICS",
["CLOCKChim"] = "\\CLOCKS\\CHIME",
["CLOCKTick"] = "\\CLOCKS\\TICK",
["CLOTHMisc"] = "\\CLOTH\\MISC",
["CLOTHFlp"] = "\\CLOTH\\FLAP",
["CLOTHMvmt"] = "\\CLOTH\\MOVEMENT",
["CLOTHRip"] = "\\CLOTH\\RIP",
["COMMisc"] = "\\COMMUNICATIONS\\MISC",
["COMAv"] = "\\COMMUNICATIONS\\AUDIO VISUAL",
["COMCam"] = "\\COMMUNICATIONS\\CAMERA",
["COMCell"] = "\\COMMUNICATIONS\\CELLPHONE",
["COMMic"] = "\\COMMUNICATIONS\\MICROPHONE",
["COMPhono"] = "\\COMMUNICATIONS\\PHONOGRAPH",
["COMRadio"] = "\\COMMUNICATIONS\\RADIO",
["COMStatic"] = "\\COMMUNICATIONS\\STATIC",
["COMTelm"] = "\\COMMUNICATIONS\\TELEMETRY",
["COMTelph"] = "\\COMMUNICATIONS\\TELEPHONE",
["COMTv"] = "\\COMMUNICATIONS\\TELEVISION",
["COMTran"] = "\\COMMUNICATIONS\\TRANSCEIVER",
["COMType"] = "\\COMMUNICATIONS\\TYPEWRITER",
["CMPTMisc"] = "\\COMPUTERS\\MISC",
["CMPTDriv"] = "\\COMPUTERS\\HARD DRIVE",
["CMPTKey"] = "\\COMPUTERS\\KEYBOARD & MOUSE",
["CREAMisc"] = "\\CREATURES\\MISC",
["CREAAqua"] = "\\CREATURES\\AQUATIC",
["CREABeast"] = "\\CREATURES\\BEAST",
["CREABlob"] = "\\CREATURES\\BLOB",
["CREADino"] = "\\CREATURES\\DINOSAUR",
["CREADrgn"] = "\\CREATURES\\DRAGON",
["CREAElem"] = "\\CREATURES\\ELEMENTAL",
["CREAEthr"] = "\\CREATURES\\ETHEREAL",
["CREAHmn"] = "\\CREATURES\\HUMANOID",
["CREAInsc"] = "\\CREATURES\\INSECTOID",
["CREAMnstr"] = "\\CREATURES\\MONSTER",
["CREARept"] = "\\CREATURES\\REPTILIAN",
["CREASmall"] = "\\CREATURES\\SMALL",
["CREASrce"] = "\\CREATURES\\SOURCE",
["CREAAvian"] = "\\CREATURES\\AVIAN",
["CRWDMisc"] = "\\CROWDS\\MISC",
["CRWDAngr"] = "\\CROWDS\\ANGRY",
["CRWDApls"] = "\\CROWDS\\APPLAUSE",
["CRWDBatl"] = "\\CROWDS\\BATTLE",
["CRWDCele"] = "\\CROWDS\\CELEBRATION",
["CRWDCheer"] = "\\CROWDS\\CHEERING",
["CRWDChld"] = "\\CROWDS\\CHILDREN",
["CRWDConv"] = "\\CROWDS\\CONVERSATION",
["CRWDLaff"] = "\\CROWDS\\LAUGHTER",
["CRWDLoop"] = "\\CROWDS\\LOOP GROUP",
["CRWDPanic"] = "\\CROWDS\\PANIC",
["CRWDQuiet"] = "\\CROWDS\\QUIET",
["CRWDReac"] = "\\CROWDS\\REACTION",
["CRWDSing"] = "\\CROWDS\\SINGING",
["CRWDSprt"] = "\\CROWDS\\SPORT",
["CRWDWalla"] = "\\CROWDS\\WALLA",
["DSGNMisc"] = "\\DESIGNED\\MISC",
["DSGNBass"] = "\\DESIGNED\\BASS DIVE",
["DSGNBoom"] = "\\DESIGNED\\BOOM",
["DSGNBram"] = "\\DESIGNED\\BRAAM",
["DSGNDron"] = "\\DESIGNED\\DRONE",
["DSGNErie"] = "\\DESIGNED\\EERIE",
["DSGNEthr"] = "\\DESIGNED\\ETHEREAL",
["DSGNRise"] = "\\DESIGNED\\RISER",
["DSGNRmbl"] = "\\DESIGNED\\RUMBLE",
["DSGNStngr"] = "\\DESIGNED\\STINGER",
["DSGNSynth"] = "\\DESIGNED\\SYNTHETIC",
["DSGNTonl"] = "\\DESIGNED\\TONAL",
["DESTRMisc"] = "\\DESTRUCTION\\MISC",
["DESTRCrsh"] = "\\DESTRUCTION\\CRASH & DEBRIS",
["DESTRClpse"] = "\\DESTRUCTION\\COLLAPSE",
["DIRTMisc"] = "\\DIRT & SAND\\MISC",
["DIRTCrsh"] = "\\DIRT & SAND\\CRASH & DEBRIS",
["DIRTDust"] = "\\DIRT & SAND\\DUST",
["DIRTImpt"] = "\\DIRT & SAND\\IMPACT",
["DIRTMvmt"] = "\\DIRT & SAND\\MOVEMENT",
["DOORMisc"] = "\\DOORS\\MISC",
["DOORAntq"] = "\\DOORS\\ANTIQUE",
["DOORAppl"] = "\\DOORS\\APPLIANCE",
["DOORCab"] = "\\DOORS\\CABINET",
["DOORDungn"] = "\\DOORS\\DUNGEON",
["DOORElec"] = "\\DOORS\\ELECTRIC",
["DOORGate"] = "\\DOORS\\GATE",
["DOORGlas"] = "\\DOORS\\GLASS",
["DOORHdwr"] = "\\DOORS\\HARDWARE",
["DOORTech"] = "\\DOORS\\HITECH",
["DOORHydr"] = "\\DOORS\\HYDRAULIC & PNEUMATIC",
["DOORKnck"] = "\\DOORS\\KNOCK",
["DOORMetl"] = "\\DOORS\\METAL",
["DOORPlas"] = "\\DOORS\\PLASTIC",
["DOORPrisn"] = "\\DOORS\\PRISON",
["DOORRevl"] = "\\DOORS\\REVOLVING",
["DOORSlid"] = "\\DOORS\\SLIDING",
["DOORSton"] = "\\DOORS\\STONE",
["DOORSwng"] = "\\DOORS\\SWINGING",
["DOORWood"] = "\\DOORS\\WOOD",
["DRWRMisc"] = "\\DRAWERS\\MISC",
["DRWRMetl"] = "\\DRAWERS\\METAL",
["DRWRPlas"] = "\\DRAWERS\\PLASTIC",
["DRWRWood"] = "\\DRAWERS\\WOOD",
["ELECMisc"] = "\\ELECTRICITY\\MISC",
["ELECArc"] = "\\ELECTRICITY\\ARC",
["ELECEmf"] = "\\ELECTRICITY\\ELECTROMAGNETIC",
["ELECBuzz"] = "\\ELECTRICITY\\BUZZ & HUM",
["ELECSprk"] = "\\ELECTRICITY\\SPARKS",
["ELECZap"] = "\\ELECTRICITY\\ZAP",
["EQUIPMisc"] = "\\EQUIPMENT\\MISC",
["EQUIPBridle"] = "\\EQUIPMENT\\BRIDLE & TACK",
["EQUIPTech"] = "\\EQUIPMENT\\HITECH",
["EQUIPRec"] = "\\EQUIPMENT\\RECREATIONAL",
["EQUISprt"] = "\\EQUIPMENT\\SPORT",
["EQUIPTact"] = "\\EQUIPMENT\\TACTICAL",
["EXPLMisc"] = "\\EXPLOSIONS\\MISC",
["EXPLReal"] = "\\EXPLOSIONS\\REAL",
["EXPLDsgn"] = "\\EXPLOSIONS\\DESIGNED",
["FARTMisc"] = "\\FARTS\\MISC",
["FARTReal"] = "\\FARTS\\REAL",
["FARTDsgn"] = "\\FARTS\\DESIGNED",
["FGHTMisc"] = "\\FIGHT\\MISC",
["FGHTBf"] = "\\FIGHT\\BODYFALL",
["FGHTClth"] = "\\FIGHT\\CLOTH",
["FGHTGrab"] = "\\FIGHT\\GRAB",
["FGHTImpt"] = "\\FIGHT\\IMPACT",
["FIREMisc"] = "\\FIRE\\MISC",
["FIREBurn"] = "\\FIRE\\BURNING",
["FIREBrst"] = "\\FIRE\\BURST",
["FIRECrkl"] = "\\FIRE\\CRACKLE",
["FIREIgn"] = "\\FIRE\\IGNITE",
["FIREGas"] = "\\FIRE\\GAS",
["FIRESizz"] = "\\FIRE\\SIZZLE",
["FIRETrch"] = "\\FIRE\\TORCH",
["FIREWhsh"] = "\\FIRE\\WHOOSH",
["FRWKMisc"] = "\\FIREWORKS\\MISC",
["FRWKComr"] = "\\FIREWORKS\\COMMERCIAL",
["FRWKRec"] = "\\FIREWORKS\\RECREATIONAL",
["FOLYMisc"] = "\\FOLEY\\MISC",
["FOLYClth"] = "\\FOLEY\\CLOTH",
["FOLYFeet"] = "\\FOLEY\\FEET",
["FOLYHand"] = "\\FOLEY\\HANDS",
["FOLYProp"] = "\\FOLEY\\PROP",
["FOODMisc"] = "\\FOOD & DRINK\\MISC",
["FOODCook"] = "\\FOOD & DRINK\\COOKING",
["FOODDrnk"] = "\\FOOD & DRINK\\DRINKING",
["FOODEat"] = "\\FOOD & DRINK\\EATING",
["FOODGware"] = "\\FOOD & DRINK\\GLASSWARE",
["FOODIngr"] = "\\FOOD & DRINK\\INGREDIENTS",
["FOODKware"] = "\\FOOD & DRINK\\KITCHENWARE",
["FOODTware"] = "\\FOOD & DRINK\\TABLEWARE",
["FEETMisc"] = "\\FOOTSTEPS\\MISC",
["FEETAnml"] = "\\FOOTSTEPS\\ANIMAL",
["FEETCrea"] = "\\FOOTSTEPS\\CREATURE",
["FEETHors"] = "\\FOOTSTEPS\\HORSE",
["FEETHmn"] = "\\FOOTSTEPS\\HUMAN",
["GAMEMisc"] = "\\GAMES\\MISC",
["GAMEArcd"] = "\\GAMES\\ARCADE",
["GAMEBoard"] = "\\GAMES\\BOARD",
["GAMECas"] = "\\GAMES\\CASINO",
["GAMEVideo"] = "\\GAMES\\VIDEO",
["GEOMisc"] = "\\GEOTHERMAL\\MISC",
["GEOLava"] = "\\GEOTHERMAL\\LAVA",
["GEOGeyser"] = "\\GEOTHERMAL\\GEYSER",
["GEOMudpot"] = "\\GEOTHERMAL\\MUD POTS",
["GEOFuma"] = "\\GEOTHERMAL\\FUMAROLE",
["GLASMisc"] = "\\GLASS\\MISC",
["GLASBrk"] = "\\GLASS\\BREAK",
["GLASCrsh"] = "\\GLASS\\CRASH & DEBRIS",
["GLASFric"] = "\\GLASS\\FRICTION",
["GLASImpt"] = "\\GLASS\\IMPACT",
["GLASMvmt"] = "\\GLASS\\MOVEMENT",
["GLASTonl"] = "\\GLASS\\TONAL",
["GOREMisc"] = "\\GORE\\MISC",
["GOREBlood"] = "\\GORE\\BLOOD",
["GOREBone"] = "\\GORE\\BONE",
["GOREBurn"] = "\\GORE\\BURN",
["GOREFlsh"] = "\\GORE\\FLESH",
["GOREOoze"] = "\\GORE\\OOZE",
["GORESplt"] = "\\GORE\\SPLAT",
["GORESqsh"] = "\\GORE\\SQUISH",
["GOREStab"] = "\\GORE\\STAB",
["GUNMisc"] = "\\GUNS\\MISC",
["GUNAntq"] = "\\GUNS\\ANTIQUE",
["GUNArtl"] = "\\GUNS\\ARTILLERY",
["GUNAuto"] = "\\GUNS\\AUTOMATIC",
["GUNCano"] = "\\GUNS\\CANNON",
["GUNTech"] = "\\GUNS\\HITECH",
["GUNMech"] = "\\GUNS\\MECHANISM",
["GUNPis"] = "\\GUNS\\PISTOL",
["GUNRif"] = "\\GUNS\\RIFLE",
["GUNShotg"] = "\\GUNS\\SHOTGUN",
["GUNSupr"] = "\\GUNS\\SUPPRESSED",
["HORNMisc"] = "\\HORNS\\MISC",
["HORNAir"] = "\\HORNS\\AIR POWERED",
["HORNCele"] = "\\HORNS\\CELEBRATION",
["HORNTrad"] = "\\HORNS\\TRADITIONAL",
["HMNMisc"] = "\\HUMAN\\MISC",
["HMNBrth"] = "\\HUMAN\\BREATH",
["HMNBurp"] = "\\HUMAN\\BURP",
["HMNCough"] = "\\HUMAN\\COUGH",
["HMNHart"] = "\\HUMAN\\HEARTBEAT",
["HMNKiss"] = "\\HUMAN\\KISS",
["HMNSneez"] = "\\HUMAN\\SNEEZE",
["HMNSnor"] = "\\HUMAN\\SNORE",
["HMNSpit"] = "\\HUMAN\\SPIT",
["ICEMisc"] = "\\ICE\\MISC",
["ICEBrk"] = "\\ICE\\BREAK",
["ICECrsh"] = "\\ICE\\CRASH & DEBRIS",
["ICEFric"] = "\\ICE\\FRICTION",
["ICEImpt"] = "\\ICE\\IMPACT",
["ICEMvmt"] = "\\ICE\\MOVEMENT",
["ICETonl"] = "\\ICE\\TONAL",
["LASRMisc"] = "\\LASERS\\MISC",
["LASRBeam"] = "\\LASERS\\BEAM",
["LASRGun"] = "\\LASERS\\GUN",
["LASRImpt"] = "\\LASERS\\IMPACT",
["LETHRMisc"] = "\\LEATHER\\MISC",
["LETHRCreak"] = "\\LEATHER\\CREAK",
["LETHRImpt"] = "\\LEATHER\\IMPACT",
["LETHRMvmt"] = "\\LEATHER\\MOVEMENT",
["LIQMisc"] = "\\LIQUID & MUD\\MISC",
["LIQBubl"] = "\\LIQUID & MUD\\BUBBLES",
["LIQImpt"] = "\\LIQUID & MUD\\IMPACT",
["LIQMvmt"] = "\\LIQUID & MUD\\MOVEMENT",
["LIQSuct"] = "\\LIQUID & MUD\\SUCTION",
["MACHMisc"] = "\\MACHINES\\MISC",
["MACHAmus"] = "\\MACHINES\\AMUSEMENT",
["MACHAntq"] = "\\MACHINES\\ANTIQUE",
["MACHAppl"] = "\\MACHINES\\APPLIANCE",
["MACHCnst"] = "\\MACHINES\\CONSTRUCTION",
["MACHElev"] = "\\MACHINES\\ELEVATOR",
["MACHEscl"] = "\\MACHINES\\ESCALATOR",
["MACHFan"] = "\\MACHINES\\FAN",
["MACHTech"] = "\\MACHINES\\HITECH",
["MACHHvac"] = "\\MACHINES\\HVAC",
["MACHInd"] = "\\MACHINES\\INDUSTRIAL",
["MACHMech"] = "\\MACHINES\\MECHANISM",
["MACHMed"] = "\\MACHINES\\MEDICAL",
["MACHOffi"] = "\\MACHINES\\OFFICE",
["MACHPump"] = "\\MACHINES\\PUMP",
["MAGMisc"] = "\\MAGIC\\MISC",
["MAGAngl"] = "\\MAGIC\\ANGELIC",
["MAGElem"] = "\\MAGIC\\ELEMENTAL",
["MAGEvil"] = "\\MAGIC\\EVIL",
["MAGPoof"] = "\\MAGIC\\POOF",
["MAGShim"] = "\\MAGIC\\SHIMMER",
["MAGSpel"] = "\\MAGIC\\SPELL",
["MECHMisc"] = "\\MECHANICAL\\MISC",
["MECHClik"] = "\\MECHANICAL\\CLICK",
["MECHGear"] = "\\MECHANICAL\\GEARS",
["MECHHydr"] = "\\MECHANICAL\\HYDRAULIC & PNEUMATIC",
["MECHLtch"] = "\\MECHANICAL\\LATCH",
["MECHLvr"] = "\\MECHANICAL\\LEVER",
["MECHLock"] = "\\MECHANICAL\\LOCK",
["MECHPuly"] = "\\MECHANICAL\\PULLEY",
["MECHRtch"] = "\\MECHANICAL\\RATCHET",
["MECHRelay"] = "\\MECHANICAL\\RELAY",
["MECHRolr"] = "\\MECHANICAL\\ROLLER",
["MECHSwtch"] = "\\MECHANICAL\\SWITCH",
["METLMisc"] = "\\METAL\\MISC",
["METLBrk"] = "\\METAL\\BREAK",
["METLCrsh"] = "\\METAL\\CRASH & DEBRIS",
["METLFric"] = "\\METAL\\FRICTION",
["METLImpt"] = "\\METAL\\IMPACT",
["METLMvmt"] = "\\METAL\\MOVEMENT",
["METLTonl"] = "\\METAL\\TONAL",
["MOTRMisc"] = "\\MOTORS\\MISC",
["MOTRAntq"] = "\\MOTORS\\ANTIQUE",
["MOTRComb"] = "\\MOTORS\\COMBUSTION",
["MOTRElec"] = "\\MOTORS\\ELECTRIC",
["MOTRSrvo"] = "\\MOTORS\\SERVO",
["MOTRTurb"] = "\\MOTORS\\TURBINE",
["MOVEMisc"] = "\\MOVEMENT\\MISC",
["MOVEActv"] = "\\MOVEMENT\\ACTIVITY",
["MOVEAnml"] = "\\MOVEMENT\\ANIMAL",
["MOVECrea"] = "\\MOVEMENT\\CREATURE",
["MOVECrwd"] = "\\MOVEMENT\\CROWD",
["MOVEInsc"] = "\\MOVEMENT\\INSECT",
["MOVEPres"] = "\\MOVEMENT\\PRESENCE",
["MUSCMisc"] = "\\MUSICAL\\MISC",
["MUSCBrass"] = "\\MUSICAL\\BRASS",
["MUSCChim"] = "\\MUSICAL\\CHIME",
["MUSCChor"] = "\\MUSICAL\\CHORAL",
["MUSCInst"] = "\\MUSICAL\\INSTRUMENT",
["MUSCLoop"] = "\\MUSICAL\\LOOP",
["MUSCPerc"] = "\\MUSICAL\\PERCUSSION",
["MUSCSmpl"] = "\\MUSICAL\\SAMPLE",
["MUSCSong"] = "\\MUSICAL\\SONG & PHRASE",
["MUSCStngr"] = "\\MUSICAL\\STINGER",
["MUSCStr"] = "\\MUSICAL\\STRINGED",
["MUSCWind"] = "\\MUSICAL\\WOODWIND",
["MUSCToy"] = "\\MUSICAL\\TOY",
["NATDMisc"] = "\\NATURAL DISASTER\\MISC",
["NATDAval"] = "\\NATURAL DISASTER\\AVALANCHE",
["NATDQuak"] = "\\NATURAL DISASTER\\EARTHQUAKE",
["NATDTorn"] = "\\NATURAL DISASTER\\TORNADO",
["NATDTsun"] = "\\NATURAL DISASTER\\TSUNAMI",
["NATDThyp"] = "\\NATURAL DISASTER\\TYPHOON",
["NATDVolc"] = "\\NATURAL DISASTER\\VOLCANO",
["OBJMisc"] = "\\OBJECTS\\MISC",
["OBJBag"] = "\\OBJECTS\\BAG",
["OBJCoin"] = "\\OBJECTS\\COIN",
["OBJFurn"] = "\\OBJECTS\\FURNITURE",
["OBJHsehld"] = "\\OBJECTS\\HOUSEHOLD",
["OBJJewl"] = "\\OBJECTS\\JEWELRY",
["OBJLug"] = "\\OBJECTS\\LUGGAGE",
["OBJKey"] = "\\OBJECTS\\KEYS",
["OBJMed"] = "\\OBJECTS\\MEDICAL",
["OBJPack"] = "\\OBJECTS\\PACKAGING",
["OBJTape"] = "\\OBJECTS\\TAPE",
["OBJUmbr"] = "\\OBJECTS\\UMBRELLA",
["OBJWhled"] = "\\OBJECTS\\WHEELED",
["OBJWrite"] = "\\OBJECTS\\WRITING",
["OBJZipr"] = "\\OBJECTS\\ZIPPER",
["PAPRMisc"] = "\\PAPER\\MISC",
["PAPRFltr"] = "\\PAPER\\FLUTTER",
["PAPRHndl"] = "\\PAPER\\HANDLE",
["PAPRRip"] = "\\PAPER\\RIP",
["PLASMisc"] = "\\PLASTIC\\MISC",
["PLASBrk"] = "\\PLASTIC\\BREAK",
["PLASCrsh"] = "\\PLASTIC\\CRASH & DEBRIS",
["PLASFric"] = "\\PLASTIC\\FRICTION",
["PLASImpt"] = "\\PLASTIC\\IMPACT",
["PLASMvmt"] = "\\PLASTIC\\MOVEMENT",
["RAIN"] = "\\RAIN\\GENERAL",
["RAINClth"] = "\\RAIN\\CLOTH",
["RAINConc"] = "\\RAIN\\CONCRETE",
["RAINGlas"] = "\\RAIN\\GLASS",
["RAINMetl"] = "\\RAIN\\METAL",
["RAINPlas"] = "\\RAIN\\PLASTIC",
["RAINVege"] = "\\RAIN\\VEGETATION",
["RAINWood"] = "\\RAIN\\WOOD",
["RAINWatr"] = "\\RAIN\\WATER",
["ROBTMisc"] = "\\ROBOTS\\MISC",
["ROBTMvmt"] = "\\ROBOTS\\MOVEMENT",
["ROBTVox"] = "\\ROBOTS\\VOCAL",
["ROCKMisc"] = "\\ROCKS\\MISC",
["ROCKBrk"] = "\\ROCKS\\BREAK",
["ROCKCrsh"] = "\\ROCKS\\CRASH & DEBRIS",
["ROCKFric"] = "\\ROCKS\\FRICTION",
["ROCKImpt"] = "\\ROCKS\\IMPACT",
["ROCKMvmt"] = "\\ROCKS\\MOVEMENT",
["ROCKTonl"] = "\\ROCKS\\TONAL",
["ROPEMisc"] = "\\ROPE\\MISC",
["ROPECreak"] = "\\ROPE\\CREAK",
["ROPEMvmt"] = "\\ROPE\\MOVEMENT",
["RUBRMisc"] = "\\RUBBER\\MISC",
["RUBRCrsh"] = "\\RUBBER\\CRASH & DEBRIS",
["RUBRFric"] = "\\RUBBER\\FRICTION",
["RUBRImpt"] = "\\RUBBER\\IMPACT",
["RUBRMvmt"] = "\\RUBBER\\MOVEMENT",
["SCIMisc"] = "\\SCIFI\\MISC",
["SCIAlrm"] = "\\SCIFI\\ALARM",
["SCICmpt"] = "\\SCIFI\\COMPUTER",
["SCIDoor"] = "\\SCIFI\\DOOR",
["SCIEnrg"] = "\\SCIFI\\ENERGY",
["SCIMach"] = "\\SCIFI\\MACHINE",
["SCIRetro"] = "\\SCIFI\\RETRO",
["SCIShip"] = "\\SCIFI\\SPACESHIP",
["SCIVeh"] = "\\SCIFI\\VEHICLE",
["SCIWeap"] = "\\SCIFI\\WEAPON",
["SNOWMisc"] = "\\SNOW\\MISC",
["SNOWCrsh"] = "\\SNOW\\CRASH & DEBRIS",
["SNOWFric"] = "\\SNOW\\FRICTION",
["SNOWImpt"] = "\\SNOW\\IMPACT",
["SNOWMvmt"] = "\\SNOW\\MOVEMENT",
["SPRTMisc"] = "\\SPORTS\\MISC",
["SPRTCourt"] = "\\SPORTS\\COURT",
["SPRTField"] = "\\SPORTS\\FIELD",
["SPRTGym"] = "\\SPORTS\\GYM",
["SPRTIndor"] = "\\SPORTS\\INDOOR",
["SPRTSkate"] = "\\SPORTS\\SKATE",
["SPRTTrck"] = "\\SPORTS\\TRACK & FIELD",
["SPRTWatr"] = "\\SPORTS\\WATER",
["SPRTWntr"] = "\\SPORTS\\WINTER",
["SWSH"] = "\\SWOOSHES\\SWISH",
["WHSH"] = "\\SWOOSHES\\WHOOSH",
["TOOLMisc"] = "\\TOOLS\\MISC",
["TOOLHand"] = "\\TOOLS\\HAND",
["TOOLPneu"] = "\\TOOLS\\PNEUMATIC",
["TOOLPowr"] = "\\TOOLS\\POWER",
["TOYMisc"] = "\\TOYS\\MISC",
["TOYMech"] = "\\TOYS\\MECHANICAL",
["TOYElec"] = "\\TOYS\\ELECTRONIC",
["TRNMisc"] = "\\TRAINS\\MISC",
["TRNBrake"] = "\\TRAINS\\BRAKE",
["TRNClak"] = "\\TRAINS\\CLACK",
["TRNDiesl"] = "\\TRAINS\\DIESEL",
["TRNElec"] = "\\TRAINS\\ELECTRIC",
["TRNHspd"] = "\\TRAINS\\HIGH SPEED",
["TRNHorn"] = "\\TRAINS\\HORN",
["TRNMech"] = "\\TRAINS\\MECHANISM",
["TRNSteam"] = "\\TRAINS\\STEAM",
["TRNSbwy"] = "\\TRAINS\\SUBWAY",
["TRNTram"] = "\\TRAINS\\TRAM",
["UIMisc"] = "\\USER INTERFACE\\MISC",
["UIAlert"] = "\\USER INTERFACE\\ALERT",
["UIBeep"] = "\\USER INTERFACE\\BEEP",
["UIClick"] = "\\USER INTERFACE\\CLICK",
["UIData"] = "\\USER INTERFACE\\DATA",
["UIGlitch"] = "\\USER INTERFACE\\GLITCH",
["UIMvmt"] = "\\USER INTERFACE\\MOTION",
["VEGEMisc"] = "\\VEGETATION\\MISC",
["VEGEGras"] = "\\VEGETATION\\GRASS",
["VEGELeaf"] = "\\VEGETATION\\LEAVES",
["VEGETree"] = "\\VEGETATION\\TREE",
["VEHMisc"] = "\\VEHICLES\\MISC",
["VEHAlrm"] = "\\VEHICLES\\ALARM",
["VEHAntq"] = "\\VEHICLES\\ANTIQUE",
["VEHAtv"] = "\\VEHICLES\\ATV",
["VEHBike"] = "\\VEHICLES\\BICYCLE",
["VEHBrake"] = "\\VEHICLES\\BRAKE",
["VEHBus"] = "\\VEHICLES\\BUS",
["VEHCar"] = "\\VEHICLES\\CAR",
["VEHCnst"] = "\\VEHICLES\\CONSTRUCTION",
["VEHDoor"] = "\\VEHICLES\\DOOR",
["VEHElec"] = "\\VEHICLES\\ELECTRIC",
["VEHFarm"] = "\\VEHICLES\\FARM",
["VEHFrght"] = "\\VEHICLES\\FREIGHT",
["VEHHorn"] = "\\VEHICLES\\HORN",
["VEHBy"] = "\\VEHICLES\\GENERIC BY",
["VEHJalop"] = "\\VEHICLES\\JALOPY",
["VEHMech"] = "\\VEHICLES\\MECHANISM",
["VEHMil"] = "\\VEHICLES\\MILITARY",
["VEHMoto"] = "\\VEHICLES\\MOTORCYCLE",
["VEHRace"] = "\\VEHICLES\\RACING",
["VEHSkid"] = "\\VEHICLES\\SKID",
["VEHSirn"] = "\\VEHICLES\\SIREN",
["VEHSusp"] = "\\VEHICLES\\SUSPENSION",
["VEHTire"] = "\\VEHICLES\\TIRE",
["VEHTruck"] = "\\VEHICLES\\TRUCK VAN & SUV",
["VEHUtil"] = "\\VEHICLES\\UTILITY",
["VEHWagn"] = "\\VEHICLES\\WAGON",
["VEHWndw"] = "\\VEHICLES\\WINDOW",
["VOXMisc"] = "\\VOICES\\MISC",
["VOXAlien"] = "\\VOICES\\ALIEN",
["VOXBaby"] = "\\VOICES\\BABY",
["VOXCheer"] = "\\VOICES\\CHEER",
["VOXChld"] = "\\VOICES\\CHILD",
["VOXCry"] = "\\VOICES\\CRYING",
["VOXEfrt"] = "\\VOICES\\EFFORTS",
["VOXFem"] = "\\VOICES\\FEMALE",
["VOXFutz"] = "\\VOICES\\FUTZED",
["VOXHist"] = "\\VOICES\\HISTORICAL",
["VOXLaff"] = "\\VOICES\\LAUGH",
["VOXMale"] = "\\VOICES\\MALE",
["VOXReac"] = "\\VOICES\\REACTION",
["VOXScrm"] = "\\VOICES\\SCREAM",
["VOXSing"] = "\\VOICES\\SINGING",
["WATRMisc"] = "\\WATER\\MISC",
["WATRBubl"] = "\\WATER\\BUBBLES",
["WATRDran"] = "\\WATER\\DRAIN",
["WATRDrip"] = "\\WATER\\DRIP",
["WATRFizz"] = "\\WATER\\FIZZ",
["WATRFlow"] = "\\WATER\\FLOW",
["WATRFoun"] = "\\WATER\\FOUNTAIN",
["WATRImpt"] = "\\WATER\\IMPACT",
["WATRLap"] = "\\WATER\\LAP",
["WATRMvmt"] = "\\WATER\\MOVEMENT",
["WATRPlmb"] = "\\WATER\\PLUMBING",
["WATRPour"] = "\\WATER\\POUR",
["WATRSplsh"] = "\\WATER\\SPLASH",
["WATRSpray"] = "\\WATER\\SPRAY",
["WATRStm"] = "\\WATER\\STEAM",
["WATRSurf"] = "\\WATER\\SURF",
["WATRTurb"] = "\\WATER\\TURBULENT",
["WATRFall"] = "\\WATER\\WATERFALL",
["WATRWave"] = "\\WATER\\WAVE",
["WEAPMisc"] = "\\WEAPONS\\MISC",
["WEAPArmr"] = "\\WEAPONS\\ARMOR",
["WEAPArro"] = "\\WEAPONS\\ARROW",
["WEAPBlnt"] = "\\WEAPONS\\BLUNT",
["WEAPBow"] = "\\WEAPONS\\BOW",
["WEAPKnif"] = "\\WEAPONS\\KNIFE",
["WEAPPole"] = "\\WEAPONS\\POLEARM",
["WEAPSiege"] = "\\WEAPONS\\SIEGE",
["WEAPSwrd"] = "\\WEAPONS\\SWORD",
["WEAPWhip"] = "\\WEAPONS\\WHIP",
["WTHR"] = "\\WEATHER\\MISC",
["HAIL"] = "\\WEATHER\\HAIL",
["STORM"] = "\\WEATHER\\STORM",
["THUN"] = "\\WEATHER\\THUNDER",
["WHSTMisc"] = "\\WHISTLES\\MISC",
["WHSTHmn"] = "\\WHISTLES\\HUMAN",
["WHSTMech"] = "\\WHISTLES\\MECHANICAL",
["WIND"] = "\\WIND\\GENERAL",
["WINDDsgn"] = "\\WIND\\DESIGNED",
["WINDGust"] = "\\WIND\\GUST",
["WINDInt"] = "\\WIND\\INTERIOR",
["WINDTonl"] = "\\WIND\\TONAL",
["WINDVege"] = "\\WIND\\VEGETATION",
["WNDWMisc"] = "\\WINDOWS\\MISC",
["WNDWCover"] = "\\WINDOWS\\COVERING",
["WNDWHdwr"] = "\\WINDOWS\\HARDWARE",
["WNDWKnck"] = "\\WINDOWS\\KNOCK",
["WNDWMetl"] = "\\WINDOWS\\METAL",
["WNDWPlas"] = "\\WINDOWS\\PLASTIC",
["WNDWWood"] = "\\WINDOWS\\WOOD",
["WINGMisc"] = "\\WINGS\\MISC",
["WINGBird"] = "\\WINGS\\BIRD",
["WINGCrea"] = "\\WINGS\\CREATURE",
["WINGInsc"] = "\\WINGS\\INSECT",
["WOODMisc"] = "\\WOOD\\MISC",
["WOODBrk"] = "\\WOOD\\BREAK",
["WOODCrsh"] = "\\WOOD\\CRASH & DEBRIS",
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

  local item_prefix_search = "%u+%l*"
  local take = reaper.GetMediaItemTake(item, 0)
  local retval, take_name = reaper.GetSetMediaItemTakeInfo_String(take, "P_NAME", "name", false)
  
  if string.find(take_name, item_prefix_search) == nil then
    
    return nil, take_name
  
  else
  
    take_prefix = string.sub(take_name, string.find(take_name, item_prefix_search))
    return take_prefix, take_name
  
  end

end


function Is_Full_UCS_Name(item)

  local file_name_search = "%u+%l*-?%w?_%w?-?[%w+%s]+_%w+_%w+_?%w?"
  local take = reaper.GetMediaItemTake(item, 0)
  local retval, take_name = reaper.GetSetMediaItemTakeInfo_String(take, "P_NAME", "name", false)
  
  
  if string.find(take_name, file_name_search) == nil then
    
    Msg("tst")
  
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
reaper.Undo_EndBlock("Render Items To UCS Folders", -1)



