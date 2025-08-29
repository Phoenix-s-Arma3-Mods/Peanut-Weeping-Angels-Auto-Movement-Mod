{
	if (typeOf _x == "SCP_AutoMover") then {
		diag_log format ["PHK: Found SCP_AutoMover: %1", _x];
		[_x] spawn PHK_fnc_mainLoop;
	};
} forEach (vehicles + allMissionObjects "");

[] spawn {
	["CuratorObjectPlaced", {
		params ["_curator", "_placedObject"];

		if (!isNull _placedObject && {typeOf _placedObject == "SCP_AutoMover"}) then {
			diag_log format ["PHK: Zeus placed SCP_AutoMover: %1", _placedObject];
			[_placedObject] spawn PHK_fnc_mainLoop;
		};
	}] call CBA_fnc_addEventHandler;
};
