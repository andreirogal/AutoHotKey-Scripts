#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Converts the clipboard to translit and paste
^!vk54:: ;CTRL + ALT + T
  str := Clipboard
  res := translit(str)
  SendRaw % res
  VarSetCapacity(res, 0) ;Free memory
  VarSetCapacity(str, 0) ;Free memory
return

translit(strVal) {
  translit := ""
  arrRuEn := {а: "a", б: "b", в: "v", г: "g", д: "d", е: "e", ё: "yo", ж: "zh", з: "z", и: "i", й: "j", к: "k", л: "l", м: "m", н: "n", о: "o", п: "p", р: "r", с: "s", т: "t", у: "u", ф: "f", х: "h", ц: "c", ч: "ch", ш: "sh", щ: "shh", ъ: "", ы: "y", ь: "", э: "e", ю: "yu", я: "ya", А: "A", Б: "B", В: "V", Г: "G", Д: "D", Е: "E", Ё: "YO", Ж: "ZH", З: "Z", И: "I", Й: "J", К: "K", Л: "L", М: "M", Н: "N", О: "O", П: "P", Р: "R", С: "S", Т: "T", У: "U", Ф: "F", Х: "H", Ц: "C", Ч: "CH", Ш: "SH", Щ: "SHH", Ъ: "", Ы: "Y", Ь: "", Э: "E", Ю: "YU", Я: "YA", " ": " ", ".": ".", ",": ","}

  arrStr := StrSplit(strVal, "")

  for indexArrStr, valueArrStr in arrStr {
    for indexArrRuEn, valuearrRuEn in arrRuEn {
      if ( indexarrRuEn = valueArrStr ) {
        translit .= valuearrRuEn
      }
    }
  }
  return translit
}
