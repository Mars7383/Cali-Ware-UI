import React, { Component } from 'react';
import {TitleBar, TextInput, Label, Button, Box, SegmentedControl, SegmentedControlItem, Text, Checkbox } from 'react-desktop/macOs';
import './App.css';

export default class extends Component {
  handleChange = e => window.doNothing(); /* console.log(e.target.value); */
  constructor() {
    super();
    this.state = { selected: 1, sFullscreen: false }
    this.minimize = () => window.minimizeWindow();
  }

  render() {
    return (
      <React.Fragment>
      <TitleBar title="Calamari" controls onMinimizeClick={this.minimize} id="titlebar"/>
      <div id="loginPage">
          <iframe id="statusView" src="https://mattt.lol/calamari/logpanel" height="365" width="275"></iframe>
          <img draggable="false" id="loginPageAppLogo" width="100px" height="100px" src="img/AppLogo.png"></img>
          <TextInput
            id="loginPageUsernameField"
            rounded="5px"
            width="235px"
            placeholder="Username..."
            defaultValue=""
            focusRing="true"
            onChange={this.handleChange}>
          </TextInput>
          <TextInput
            id="loginPagePasswordField"
            rounded="5px"
            width="235px"
            placeholder="Password..."
            defaultValue=""
            focusRing="true"
            password="true"
            onChange={this.handleChange}>
          </TextInput>
          <Button id="loginPageAuthButton" padding="0px 100px 0px 100px" onClick={() => window.authenticate(document.getElementById("loginPageUsernameField").value, document.getElementById("loginPagePasswordField").value)}>
              Login
          </Button>
          <Text id="loginPageCopyrightNotice" padding="0 100px" textAlign="center" size="14">©️ 2020 Inspect</Text>
      </div>

      <div id="configPage">
        <Box padding="10px 30px" height='100%'>
        <br></br>
        <Label marginTop="15px">Configuration</Label>
        <br></br>
        <input type="checkbox"
          id="legacyWindowToggle"
          onClick= {(e) => {window.setPreference("legacyWindow", document.getElementById("legacyWindowToggle").checked)}}
        ></input>Legacy window mode (High Sierra styled)
        <br></br>
        <input type="checkbox"
          id="multiInjectToggle"
          onClick= {(e) => {window.setPreference("multiInject", document.getElementById("multiInjectToggle").checked); if(document.getElementById("multiInjectToggle").checked)alert("This is currently just a proof of concept. Please read the release page of v1.2.0 if you want more information.");}}
        ></input>Multi-inject mode (experimental)
        <br></br>
        <input type="checkbox"
          id="autoUpdateToggle"
          onClick= {(e) => {window.setPreference("autoUpdate", document.getElementById("autoUpdateToggle").checked)}}
        ></input>Auto updates
        <img src="https://cdn.discordapp.com/attachments/765583918656389180/888188419921047562/2RMa5FjfEo1vgIAgA9GA1xpaZ6fAv4KQQAKmpn0N.png" width="100px" id="swchan"></img>
        <Label marginTop="15px">Changes require an app restart. You may encounter bugs while testing with these options!</Label>
        <br></br>
        <br></br>
        <br></br>
        <br></br>
        <Button color="white" marginRight="10px" onClick={() => {
          window.openResourcesFolder();
        }}>
            Open Resources Folder
        </Button>
        <Label id="version">version </Label>
        <br></br>
        <hr></hr>
        <center>
          <Button color="white" marginRight="10px" onClick={() => window.togglePreferencePane(false)}>
            Back
          </Button>
          <Button color="white" onClick={() => window.open('https://github.com/Mars7383/Cali-Ware-UI/blob/main/CREDITS.md')}>
            Credits
          </Button>
        </center>
        <br></br>
        <br></br>
        <br></br>
        </Box>
      </div>
      <SegmentedControl box width="520px">
        {this.renderItems()}
      </SegmentedControl>
      </React.Fragment>
    );
  }

  renderItems() {
    return [
      this.renderItem(1, 'Executor', 
       <div className="inline" id="executorElements">
        <React.Fragment>
        <div>
          <textarea className="editorBox" spellCheck="false"></textarea>
          <div className="inline">
          <div className="executorMiniButtonsContainer">
                 <Button color="white" className="executorMiniButton" marginTop="5px" padding="2px 2px 0px 3px" onClick={() => window.execute(document.getElementsByClassName("editorBox")[0].value)}>
            <img draggable="false" width="20px" height="20px" 
              src="data:image/png;base64,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"
            >
            </img>
          </Button>
          <Button color="white" className="executorMiniButton" padding="2px 2px 0px 3px"  onClick={() => document.getElementsByClassName("editorBox")[0].value = window.getClipboardContents()}>
            <img draggable="false" width="20px" height="20px" 
              src="data:image/png;base64,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"
            >
            </img>
          </Button>
          <img draggable="false" className="executorMiniButton" id="executorPageAppLogo" width="20px" height="20px" src="img/AppLogo.png"></img>

          </div>
          <div>
          <textarea readOnly className="outputBox" spellCheck="false">
            To attach Calamari-M, please press the "Attach Calamari" button.
          </textarea>
          </div>
        </div>
        </div>
        <div>
         <Label marginLeft="17px">Calamari-M - Selects</Label>
           <Box padding="5px 5px 0px 5px" marginLeft="10px" width="130">
               <Button color="white" padding="0px 24px 0px 24px" onClick={() => window.execute(`CalamariDefaults://DexRaw`) }>
             Dex by Moon
           </Button>
               <Button color="white" marginLeft="7px" padding="0px 24px 0px 24px" onClick={() => window.execute(window.CalamariDefaults["CalamariDefaults://PlaceSaver"]) }>
             Save Place
           </Button>
           <hr></hr>
               <Button color="white" marginLeft="7px" padding="0px 15px 0px 15px" onClick={() => window.execute("CalamariDefaults://CalamariRemoteSpy")}>
             RemoteSpy-M
           </Button>
               <Button color="white" marginLeft="7px" padding="0px 21px 0px 21px" onClick={() => window.execute("CalamariDefaults://InfiniteYiff") }>
             Infinite Yield
           </Button>
           <hr></hr>
             <Button color="white" marginLeft="7px" padding="0px 46px 0px 46px"  onClick={() => window.execute("CalamariDefaults://ESP")}>
             ESP
           </Button>
               <Button color="white" marginLeft="7px" padding="0px 27px 0px 27px" onClick={() => {alert('"FE Gui" was missing so you can enjoy my script instead :D\n\n- Mars');window.execute("CalamariDefaults://Internal")}}>
                 Internal UI
               </Button>
           <hr></hr>
               <Button color="white" marginLeft="7px" marginBottom="16px" originalpadding22 padding="0px 13px 0px 32px" onClick={() => window.openSavesFolder()}>
                 <img id="folderIconOpenSavesButton"
                   src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAMAAAD04JH5AAAAAXNSR0IB2cksfwAAAAlwSFlzAAALEwAACxMBAJqcGAAAATVQTFRFAAAAOUVNj9Pvktj3j9f2kNb2kNf2jNf2j9b2jtX2jtj2l93/l93/l93/l93/l93/oaOkktv7lNv+lNv/kt3/lt3/lN3/ldz/ktz/k9z/kNv/l93/l93/l93/l93/l93/l93/l93/l93/l93/l93/l93/l93/l93/l93/l93/l93/l93/l93/l93/l93/l93/l93/l93/l93/l93/l93/l93/l93/kdz/ld3/hdb8cM76a8z5cc75dc/6dtD6dM/6dND6ddD6d9D6dtH6d9D5ddD5dM/5ds/6bMz5i9n9k93/jNn9k9z+j9r9lt3+kd3/bs35hNb8a835a8z6a8z5a8z5csz0csv0bsvzccv0c8z0cMvzcMrzb8vzccrzcMz0b8rzcMr0cMv0cszza8z5a8z5a8z5G5z/HwAAAGd0Uk5TAAVYaWpqampqampqaVcGBALt/f////////////3AAwjp+rQy/iq54criYArj9l9rBwHcCZnk8///////////////////////////////////////5P7//////////////////4LijtKIW3MAAAFxSURBVHic7dJXT8MwGIXhsMoom5ZSHHbYexeCMwpl71XSlAJh/P+fQLhAckUlAq35InHeqyiSfZ4LKwpCCCGEUGiqqq6prYvUNzRGmqJfam5pbZM7397R2RWLdyd64sneJCuR2tcvc39ALTVa3KBMwND3+4wNy9sf0YIAtFFpgLEg+/47kPYMxoMB2IQswGRAgDZFDGBadFoKYCYogLHZOWJAZVK1+YVFSoDf0jIxgK0IgFUKgCoA1igATAAwtp7a2NQ/2+KGyU3D4rb/keb2dtrYyXA7s2tyw/+1Z5nc1stp3zo4jBUDjsq68DcdJwRA6uTP93X9VACcEezr5wLgggKgCwCSfQBCBbikBlxRA0j2QwW4BgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP49gGQfAABCBbgJeOQ2e+c4OTd/X3AeHgvuk+d6z7msk3e8nFsW4OXnpyuQAFBeCfbfFIQQQggh9NE7jE+7HHGpi5gAAAAASUVORK5CYII="
                 width="16px" height="16px"></img>
                Open Saves
               </Button>
               <br></br>
           <br></br>
         </Box>
            <div className="inline" >
                <Button color="white" marginTop="9px" marginLeft="7px" padding="0px 10px 0px 10px"  onClick={() => window.inject()}>Attach Calamari</Button>
               <button id="helpButton" onClick={() => window.togglePreferencePane(true)}>?</button>
               
               
            </div>
         </div>
         </React.Fragment>
        </div>
      ),
      
      this.renderItem(2, 'Tools & Tricks', 
      <div className='inline'>
      <React.Fragment>
        <Text size="11px" id="localPlayerLabel">LocalPlayer</Text>
        <Box label="&#8203;" padding="5px 5px" marginRight="5px" marginLeft="-15px" width="203">
            <div className='inline'>
              <Label marginRight="-95px" marginTop="4px">Number Value:</Label>
              <TextInput
                id="toolsTricksNumInput"
                marginLeft="100px"
                defaultValue="150"
                width="105px"
                onChange={this.handleChange}
              ></TextInput>
            </div>
            <hr></hr>
            <div className='inline'>
              <Button color="white" padding="0px 24px 0px 23px" onClick={() => window.execute("game:GetService('Players').LocalPlayer.Character.Humanoid.WalkSpeed=" + parseFloat(document.getElementById("toolsTricksNumInput").value))}>
                Set WalkSpeed
              </Button>
              <Button color="white" onClick={() => window.execute("game:GetService('Players').LocalPlayer.Character.Humanoid.WalkSpeed=16")}>
                Reset
              </Button>
            </div>
            <div className='inline'>
              <Button size="12px" color="white" padding="0px 25px 0px 24px" onClick={() => window.execute("game:GetService('Players').LocalPlayer.Character.Humanoid.JumpHeight=" + parseFloat(document.getElementById("toolsTricksNumInput").value) + " game:GetService('Players').LocalPlayer.Character.Humanoid.JumpPower=" + parseFloat(document.getElementById("toolsTricksNumInput").value))}>
                Set JumpPower
              </Button>
              <Button color="white" onClick={() => window.execute("game:GetService('Players').LocalPlayer.Character.Humanoid.JumpHeight=7.2 game:GetService('Players').LocalPlayer.Character.Humanoid.JumpPower=50")}>
                Reset
              </Button>
            </div>
            <div className='inline'>
              <Button color="white" padding="0px 27px 0px 26px" onClick={() => window.execute("game:GetService('Players').LocalPlayer.Character.Humanoid.HipHeight=" + parseFloat(document.getElementById("toolsTricksNumInput").value))}>
                Set HipHeight
              </Button>
              <Button color="white" onClick={() => window.execute("game:GetService('Players').LocalPlayer.Character.Humanoid.HipHeight=1.998")}>
                Reset
              </Button>
            </div>
            <div className='inline'>
              <Button color="white" onClick={() => window.execute("workspace.Gravity=" + parseFloat(document.getElementById("toolsTricksNumInput").value))}>
                Set Gravity (Local)
              </Button>
              <Button color="white" onClick={() => window.execute("workspace.Gravity=196.2")}>
                Reset
              </Button>
            </div>
            <hr></hr>
            <div className='inline'>
              <Button color="white" padding="0px 38px 0px 38px" onClick={() => window.execute("CalamariDefaults://fly")}>
                Enable Fly
              </Button>
              <Button color="white" onClick={() => window.execute("_G.unfly()")}>
                Reset
              </Button>
            </div>
            <div className='inline'>
              <Button color="white" padding="0px 27px 0px 28px" onClick={() => window.execute("CalamariDefaults://noclip")}>
                Enable Noclip
              </Button>
              <Button color="white" onClick={() => window.execute("_G.unnoclip()")}>
                Reset
              </Button>
            </div>
            <hr></hr>
            <Button color="white" padding="0px 66px 0px 66px" onClick={() => window.execute(`
local a = Instance.new("HopperBin")
a.BinType = 1
a.Parent = game:GetService("Players").LocalPlayer.Backpack
a = Instance.new("HopperBin")
a.BinType = 4
a.Parent = game:GetService("Players").LocalPlayer.Backpack
a = Instance.new("HopperBin")
a.BinType = 3
a.Parent = game:GetService("Players").LocalPlayer.Backpack`
            )}>
              Give Btools
            </Button>
            <Button color="white" padding="0px 67px 0px 67px" onClick={() => window.execute("CalamariDefaults://ClickTP")}>
              Click to TP
            </Button>
        </Box>
          <Box label="GUIs" height="268px" padding="5px 5px" marginRight="5px" width="132px">
            <br></br><br></br>
            <Button color="white" padding="0px 43px 0px 43px" onClick={() => window.execute("CalamariDefaults://c00lgui")}>
              c00lgui
            </Button>
          <br></br>
            <Button color="white" padding="0px 28px 0px 28px" onClick={() => window.execute("CalamariDefaults://RoXploit")}>
            RoXploit 6.0
          </Button>
            <Button color="white" padding="0px 43px 0px 43px" onClick={() => window.execute("CalamariDefaults://TopK3k")}>
              TopK3k
            </Button>
            <br></br>
            <Button color="white" padding="0px 12px 0px 12px" onClick={() => window.execute("CalamariDefaults://FEAnimations")}>
              FE Animation GUI
            </Button>
            <hr></hr>
            <Button color="white" padding="0px 37px 0px 37px" onClick={() => window.execute("CalamariDefaults://headspin")}>
              Headspin
            </Button>
            <Button color="white" padding="0px 44px 0px 44px" onClick={() => window.execute("CalamariDefaults://Dex")}>
              Dex v4
            </Button>
      </Box>
          <Box label="Classics" height="268px" padding="5px 5px" marginRight="10px" width="132px">
            <br></br><br></br>
            <Button color="white" padding="0px 23px 0px 23px" onClick={() => window.execute("CalamariDefaults://LustrisSword")}>
              Lustris Sword
            </Button>
            <Button color="white" padding="0px 13px 0px 13px" onClick={() => window.execute("CalamariDefaults://TrueHeroUltima")}>
              True Hero Ultima
            </Button>
            <Button color="white" padding="0px 8px 0px 8px" onClick={() => window.execute("CalamariDefaults://DoubleMusicTails")}>
              Double Tails Music
            </Button>
            <Button color="white" padding="0px 32px 0px 32px" onClick={() => window.execute("CalamariDefaults://GodClaws")}>
              God Claws
            </Button>
            <hr></hr>
            <Button color="white" padding="0px 30px 0px 30px" onClick={() => window.execute("CalamariDefaults://Starglitcher")}>
              Starglitcher
            </Button>
            <Button color="white" padding="0px 26px 0px 26px" onClick={() => window.execute("CalamariDefaults://Wings")}>
              Wings Script
            </Button>
            <Label>NOTE: These tricks won't be visible to others. Use for tests.</Label>
      </Box>
      </React.Fragment>
      </div>
      ),
    ];
  }

  renderItem(key, title, content) {
    return (
      <SegmentedControlItem
        key={key}
        title={title}
        selected={this.state.selected === key}
        onSelect={() => this.setState({ selected: key })}
      >
        {content}
      </SegmentedControlItem>
    );
  }
}