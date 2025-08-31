params ["_movableObj", "_players"];

// private _target = [_players, getPosASL _movableObj] call BIS_fnc_nearestPosition; // old
// if (isNil "_target") exitWith {}; //old
private _nearestPlayer = nil;
private _minDistance = 99999;
private _movableObjPos = getPosASL _movableObj;

{
	private _playerPos = getPosASL _x;

	private _distance = _movableObjPos distance _playerPos;

	if (_distance < _minDistance) then {
		_minDistance = _distance;
		_nearestPlayer = _x;
	};
} forEach _players;

// if (isNil "_target" || {!(typeOf _target isEqualTo "Man")}) exitWith { diag_log "Error: No valid player target found."; }; //new
if (isNil "_nearestPlayer" || !alive _nearestPlayer || {!(typeOf _nearestPlayer isKindOf "Man")}) exitWith { diag_log "Error: No valid player target found."; };
if (!alive _movableObj || !alive _nearestPlayer) exitWith { diag_log "Error: Invalid target or movable object."; };

private _targetPos = getPosASL _nearestPlayer;

// in case not super clear: if moveable_object is > 50 meters from nearest player, teleport to 10 meters to nearest player -> else, move _stepDistance nearer.
private _distance = _movableObjPos distance _targetPos;
if (_distance > 50) then {
	private _dirVector = _targetPos vectorDiff _movableObjPos;
	private _teleportVector = vectorNormalized _dirVector vectorMultiply 10;

	private _teleportPos = _targetPos vectorDiff _teleportVector;

	_movableObj setPosASL _teleportPos; // need to figure out how to validate on weirdly-spawned floors
} else {
	private _dirVector = _targetPos vectorDiff _movableObjPos;
	private _stepDistance = missionNamespace getVariable ["SCP_Movement_StepDistance", 1.5];
	private _step = vectorNormalized _dirVector vectorMultiply _stepDistance;

	private _newPos = _movableObjPos vectorAdd _step;

	_movableObj setPosASL _newPos; // need to figure out how to validate on weirdly-spawned floors
};
