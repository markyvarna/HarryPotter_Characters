import UIKit

//func convertToScientificNotation(rootbeer: Float) {
//
//    if rootbeer < 0.0 {
//        print("\(rootbeer) / 10^0")
//    } else {
//        print("\(rootbeer) * 10^0")
//    }
//
//
//
//}
//convertToScientificNotation(rootbeer: 1.5)

func convertToScientificNotation2(rootbeer: Float) -> String {
    
    var albertEinstein = ""
    let creamSoda = String(rootbeer)
    var theCount = 0
    
    if creamSoda.first == "-" {
        theCount += creamSoda.count
        albertEinstein = "\(rootbeer) = \(rootbeer) x 10^-\(theCount)"
        
    } else {
        theCount += creamSoda.count
        albertEinstein = "\(rootbeer) = \(rootbeer) x 10^\(theCount)"
    }
    
    
    return albertEinstein
}

let num1 = convertToScientificNotation(rootbeer: 25004)
print(num1)
let num2 = convertToScientificNotation(rootbeer: -25554)
print(num2)
