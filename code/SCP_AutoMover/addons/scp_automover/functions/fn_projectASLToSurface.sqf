params [["_posASL", objNull, [[]]]];
if (_posASL isEqualTo objNull) exitWith { [[0,0,0], [0,0,1]] };

private _hits = lineIntersectsSurfaces [
	_posASL vectorAdd [0,0, 2],
	_posASL vectorAdd [0,0,-4],
	objNull, objNull,
	true, 1, "GEOM", "NONE"
];

if (_hits isEqualTo []) then {
	private _atl = ASLToATL _posASL;
	[_atl, surfaceNormal _atl]
} else {
	private _hit = _hits select 0;
	[ASLToATL (_hit select 0), _hit select 1]
};
