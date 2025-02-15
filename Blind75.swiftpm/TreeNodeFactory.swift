//
//  TreeNodeFactory.swift
//  Blind75
//
//  Created by Roman Dashchakivskyi on 2/15/25.
//

import Foundation

public class TreeNodeFactory {
    // Factory method to create a binary tree from an array
    public static func createTree(_ array: [Int?]) -> TreeNode? {
        // Recursive approach
        func build(_ index: Int) -> TreeNode? {
            guard index < array.count, let value = array[index] else { return nil }

            let node = TreeNode(value)
            node.left = build(2 * index + 1)
            node.right = build(2 * index + 2)
            return node
        }
        return build(0)
    }
}

