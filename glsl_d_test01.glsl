import lib-sampler.glsl
import lib-normal.glsl
import lib-alpha.glsl
import lib-pbr.glsl

//: state cull_face off

//-------------------------- Diffuse Map --------------------------//

//: param auto channel_basecolor
uniform sampler2D diffuseMapSampler;

//: param auto channel_opacity
uniform sampler2D opacitySampler;


//--------MASK1 ---------------------------------------------------//
//: param auto channel_user0
uniform sampler2D detail_tex;
//: param auto channel_user1
uniform sampler2D fresnelMaskSampler;
//: param auto channel_metallic
uniform sampler2D metallicSampler;
//: param auto channel_emissive
uniform sampler2D emissiveSampler;



//--------MASK2 ---------------------------------------------------//
//: param auto channel_user4
uniform sampler2D specularLinearSampler;
//: param auto channel_user2
uniform sampler2D rimSampler;
//: param auto channel_user3
uniform sampler2D tintSpecSampler;
//: param auto channel_glossiness
uniform sampler2D glossinessSampler;

//-------- Lights ----------------------------------------------------//

///////////////////


//: param custom { "default": 0, "group": "Debug", "label": "Time", "min": 0.0, "max":100, "visible" : false }
uniform float Time;

//: param custom { "default": 1.0, "group": "Detail Animation", "label": "Time Speed", "min": 0.0, "max":10 }
uniform float TimeSpeed;

//: param custom { "default": 0.0, "group": "Detail Animation", "label": "Horizontal Scroll Speed", "min": -10, "max":10,  "visible" :"input.charSelCombo == 0" }
uniform float horizontalScrollSpeed;

//: param custom { "default": 0.0, "group": "Detail Animation", "label": "Vertical Scroll Speed", "min": -10, "max":10,  "visible" :"input.charSelCombo == 0" }
uniform float verticalScrollSpeed;




/////////////
//: param custom {
//:   "default": 0,
//:   "label": "DOTA Shader",
//:   "group": "",
//:   "widget": "combobox",
//:   "values": {
//:		"Customize Me":0,
//: 	"Abaddon Mount":1,
//: 	"Abaddon":2,
//: 	"Alchemist Goblin":3,
//: 	"Alchemist":4,
//: 	"Ancient Apparition":5,
//: 	"Antimage":6,
//: 	"Arc Warden":7,
//: 	"Axe":8,
//: 	"Bane":9,
//: 	"Batrider Mount":10,
//: 	"Batrider":11,
//: 	"Beastmaster Bird":12,
//: 	"Beastmaster Boar":13,
//: 	"Beastmaster":14,
//: 	"Blood Seeker":15,
//: 	"Bounty Hunter":16,
//: 	"Brewmaster Firespirit":17,
//: 	"Brewmaster Windspirit":18,
//: 	"Brewmaster":19,
//: 	"Bristleback":20,
//: 	"Broodmother Spiderling":21,
//: 	"Broodmother":22,
//: 	"Centaur":23,
//: 	"Chaos Knight":24,
//: 	"Chen":25,
//: 	"Clinkz":26,
//: 	"Crystal Maiden":27,
//: 	"Dark Seer":28,
//: 	"Dark Willow":29,
//: 	"Davion Persona":30,
//: 	"Dawnbreaker":31,
//: 	"Dazzle":32,
//: 	"Death Prophet":33,
//: 	"Deathprophet Ladyghosts":34,
//: 	"Disruptor Mount":35,
//: 	"Disruptor":36,
//: 	"Dk Dragon Black":37,
//: 	"Dk Dragon Blue":38,
//: 	"Dk Dragon Green":39,
//: 	"Dk Dragon Red":40,
//: 	"Doom":41,
//: 	"Dragon Knight":42,
//: 	"Drow":43,
//: 	"Earth Spirit Summon":44,
//: 	"Earth Spirit":45,
//: 	"Earthshaker":46,
//: 	"Elder Titan":47,
//: 	"Ember Spirit":48,
//: 	"Enchantress":49,
//: 	"Enigma Eidelon":50,
//: 	"Enigma":51,
//: 	"Faceless Void":52,
//: 	"Furion Treant":53,
//: 	"Furion":54,
//: 	"Grimstroke":55,
//: 	"Gyro":56,
//: 	"Hoodwink":57,
//: 	"Huskar":58,
//: 	"Invoker Forge Spirit":59,
//: 	"Invoker Kid":60,
//: 	"Invoker":61,
//: 	"Io":62,
//: 	"Jakiro":63,
//: 	"Juggernaut Ward":64,
//: 	"Juggernaut":65,
//: 	"Kotl Mount":66,
//: 	"Kotl":67,
//: 	"Kunkka":68,
//: 	"Lanaya":69,
//: 	"Legion Commander":70,
//: 	"Leshrac":71,
//: 	"Lich":72,
//: 	"Life Stealer":73,
//: 	"Lina":74,
//: 	"Lion":75,
//: 	"Lone Druid Trueform":76,
//: 	"Lone Druid":77,
//: 	"Luna Mount":78,
//: 	"Luna":79,
//: 	"Lycan Wolves":80,
//: 	"Lycan":81,
//: 	"Magnataur":82,
//: 	"Marci":83,
//: 	"Mars":84,
//: 	"Medusa":85,
//: 	"Meepo":86,
//: 	"Mirana Mount":87,
//: 	"Mirana Persona":88,
//: 	"Mirana":89,
//: 	"Monkey King":90,
//: 	"Morphling":91,
//: 	"Necrolyte":92,
//: 	"Nevermore":93,
//: 	"Nightstalker":94,
//: 	"Nyx":95,
//: 	"Obsidian Destroyer":96,
//: 	"Ogre Magi":97,
//: 	"Omniknight":98,
//: 	"Oracle":99,
//: 	"Pangolier":100,
//: 	"Phantom Assassin":101,
//: 	"Phantom Lancer":102,
//: 	"Phoenix Egg":103,
//: 	"Phoenix Spirit":104,
//: 	"Phoenix":105,
//: 	"Primal Beast Items":106,
//: 	"Primal Beast":107,
//: 	"Puck":108,
//: 	"Pudge Cute":109,
//: 	"Pudge":110,
//: 	"Pugna Ward":111,
//: 	"Pugna":112,
//: 	"Queenofpain":113,
//: 	"Rattletrap":114,
//: 	"Razor":115,
//: 	"Rhasta Ward":116,
//: 	"Rikimaru":117,
//: 	"Rubick":118,
//: 	"Sand King":119,
//: 	"Shadow Demon":120,
//: 	"Shadow Fiend":121,
//: 	"Shadowshaman Totem":122,
//: 	"Shadowshaman":123,
//: 	"Silencer":124,
//: 	"Siren":125,
//: 	"Skeleton King":126,
//: 	"Skywrath Mage":127,
//: 	"Slardar":128,
//: 	"Slark":129,
//: 	"Snapfire Mount":130,
//: 	"Snapfire":131,
//: 	"Sniper":132,
//: 	"Spectre":133,
//: 	"Spirit Breaker":134,
//: 	"Storm Spirit":135,
//: 	"Sven":136,
//: 	"Techies":137,
//: 	"Templar Assassin Trap":138,
//: 	"Templar Assassin":139,
//: 	"Terrorblade Demon":140,
//: 	"Terrorblade":141,
//: 	"Tidehunter":142,
//: 	"Timbersaw":143,
//: 	"Tinker":144,
//: 	"Tiny 01":145,
//: 	"Treant Protector":146,
//: 	"Troll Warlord":147,
//: 	"Tuskarr":148,
//: 	"Underlord":149,
//: 	"Undying Golem":150,
//: 	"Undying":151,
//: 	"Ursa":152,
//: 	"Vengeful Spirit":153,
//: 	"Venomancer Ward":154,
//: 	"Venomancer":155,
//: 	"Viper":156,
//: 	"Visage Familiar":157,
//: 	"Visage":158,
//: 	"Void Spirit":159,
//: 	"Warlock Demon":160,
//: 	"Warlock":161,
//: 	"Weaver":162,
//: 	"Windrunner":163,
//: 	"Winter Wyvern":164,
//: 	"Witchdoctor Ward":165,
//: 	"Witchdoctor":166,
//: 	"Wraith King":167,
//: 	"Zeus":168
//:   }
//: }
uniform int charSelCombo;

//: param custom {
//:   "default": 1,
//:   "label": "Light Environment",
//:   "group": "DOTA Shader/DOTA Lighting",
//:   "widget": "combobox",
//:   "values": {
//:     "Customize Me": 0,
//:     "Store":   1,
//:     "Radiant Day": 2
//:   }
//: }
uniform int lightEnvCombo;

//Dota Lighting//

//: param custom { "default": [0.0, 0.0, 0.0], "label": "Light Position", "group": "DOTA Shader/DOTA Lighting", "min": -20, "max": 20, "visible" : "input.lightEnvCombo == 0 "}
uniform vec3 lightPosition_1;

//: param custom { "default": 1, "label": "Light Color", "group": "DOTA Shader/DOTA Lighting/Light", "widget": "color", "visible" : "input.lightEnvCombo == 0 " }
uniform vec3 lightColor_1;

//: param custom { "default": 1, "label": "Light Scale", "group": "DOTA Shader/DOTA Lighting/Light", "min": 0.0, "max": 5, "visible" : "input.lightEnvCombo == 0 " }
uniform float fLightMul;

//ambient//

//: param custom { "default": 1.0, "label": "Ambient Scale", "group": "DOTA Shader/DOTA Lighting/Light",  "min": 1.0, "max": 10,  "visible" :"input.charSelCombo == 0" }
uniform float fAmbientScale;


//-------- Specular Parameters ---------------------------------------------------//

//: param custom { "default": 1, "label": "Specular Color", "group": "DOTA Shader/Specular", "widget": "color",  "visible" :"input.charSelCombo == 0" }
uniform vec3 fSpecularColor;

//: param custom { "default": 1, "label": "Specular Scale", "group": "DOTA Shader/Specular", "min": 0.0, "max": 80, "visible" :"input.charSelCombo == 0" }
uniform float fSpecularScale;

//: param custom { "default": 32.0, "label": "Specular Exponent", "group": "DOTA Shader/Specular", "min": 1.0, "max": 160,  "visible" :"input.charSelCombo == 0" }
uniform float fSpecularExponent;

//: param custom { "default": false, "label": "Use Cube Map","group": "DOTA Shader/Specular",  "visible" :"input.charSelCombo == 0" }
uniform bool bDoCubeMap;

//: param custom { "default": false, "label": "Mask Cube By Metal","group": "DOTA Shader/Specular", "visible" :"input.charSelCombo == 0", "visible" : "input.bDoCubeMap == true " }
uniform bool bDoMetalMaskCube;


//: param custom { "default": 1, "label": "Cubemap Scale", "group": "DOTA Shader/Specular/Cube",  "min": 0.0, "max": 100, "visible" :"input.charSelCombo == 0" }
uniform float fCubemapScale;

//: param custom { "default": .5, "label": "Cubemap Rotation", "group": "DOTA Shader/Specular/Cube",  "min": 0.0, "max": 1, "visible" : "input.bDoCubeMap == true "}
uniform float fCubemapRotation;

//: param custom { "default": "glossy_cube", "label": "Cube Map", "group": "DOTA Shader/Specular/Cube", "usage": "environment", "visible" :"input.charSelCombo == 0" }
uniform sampler2D fCubeMapSample;


//-------- Jank-Ass Bullshit ---------------------------------------------------//

//: param custom { "default": "dawnbreaker_cube", "label": "dawnbreaker","usage": "environment", "visible": "false" }
uniform sampler2D dawnbreaker_cube;

//: param custom { "default": "dota_default_cube", "label": "default","usage": "environment", "visible": "false" }
uniform sampler2D dota_default_cube;

//: param custom { "default": "cube_earthspirit_cube", "label": "earthspirit","usage": "environment", "visible": "false" }
uniform sampler2D cube_earthspirit_cube;

//: param custom { "default": "darkreef_hatchetfish_cube", "label": "hatchetfish","usage": "environment", "visible": "false" }
uniform sampler2D darkreef_hatchetfish_cube;

//: param custom { "default": "hoodwink_day_cube", "label": "hoodwink","usage": "environment", "visible": "false" }
uniform sampler2D hoodwink_day_cube;

//: param custom { "default": "invoker_kid_cube", "label": "invokerkid","usage": "environment", "visible": "false" }
uniform sampler2D invoker_kid_cube;

//: param custom { "default": "mars_bronze_day_cube", "label": "mars","usage": "environment", "visible": "false" }
uniform sampler2D mars_bronze_day_cube;

//: param custom { "default": "queenofpain_arcana_base_style1_cube", "label": "qoppersona","usage": "environment", "visible": "false" }
uniform sampler2D queenofpain_arcana_base_style1_cube;

//: param custom { "default": "primal_cube", "label": "primal","usage": "environment", "visible": "false" }
uniform sampler2D primal_cube;

//: param custom { "default": "snapfire_lizard_cube", "label": "snapfirelizard","usage": "environment", "visible": "false" }
uniform sampler2D snapfire_lizard_cube;

//: param custom { "default": "snapfire_cube", "label": "snapfire","usage": "environment", "visible": "false" }
uniform sampler2D snapfire_cube;

//: param custom { "default": "crimson_pique_glass_cube", "label": "piqueglass","usage": "environment", "visible": "false" }
uniform sampler2D crimson_pique_glass_cube;

//: param custom { "default": "cube_legion_commander_cube", "label": "legioncommand","usage": "environment", "visible": "false" }
uniform sampler2D cube_legion_commander_cube;

//: param custom { "default": "cube_metal_grey_cube", "label": "metalgrey","usage": "environment", "visible": "false" }
uniform sampler2D cube_metal_grey_cube;

//: param custom { "default": "cube_ram_gold_cube", "label": "ramgold","usage": "environment", "visible": "false" }
uniform sampler2D cube_ram_gold_cube;

//: param custom { "default": "glossy_blue_cube", "label": "glossyblue","usage": "environment", "visible": "false" }
uniform sampler2D glossy_blue_cube;

//: param custom { "default": "glossy_broad_cube", "label": "glossybroad","usage": "environment", "visible": "false" }
uniform sampler2D glossy_broad_cube;

//: param custom { "default": "glossy_cube", "label": "glossy","usage": "environment", "visible": "false" }
uniform sampler2D glossy_cube;

//: param custom { "default": "glossy_orange_cube", "label": "glossyorange","usage": "environment", "visible": "false" }
uniform sampler2D glossy_orange_cube;

//: param custom { "default": "gold_day_cube", "label": "goldday","usage": "environment", "visible": "false" }
uniform sampler2D gold_day_cube;

//: param custom { "default": "techies_metal_cube", "label": "techies","usage": "environment", "visible": "false" }
uniform sampler2D techies_metal_cube;

//: param custom { "default": "veryglossy_green_underlit_cube", "label": "vglossyunderlit","usage": "environment", "visible": "false" }
uniform sampler2D veryglossy_green_underlit_cube;

//: param custom { "default": "jakiro_cube", "label": "jakiro","usage": "environment", "visible": "false" }
uniform sampler2D jakiro_cube;

//: param custom { "default": "n_creep_centaur_conqueror_metal_cube", "label": "conqueror","usage": "environment", "visible": "false" }
uniform sampler2D n_creep_centaur_conqueror_metal_cube;

//: param custom { "default": "cube_metal_grey_contrast_cube", "label": "metalgreycontrast","usage": "environment", "visible": "false" }
uniform sampler2D cube_metal_grey_contrast_cube;

//---fulltrash--//


//-------- Rim Lighting Parameters ---------------------------------------------------//

//: param custom { "default": 1, "label": "Rim Light Color", "group": "DOTA Shader/DOTA Lighting/Rim",  "widget": "color", "visible" :"input.charSelCombo == 0"  }
uniform vec3 fRimLightColor;

//: param custom { "default": 1, "label": "Rim Light Scale", "group": "DOTA Shader/DOTA Lighting/Rim",  "min": 0.0, "max": 100, "visible" :"input.charSelCombo == 0"  }
uniform float fRimLightScale;


//Warps//

//: param custom { "default": "default_fresnelwarprim", "label": "Rim Warp", "group": "DOTA Shader/Fresnel Warp Textures", "usage": "texture" }
uniform sampler2D rimWarpSample;

//: param custom { "default": "default_fresnelwarpspec", "label": "Specular Warp", "group": "DOTA Shader/Fresnel Warp Textures", "usage": "texture" }
uniform sampler2D specWarpSample;





//: param custom { "default": true, "label": "Use Detail Mask", "group": "DOTA Shader/Detail Map",  "visible" :"input.charSelCombo == 0" }
uniform bool bDoDetailMask;

//: param custom { "default": "", "label": "Detail Map","group": "DOTA Shader/Detail Map", "usage": "texture" }
uniform sampler2D detailMapSampler;


//: param custom { "default": 1.0, "label": "Detail Scale","group": "DOTA Shader/Detail Map", "min": 0.0, "max": 32.0,  "visible" :"input.charSelCombo == 0" }
uniform float fDetailScale;

//: param custom { "default": 1.0, "label": "Detail Blend","group": "DOTA Shader/Detail Map", "min": 0.0, "max": 1.0 }
uniform float fDetailBlend;

//------------------------------------------------------------------//
//-------------------------- Data Stucts ---------------------------//
//------------------------------------------------------------------//

struct lightEnvironment
{
    vec3  lightVector;
    vec3  lightColor;
	float  lightScale;
    float ambientScale;
};

lightEnvironment lightEnv;

struct characterSelect
{
	bool useMetalMaskCube;
	bool useCubeMap;
	float cubeScale;
	float rimScale;
	float specExponent;
	float specScale;
	vec3 rimColor;
	vec3 specColor;
	sampler2D cubeMap;
	float detailIntensity;
	vec2 uvScale;
	vec2 uvOffset;
};

characterSelect charSel;
//character select combo box stuffs

void InitCharacterSelect()
{
    if (charSelCombo == 0){ //Custom
		charSel.useMetalMaskCube = bDoMetalMaskCube;
		charSel.useCubeMap = bDoCubeMap;
		charSel.cubeScale = fCubemapScale;
		charSel.rimScale = fRimLightScale;
		charSel.specExponent =fSpecularExponent;
	   	charSel.specScale = fSpecularScale;
	   	charSel.rimColor = fRimLightColor;
		charSel.specColor = fSpecularColor;
	   	charSel.cubeMap = fCubeMapSample;
		charSel.detailIntensity = fDetailBlend;
	 	charSel.uvScale = vec2(fDetailScale,fDetailScale);
	 	charSel.uvOffset = vec2(horizontalScrollSpeed,verticalScrollSpeed);
    }
else if (charSelCombo == 1 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 3; charSel.specExponent= 32; charSel.specScale= 80; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(5, 5); charSel.uvOffset = vec2(fract(vec2(.096,.115)*Time));}
else if (charSelCombo == 2 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 3; charSel.specExponent= 32; charSel.specScale= 80; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(5, 5); charSel.uvOffset = vec2(fract(vec2(.096,.115)*Time));}
else if (charSelCombo == 3 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 10; charSel.specExponent= 22; charSel.specScale= 15; charSel.rimColor= vec3(0.735357, 0.906332, 0.954687); charSel.specColor= vec3(0.854306, 0.954687, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(.115,.164)*Time));}
else if (charSelCombo == 4 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 10; charSel.specExponent= 22; charSel.specScale= 15; charSel.rimColor= vec3(0.735357, 0.906332, 0.954687); charSel.specColor= vec3(0.854306, 0.954687, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(.115,.164)*Time));}
else if (charSelCombo == 5 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 5; charSel.rimScale= 25; charSel.specExponent= 5; charSel.specScale= 5; charSel.rimColor= vec3(0.545098, 1, 0.913726); charSel.specColor= vec3(0.854902, 1, 1); charSel.cubeMap =glossy_broad_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1.5, 1.5); charSel.uvOffset = vec2(fract(vec2(-0,-.025)*Time));}
else if (charSelCombo == 6 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 15; charSel.specScale= 4; charSel.rimColor= vec3(0.735357, 0.735357, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 7 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 15; charSel.specScale= 5; charSel.rimColor= vec3(0.666667, 1, 1); charSel.specColor= vec3(0.705882, 0.694118, 0.678431); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 8 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 20; charSel.specScale= 2.5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0.954687, 0.906332, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(2.5, 2.5); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 9 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 32; charSel.specScale= 8; charSel.rimColor= vec3(0.737255, 0.905882, 0.952941); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 10 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 10; charSel.specScale= 3; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 11 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 10; charSel.specScale= 4; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(2, 2); charSel.uvOffset = vec2(fract(vec2(.2,0)*Time));}
else if (charSelCombo == 12 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 0.1; charSel.specExponent= 8; charSel.specScale= 3; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 13 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 0.1; charSel.specExponent= 8; charSel.specScale= 3; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 14 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 32; charSel.specScale= 4; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 15 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 10; charSel.specScale= 1; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 16 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 20; charSel.specScale= 7; charSel.rimColor= vec3(0.906332, 1, 1); charSel.specColor= vec3(0.854306, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(5.5,0)*Time));}
else if (charSelCombo == 17 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 10; charSel.specExponent= 64; charSel.specScale= 5; charSel.rimColor= vec3(1, 0.737255, 0.737255); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(-.068,-.188)*Time));}
else if (charSelCombo == 18 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 10; charSel.specExponent= 64; charSel.specScale= 5; charSel.rimColor= vec3(0.737255, 0.737255, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 19 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 2; charSel.specExponent= 64; charSel.specScale= 5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 20 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 20; charSel.specScale= 5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 21 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1.5; charSel.specExponent= 100; charSel.specScale= 55; charSel.rimColor= vec3(1, 0.445061, 0); charSel.specColor= vec3(0.735357, 0.665185, 0.907832); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 22 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 24; charSel.specScale= 8; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 23 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 3; charSel.specExponent= 32; charSel.specScale= 10; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 24 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 1; charSel.rimScale= 0; charSel.specExponent= 6.646; charSel.specScale= 5.525; charSel.rimColor= vec3(0.666667, 0.807843, 0.854902); charSel.specColor= vec3(0.847059, 0.882353, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1.5, 1.5); charSel.uvOffset = vec2(fract(vec2(0,-.3)*Time));}
else if (charSelCombo == 25 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 2; charSel.specExponent= 20; charSel.specScale= 3; charSel.rimColor= vec3(1, 1, 0.952941); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(-0,.1)*Time));}
else if (charSelCombo == 26 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 32; charSel.specScale= 3; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 27 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 35; charSel.specScale= 6; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0.611765, 0.835294, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 28 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 4; charSel.specExponent= 33; charSel.specScale= 11; charSel.rimColor= vec3(0.735357, 0.906332, 0.954687); charSel.specColor= vec3(0.854306, 0.954687, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 29 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 3; charSel.specExponent= 15; charSel.specScale= 3; charSel.rimColor= vec3(0.827451, 1, 0.894118); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 30 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 10; charSel.rimScale= 1; charSel.specExponent= 64; charSel.specScale= 5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0.866667, 0.898039, 0.643137); charSel.cubeMap =glossy_broad_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 31 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 3; charSel.rimScale= 2; charSel.specExponent= 15; charSel.specScale= 3; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0.847059, 0.929412, 1); charSel.cubeMap =dawnbreaker_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(2, 0.5); charSel.uvOffset = vec2(fract(vec2(-0,.25)*Time));}
else if (charSelCombo == 32 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 10; charSel.specScale= 3; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 33 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 10; charSel.specExponent= 23; charSel.specScale= 42; charSel.rimColor= vec3(0.735357, 0.906332, 0.954687); charSel.specColor= vec3(0.854306, 0.954687, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 34 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 15; charSel.specScale= 0.5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 35 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 3; charSel.specExponent= 32; charSel.specScale= 5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 36 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 3; charSel.specExponent= 32; charSel.specScale= 5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 37 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 0.5; charSel.specExponent= 20; charSel.specScale= 16; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0.85098, 0.85098, 0.85098); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 38 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 4; charSel.specScale= 16; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0.592619, 0.906332, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 39 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 4; charSel.specScale= 16; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0.859696, 1, 0.797738); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 40 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 4; charSel.specScale= 16; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 0.906332, 0.797738); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 41 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 10; charSel.specExponent= 63; charSel.specScale= 5; charSel.rimColor= vec3(0.735357, 0.906332, 0.954687); charSel.specColor= vec3(0.854306, 0.954687, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(.115,.164)*Time));}
else if (charSelCombo == 42 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 11; charSel.specScale= 5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 43 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 3; charSel.rimScale= 3; charSel.specExponent= 40; charSel.specScale= 10; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0.780392, 0.941177, 1); charSel.cubeMap =cube_metal_grey_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 44 ) { charSel.useMetalMaskCube= true; charSel.useCubeMap= true; charSel.cubeScale= 5; charSel.rimScale= 3; charSel.specExponent= 10; charSel.specScale= 2; charSel.rimColor= vec3(0.797738, 0.906332, 0.484529); charSel.specColor= vec3(0.954687, 0.954687, 1); charSel.cubeMap =cube_earthspirit_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(.115,.164)*Time));}
else if (charSelCombo == 45 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 6; charSel.specExponent= 20; charSel.specScale= 10; charSel.rimColor= vec3(0.854306, 1, 0.906332); charSel.specColor= vec3(0.854306, 1, 0.906332); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(10, 10); charSel.uvOffset = vec2(fract(vec2(.039,.008)*Time));}
else if (charSelCombo == 46 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 30; charSel.specScale= 4; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(-.197,-.035)*Time));}
else if (charSelCombo == 47 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 20; charSel.specScale= 10; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(2, 2); charSel.uvOffset = vec2(fract(vec2(-.289,.345)*Time));}
else if (charSelCombo == 48 ) { charSel.useMetalMaskCube= true; charSel.useCubeMap= true; charSel.cubeScale= 1; charSel.rimScale= 5; charSel.specExponent= 32; charSel.specScale= 15.4; charSel.rimColor= vec3(1, 0.484529, 0); charSel.specColor= vec3(0.439607, 0.695466, 1); charSel.cubeMap =glossy_orange_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 49 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 0.8; charSel.specExponent= 30; charSel.specScale= 3; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 50 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 11; charSel.specExponent= 5; charSel.specScale= 5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0, 0.713726, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(3, 3); charSel.uvOffset = vec2(fract(vec2(-.141,-.141)*Time));}
else if (charSelCombo == 51 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 5; charSel.rimScale= 42; charSel.specExponent= 5; charSel.specScale= 5; charSel.rimColor= vec3(0.737255, 0.423529, 1); charSel.specColor= vec3(0, 0.701961, 1); charSel.cubeMap =crimson_pique_glass_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(.068,-.188)*Time));}
else if (charSelCombo == 52 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 3; charSel.rimScale= 0; charSel.specExponent= 30; charSel.specScale= 5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 0.905882, 0.905882); charSel.cubeMap =cube_metal_grey_contrast_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 53 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 8; charSel.specScale= 3; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 54 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 0.6; charSel.specExponent= 30; charSel.specScale= 2; charSel.rimColor= vec3(0.854306, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 55 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 5; charSel.rimScale= 5; charSel.specExponent= 15; charSel.specScale= 5; charSel.rimColor= vec3(0.541176, 0.698039, 0.894118); charSel.specColor= vec3(0.94902, 0.937255, 0.898039); charSel.cubeMap =darkreef_hatchetfish_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0,0);}
else if (charSelCombo == 56 ) { charSel.useMetalMaskCube= true; charSel.useCubeMap= true; charSel.cubeScale= 1; charSel.rimScale= 6; charSel.specExponent= 33; charSel.specScale= 7; charSel.rimColor= vec3(0.735357, 0.906332, 0.954687); charSel.specColor= vec3(0.854306, 0.954687, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 57 ) { charSel.useMetalMaskCube= true; charSel.useCubeMap= true; charSel.cubeScale= 1; charSel.rimScale= 1; charSel.specExponent= 32; charSel.specScale= 6; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =hoodwink_day_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1.855, 1.257); charSel.uvOffset = vec2(fract(vec2(.3,0)*Time));}
else if (charSelCombo == 58 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 30; charSel.specScale= 5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract((vec2(-0,1)*Time)/4));}
else if (charSelCombo == 59 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 2; charSel.specExponent= 25; charSel.specScale= 10; charSel.rimColor= vec3(1, 0, 0); charSel.specColor= vec3(1, 0, 0); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(.024,.449)*Time));}
else if (charSelCombo == 60 ) { charSel.useMetalMaskCube= true; charSel.useCubeMap= true; charSel.cubeScale= 1; charSel.rimScale= 2; charSel.specExponent= 24; charSel.specScale= 8; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =snapfire_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 61 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 2; charSel.specExponent= 5; charSel.specScale= 6; charSel.rimColor= vec3(1, 1, 0.882353); charSel.specColor= vec3(1, 0.666667, 0.627451); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 62 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 0; charSel.specExponent= 0; charSel.specScale= 0; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 63 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 3; charSel.rimScale= 3; charSel.specExponent= 15; charSel.specScale= 15; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0.733333, 0.784314, 0.972549); charSel.cubeMap =jakiro_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(vec2(.25,Time*-.05));}
else if (charSelCombo == 64 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 3; charSel.rimScale= 1; charSel.specExponent= 13; charSel.specScale= 1; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =cube_metal_grey_contrast_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 65 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 3; charSel.rimScale= 1.35; charSel.specExponent= 20; charSel.specScale= 2; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =cube_metal_grey_contrast_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 66 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 100; charSel.specScale= 10; charSel.rimColor= vec3(0.735357, 0.906332, 0.954687); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 67 ) { charSel.useMetalMaskCube= true; charSel.useCubeMap= true; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 16; charSel.specScale= 10; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(vec2(.13,1-(Time/4.56)));}
else if (charSelCombo == 68 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 3; charSel.specExponent= 23; charSel.specScale= 1.6; charSel.rimColor= vec3(0.735357, 0.906332, 0.954687); charSel.specColor= vec3(0.854306, 0.954687, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 69 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 2; charSel.specExponent= 15; charSel.specScale= 7; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 70 ) { charSel.useMetalMaskCube= true; charSel.useCubeMap= true; charSel.cubeScale= 1; charSel.rimScale= 5; charSel.specExponent= 32; charSel.specScale= 5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 0.797738, 0.583831); charSel.cubeMap =cube_legion_commander_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(-0,.45)*Time));}
else if (charSelCombo == 71 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 0.1; charSel.specExponent= 4; charSel.specScale= 10; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0.34919, 0.735357, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 72 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1.4; charSel.specExponent= 20; charSel.specScale= 4; charSel.rimColor= vec3(0.735357, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 73 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 0.4; charSel.rimScale= 1; charSel.specExponent= 16; charSel.specScale= 10; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 74 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 30; charSel.specScale= 3; charSel.rimColor= vec3(1, 1, 0.880825); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(0, 0); charSel.uvOffset = vec2(fract(vec2(.106,.106)*Time));}
else if (charSelCombo == 75 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 10; charSel.specExponent= 20; charSel.specScale= 15; charSel.rimColor= vec3(0.735357, 0.906332, 0.906332); charSel.specColor= vec3(0.854306, 0.954687, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(.229,.328)*Time));}
else if (charSelCombo == 76 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 10; charSel.specExponent= 23; charSel.specScale= 22; charSel.rimColor= vec3(0.737255, 0.905882, 0.952941); charSel.specColor= vec3(0.854902, 0.952941, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(5, 5); charSel.uvOffset = vec2(0,0);}
else if (charSelCombo == 77 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 10; charSel.specExponent= 23; charSel.specScale= 22; charSel.rimColor= vec3(0.735357, 0.906332, 0.954687); charSel.specColor= vec3(0.854306, 0.954687, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(5, 5); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 78 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 4; charSel.specExponent= 20; charSel.specScale= 20; charSel.rimColor= vec3(0.905882, 1, 1); charSel.specColor= vec3(0.905882, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 79 ) { charSel.useMetalMaskCube= true; charSel.useCubeMap= true; charSel.cubeScale= 0.5; charSel.rimScale= 4; charSel.specExponent= 20; charSel.specScale= 20; charSel.rimColor= vec3(0.905882, 1, 1); charSel.specColor= vec3(0.905882, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 80 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 0.5; charSel.specExponent= 20; charSel.specScale= 1; charSel.rimColor= vec3(0.737255, 0.827451, 1); charSel.specColor= vec3(0.737255, 0.827451, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 81 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 3; charSel.rimScale= 0.5; charSel.specExponent= 25; charSel.specScale= 10; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 82 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 10; charSel.specExponent= 20; charSel.specScale= 10; charSel.rimColor= vec3(0.484529, 0.906332, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 83 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 3; charSel.rimScale= 2; charSel.specExponent= 30; charSel.specScale= 5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =cube_metal_grey_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(6, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 84 ) { charSel.useMetalMaskCube= true; charSel.useCubeMap= true; charSel.cubeScale= 1; charSel.rimScale= 2; charSel.specExponent= 12.2; charSel.specScale= 22; charSel.rimColor= vec3(0.866667, 0.74902, 0.615686); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =mars_bronze_day_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(-0,.4)*Time));}
else if (charSelCombo == 85 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 1; charSel.rimScale= 4; charSel.specExponent= 22; charSel.specScale= 15; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 86 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 12; charSel.specExponent= 5; charSel.specScale= 22.5; charSel.rimColor= vec3(0.537099, 0.722027, 0.954687); charSel.specColor= vec3(0, 0.836007, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 87 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 16; charSel.specScale= 1; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 88 ) { charSel.useMetalMaskCube= true; charSel.useCubeMap= true; charSel.cubeScale= 1.5; charSel.rimScale= 1; charSel.specExponent= 30; charSel.specScale= 10; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(6, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 89 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 16; charSel.specScale= 10; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 90 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 3; charSel.rimScale= 3; charSel.specExponent= 10; charSel.specScale= 5; charSel.rimColor= vec3(0.835294, 0.921569, 1); charSel.specColor= vec3(0.952941, 0.854902, 0.611765); charSel.cubeMap =gold_day_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(0.5, 1); charSel.uvOffset = vec2(vec2(-.25,Time*-.082));}
else if (charSelCombo == 91 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 2; charSel.rimScale= 0.5; charSel.specExponent= 50; charSel.specScale= 15; charSel.rimColor= vec3(0.484529, 0.906332, 0.854306); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(-0,.3)*Time));}
else if (charSelCombo == 92 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 30; charSel.specScale= 4; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(2, 2); charSel.uvOffset = vec2(vec2(-.25,Time*.382));}
else if (charSelCombo == 93 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 0.2; charSel.specExponent= 20; charSel.specScale= 3; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 94 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 4; charSel.specExponent= 33; charSel.specScale= 11; charSel.rimColor= vec3(0.735357, 0.906332, 0.954687); charSel.specColor= vec3(0.854306, 0.954687, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(4, 4); charSel.uvOffset = vec2(fract(vec2(.025,-.025)*Time));}
else if (charSelCombo == 95 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 0; charSel.specExponent= 64; charSel.specScale= 4; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(.061,.496)*Time));}
else if (charSelCombo == 96 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 12; charSel.specScale= 2; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0.835294, 0.721569, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(0,-.2)*Time));}
else if (charSelCombo == 97 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 5; charSel.specExponent= 16; charSel.specScale= 10; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 98 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 8; charSel.rimScale= 1; charSel.specExponent= 12; charSel.specScale= 5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 0.941177, 0.717647); charSel.cubeMap =cube_metal_grey_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 99 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 8; charSel.rimScale= 3; charSel.specExponent= 30; charSel.specScale= 15; charSel.rimColor= vec3(0.836007, 0.922823, 1); charSel.specColor= vec3(1, 0.797738, 0.583831); charSel.cubeMap =cube_metal_grey_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(-0,-.085)*Time));}
else if (charSelCombo == 100 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 5; charSel.rimScale= 0.5; charSel.specExponent= 20; charSel.specScale= 5; charSel.rimColor= vec3(0.533333, 0.592157, 0.898039); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 101 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 0.25; charSel.rimScale= 5; charSel.specExponent= 15; charSel.specScale= 10; charSel.rimColor= vec3(0.737255, 0.796079, 0.666667); charSel.specColor= vec3(0.854902, 0.952941, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0,0);}
else if (charSelCombo == 102 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 0.5; charSel.specExponent= 25; charSel.specScale= 1; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 103 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 4; charSel.specExponent= 10; charSel.specScale= 3; charSel.rimColor= vec3(1, 0.34919, 0); charSel.specColor= vec3(0.854306, 0.954687, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(-0,.1)*Time));}
else if (charSelCombo == 104 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 4; charSel.specExponent= 40; charSel.specScale= 40; charSel.rimColor= vec3(1, 0.34919, 0); charSel.specColor= vec3(0.854306, 0.954687, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(-.094,-.034)*Time));}
else if (charSelCombo == 105 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 4; charSel.specExponent= 20; charSel.specScale= 20; charSel.rimColor= vec3(1, 0.34919, 0); charSel.specColor= vec3(0.854306, 0.954687, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(-.094,-.034)*Time));}
else if (charSelCombo == 106 ) { charSel.useMetalMaskCube= true; charSel.useCubeMap= true; charSel.cubeScale= 0.5; charSel.rimScale= 4; charSel.specExponent= 10; charSel.specScale= 5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0.74902, 1, 0.909804); charSel.cubeMap =primal_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 107 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 1; charSel.rimScale= 4; charSel.specExponent= 60; charSel.specScale= 3; charSel.rimColor= vec3(0.709804, 0.882353, 1); charSel.specColor= vec3(0.686275, 1, 0.968628); charSel.cubeMap =primal_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 108 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 2; charSel.specExponent= 8; charSel.specScale= 25; charSel.rimColor= vec3(0.735357, 1, 0.735357); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 109 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 10; charSel.specExponent= 30; charSel.specScale= 10; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0.854902, 0.952941, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 110 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 10; charSel.specExponent= 30; charSel.specScale= 10; charSel.rimColor= vec3(0.735357, 0.906332, 0.954687); charSel.specColor= vec3(0.854306, 0.954687, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(.077,-.064)*Time));}
else if (charSelCombo == 111 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 3; charSel.specExponent= 15; charSel.specScale= 13; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 112 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 0.21; charSel.specExponent= 15; charSel.specScale= 1; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 113 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 20; charSel.specScale= 8; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(-0,.3)*Time));}
else if (charSelCombo == 114 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 0.5; charSel.rimScale= 1; charSel.specExponent= 30; charSel.specScale= 7; charSel.rimColor= vec3(0.905882, 0.905882, 0.905882); charSel.specColor= vec3(0.905882, 0.905882, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 115 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 15; charSel.specScale= 1.5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(6, 6); charSel.uvOffset = vec2(fract(vec2(.339,.212)*Time));}
else if (charSelCombo == 116 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 2; charSel.specExponent= 13; charSel.specScale= 1; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 117 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 20; charSel.specScale= 5; charSel.rimColor= vec3(0.930925, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 118 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 23; charSel.specScale= 5; charSel.rimColor= vec3(0.737255, 0.905882, 0.952941); charSel.specColor= vec3(0.854902, 0.952941, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(6, 6); charSel.uvOffset = vec2(fract(vec2(-0,.2)*Time));}
else if (charSelCombo == 119 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 10; charSel.specScale= 5; charSel.rimColor= vec3(1, 1, 0.906332); charSel.specColor= vec3(1, 0.701411, 0); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 120 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 2.3; charSel.specExponent= 25; charSel.specScale= 8; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0.797738, 0.665185, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(-0,.1)*Time));}
else if (charSelCombo == 121 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 0.25; charSel.specExponent= 16; charSel.specScale= 5; charSel.rimColor= vec3(0.484529, 0.797738, 0.906332); charSel.specColor= vec3(0.880825, 0.2478, 0.2478); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(2, 2); charSel.uvOffset = vec2(fract(vec2(-.098,-.017)*Time));}
else if (charSelCombo == 122 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 2; charSel.specExponent= 25; charSel.specScale= 10; charSel.rimColor= vec3(1, 0, 0); charSel.specColor= vec3(1, 0, 0); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(-0,.45)*Time));}
else if (charSelCombo == 123 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 0.5; charSel.specExponent= 7; charSel.specScale= 8; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0.34919, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 124 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 12; charSel.specScale= 2; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 0.854902, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 125 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 0.6; charSel.rimScale= 1; charSel.specExponent= 20; charSel.specScale= 5; charSel.rimColor= vec3(0.537099, 0.880825, 1); charSel.specColor= vec3(0.854306, 0.954687, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 126 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 15; charSel.specScale= 4; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 127 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 0; charSel.specExponent= 32; charSel.specScale= 5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(-0,.45)*Time));}
else if (charSelCombo == 128 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 3; charSel.rimScale= 3; charSel.specExponent= 25; charSel.specScale= 10; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0.796079, 1, 1); charSel.cubeMap =n_creep_centaur_conqueror_metal_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 129 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 3; charSel.rimScale= 1; charSel.specExponent= 30; charSel.specScale= 15; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 130 ) { charSel.useMetalMaskCube= true; charSel.useCubeMap= true; charSel.cubeScale= 0.5; charSel.rimScale= 4; charSel.specExponent= 15; charSel.specScale= 2; charSel.rimColor= vec3(0.152941, 1, 0.886275); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =snapfire_lizard_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 131 ) { charSel.useMetalMaskCube= true; charSel.useCubeMap= true; charSel.cubeScale= 0.5; charSel.rimScale= 4; charSel.specExponent= 32; charSel.specScale= 1; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =snapfire_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(4.8, 2.693); charSel.uvOffset = vec2(fract(vec2(-0,-.4)*Time));}
else if (charSelCombo == 132 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 50; charSel.specScale= 25; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0.735357, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 133 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1.5; charSel.specExponent= 2; charSel.specScale= 10; charSel.rimColor= vec3(1, 0.583831, 0.797738); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 134 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 15; charSel.specScale= 15; charSel.rimColor= vec3(0.880825, 0.880825, 1); charSel.specColor= vec3(0.880825, 0.906332, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(5, 5); charSel.uvOffset = vec2(fract(vec2(.061,.496)*Time));}
else if (charSelCombo == 135 ) { charSel.useMetalMaskCube= true; charSel.useCubeMap= true; charSel.cubeScale= 0.75; charSel.rimScale= 3; charSel.specExponent= 32; charSel.specScale= 1; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0, 0.735357, 1); charSel.cubeMap =glossy_blue_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(-.3*cos(.017453*mix(92,93,(.5*sin(.196*Time))+.5)),-.3*sin(.017453*mix(92,93,(.5*sin(.196*Time))+.5)))*Time));}
else if (charSelCombo == 136 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 3; charSel.rimScale= 1; charSel.specExponent= 20; charSel.specScale= 12; charSel.rimColor= vec3(0.906332, 1, 1); charSel.specColor= vec3(0.906332, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(5, 5); charSel.uvOffset = vec2(fract(vec2(.061,.496)*Time));}
else if (charSelCombo == 137 ) { charSel.useMetalMaskCube= true; charSel.useCubeMap= true; charSel.cubeScale= 1; charSel.rimScale= 2; charSel.specExponent= 60; charSel.specScale= 5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =techies_metal_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 138 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 2; charSel.specExponent= 20; charSel.specScale= 10; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 139 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 2; charSel.specExponent= 15; charSel.specScale= 7; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 140 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 14; charSel.rimScale= 1; charSel.specExponent= 32; charSel.specScale= 5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(.349,.735,1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(7, 7); charSel.uvOffset = vec2(fract(vec2(-.06,-.5)*Time));}
else if (charSelCombo == 141 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 2; charSel.specExponent= 18; charSel.specScale= 8; charSel.rimColor= vec3(0, 1, 1); charSel.specColor= vec3(1, 0.735357, 0.34919); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(7, 7); charSel.uvOffset = vec2(fract(vec2(-.04,-.3)*Time));}
else if (charSelCombo == 142 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 15; charSel.specScale= 4; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0.735357, 1, 0.906332); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 143 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 1; charSel.rimScale= 1; charSel.specExponent= 20; charSel.specScale= 8; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(0,-.2)*Time));}
else if (charSelCombo == 144 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 1; charSel.rimScale= 5; charSel.specExponent= 40; charSel.specScale= 17; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 145 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 3; charSel.rimScale= 1; charSel.specExponent= 25; charSel.specScale= 10; charSel.rimColor= vec3(0.929412, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =cube_metal_grey_contrast_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0,0);}
else if (charSelCombo == 146 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 6; charSel.specExponent= 25; charSel.specScale= 2; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(0.826657, 0.880825, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 147 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 16; charSel.specScale= 10; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 148 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 20; charSel.specScale= 10; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 149 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 32; charSel.specScale= 10; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(0.25, 0.25); charSel.uvOffset = vec2(1-fract((vec2(.257,-.257)*Time)*.25));}
else if (charSelCombo == 150 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 35; charSel.specScale= 25; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 151 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 2; charSel.specExponent= 64; charSel.specScale= 44; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 152 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 32; charSel.specScale= 5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(15, 15); charSel.uvOffset = vec2(fract(vec2(.061,.496)*Time));}
else if (charSelCombo == 153 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 10; charSel.specExponent= 13; charSel.specScale= 60; charSel.rimColor= vec3(0.737255, 0.905882, 0.952941); charSel.specColor= vec3(0.854902, 0.952941, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(-0,.1)*Time));}
else if (charSelCombo == 154 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 25; charSel.specScale= 10; charSel.rimColor= vec3(0.880825, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 155 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 2; charSel.specExponent= 20; charSel.specScale= 8; charSel.rimColor= vec3(0.954687, 0.954687, 0.484529); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(2, 2); charSel.uvOffset = vec2(fract(vec2(.007,.06)*Time));}
else if (charSelCombo == 156 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 10; charSel.rimScale= 1; charSel.specExponent= 32; charSel.specScale= 10; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =veryglossy_green_underlit_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 157 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 7; charSel.specExponent= 24; charSel.specScale= 5; charSel.rimColor= vec3(0.537255, 0.721569, 0.952941); charSel.specColor= vec3(0.796079, 1, 0.905882); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(.129,-.153)*Time));}
else if (charSelCombo == 158 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 24; charSel.specScale= 62; charSel.rimColor= vec3(0.905882, 1, 0.952941); charSel.specColor= vec3(0.796079, 1, 0.905882); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 159 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= true; charSel.cubeScale= 5; charSel.rimScale= 3; charSel.specExponent= 32; charSel.specScale= 10; charSel.rimColor= vec3(0.921569, 0.764706, 1); charSel.specColor= vec3(1, 0.882353, 0.803922); charSel.cubeMap =mars_bronze_day_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(5, 5); charSel.uvOffset = vec2(fract(vec2(-0,.05)*Time));}
else if (charSelCombo == 160 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 0.8; charSel.specExponent= 15; charSel.specScale= 1; charSel.rimColor= vec3(1, 1, 0.796079); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(5, 5); charSel.uvOffset = vec2(fract(vec2(.013,.25)*Time));}
else if (charSelCombo == 161 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 2; charSel.specExponent= 15; charSel.specScale= 10; charSel.rimColor= vec3(0.880825, 0.880825, 0.880825); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 162 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 32; charSel.specScale= 6; charSel.rimColor= vec3(1, 0.905882, 0.952941); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 163 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 0.4; charSel.specExponent= 15; charSel.specScale= 5; charSel.rimColor= vec3(1, 1, 0.737255); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 164 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 16; charSel.specScale= 5; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(fract(vec2(-.05,-0)*Time));}
else if (charSelCombo == 165 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 1; charSel.specExponent= 8; charSel.specScale= 0.8; charSel.rimColor= vec3(1, 1, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 166 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 3; charSel.specExponent= 15; charSel.specScale= 15; charSel.rimColor= vec3(0.737255, 0.905882, 0.952941); charSel.specColor= vec3(0.737255, 0.952941, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}
else if (charSelCombo == 167 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 24; charSel.specExponent= 20; charSel.specScale= 40; charSel.rimColor= vec3(0.537099, 1, 0.537099); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(3, 3); charSel.uvOffset = vec2(fract(vec2(-.054,-.084)*Time));}
else if (charSelCombo == 168 ) { charSel.useMetalMaskCube= false; charSel.useCubeMap= false; charSel.cubeScale= 0; charSel.rimScale= 7; charSel.specExponent= 20; charSel.specScale= 3; charSel.rimColor= vec3(0.019608, 0.788235, 1); charSel.specColor= vec3(1, 1, 1); charSel.cubeMap =glossy_cube; charSel.detailIntensity = fDetailBlend; charSel.uvScale = vec2(1, 1); charSel.uvOffset = vec2(0);}

}


void InitLightEnvironment( vec3 position )
{
    if (lightEnvCombo == 0){ //Custom
        lightEnv.lightVector  = lightPosition_1 - position;
        lightEnv.lightColor   = lightColor_1;
        lightEnv.lightScale   = fLightMul;
        lightEnv.ambientScale = fAmbientScale;
    }
    else if (lightEnvCombo == 1){ //Store
        lightEnv.lightVector  = vec3(-0.12, 20.0, 3.44) - position;
        lightEnv.lightColor   = lightColor_1;
        lightEnv.lightScale   = 1;
        lightEnv.ambientScale = 2;
    }
	else if (lightEnvCombo == 2){ //Radiant Day
        lightEnv.lightVector  = vec3(-1.35, 11.78, -5.15) - position;
        lightEnv.lightColor   = lightColor_1;
        lightEnv.lightScale   = 1;
        lightEnv.ambientScale = 5;
    }


}


vec3 cubeSampleLOD(vec3 dir, float lod)
{
  // WORKAROUND: Intel GLSL compiler for HD5000 is bugged on OSX:
  // https://bugs.chromium.org/p/chromium/issues/detail?id=308366
  // It is necessary to replace atan(y, -x) by atan(y, -1.0 * x) to force
  // the second parameter to be interpreted as a float
  vec2 pos = M_INV_PI * vec2(atan(-dir.z, -1.0 * dir.x), 2.0 * asin(-dir.y));
  pos = 0.5 * pos + vec2(0.5);
  pos.x += fCubemapRotation ;
  return textureLod(charSel.cubeMap, pos, lod).rgb;
}


void CustomHeroDoLighting( vec3 N, vec3 L, vec3 V, vec3 LightColor, float diffuseWarpMask, float flSpecularExponent, inout vec3 finalDiffuse, inout vec3 finalSpecular,inout vec3 finalCube)
{
	L = normalize(L);

	float NdotL = dot(N, L);

	float halfLambert = NdotL * 0.5 + 0.5;

	vec3 diffuseLight = LightColor;

	vec3 reflectUnnormalized = (2.0 * ( dot ( N, V ) ) * N ) - ( dot( N, N ) * V );



//	diffuseLight *= bDoColorWarp ? texture(colorWarpSample, vec2((halfLambert), diffuseWarpMask)).rgb : vec3(halfLambert);


	diffuseLight *= halfLambert;

	finalDiffuse += diffuseLight; // Output our diffuse lighting

	NdotL = clamp(NdotL,0,1);
	vec3 R = reflect( V, N ); // No half-vector so this is consistent in look with ps2.0

	float RdotL = clamp(dot( L, -R ),0,1);

	vec3 SpecularLighting = vec3(0.0);

	float flSpecularIntensity = clamp(NdotL,0.0,1.0) * pow( max(0.001, RdotL), charSel.specExponent * flSpecularExponent );

	SpecularLighting = vec3( flSpecularIntensity, flSpecularIntensity, flSpecularIntensity );

	finalCube = cubeSampleLOD(reflectUnnormalized, 0)*charSel.cubeScale;

	finalSpecular += SpecularLighting;

}

void shade(V2F inputs)
{
inputs.normal = normalize(inputs.normal);
LocalVectors vectors = computeLocalFrame(inputs);


alphaKill(inputs.tex_coord);


//All tangent space normals

  vec3 normalTGT = getTSNormal(inputs.tex_coord);

//Compute a world space normal from the tangent space one
  	vec3 normalWS = normalize(normalTGT.x * inputs.tangent + normalTGT.y * inputs.bitangent + normalTGT.z * inputs.normal);
	if (isBackFace()) {
    	normalWS = -normalWS;
  	}

	InitLightEnvironment(inputs.position.xyz); // Bring in lights

	InitCharacterSelect();

	vec3 eye_vec = normalize(camera_pos - inputs.position);
	vec2 texCoord = inputs.tex_coord;
	vec3 V = eye_vec;
 
	float VdotN = clamp(dot(vectors.normal, vectors.eye ),0.008,0.992);

	


	float flDetailMask		= texture(detail_tex,texCoord).r;
	float flDiffuseWarpMask = getRoughness(fresnelMaskSampler,texCoord);
	float flMetalnessMask	= texture(metallicSampler,texCoord).r;
	float flSelfIllumMask	= texture(emissiveSampler,texCoord).r;

	float flSpecularMask      = getRoughness(specularLinearSampler,texCoord);
	float flRimMask           = getRoughness(rimSampler,texCoord);
	float flTintByBaseMask    = texture(tintSpecSampler,texCoord).r;
	float flSpecularExponent  = getRoughness(glossinessSampler,texCoord);


	//float flDifWarp		      = texture(colorWarpSample, vec2(VdotN, .5)).r;
	float flRimWarp		      = texture(rimWarpSample, vec2(VdotN, .5 )).r;
	float flSpecWarp		  = texture(specWarpSample, vec2(VdotN, .5 )).r;
	//	vec3 colSpecWarp		  = texture(colSpecWarpSample, vec2(VdotN, max(.001,flSpecularExponent))).rgb;


	vec4 albedo = texture2D(diffuseMapSampler, texCoord);
	albedo.rgb += DEFAULT_BASE_COLOR * (1.0 - albedo.a);
	
	vec3 diffuseColor = vec3(0.5); 
	diffuseColor = albedo.rgb; 

	// detail add if on!
	if (bDoDetailMask)
	{

	float Scale = (Time * TimeSpeed * 5);
	Scale = 1 - Scale;
	
	vec2 offsetXY = vec2(Scale)*charSel.uvOffset;


	vec3 Detail = texture(detailMapSampler, inputs.tex_coord * charSel.uvScale+offsetXY).rgb;
	diffuseColor += Detail * flDetailMask*charSel.detailIntensity;
	}
	
	
// vec3 ambient = fAmbientColor * lightEnv.ambientScale;
	vec3 ambient = vec3(lightEnv.ambientScale);

	vec3 finalDiffuse = vec3(0.0);
	vec3 finalSpecular = vec3(0.0); 
	vec3 finalCube = vec3(0.0);
	vec3 rimLighting = vec3(0.0);
	vec3 fwRim = vec3(0.0);
	vec3 LightColor = lightColor_1;

	vec3 final;


	CustomHeroDoLighting( normalWS,  lightEnv.lightVector, V, lightEnv.lightColor, flDiffuseWarpMask, flSpecularExponent, finalDiffuse, finalSpecular, finalCube);


//
//	if (bDoSpecWarp==true)
//	{
//	
//	finalSpecular = colSpecWarp;
//
//	}
//

//scale spec
vec3 cSpecular = finalSpecular*charSel.specScale;



//spec tint 
vec3 SpecularTint = mix(diffuseColor, charSel.specColor, flTintByBaseMask );
	

	if (charSel.useCubeMap==true)
	{
	
	//cSpecular += finalCube * (1.0-flMetalnessMask);
	cSpecular += charSel.useMetalMaskCube ? finalCube * (1.0-flMetalnessMask) : finalCube;
	
	}

cSpecular *= flSpecularMask;

cSpecular *= SpecularTint;

cSpecular *= max(flMetalnessMask, flSpecWarp);

//final accum

final = (finalDiffuse * diffuseColor *ambient);

final += cSpecular;

vec3 metalness = cSpecular;



// met +(cube*mask) : met
final = charSel.useMetalMaskCube ? mix(final, metalness + (finalCube*flMetalnessMask), flMetalnessMask ): mix( final, metalness, flMetalnessMask);


//rim scal 
rimLighting = charSel.rimColor * (charSel.rimScale/10) * flRimMask * max(0.0, normalWS.y) * flRimWarp;

final += rimLighting;

final = mix (final, diffuseColor, flSelfIllumMask);

// final = ScrollingTexture;
final *= getShadowFactor();


		diffuseShadingOutput(final);


}
