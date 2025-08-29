params ["_target", "_unit"];

private _eyeDir = eyeDirection _unit;
private _toTarget = (getPosASL _target) vectorDiff (eyePos _unit);
private _dot = _eyeDir vectorDotProduct (vectorNormalized _toTarget);

private _movableObjThreshold = missionNamespace getVariable ["SCP_Movement_LookSensitivity", 0.94];

_dot > _movableObjThreshold