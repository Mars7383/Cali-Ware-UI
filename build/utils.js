const fs2 = require("fs"); // these have a 2 in their name because they are redeclared in the other js file and that makes the interpreter sad :(
const path2 = require("path")
// Load prefs
let prefsFileLocation2 = path2.join(__dirname, "../../config.json");
var prefsObj2;
if (fs2.existsSync(prefsFileLocation2)) {
    prefsObj2 = require(prefsFileLocation2);
} else {
    prefsObj2 = { 
        legacyWindow: false,
        multiInject: false,
        autoUpdate: true
    };
}
// Run prefs
let checkedStyle = "user-select: none; -webkit-appearance: none; border-width: 1px; border-style: solid; border-color: rgb(44, 145, 252); border-radius: 3px; background-color: rgb(59, 153, 252); padding: 6px; margin: 0px 1px; box-shadow: none; transition: all 0.4s ease 0s;";
window.addEventListener('load', function () { // DOM is so annoying
    // Legacy window mode
    if (prefsObj2.legacyWindow) {
        document.body.style.width = "521";
        document.body.style.height = "365";
        document.body.style.borderRadius = "5px";
        document.getElementById("titlebar").style.visibility = "visible";
        document.getElementById("titlebar").style.position = "static";
        for (i = 0; i < document.getElementsByTagName("div").length; i++) {
            if (document.getElementsByTagName("div")[i].style.width == "520px" || document.getElementsByTagName("div")[i].style.width == "521px") {
                document.getElementsByTagName("div")[i].style.backgroundColor = "#ffffff"
            }
        }
    }
    if (prefsObj2.legacyWindow) {
        document.getElementById("legacyWindowToggle").checked = true;
    }
    if (prefsObj2.multiInject) {
        document.getElementById("multiInjectToggle").checked = true;
    }
    if (prefsObj2.autoUpdate) {
        document.getElementById("autoUpdateToggle").checked = true;
    }

    document.getElementById("version").innerHTML = `version ${remote.app.getVersion()}`;
    console.log(document.getElementById("version").innerHTML)
})

/*
async function disableUpdates() {
    console.log(await ipcRenderer.invoke("setPref", {pref: "autoUpdate", prefValue: false}));
}
async function enableUpdates() {
    console.log(await ipcRenderer.invoke("setPref", {pref: "autoUpdate", prefValue: false}));
}
*/
window.setPreference = async function(preference, value) { // string preference, bool value
    console.log(await ipcRenderer.invoke("setPref", {"pref": preference, "prefValue": value}));
}

window.minimizeWindow = function() {
    require("electron").remote.BrowserWindow.getFocusedWindow().minimize();
}

window.togglePreferencePane = function(bool) {
    if (bool) {
        document.getElementById("configPage").style.position = "static"
        document.getElementById("configPage").style.visibility = "visible"
    } else {
        document.getElementById("configPage").style.position = "absolute"
        document.getElementById("configPage").style.visibility = "hidden"
    }
}

/*  
Hacky workaround to fix the editor/output box clearing
I can't really do much else without modifying
the source code of react-desktop
*/
let editorVisible = true;
sessionStorage.editorText = "";
sessionStorage.editorScrollPos = 0;

let outputVisible = true;
sessionStorage.outputText = `To attach Calamari-M, please press the "Attach Calamari" button.`;
sessionStorage.outputColor = "#be4039";
sessionStorage.outputScrollPos = 0;

let robloxExistedAtTheTimeThisVariableWasDefinedNoCap = false;

setInterval(() => {
    if (document.getElementsByClassName("editorBox").length == 0) {
        if (editorVisible) {
            //console.log("Editor left the screen")
            editorVisible = false;
        }
    }
    if (document.getElementsByClassName("editorBox").length == 1)  {
        if (!editorVisible) {
            //console.log("Editor visible again")
            document.getElementsByClassName("editorBox")[0].value = sessionStorage.editorText
            document.getElementsByClassName("editorBox")[0].scrollTop = sessionStorage.editorScrollPos
            editorVisible = true;
        } else {
            //console.log("Storing editor values")
            sessionStorage.editorText = document.getElementsByClassName("editorBox")[0].value
            sessionStorage.editorScrollPos = document.getElementsByClassName("editorBox")[0].scrollTop
        }
    }

    if (document.getElementsByClassName("outputBox").length == 0) {
        if (outputVisible) {
            //console.log("Output left the screen")
            outputVisible = false;
        }
    }
    if (document.getElementsByClassName("outputBox").length == 1)  {
        if (!outputVisible) {
            //console.log("Output visible again")
            document.getElementsByClassName("outputBox")[0].value = sessionStorage.outputText;
            document.getElementsByClassName("outputBox")[0].style.color = sessionStorage.outputColor;
            document.getElementsByClassName("outputBox")[0].scrollTop = sessionStorage.outputScrollPos
            outputVisible = true;
        } else {
            //console.log("Storing output values")
            sessionStorage.outputText = document.getElementsByClassName("outputBox")[0].value
            sessionStorage.outputColor = document.getElementsByClassName("outputBox")[0].style.color
            sessionStorage.outputScrollPos = document.getElementsByClassName("outputBox")[0].scrollTop
        }
    }

    // reset output box once roblox closes
    if (getProcesses().length == 0) {
        if (robloxExistedAtTheTimeThisVariableWasDefinedNoCap) {
            // roblox existed but now we cant find it D:
            if (trial) crumbling("the true at the end is to kill all audios", false, false, true); // lets stop trial music while we're here
            sessionStorage.outputText = `To attach Calamari-M, please press the "Attach Calamari" button.`
            document.getElementsByClassName("outputBox")[0].value = sessionStorage.outputText
            sessionStorage.outputColor = "#be4039"
            document.getElementsByClassName("outputBox")[0].style.color = sessionStorage.outputColor
        }
        robloxExistedAtTheTimeThisVariableWasDefinedNoCap = false;
    } else {
        robloxExistedAtTheTimeThisVariableWasDefinedNoCap = true;
    }

}, 1000);