import Foundation
import XCTest

func rank(_ st: String, _ we: [Int], _ n: Int) -> String {
    guard !st.trimmingCharacters(in: .whitespaces).isEmpty else { return "No participants" }
    guard n <= we.count else { return "Not enough participants" }
    
    let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    let names = st
        .trimmingCharacters(in: .whitespaces)
        .split(separator: ",")
        .map { String($0).lowercased() }
    
    var soms = [Int]()
    for name in names {
        var som = 0
        som += name.count
        name.forEach {
            if let index = alphabet.firstIndex(of: String($0)) {
                som += index + 1
            }
        }
        soms.append(som)
    }

    let winningNumbers = soms
        .enumerated()
        .map { $1 * we[$0] }
    
    var winningCombination = zip(winningNumbers, names)
        .sorted(by: >)
    
    if winningNumbers.count != Set(winningNumbers).count {
        if let duplicateNumber = winningNumbers.duplicates().first {
            let equalWN = winningCombination
                .filter { $0.0 == duplicateNumber }
                .sorted(by: { $0.1 < $1.1 })
            
            var indexes = [Int]()
            for wn in equalWN {
                if let index = winningCombination.firstIndex(where: { $0 == wn }) {
                    indexes.append(index)
                }
            }
            let sortedIndexes = indexes
                .sorted(by: <)
            
            if let first = sortedIndexes.first, let last = sortedIndexes.last {
                winningCombination[first...last].sort(by: { $0.1 < $1.1 })
            }
        }
        
    }
    return winningCombination[n - 1].1.capitalized
}

extension Array where Element: Hashable {
    func duplicates() -> Array {
        let groups = Dictionary(grouping: self, by: { $0 })
        let duplicateGroups = groups.filter { $1.count > 1 }
        let duplicates = Array(duplicateGroups.keys)
        return duplicates
    }
}

class SolutionTest: XCTestCase {
    static var allTests = [
        ("rank", testExample),
    ]

    func testing(_ s: String, _ we: [Int], _ n: Int, _ expected: String) {
        XCTAssertEqual(rank(s, we, n), expected, "should return \(expected)")
    }
     
    func testExample() {
        testing("Addison,Jayden,Sofia,Michael,Andrew,Lily,Benjamin", [4, 2, 1, 4, 3, 1, 2], 4, "Benjamin")
        testing("Elijah,Chloe,Elizabeth,Matthew,Natalie,Jayden", [1, 3, 5, 5, 3, 6], 2, "Matthew")
        testing("Addison,Jayden,Sofia,Michael,Andrew,Lily,Benjamin", [4, 2, 1, 4, 3, 1, 2], 8, "Not enough participants")
        testing("", [4, 2, 1, 4, 3, 1, 2], 6, "No participants")
        testing(" ", [4, 2, 1, 4, 3, 1, 2], 6, "No participants")
    }
}
         
let observer = PlaygroundTestObserver()
let center = XCTestObservationCenter.shared
center.addTestObserver(observer)
TestRunner().runTests(testClass: SolutionTest.self)
