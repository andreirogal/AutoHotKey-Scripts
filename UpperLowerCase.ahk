#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Replace selected text with lowercase // CTRL + ALT + L
^!vk4C:: ;CTRL + ALT + L
  Clipboard = ;Empty the clipboard so that ClipWait has something to detect
  SendInput, ^{vk43} ;Copies selected text CTRL + C
  ClipWait
  StringReplace, OutputText, Clipboard, `r`n, `n, All ;Fix for SendInput sending Windows linebreaks
  StringLower, OutputText, OutputText
  SendRaw % OutputText
  VarSetCapacity(OutputText, 0) ;Free memory
return

;Replace selected text with uppercase // CTRL + ALT + U
^!vk55:: ;CTRL + ALT + U
  Clipboard = ;Empty the clipboard so that ClipWait has something to detect
  SendInput, ^{vk43} ;Copies selected text CTRL + C
  ClipWait
  StringReplace, OutputText, Clipboard, `r`n, `n, All ;Fix for SendInput sending Windows linebreaks
  StringUpper, OutputText, OutputText
  SendRaw % OutputText
  VarSetCapacity(OutputText, 0) ;Free memory
return
