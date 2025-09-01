// params [["_duration",5]];
// if (!hasInterface) exitWith {};

// // Use titleRsc (topmost title channel). Re-assert a couple times to beat death UI.
// titleRsc ["PHK_KillOverlay", "PLAIN"];
// uiSleep 0;
// titleRsc ["PHK_KillOverlay", "PLAIN"];
// uiSleep 0.1;
// titleRsc ["PHK_KillOverlay", "PLAIN"];

// uiSleep (_duration max 0);

// cutText ["", "PLAIN"];

params [["_duration",5]];
if (!hasInterface) exitWith {};
disableSerialization;

// Create the dialog (sits above scoreboard). Re-assert a couple of times after death UI.
createDialog "RscDisplayPHK_KillOverlay";
uiSleep 0;
createDialog "RscDisplayPHK_KillOverlay";
uiSleep 0.10;
createDialog "RscDisplayPHK_KillOverlay";

// Keep it visible for the duration
uiSleep (_duration max 0);

// Close if still open
private _disp = findDisplay 926600;
if (!isNull _disp) then { closeDialog 0; };