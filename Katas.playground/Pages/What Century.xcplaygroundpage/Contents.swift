import Foundation
import PlaygroundSupport
import XCTest

// MARK: - What Century

func whatCentury(_ year: String) -> String {
    guard let yearNumber = Int(year) else {
        return "Not a valid number"
    }

    var yearCopy = yearNumber
    var centuryNumber: Int = yearNumber.isMultiple(of: 100) ? 0 : 1

    while yearCopy >= 100 {
        yearCopy -= 100
        centuryNumber += 1
    }

    if let centuryLastNumber = String(describing: centuryNumber).compactMap({ Int(String($0)) }).last {
        switch centuryLastNumber {
        case 1: return "\(centuryNumber)st"
        case 2: return "\(centuryNumber)nd"
        case 3: return "\(centuryNumber)rd"
        default: return "\(centuryNumber)th"
        }
    }
  return "Error"
}

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]

    func testExample() {
        XCTAssertEqual("20th", whatCentury("1999"), "With input '1999' solution produced wrong output.")
        XCTAssertEqual("21st", whatCentury("2011"), "With input '2011' solution produced wrong output.")
        XCTAssertEqual("22nd", whatCentury("2154"), "With input '2154' solution produced wrong output.")
        XCTAssertEqual("23rd", whatCentury("2259"), "With input '2259' solution produced wrong output.")
        XCTAssertEqual("13rd", whatCentury("1234"), "With input '1234' solution produced wrong output.")
        XCTAssertEqual("3rd", whatCentury("250"), "With input '250' solution produced wrong output.")
        XCTAssertEqual("10th", whatCentury("1000"), "With input '1000' solution produced wrong output.")
        
    }
}


let observer = PlaygroundTestObserver()
let center = XCTestObservationCenter.shared
center.addTestObserver(observer)
TestRunner().runTests(testClass: SolutionTest.self)
