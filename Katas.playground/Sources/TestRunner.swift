import Foundation
import PlaygroundSupport
import XCTest

// MARK: - Test Observer

public class PlaygroundTestObserver: NSObject, XCTestObservation {
    @objc public func testCase(_ testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: Int) {
        print("Test failed on line \(lineNumber): \(testCase.name), \(description)")
    }
}

public struct TestRunner {
    public init() {}
    
    public func runTests(testClass: AnyClass) {
        let tests = testClass as! XCTestCase.Type
        let testSuite = tests.defaultTestSuite
        testSuite.run()
        let run = testSuite.testRun as! XCTestSuiteRun
        
        print("Ran \(run.executionCount) tests in \(run.testDuration)s with \(run.totalFailureCount) failures")
    }
}
