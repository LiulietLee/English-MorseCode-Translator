# English-MorseCode-Translator
A little stuff that be used to translate from English to Morse code and from Morse code to English for iOS development.

## Installation
Just move the LLMorseCodeTranslator.swift file to your project.

## Usage
The usage is very simple because there are only 2 public functions in this file.

```
let translator = LLMorseCodeTranslator()
let translateEnglishToMorseCode = translator.englishToMorse("Your English String")
let translateMorseCodeToEnglish = translator.morseToEnglish(".- .-- -.--")
```

## Supported Characters
* A - Z
* a - z
* 0 - 9
* '.' ',' '?' '!' ' '
