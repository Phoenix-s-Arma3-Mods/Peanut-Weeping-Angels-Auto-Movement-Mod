if (!isServer) exitWith {};
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
		if ([_movingObj, _x] call PHK_fnc_isLookedAt) then {
			_isSeen = true;
		};
	} forEach _players;

	if (!_isSeen) then {
		[_movingObj, _players] call PHK_fnc_stepTowardPlayer;
		sleep _cooldown;
	};

	if (missionNamespace getVariable ["SCP_EnableKill", true]) then {
		private _killDistance = missionNamespace getVariable ["SCP_KillDistance", 1.25];
		private _nearbyPlayers = allPlayers select {
			alive _x && 
			{_x distance _movingObj < _killDistance}
		};

		{
			private _player = _x;
			private _isObserved = [_movingObj, _player] call PHK_fnc_isLookedAt;

			if (!_isObserved) then {
				// --- Show image on the victim's CLIENT for N seconds
				private _dur = 5;  // or read from a CBA setting if you add one
				[_dur] remoteExec ["PHK_fnc_showKillImage", _player];  // targets that player's machine

				_player setDamage 1;

				diag_log format ["PHK: SCP Killed Player %1", name _player];
				};
		} forEach _nearbyPlayers;
	};
};