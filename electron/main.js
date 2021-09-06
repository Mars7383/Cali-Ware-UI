const { app, ipcMain, BrowserWindow, screen: electronScreen, nativeTheme, session } = require('electron');
const isDev = require('electron-is-dev');
const fs = require("fs")
const path = require("path")
const os = require('os');
const keytar = require("keytar");
const fetch = require("node-fetch")

let forceQuit = false;

const createMainWindow = () => {
    nativeTheme.themeSource = 'light' // force light mode titlebar
    let mainWindow = new BrowserWindow({
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
    mainWindow.maximizable = false;
    mainWindow.resizable = false;
    mainWindow.closable = false;
    //electron.remote.nativeTheme.themeSource = "light";
    const startURL = isDev
        ? 'http://localhost:3000'
        : `file://${path.join(__dirname, '../build/index.html')}`;

    mainWindow.loadURL(startURL);
    mainWindow.once('ready-to-show', () => mainWindow.show());

    mainWindow.on('close', (e) => {
        app.exit();
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
        mainWindow.maximizable = false;
        mainWindow.resizable = false;
        mainWindow.closable = false;
    }, 1000);
};

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

/* 'before-quit' is emitted when Electron receives 
 * the signal to exit and wants to start closing windows */
app.on('before-quit', () => app.exit());

require("./script-ware-electron-funcs.js"); // Exempt from source code