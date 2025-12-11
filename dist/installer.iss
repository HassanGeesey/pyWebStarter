; ================================
; 💻 WebStarter CLI Installer
; ================================

[Setup]
AppName=WebStarter CLI
AppVersion=1.0
DefaultDirName={autopf}\WebStarter
DisableDirPage=yes
OutputDir=Output
Compression=lzma
SolidCompression=yes
;SetupIconFile=webstarter.ico

; ================================
; FILES TO INSTALL
; ================================
[Files]
Source: "webstarter.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "webstarter.bat"; DestDir: "{app}"; Flags: ignoreversion

; ================================
; OPTIONAL INSTALL FEATURES
; ================================
[Tasks]
Name: "addtopath"; Description: "Add WebStarter to System PATH"; Flags: unchecked
Name: "system32"; Description: "Also install to System32 (requires admin)"; Flags: unchecked

; ================================
; ACTIONS AFTER INSTALL
; ================================
[Run]
; Add to PATH if selected
Filename: "{cmd}"; \
Parameters: "/c setx PATH ""%PATH%;{app}"""; \
StatusMsg: "Adding WebStarter to global PATH..."; \
Tasks: addtopath; \
Flags: runhidden

; Copy to System32 if selected
Filename: "cmd.exe"; \
Parameters: "/c copy /Y ""{app}\webstarter.exe"" ""{sys}\webstarter.exe"""; \
StatusMsg: "Copying to System32..."; \
Tasks: system32; \
Flags: runascurrentuser runhidden

; ================================
; SHORTCUTS
; ================================
[Icons]
Name: "{group}\WebStarter CLI"; Filename: "{app}\webstarter.exe"
Name: "{group}\Uninstall WebStarter"; Filename: "{uninstallexe}"

; ================================
; UNINSTALL CLEANUP
; ================================
[UninstallDelete]
Type: filesandordirs; Name: "{app}"
