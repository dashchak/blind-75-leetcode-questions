//Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.
//
//
//
//Example 1:
//
//Input: nums = [1,1,1,2,2,3], k = 2
//Output: [1,2]
//Example 2:
//
//Input: nums = [1], k = 1
//Output: [1]
//
//
//Constraints:
//
//1 <= nums.length <= 105
//-104 <= nums[i] <= 104
//k is in the range [1, the number of unique elements in the array].
//It is guaranteed that the answer is unique.
//
//
//Follow up: Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
//


// O(N log k) O(N+k)

extension Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // Element: Count
        let countsDict = nums.reduce(into: [Int:Int]()) { dict, elem in
            dict[elem, default: 0] += 1
        }

        // Create min heap so we can disregard early >k elements
        var heap = Heap<(Int,Int)> ( {$0.0 < $1.0} )

        // Keep maximum size of k top frequent elements in the heap
        // O(N log k) < O(N log N) time
        for entry in countsDict {
            heap.insert((entry.value, entry.key))
            if heap.size > k { heap.extract() }
        }

        // Extract top k elements
        // Actually we will extract all as heap size should be k
        return (0..<k).compactMap { _ in heap.extract()?.1 }
    }


    func testTopKFrequent() {
        let nums = [1,1,1,2,2,3]
        let result = topKFrequent(nums, 2)
        print(result)

        let expectedResult = [2,1]
        assert(result == expectedResult)
    }
}
