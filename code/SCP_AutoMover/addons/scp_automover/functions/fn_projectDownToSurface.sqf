// [xyATL, zAbove, zBelow] call PHK_fnc_projectDownToSurface
// Returns: [posATL, surfaceNormal] — if nothing hit, posATL is [x,y,0] and normal is surface normal at ground
params ["_xyATL", ["_up",200], ["_down",-200]];

private _startASL = ATLToASL [_xyATL select 0, _xyATL select 1, _up];
private _endASL   = ATLToASL [_xyATL select 0, _xyATL select 1, _down];

// nearest hit first, only need 1, use GEOM LOD so we hit floors/roofs/terrain
private _hits = lineIntersectsSurfaces [_startASL, _endASL, objNull, objNull, true, 1, "GEOM", "NONE"];

if (_hits isEqualTo []) then {
	private _atl = [_xyATL select 0, _xyATL select 1, 0];
	private _nrm = surfaceNormal _atl;
	[_atl, _nrm]
} else {
	private _hit = _hits select 0; // [posASL, surfNormal, obj, parent]
	private _posATL = ASLToATL (_hit select 0);
	private _nrm = _hit select 1;
	[_posATL, _nrm]
};