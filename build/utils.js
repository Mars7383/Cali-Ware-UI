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

let outputVisible = true;
sessionStorage.outputText = `To attach Calamari-M, please press the "Attach Calamari" button.`;
sessionStorage.outputColor = "#be4039";

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
            editorVisible = true;
        } else {
            //console.log("Storing editor values")
            sessionStorage.editorText = document.getElementsByClassName("editorBox")[0].value
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
            outputVisible = true;
        } else {
            //console.log("Storing output values")
            sessionStorage.outputText = document.getElementsByClassName("outputBox")[0].value
            sessionStorage.outputColor = document.getElementsByClassName("outputBox")[0].style.color
        }
    }
}, 100);