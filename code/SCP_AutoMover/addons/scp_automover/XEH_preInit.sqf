[
	"SCP_Movement_Cooldown",
	"SLIDER",
	["Cooldown Time", "Seconds between steps"],
	"SCP Auto-Mover",
	[0.1, 10, 2, 1],
	1
] call CBA_fnc_addSetting;

[
	"SCP_Movement_LookSensitivity",
	"SLIDER",
	["View Angle Sensitivity", "How directly a player must look to 'freeze' the SCP (higher = stricter)"],
	"SCP Auto-Mover",
	[0.80, 0.99, 0.94, 2], // min, max, default, decimals
	1
] call CBA_fnc_addSetting;

[
	"SCP_Movement_StepDistance",
	"SLIDER",
	["Step Distance", "How far the SCP moves when advancing"],
	"SCP Auto-Mover",
	[0.5, 5, 1.5, 1],
	1
] call CBA_fnc_addSetting;

if (hasInterface) then {
	[
		"SCP_UseCustomMoverClass",
		"CHECKBOX",
		["Use Custom SCP Mover Object", "Enable this to use a custom object class for SCP Movers."],
		"SCP AutoMover",
		false
	] call CBA_fnc_addSetting;

	[
		"SCP_CustomMoverClass",
		"EDITBOX",
		["Custom SCP Mover Class", "Enter the object className to use instead of the default (e.g., Land_Maroula_F)."],
		"SCP AutoMover",
		"Land_Maroula_F"
	] call CBA_fnc_addSetting;
};