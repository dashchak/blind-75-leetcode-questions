//There is an integer array nums sorted in ascending order (with distinct values).
//
//Prior to being passed to your function, nums is possibly rotated at an unknown pivot index k (1 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].
//
//Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.
//
//You must write an algorithm with O(log n) runtime complexity.
//
//
//
//Example 1:
//
//Input: nums = [4,5,6,7,0,1,2], target = 0
//Output: 4
//Example 2:
//
//Input: nums = [4,5,6,7,0,1,2], target = 3
//Output: -1
//Example 3:
//
//Input: nums = [1], target = 0
//Output: -1
//
//
//Constraints:
//
//1 <= nums.length <= 5000
//-104 <= nums[i] <= 104
//All values of nums are unique.
//nums is an ascending array that is possibly rotated.
//-104 <= target <= 104
import Foundation

// O(logn) O(1)

extension Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1
        // Better to use <= to check all cases and return -1 at the end
        // if use l < r, then return nums[l] == target ? l : -1
        while l <= r {
            let mid = l + (r - l) / 2
            if target == nums[mid] {
                return mid
            } else if nums[mid] <= nums[r] { // right part is sorted
                if nums[mid] < target && target <= nums[r] { // target is in the right (sorted) part
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            } else { // left part must be sorted
                if nums[l] <= target && target < nums[mid] {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
        }
        return -1
    }

    func testSearch() {
        let nums = [4,5,6,7,0,1,2]
        let target = 0
        let result = search(nums, target)
        print(result)

        let expected = 4
        assert(result == expected)
    }
}
