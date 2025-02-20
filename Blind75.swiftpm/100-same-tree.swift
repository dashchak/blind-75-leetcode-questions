//Given the roots of two binary trees p and q, write a function to check if they are the same or not.
//
//Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.
//
//
//
//Example 1:
//
//
//Input: p = [1,2,3], q = [1,2,3]
//Output: true
//Example 2:
//
//
//Input: p = [1,2], q = [1,null,2]
//Output: false
//Example 3:
//
//
//Input: p = [1,2,1], q = [1,1,2]
//Output: false
//
//
//Constraints:
//
//The number of nodes in both trees is in the range [0, 100].
//-10^4 <= Node.val <= 10^4


// O(N) O(N)
// DFS iterative
extension Solution {
    // Iterative
    func isSameTree1(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var stack: [(TreeNode?, TreeNode?)] = [(p,q)]
        while !stack.isEmpty {
            let (node1, node2) = stack.removeLast()

            if node1 == nil && node2 == nil { continue }

            if node1?.val != node2?.val {
                return false
            }

            stack.append((node1?.left, node2?.left))
            stack.append((node1?.right, node2?.right))
        }
        return true
    }

    // Recursive
    func isSameTree2(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let p, let q else { return p === q }

        return p.val == q.val &&
               isSameTree1(p.left, q.left) &&
               isSameTree1(p.right, q.right)
    }

    func testIsSameTree1() {
        let p = TreeNodeFactory.createTree([1,2,1])!
        let q = TreeNodeFactory.createTree([1,1,2])!

        let result = isSameTree1(p, q)

        let expectedResult = false
        assert(result == expectedResult)
    }

    func testIsSameTree2() {
        let p = TreeNodeFactory.createTree([1,2,1])!
        let q = TreeNodeFactory.createTree([1,2,1])!

        let result = isSameTree2(p, q)

        let expectedResult = true
        assert(result == expectedResult)
    }
}
