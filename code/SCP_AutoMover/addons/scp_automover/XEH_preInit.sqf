[
	"SCP_Movement_Cooldown",
	"SLIDER",
	["Cooldown Time", "Seconds between steps"],
	"SCP Auto-Mover",
	[0.1, 10, 2, 1],
	1,
	{},
	true,
	{},
	"Movement Configuration"
] call CBA_fnc_addSetting;

[
	"SCP_Movement_LookSensitivity",
	"SLIDER",
	["View Angle Sensitivity", "How directly a player must look to 'freeze' the SCP (higher = stricter)"],
	"SCP Auto-Mover",
	[0.80, 0.99, 0.94, 2],
	1,
	{},
	true,
	{},
	"Movement Configuration"
] call CBA_fnc_addSetting;

[
	"SCP_Movement_StepDistance",
	"SLIDER",
	["Step Distance", "How far the SCP moves when advancing"],
	"SCP Auto-Mover",
	[0.5, 10, 1.5, 1],
	1,
	{},
	true,
	{},
	"Movement Configuration"
] call CBA_fnc_addSetting;

if (hasInterface) then {
	[
		"SCP_UseCustomMoverClass",
		"CHECKBOX",
		["Use Custom SCP Mover Object", "Enable this to use a custom object class for SCP Movers."],
		"SCP Auto-Mover",
		false,
		1,
		{},
		true,
		{},
		"Custom Spawn Class Configuration"
	] call CBA_fnc_addSetting;

	[
		"SCP_CustomMoverClass",
		"EDITBOX",
		["Custom SCP Mover Class", "Enter the object className to use instead of the default (e.g., Land_Maroula_F)."],
		"SCP Auto-Mover",
		"Land_Maroula_F",
		1,
		{},
		true,
		{},
		"Custom Spawn Class Configuration"
	] call CBA_fnc_addSetting;
};

[
	"SCP_EnableKill",
	"CHECKBOX",
	["Enable Kill Behavior", "If enabled, SCP_AutoMover object will kill players when unobserved and within range."],
	"SCP Auto-Mover",
	true,
	1,
	{},
	true,
	{},
	"Killing Feature"
] call CBA_fnc_addSetting;

[
	"SCP_KillDistance",
	"SLIDER",
	["Kill Distance", "Distance at which the SCP_Object will kill a nearby unobserving player."],
	"SCP Auto-Mover",
	[0.5, 5, 1.25, 2],
	1,
	{},
	true,
	{ missionNamespace getVariable ["SCP_EnableKill", true] },
	"Killing Feature"
] call CBA_fnc_addSetting;

[
    "SCP_DisplayKillImage",
    "CHECKBOX",
    ["Enable Kill Image Display", "If enabled, a brief image will be shown upon player death by SCP_MovableObject."],
    "SCP Auto-Mover",
    true,
    1,
    {},
    true,
    {},
    "Killing Feature"
] call CBA_fnc_addSetting;