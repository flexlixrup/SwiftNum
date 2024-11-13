// Matrix+Helper.swift
//
// This file is part of the SwiftNum project.
// Licensed under the MIT licence, © 2024.
//

extension Matrix {
	func toDouble(_ value: T) -> Double {
		if let integerValue = value as? any BinaryInteger {
			Double(integerValue)
		} else if let floatValue = value as? any BinaryFloatingPoint {
			Double(floatValue)
		} else {
			fatalError("Unsupported numeric type")
		}
	}

	var doubleValues: [[Double]] {
		grid.map { row in
			row.map {
				toDouble($0)
			}
		}
	}
}
