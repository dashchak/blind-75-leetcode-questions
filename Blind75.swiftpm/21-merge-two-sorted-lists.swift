//
//You are given the heads of two sorted linked lists list1 and list2.
//
//Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.
//
//Return the head of the merged linked list.
//
//
//
//Example 1:
//
//
//Input: list1 = [1,2,4], list2 = [1,3,4]
//Output: [1,1,2,3,4,4]
//Example 2:
//
//Input: list1 = [], list2 = []
//Output: []
//Example 3:
//
//Input: list1 = [], list2 = [0]
//Output: [0]
//
//
//Constraints:
//
//The number of nodes in both lists is in the range [0, 50].
//-100 <= Node.val <= 100
//Both list1 and list2 are sorted in non-decreasing order.

import Foundation

// O(l1 + l2) O(1)

extension Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // Create a dummy node to start the merged list
        let head = ListNode(0)

        // l1 and l2 point to the current nodes in list1 and list2 respectively
        var l1 = list1, l2 = list2

        // cur is used to build the merged list
        var cur = head

        // Loop through both lists until we reach the end of one of them
        while l1 != nil && l2 != nil {
            // Compare values from both lists and append the smaller one to the merged list
            if l1!.val < l2!.val {
                cur.next = l1 // Add l1 node to the merged list
                l1 = l1?.next // Move to the next node in list1
            } else {
                cur.next = l2 // Add l2 node to the merged list
                l2 = l2?.next // Move to the next node in list2
            }
            cur = cur.next! // Move the current pointer to the next node
        }

        // If one of the lists is not empty, append the rest of the nodes to the merged list
        cur.next = l1 != nil ? l1 : l2

        // Return the merged list starting from the first actual node (skip dummy head)
        return head.next
    }

    func testMergeTwoLists() {
        let l1 = ListNodeFactory.createList([1,2,4])
        let l2 = ListNodeFactory.createList([1,3,4])
        let result = mergeTwoLists(l1, l2)
        print(result!)

        let expectedResult = ListNodeFactory.createList([1,1,2,3,4,4])
        assert(result == expectedResult)
    }
}
