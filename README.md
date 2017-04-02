# English MorseCode Translator
A model that is used to translate from English to Morse code, and vise versa, for iOS development.

## Installation
Just move the [`LLMorseCodeTranslator.swift`](https://github.com/LiulietLee/English-MorseCode-Translator/blob/master/LLMorseCodeTranslator.swift) file to your project.

## Usage
The usage is very simple because there are only 2 public methods in this file.

```swift
let translator = LLMorseCodeTranslator()
let translateEnglishToMorseCode = translator.englishToMorse("Your English String")
let translateMorseCodeToEnglish = translator.morseToEnglish(".- .-- -.--")
```

## Supported Characters
* A - Z
* a - z
* 0 - 9
* '.' ',' '?' '!' ' '

Unsupported characters are shown as `⊠`
