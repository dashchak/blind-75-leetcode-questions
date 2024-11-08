//
//  Heap.swift
//  Blind75
//
//  Created by Roman Dashchakivskyi on 10/13/24.
//

import Foundation

class Trie {
    var root = TrieNode<Character>()

    func insert(_ word: String) {
        var cur = root
        for char in word {
            cur = cur.children[char] ?? {
                let newNode = TrieNode<Character>()
                cur.children[char] = newNode
                return newNode
            }()
        }
        cur.isEnd = true
    }

    func search(_ word: String) -> Bool {
        node(for: word)?.isEnd ?? false
    }

    func startsWith(_ prefix: String) -> Bool {
        node(for: prefix) != nil
    }
}

private extension Trie {
    func node(for word: String) -> TrieNode<Character>? {
        var cur = root
        for char in word {
            guard let child = cur.children[char] else { return nil }
            cur = child
        }
        return cur
    }
}
