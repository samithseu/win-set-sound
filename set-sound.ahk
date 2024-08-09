#Requires AutoHotkey v2.0

; CONTROLLING THE VOLUME LEVEL IN THE SYSTEM
F8::{ ; Pressing F8 to show the GUI input
  input_vol := InputBox("Enter the volume :", "Setting volume!", "w200 h100", String(Round(SoundGetVolume(), 0)))
  ; check to see if the input is not digit
  If (input_vol.Value = "" or !RegExMatch(input_vol.Value, "^\d+$")) {
    input_vol.Value := String(Round(SoundGetVolume(), 0))
  } Else {
    ; check to see if the value is too high (too loud)
    if(Float(input_vol.Value) > 25.00) {
      result := MsgBox( input_vol.Value " really ?", "Warning!", "YesNo Default2 Icon?",)
      ; if alert is yes, go ahead but if not set to 10 only
      If (result != "Yes") {
        input_vol.Value := String(Round(SoundGetVolume(), 0))
      }
    }
  }
  ; setting the volume
  SoundSetVolume input_vol.Value
}  

!NumpadAdd::{ ; Alt+NumPad Plus
  SoundSetVolume "+2" ; increment the volume up by 2%
}

!NumpadSub::{ ; Alt+NumPad Minus
  SoundSetVolume "-2" ; decrement the volume down by 2%
}

