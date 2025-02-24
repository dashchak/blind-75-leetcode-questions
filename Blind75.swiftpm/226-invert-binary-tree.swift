//Given the root of a binary tree, invert the tree, and return its root.
//
//
//
//Example 1:
//
//
//Input: root = [4,2,7,1,3,6,9]
//Output: [4,7,2,9,6,3,1]
//Example 2:
//
//
//Input: root = [2,1,3]
//Output: [2,3,1]
//Example 3:
//
//Input: root = []
//Output: []
//
//
//Constraints:
//
//The number of nodes in the tree is in the range [0, 100].
//-100 <= Node.val <= 100

// O(N) O(N)

extension Solution {
    // DFS Recursive
    func invertTreeDFSRecursive(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        let leftSubtree = invertTreeDFSRecursive(root.left)
        let rightSubtree = invertTreeDFSRecursive(root.right)

        root.left = rightSubtree
        root.right = leftSubtree
        
        return root
    }


    func invertTreeDFSIterative(_ root: TreeNode?) -> TreeNode? {
        guard let root else { return nil }

        var stack = [root]
        while !stack.isEmpty {
            let current = stack.removeLast()

            (current.left, current.right) = (current.right, current.left)

            // 1 liner adds an overhead for creating and filtering array:
            // stack.append(contentsOf: [current.left, current.right].compactMap { $0 })
            // Thus better to use:
             if let left = current.left { stack.append(left) }
             if let right = current.right { stack.append(right)}
        }
        return root
    }

    func testInvertTreeDFSRecursive() {
        let tree = TreeNodeFactory.createTree([2,1,3])!

        let result = invertTreeDFSIterative(tree)

        let expectedResult = TreeNodeFactory.createTree([2,3,1])!
        assert(result == expectedResult)
    }

    func testInvertTreeDFSIterative() {
        let tree = TreeNodeFactory.createTree([4,2,7,1,3,6,9])!

        let result = invertTreeDFSIterative(tree)

        let expectedResult = TreeNodeFactory.createTree([4,7,2,9,6,3,1])!
        assert(result == expectedResult)
    }
}
