//
//  LLMorseCodeTranslator.swift
//  
//
//  Created by Liuliet.Lee on 2/4/2016.
//
//

import Foundation

class LLMorseCodeTranslator {
    
    // MARK: - Dictionarys
    
    private let engToMorse = ["a": ".-",
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
                              "!": "-.-.--"]
    
    private let morseToEng = [".-": "a",
                              "-...": "b",
                              "-.-.": "c",
                              "-..": "d",
                              ".": "e",
                              "..-.": "f",
                              "--.": "g",
                              "....": "h",
                              "..": "i",
                              ".---": "j",
                              "-.-": "k",
                              ".-..": "l",
                              "--": "m",
                              "-.": "n",
                              "---": "o",
                              ".--.": "p",
                              "--.-": "q",
                              ".-.": "r",
                              "...": "s",
                              "-": "t",
                              "..-": "u",
                              "...-": "v",
                              ".--": "w",
                              "-..-": "x",
                              "-.--": "y",
                              "--..": "z",
                              ".----": "1",
                              "..---": "2",
                              "...--": "3",
                              "....-": "4",
                              ".....": "5",
                              "-....": "6",
                              "--...": "7",
                              "---..": "8",
                              "----.": "9",
                              "-----": "0",
                              "  ": " ",
                              ".-.-.-": ".",
                              "--..--": ",",
                              "..--..": "?",
                              "-.-.--": "!"]
    
    // MARK: - Public functions
    
    func englishToMorse(input: String) -> String {
        var translatedString = ""
        let arrayOfString = Array(input.characters)
        
        for char in arrayOfString {
            if let newCode = engToMorse[String(char).lowercaseString] {
                translatedString += newCode + " "
            } else {
                translatedString = "Error: Cannot translate character: \(char)"
                break
            }
        }
        
        return translatedString
    }
    
    func morseToEnglish(input: String) -> String {
        var translatedString = ""
        let arrayOfCode = spliteMorse(input)
        
        for code in arrayOfCode {
            if let newString = morseToEng[code] {
                translatedString += newString
            } else {
                translatedString = "Error: Cannot translate code: \(code)"
                break
            }
        }
        
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

// MARK: - Configure String data type

extension String {
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = startIndex.advancedBy(r.startIndex)
        let end = start.advancedBy(r.endIndex - r.startIndex)
        return self[Range(start ..< end)]
    }
}