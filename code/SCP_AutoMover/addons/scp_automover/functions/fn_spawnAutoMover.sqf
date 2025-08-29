if (!isServer) exitWith {};
params ["_logic", "_position", "_activated", "_isCuratorPlaced"];

if (!_activated) exitWith {};

if ((typeName _position) != "ARRAY" || {count _position < 2}) then {
    _position = getPosASL _logic;
};

if ((count _position) < 3) then {
    _position pushBack 0;
};

private _useCustom = missionNamespace getVariable ["SCP_UseCustomMoverClass", false];
private _customClass = missionNamespace getVariable ["SCP_CustomMoverClass", ""];

private _objectClass = if (_useCustom && {_customClass != ""}) then {
    _customClass
} else {
    "SCP_AutoMover"
};

if !(isClass (configFile >> "CfgVehicles" >> _objectClass)) then {
    diag_log format ["[SCP_AutoMover] Invalid object class: %1. Falling back to default.", _objectClass];
    _objectClass = "SCP_AutoMover";
};

private _obj = createVehicle [_objectClass, _position, [], 0, "CAN_COLLIDE"];
_obj enableSimulationGlobal true;
// _obj setDir random 360; // add back if we really want random - else i think Zeus is predefining object facing direction when placing

[_obj] remoteExec ["PHK_fnc_mainLoop", 0];
deleteVehicle _logic;
