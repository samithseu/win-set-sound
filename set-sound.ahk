#Requires AutoHotkey v2.0

; CONTROLLING THE VOLUME LEVEL IN THE SYSTEM
F8:: { ; Pressing F8 to show the GUI input
  input_vol := InputBox("Enter the volume :", "Setting volume!", "w200 h100", String(Round(SoundGetVolume(), 0)))
  ; check to see if the input is not digit
  if (input_vol.Value = "" or !RegExMatch(input_vol.Value, "^\d+$")) {
    input_vol.Value := String(Round(SoundGetVolume(), 0))
  } else {
    ; check to see if the value is too high (too loud)
    if (Round(SoundGetVolume(), 0) <25 && Float(input_vol.Value) > 25.00) {
      result := MsgBox(input_vol.Value " really ?", "Warning!", "YesNo Default2 Icon?",)
      ; if alert is yes, go ahead but if not set to 10 only
      if (result != "Yes") {
        input_vol.Value := String(Round(SoundGetVolume(), 0))
      }
    }
  }
  ; setting the volume
  SoundSetVolume input_vol.Value
  Send("{Volume_Up}")
  Send("{Volume_Down}")
}

!NumpadAdd:: { ; Alt+NumPad Plus
  ; increment the volume up by 2%
  Send("{Volume_Up}")
}

!NumpadSub:: { ; Alt+NumPad Minus
  ; decrement the volue down by 2%
  Send("{Volume_Down}")
}
