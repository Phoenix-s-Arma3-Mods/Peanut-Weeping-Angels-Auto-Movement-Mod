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