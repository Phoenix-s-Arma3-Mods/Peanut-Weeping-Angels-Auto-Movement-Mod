{
	if (typeOf _x == "SCP_AutoMover") then {
		diag_log format ["PHK: Found SCP_AutoMover: %1", _x];
		[_x] spawn PHK_fnc_mainLoop;
	};
} forEach (vehicles + allMissionObjects "");
