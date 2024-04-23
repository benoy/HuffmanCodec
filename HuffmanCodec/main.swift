//
//  main.swift
//  HuffmanCodec
//
//  Created by Binoy Vijayan on 12/01/24.
//

import Foundation


let codec = HuffmanCodec()
let compressed =  codec.compress("huffman coding")
print(compressed.encoded)
let deCompressed = codec.decompress(compressed.encoded, compressed.tree)
print(deCompressed)
