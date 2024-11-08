//
//  Heap.swift
//  Blind75
//
//  Created by Roman Dashchakivskyi on 10/13/24.
//

import Foundation

class TrieNode<Key: Hashable> {
    var children = [Key: TrieNode]()
    var isEnd = false
}
