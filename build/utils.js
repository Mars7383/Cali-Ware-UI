async function disableUpdates() {
    console.log(await ipcRenderer.invoke("autoUpdates", false));
}
async function enableUpdates() {
    console.log(await ipcRenderer.invoke("autoUpdates", true));
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

}, 100);