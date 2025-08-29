class CfgPatches {
    class scp_automover {
        units[] = {"SCP_AutoMover"};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F", "cba_main"};
        requiredVersion = 2.06;
        author = "Phoenix";
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
        };
    };
};

class CfgEditorCategories {
    class SCP_EditorCategory {
        displayName = "SCP Objects";
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