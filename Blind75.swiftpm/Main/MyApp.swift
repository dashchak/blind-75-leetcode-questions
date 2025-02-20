import SwiftUI

class Solution {}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            EmptyView()
        }
    }


    init() {
        let solution = Solution()
        solution.testLongestConsecutive()
        solution.testMergeTwoLists()
        solution.testTopKFrequent()
        solution.testCanFinish()
        solution.testValidTree()
        solution.testTrie()
        solution.testSearch()
        solution.testFindMin()
        solution.testMissingNumber1()
        solution.testMissingNumber2()
        solution.testGetSum()
        solution.testHammingWeight1()
        solution.testHammingWeight2()
        solution.testMaxPathSum()
        solution.testIsSameTree1()
        solution.testIsSameTree2()
    }
}



