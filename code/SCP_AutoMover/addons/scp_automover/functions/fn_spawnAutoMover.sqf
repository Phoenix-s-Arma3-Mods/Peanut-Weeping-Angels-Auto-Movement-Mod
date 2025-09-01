if (!isServer) exitWith {};
params ["_logic", "_position", "_activated", "_isCuratorPlaced"];
if (!_activated) exitWith {};

private _xyATL =
if (_position isEqualType [] && {(count _position) >= 2}) then {
	// Zeus sometimes sends ASL; we only need XY → treat as XY and project down
	[_position select 0, _position select 1, 0] vectorDiff [0,0,0]
} else {
	getPosATL _logic
};

private _useCustom = missionNamespace getVariable ["SCP_UseCustomMoverClass", false];
private _customClass = missionNamespace getVariable ["SCP_CustomMoverClass", ""];
private _objectClass = if (_useCustom && {_customClass != ""}) then {_customClass} else {"SCP_AutoMover"};
if !(isClass (configFile >> "CfgVehicles" >> _objectClass)) then { _objectClass = "SCP_AutoMover" };

private _proj = [[_xyATL select 0, _xyATL select 1, 0], 200, -200] call PHK_fnc_projectDownToSurface;
_proj params ["_posATL","_normal"];

private _obj = createVehicle [_objectClass, [0,0,0], [], 0, "CAN_COLLIDE"];
_obj enableSimulationGlobal false;
_obj setPosATL _posATL;
_obj setVectorUp _normal;
_obj setVelocity [0,0,0];
_obj enableSimulationGlobal true;

[_obj] remoteExec ["PHK_fnc_mainLoop", 2];
deleteVehicle _logic;
