const { app, ipcMain, BrowserWindow, screen: electronScreen, nativeTheme, session, Notification } = require('electron');
const isDev = require('electron-is-dev');
const fs = require("fs")
const path = require("path")
const os = require('os');
const keytar = require("keytar");
const fetch = require("node-fetch")

var prefs;
if (fs.existsSync(`${path.join(__dirname, "../../config.json")}`)) {
    prefs = require(`${path.join(__dirname, "../../config.json")}`) ;
} else {
    console.log("NO CONFIG FILE FOUND SAD FACE", `${path.join(__dirname, " ")}`)
    prefs = { 
        legacyWindow: false,
        multiInject: false,
        autoUpdate: true
    };
}  

let forceQuit = false;

const createMainWindow = () => {
    nativeTheme.themeSource = 'light' // force light mode titlebar
    var mainWindow;
    if (prefs.legacyWindow) {
        mainWindow = new BrowserWindow({
            width: 521, //electronScreen.getPrimaryDisplay().workArea.width,
            height: 365, //electronScreen.getPrimaryDisplay().workArea.height,
            show: false,
            backgroundColor: 'white',
            webPreferences: {
                nodeIntegration: true, // false
                devTools: true, //isDev
                contextIsolation: false,
                enableRemoteModule: true
            },
            transparent: true,
            frame: false,
            titleBarStyle: 'customButtonsOnHover',
            backgroundColor: 'ffffffff', //'#00ffffff',
            closable: false,
            maximizable: false,
            resizable: false
        });
    } else {
        mainWindow = new BrowserWindow({
            width: 521, //electronScreen.getPrimaryDisplay().workArea.width,
            height: 365, //electronScreen.getPrimaryDisplay().workArea.height,
            show: false,
            backgroundColor: 'white',
            webPreferences: {
                nodeIntegration: true, // false
                devTools: true, //isDev
                contextIsolation: false,
                enableRemoteModule: true
            },
            closable: false,
            maximizable: false,
            resizable: false
        });
    }
    mainWindow.maximizable = false;
    mainWindow.resizable = false;
    mainWindow.closable = false;
    //electron.remote.nativeTheme.themeSource = "light";
    const startURL = isDev
        ? 'http://localhost:3000'
        : `file://${path.join(__dirname, '../build/index.html')}`;

    mainWindow.loadURL(startURL);
    mainWindow.once('ready-to-show', () => {
        mainWindow.show();
    });

    mainWindow.on('close', (e) => {
        /*
        if (!isDev && `${path.join(__dirname, "../../newapp.asar")}`) {
            fs.unlinkSync(`${path.join(__dirname, "../../app.asar")}`);
            fs.renameSync(`${path.join(__dirname, "../../newapp.asar")}`, `${path.join(__dirname, "../../app.asar")}`, () => {
                console.log("Updated!");
            });
        }
        app.exit();
        */
        if (forceQuit) {
            /* the user tried to quit the app */
            window = null;
        } else {
            /* the user only tried to close the window */
            e.preventDefault();
            window.hide();
        }

    });
    mainWindow.on('closed', () => {
        mainWindow = null;
    });

    mainWindow.webContents.on('new-window', (event, url) => {
        event.preventDefault();
        //mainWindow.loadURL(url);
        require('electron').shell.openExternal(url);
    });

    /* 
    electron is weird bro
    for some reason after you call alert()
    ALL OF THE TITLEBAR SETTINGS GET RESET 
    LIKE WTF 
    */
    setInterval(function () {
        try {
            mainWindow.maximizable = false;
            mainWindow.resizable = false;
            mainWindow.closable = false;
        } catch (e) {}
    }, 1000);
};

async function checkForUpdate() {
    if (isDev) return;
    if (!prefs.autoUpdate) return;
    try {
    //if (fs.existsSync(`${path.join(__dirname, "../../skipUpdateChecking")}`)) return
    let newVersion;
    let newBootstrapperVersion;
    const updateInfo = await fetch('https://raw.githubusercontent.com/Mars7383/Cali-Ware-UI/main/package.json').then(res => res.json())
    .then((json) => {
        // do something with JSON
        newVersion = json.version;
        newBootstrapperVersion = json.bootstrapperVersion;
    });
    //newVersion = await updateInfo.json().version;
    let currentInfo = require(`${path.join(__dirname, "../package.json")}`);
    let currentVersion = currentInfo.version;
    let currentBootstrapperVersion = currentInfo.bootstrapperVersion;
        if (currentVersion != newVersion) {
        if (newBootstrapperVersion != currentBootstrapperVersion) {
            let updateNotif = new Notification({ title: "Outdated Cali-Ware App", body: "Please download the update manually from GitHub by clicking here" })
            updateNotif.show()
            updateNotif.on('click', (event, arg)=>{
                require('electron').shell.openExternal("https://github.com/Mars7383/Cali-Ware-UI/releases")
            })
            return;
        }
        let res = await fetch(`https://github.com/Mars7383/Cali-Ware-UI/releases/download/v${newVersion}/update.asar`);
        console.log(res);
        if (!res.ok) console.log("Error downloading update.")
        let dest = fs.createWriteStream(`${path.join(__dirname, "../../newapp.asar.part")}`);  
        res.body.pipe(dest);
        await new Promise((fufilled,reject) => {res.body.on("end",fufilled)})
        fs.renameSync(`${path.join(__dirname, "../../newapp.asar.part")}`,`${path.join(__dirname, "../../newapp.asar")}`)
        console.log("Update downloaded!");
    }
    } catch (e) {
        console.log("Error downloading update: " + e)
        let updateNotif = new Notification({ title: "Error Updating Cali-Ware", body: "Please download the update manually from GitHub by clicking here" })
        updateNotif.show()
        updateNotif.on('click', (event, arg)=>{
            require('electron').shell.openExternal("https://github.com/Mars7383/Cali-Ware-UI/releases")
        })
    }
}
checkForUpdate();

ipcMain.handle("autoUpdates", async (evt, arg) => {
    if (arg == false) {
        
        if (!prefs.autoUpdate/*fs.existsSync(`${path.join(__dirname, "../../skipUpdateChecking")}`)*/) return 'Auto updates already disabled!';
        //fs.writeFileSync(`${path.join(__dirname, "../../skipUpdateChecking")}`, " "); 
        prefs.autoUpdate = false;
        return 'Disabled auto updates! Relaunch to take effect.';
    }
    if (arg == true) {
        if (!prefs.autoUpdate/*fs.existsSync(`${path.join(__dirname, "../../skipUpdateChecking")}`)*/) {
            //fs.unlinkSync(`${path.join(__dirname, "../../skipUpdateChecking")}`);
            prefs.autoUpdate = true;
            return 'Enabled auto updates! Relaunch to take effect.'
        } else {
            return 'Auto updates already enabled!';
        }
    }
})

ipcMain.handle("setPref", async (evt, arg) => {
    // example arg variable: { pref: "autoUpdate", prefValue: true }
    prefs[arg.pref] = arg.prefValue;
    return `Set ${arg.pref} to ${arg.prefValue}!`;
})

/* 'before-quit' is emitted when Electron receives 
 * the signal to exit and wants to start closing windows */
app.on('before-quit', () => {
    console.log("Is dev? " + isDev);
    console.log("Update path exists? " + fs.existsSync(`${path.join(__dirname, "../../newapp.asar")}`));
    console.log("Path: " + path.join(__dirname, "../../newapp.asar"));
    fs.writeFileSync(`${path.join(__dirname, "../../config.json")}`, JSON.stringify(prefs, null, 4), function writeJSON(err) {
        if (err) return console.log(err);
        console.log('saving prefs to ' + fileName);
    });
    if (!isDev && fs.existsSync(`${path.join(__dirname, "../../newapp.asar")}`)) {
        if (!prefs.autoUpdate) {
            // delete the downloaded update file if present
            fs.unlinkSync(`${path.join(__dirname, "../../newapp.asar")}`)
        } else {
            fs.unlinkSync(`${path.join(__dirname, "../../app.asar")}`);
            fs.renameSync(`${path.join(__dirname, "../../newapp.asar")}`, `${path.join(__dirname, "../../app.asar")}`, () => {
                console.log("Updated Cali-Ware!");
            });
        }
    }
    app.exit();
});

app.whenReady().then(() => {
    createMainWindow();
    // turns out electron already adds the project name ('caliware') to the user-agent lol
    /*
    session.defaultSession.webRequest.onBeforeSendHeaders((details, callback) => {
        details.requestHeaders['User-Agent'] = details.requestHeaders['User-Agent'] + ' using Cali-Ware';
        callback({ cancel: false, requestHeaders: details.requestHeaders });
    });
    */
    app.on('activate', () => {
        if (!BrowserWindow.getAllWindows().length) {
            createMainWindow();
        }
    });
});

/*
app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') {
        app.quit();
    }
});
*/

require("./script-ware-electron-funcs.js"); // Exempt from source code