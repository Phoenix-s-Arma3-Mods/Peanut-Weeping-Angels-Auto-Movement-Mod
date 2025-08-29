class Land_Maroula_F; // base class
class SCP_AutoMover : Land_Maroula_F {
    scope = 2;
    scopeCurator = 0;
    displayName = "Movable SCP";
    editorCategory = "SCP_EditorCategory";
    editorSubcategory = "SCP_EditorSubcategory";
    vehicleClass = "Structures";
    side = 3;
    curatorCanAttach = 1;
    icon = "\A3\ui_f\data\map\vehicleicons\iconObject_ca.paa";
};

class Module_F;
class SCP_Module_SpawnAutoMover : Module_F {
    scope = 2;
    scopeCurator = 2;
    displayName = "Spawn SCP AutoMover";
    category = "SCP_ZeusModules";
    function = "PHK_fnc_spawnAutoMover";
    functionPriority = 1;
    isGlobal = 1;
    isTriggerActivated = 0;
    isDisposable = 1;
    curatorCanAttach = 1;

    class Arguments {};

    class ModuleDescription {
        description = "Spawns a Movable SCP object at the placed position.";
    };
};