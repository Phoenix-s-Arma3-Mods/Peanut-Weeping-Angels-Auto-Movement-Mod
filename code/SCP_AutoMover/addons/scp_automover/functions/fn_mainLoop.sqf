params ["_movingObj"];
diag_log format ["PHK: Main loop started for: %1", _movingObj];

private _cooldown = missionNamespace getVariable ["SCP_Movement_Cooldown", 2];
private _stepDistance = 1.5;
private _checkInterval = 0.2;

while {alive _movingObj} do {
	sleep _checkInterval;

	private _players = allPlayers select {alive _x && isPlayer _x};
	private _isSeen = false;

	{
		if ([_movingObj, _x] call PHK_fnc_isLookedAt) exitWith {
			_isSeen = true;
		};
	} forEach _players;

	if (!_isSeen) then {
		[_movingObj, _players] call PHK_fnc_stepTowardPlayer;
		sleep _cooldown;
	};
};