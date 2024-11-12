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

	/// Augments a matrix with another matrix.
	/// - Parameter matrix: The matrix to augment.
	/// - Returns: The new augmented matrix.
	func augment(with matrix: Matrix<T>) -> Matrix<T> {
		precondition(rowCount == matrix.rowCount, "You can only augment matrices with the same row count.")
		var newMatrix = Matrix(rows: rowCount, columns: columnCount + matrix.columnCount, initialValue: 0)
		for row in 0 ..< rowCount {
			let augmentedRow = self[row] + matrix[row]
			newMatrix[row] = augmentedRow
		}
		return newMatrix
	}

	/// Inverse a matrix.
	/// - Returns: The inversed matrix as a Matrix\<Double\>.
	func inversed() -> Matrix<Double> {
		precondition(isSquare, "Matrix must be square.")
		precondition(determinant != 0, "Matrix must have a non-zero determinant.")
		// Convert to double
		let originalDoubleMatrix = Matrix<Double>(values: doubleValues)
		let doubleIdentityMatrix = Matrix<Double>(values: identityMatrix.doubleValues)
		var augmentedMatrix = originalDoubleMatrix.augment(with: doubleIdentityMatrix)
		for i in 0 ..< rowCount {
			let pivot = augmentedMatrix[i][i]
			for j in 0 ..< 2 * rowCount {
				augmentedMatrix[i][j] /= pivot
			}

			for k in 0 ..< rowCount {
				if k != i {
					let factor = augmentedMatrix[k][i]
					for j in 0 ..< 2 * rowCount {
						augmentedMatrix[k][j] -= factor * augmentedMatrix[i][j]
					}
				}
			}
		}

		var inverseMatrix: Matrix<Double> = Matrix<Double>(rows: rowCount, columns: rowCount, initialValue: 0)
		for i in 0 ..< rowCount {
			for j in 0 ..< rowCount {
				inverseMatrix[i][j] = augmentedMatrix[i][j + rowCount]
			}
		}
		return inverseMatrix
	}
}
