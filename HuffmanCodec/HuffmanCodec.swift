//
//  HuffmanCodec.swift
//  HuffmanCodec
//
//  Created by Binoy Vijayan on 12/01/24.
//

import Foundation


class HuffmanCodec {
    
    private let huffmanTree = HuffmanTree()
    
    func compress(_ string: String) -> (encoded: String, tree: String) {
        
        var frequencies = [Character: Int]()
        for char in string { frequencies[char, default: 0] += 1 }
        guard let tree = huffmanTree.buildTree(frequencies) else { return ("", "") }
        var codes = [Character: String]()
        huffmanTree.generateHuffmanCodes(tree, "", &codes)
        var compressed = ""
        for char in string {
            guard let code = codes[char] else { fatalError("Failed to find Huffman code for character") }
            compressed += code
        }
            
        return (compressed, huffmanTree.serializeTree( tree))
    }
    
    func decompress(_ compressed: String, _ tree: String) -> String {
        
        var decoded = ""
        guard let node = huffmanTree.deserializeTree(tree) else { return "" }
        var current = node
        for bit in compressed {
            if bit == "0" { if let left = current.left { current = left } }
            else if bit == "1" { if let right = current.right { current = right } }
            if let char = current.character {
                decoded.append(char)
                current = node
            }
        }
        
        return decoded
    }
}
