//
//  HuffmanCodecTests.swift
//  HuffmanCodecTests
//
//  Created by Binoy Vijayan on 23/04/24.
//

import XCTest
@testable import HuffmanCodec

final class HuffmanCodecTests: XCTestCase {

    func testCompressionAndDecompression() {
        let codec = HuffmanCodec()
        
        // Test case 1: Compression and decompression of a simple string
        let input1 = "ABRACADABRA"
        let (compressed1, tree1) = codec.compress(input1)
        let decompressed1 = codec.decompress(compressed1, tree1)
        XCTAssertEqual(decompressed1, input1)
        
        // Test case 2: Compression and decompression of an empty string
        let input2 = ""
        let (compressed2, tree2) = codec.compress(input2)
        let decompressed2 = codec.decompress(compressed2, tree2)
        XCTAssertEqual(decompressed2, input2)
        
        // Test case 3: Compression and decompression of a string with special characters
        let input3 = "Hello, world! How are you today?"
        let (compressed3, tree3) = codec.compress(input3)
        let decompressed3 = codec.decompress(compressed3, tree3)
        XCTAssertEqual(decompressed3, input3)
        
        // Add more test cases as needed
    }

}
