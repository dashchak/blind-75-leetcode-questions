//Given the root of a binary tree, return its maximum depth.
//
//A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
//
//
//
//Example 1:
//
//
//Input: root = [3,9,20,null,null,15,7]
//Output: 3
//Example 2:
//
//Input: root = [1,null,2]
//Output: 2
//
//
//Constraints:
//
//The number of nodes in the tree is in the range [0, 104].
//-100 <= Node.val <= 100

// O(N) O(N)

extension Solution {
    // BFS Iterative. Level order traversal
    func maxDepthBFSIterative(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }

        var result = 0
        var level = [root]
        while !level.isEmpty {
            let nextLevel = level.flatMap{ [$0.left, $0.right].compactMap{$0} }
            level = nextLevel
            result += 1
        }

        return result
    }

    // BFS Recursive. Level order traversal
    func maxDepthBFSRecursive(_ root: TreeNode?) -> Int {
         func bfs(_ level: [TreeNode?], _ depth: Int) -> Int {
             guard !level.isEmpty else { return depth }

             let nextLevel = level.flatMap{ treeNode in
                 [treeNode?.left, treeNode?.right].compactMap{$0}
             }
             return bfs(nextLevel, depth + 1)
         }

         return root == nil ? 0 : bfs([root], 0)
     }

    // DFS Iterative
    func maxDepthDFSIterative(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }

        var stack = [(root, 1)]
        var result = 0

        while !stack.isEmpty {
            let (node, depth) = stack.removeLast()
            result = max(result, depth)

            if let right = node.right {
                stack.append((right, depth + 1))
            }
            if let left = node.left {
                stack.append((left, depth + 1))
            }
        }
        return result
    }

    // DFS Recursive
    func maxDepthDFSRecursive(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }

        return 1 + max(maxDepthDFSRecursive(root.right), maxDepthDFSRecursive(root.left))
    }

    
    func testMaxDepthMaxDepthBFSIterative() {
        let tree = TreeNodeFactory.createTree([3,9,20,nil,nil,15,7])!

        let result = maxDepthBFSIterative(tree)

        let expectedResult = 3
        assert(result == expectedResult)
    }

    func testMaxDepthMaxDepthBFSRecursive() {
        let tree = TreeNodeFactory.createTree([3,9,20,nil,nil,15,7])!

        let result = maxDepthBFSRecursive(tree)

        let expectedResult = 3
        assert(result == expectedResult)
    }
    
    func testMaxDepthMaxDepthDFSIterative() {
        let tree = TreeNodeFactory.createTree([3,9,20,nil,nil,15,7])!

        let result = maxDepthDFSIterative(tree)

        let expectedResult = 3
        assert(result == expectedResult)
    }

    func testMaxDepthMaxDepthDFSRecursive() {
        let tree = TreeNodeFactory.createTree([3,9,20,nil,nil,15,7])!

        let result = maxDepthDFSRecursive(tree)

        let expectedResult = 3
        assert(result == expectedResult)
    }
}
