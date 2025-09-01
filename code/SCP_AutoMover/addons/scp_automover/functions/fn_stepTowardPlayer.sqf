params ["_movableObj", "_players"];

if (isNull _movableObj || {!alive _movableObj}) exitWith {};

private _nearestPlayer = objNull;
private _minDistance = 1e9;
private _movableObjPosASL = getPosASL _movableObj;

// pick nearest alive player
{
	if (alive _x) then {
		private _pPosASL = getPosASL _x;
		private _d = _movableObjPosASL distance _pPosASL;
		if (_d < _minDistance) then {
			_minDistance = _d;
			_nearestPlayer = _x;
		};
	};
} forEach _players;

if (isNull _nearestPlayer || {!alive _nearestPlayer} || {!(typeOf _nearestPlayer isKindOf "Man")}) exitWith {
	diag_log "PHK: No valid player target found.";
};

private _targetPosASL = getPosASL _nearestPlayer;
private _distance = _movableObjPosASL distance _targetPosASL;

// >50 m: teleport to 10 m behind target along the line
if (_distance > 50) then {
	private _dirVector = _targetPosASL vectorDiff _movableObjPosASL;
	private _teleportVector = vectorNormalized _dirVector vectorMultiply 10;
	private _teleportPosASL = _targetPosASL vectorDiff _teleportVector;

	private _snapT = [_teleportPosASL] call PHK_fnc_projectASLToSurface;
	_snapT params ["_atlT","_nrmT"];
	_movableObj setPosATL _atlT;
	_movableObj setVectorUp _nrmT;

} else {
	private _dirVector = _targetPosASL vectorDiff _movableObjPosASL;
	private _stepDistance = missionNamespace getVariable ["SCP_Movement_StepDistance", 1.5];
	if (_stepDistance <= 0) exitWith {};

	private _step = vectorNormalized _dirVector vectorMultiply _stepDistance;
	private _newPosASL = _movableObjPosASL vectorAdd _step;

	private _snapS = [_newPosASL] call PHK_fnc_projectASLToSurface;
	_snapS params ["_atlS","_nrmS"];
	_movableObj setPosATL _atlS;
	_movableObj setVectorUp _nrmS;
};
