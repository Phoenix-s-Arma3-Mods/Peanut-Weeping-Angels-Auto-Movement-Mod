class CfgPatches {
    class scp_automover {
        units[] = {"SCP_AutoMover", "SCP_Module_SpawnAutoMover"};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F", "cba_main", "cba_xeh"};
        requiredVersion = 2.06;
        author = "Phoenix";
    };
};

class CfgRemoteExec {
    class Functions {
        mode = 1; jip = 1;
        class PHK_fnc_showKillImage { allowedTargets = 1; }
    };
};

class CfgFactionClasses {
    class SCP_ZeusModules {
        displayName = "SCP Modules";
        priority = 1;
        side = 7;
    };
};

class CfgVehicles {
    #include "CfgVehicles.hpp"
};

class CfgFunctions {
    class PHK {
        class AutoMover {
            file = "\scp_automover\functions";
            class mainLoop {};
            class isLookedAt {};
            class stepTowardPlayer {};
            class spawnAutoMover {};
            class projectDownToSurface {};
            class projectASLToSurface {};
            
            class showKillImage {};
        };
    };
};

class CfgEditorCategories {
    class SCP_EditorCategory {
        displayName = "SCP Objects";
    };

    class SCP_ZeusModules {
        displayName = "SCP Zeus Modules";
    };
};
class CfgEditorSubcategories {
    class SCP_EditorSubcategory {
        displayName = "Movable Entities";
    };
};


class Extended_PreInit_EventHandlers {
    class scp_automover {
        init = "call compile preprocessFileLineNumbers '\scp_automover\XEH_preInit.sqf';";
    };
};

class Extended_PostInit_EventHandlers {
    class scp_automover {
        init = "call compile preprocessFileLineNumbers '\scp_automover\XEH_postInit.sqf';";
    };
};

// class RscPicture;
// class RscPictureKeepAspect;

// class RscTitles {
//   class PHK_KillOverlay {
//     idd = -1;
//     duration = 5;           // script will override actual show time
//     movingEnable = 0;
//     fadein = 0;
//     fadeout = 0;
//     onLoad = "uiNamespace setVariable ['PHK_KillOverlay', _this select 0]";
//     class controls {
//       // full-bleed image (will stretch to fill)
//       class Pic: RscPictureKeepAspect {
//         idc = 926501;
//         text = "\scp_automover\images\KilledBySCP.paa";
//         x = "safeZoneXAbs";
//         y = "safeZoneY";
//         w = "safeZoneWAbs";
//         h = "safeZoneH";
//       };
//     };
//   };
// };
class RscText;
class RscPicture;
class RscPictureKeepAspect;
class RscDisplayEmpty;

class RscDisplayPHK_KillOverlay
{
  idd = 926600;
  movingEnable = 0;
  enableSimulation = 0;
  enableDisplay = 1;
  onLoad   = "uiNamespace setVariable ['PHK_KillDialog', _this select 0]";
  onUnload = "uiNamespace setVariable ['PHK_KillDialog', displayNull]";
  class controls
  {
    class Pic: RscPictureKeepAspect
    {
      idc = 926501;
      text = "\scp_automover\images\KilledBySCP.paa";
      x = "safeZoneXAbs";
      y = "safeZoneY";
      w = "safeZoneWAbs";
      h = "safeZoneH";
    };
  };
};