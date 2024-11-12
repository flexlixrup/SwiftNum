// Matrix+Maths.swift
//
// This file is part of the SwiftNum project.
// Licensed under the MIT licence, © 2024.
//

public extension Matrix {
	/// Returns a transposed matrix.
	/// - Returns: The transposed matrix.
	///
	/// A transposed matrix is a matrix with its rows and columns switched.
	func transposed() -> Matrix<T> {
		let firstRow = grid.first!
		let transposedValues = (0 ..< firstRow.count).map { columnIndex in
			grid.map { row in row[columnIndex] }
		}
		return Matrix(values: transposedValues)
	}
}
