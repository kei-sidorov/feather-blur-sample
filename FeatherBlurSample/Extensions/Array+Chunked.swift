//
//  Array+Chunked.swift
//  FeatherBlurSample
//
//  Created by Кирилл Сидоров on 04.11.2020.
//

import Foundation

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
