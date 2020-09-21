// Kata URL: https://www.codewars.com/kata/5517fcb0236c8826940003c9/train/swift

import Foundation
import PlaygroundSupport
import XCTest

// MARK: - Irreducible Sum of Rationals

func sumFracts(_ l: [(Int, Int)]) -> (Int, Int)? {
   // your code
    return nil
}

class SolutionTest: XCTestCase {
    static var allTests = [
        ("sumFracts", testExample),
    ]

    func testing(_ l: [(Int, Int)], _ expected: (Int, Int)?) {
        XCTAssert(sumFracts(l)! == expected!, "should return \(expected!)")
    }
    func testingNil(_ l: [(Int, Int)]) {
        XCTAssertTrue(sumFracts(l) == nil, "Should return nil")
    }

    func testExample() {
        testing([(1, 2), (1, 3), (1, 4)], (13, 12))
        testing([(1, 3), (5, 3)], (2, 1))
        testingNil([])
        testing([(1, 8), (1, 9)], (17, 72))
    }
}


let observer = PlaygroundTestObserver()
let center = XCTestObservationCenter.shared
center.addTestObserver(observer)
TestRunner().runTests(testClass: SolutionTest.self)

