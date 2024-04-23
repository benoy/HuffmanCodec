//
//  HuffmanTreeTests.swift
//  HuffmanCodecTests
//
//  Created by Binoy Vijayan on 23/04/24.
//

import XCTest
@testable import HuffmanCodec

final class HuffmanTreeTests: XCTestCase {
    let huffmanTree = HuffmanTree()
    

    func testBuildTree() {
        
        let frequencies: [Character: Int] = ["a": 5, "b": 9, "c": 12, "d": 13, "e": 16, "f": 45]
        let rootNode = huffmanTree.buildTree(frequencies)
        
        XCTAssertNotNil(rootNode)
        // Add more assertions as needed
    }

    func testGenerateHuffmanCodes() {
        let huffmanTree = HuffmanTree()
        let rootNode = HuffmanNode(nil, 100)
        rootNode.left = HuffmanNode("a", 50)
        rootNode.right = HuffmanNode("b", 50)
        var codes: [Character: String] = [:]
        huffmanTree.generateHuffmanCodes(rootNode, "", &codes)
        
        XCTAssertEqual(codes["a"], "0")
        XCTAssertEqual(codes["b"], "1")
        // Add more assertions as needed
    }

    func testSerializeDeserializeTree() {
        let huffmanTree = HuffmanTree()
        let rootNode = HuffmanNode(nil, 100)
        rootNode.left = HuffmanNode("a", 50)
        rootNode.right = HuffmanNode("b", 50)
        let serializedTree = huffmanTree.serializeTree(rootNode)
        let deserializedRootNode = huffmanTree.deserializeTree(serializedTree)
        
        XCTAssertNotNil(deserializedRootNode)
        // Add more assertions as needed
    }

}
