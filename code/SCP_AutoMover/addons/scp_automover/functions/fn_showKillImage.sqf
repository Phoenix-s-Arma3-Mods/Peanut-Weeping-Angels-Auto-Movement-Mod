params ["_player"];

private _showKillImage = missionNamespace getVariable ["SCP_DisplayKillImage", true];

if (!_showKillImage) exitWith {};

private _imagePath = "scp_automover\images\KilledBySCP.paa";
private _duration = 5;

// private _rscPicture = createDialog "RscDisplayEmpty"; // creates a blank dialog RscPicture // old

private _display = findDisplay 46; // 46 is the default display for all dialogs (fullscreen)
private _ctrl = _display displayCtrl 1000;  // 1000 is an arbitrary control ID

if (isNull _ctrl) then {
    _ctrl = _display ctrlCreate ["RscPicture", 1000];
};

_ctrl ctrlSetText _imagePath;
_ctrl ctrlSetPosition [0.4, 0.4, 0.2, 0.2];

_ctrl ctrlShow true;

sleep _duration;

// close the dialog overlay:
// closeDialog 0;
_ctrl ctrlShow false;
