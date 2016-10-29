//
//  LLMorseCodeTranslator.swift
//
//
//  Created by Liuliet.Lee on 2/4/2016.
//
//

import Foundation

class LLMorseCodeTranslator {

    // MARK: - Mapping
    private let dict = [
        "a": ".-",
        "b": "-...",
        "c": "-.-.",
        "d": "-..",
        "e": ".",
        "f": "..-.",
        "g": "--.",
        "h": "....",
        "i": "..",
        "j": ".---",
        "k": "-.-",
        "l": ".-..",
        "m": "--",
        "n": "-.",
        "o": "---",
        "p": ".--.",
        "q": "--.-",
        "r": ".-.",
        "s": "...",
        "t": "-",
        "u": "..-",
        "v": "...-",
        "w": ".--",
        "x": "-..-",
        "y": "-.--",
        "z": "--..",
        "1": ".----",
        "2": "..---",
        "3": "...--",
        "4": "....-",
        "5": ".....",
        "6": "-....",
        "7": "--...",
        "8": "---..",
        "9": "----.",
        "0": "-----",
        " ": " ",
        ".": ".-.-.-",
        ",": "--..--",
        "?": "..--..",
        "!": "-.-.--"
    ]

    // MARK: - Public functions

    func englishToMorse(input: String) -> String {
        let arrayOfString = Array(input.characters)
        let translatedString = arrayOfString.reduce("") { $0 + (dict[String($1).lowercased()] ?? "⊠") + " "}
        return translatedString
    }

    func morseToEnglish(input: String) -> String {
        let arrayOfCode = spliteMorse(code: input)
        let translatedString = arrayOfCode.reduce("") { $0 + (dict.key(forValue: $1) ?? "⊠")}
        return translatedString
    }

    // MARK: - Private functions

    private func spliteMorse(code: String) -> [String] {
        var splitedCode = [String]()
        let arrayOfString = Array(code.characters)

        var temp = ""
        for single in arrayOfString {
            switch single {
            case ".", "-":
                temp += String(single)
            default:
                if temp != "" {
                    splitedCode += [temp]
                    temp = ""
                } else {
                    splitedCode += ["  "]
                }
            }
        }

        if temp != "" {
            splitedCode += [temp]
        }

        return splitedCode
    }
}

// MARK: - Add functionality to Dictionary
extension Dictionary {
    func key(forValue val: Value) -> Key? {
        return (self as NSDictionary).allKeys(for: val).first as! Key?
    }
}

// MARK: - Configure String data type
extension String {
    subscript (i: Int) -> Character {
        return self[index(self.startIndex, offsetBy: i)]
    }

    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }

    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(start, offsetBy: r.upperBound - r.lowerBound)
        return self[Range(start ..< end)]
    }
}
