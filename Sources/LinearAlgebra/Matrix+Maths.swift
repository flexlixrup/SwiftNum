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
	@inlinable
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
	func augmented(with matrix: Matrix<T>) throws -> Matrix<T> {
		guard rowCount == matrix.rowCount else {
			throw LinearAlgebraErrors.invalidDimension
		}
		var newMatrix = Matrix(rows: rowCount, columns: columnCount + matrix.columnCount, initialValue: 0)
		for row in 0 ..< rowCount {
			let augmentedRow = self[row] + matrix[row]
			newMatrix[row] = augmentedRow
		}
		return newMatrix
	}

	/// Inverse a matrix.
	/// - Returns: The inversed matrix as a Matrix\<Double\>.
	func inversed() throws -> Matrix<Double> {
		guard isSquare && determinant != 0 else {
			throw LinearAlgebraErrors.invalidDimension
		}
		// Convert to double
		let originalDoubleMatrix = Matrix<Double>(values: doubleValues)
		let doubleIdentityMatrix = Matrix<Double>(values: identityMatrix.doubleValues)
		var augmentedMatrix = try originalDoubleMatrix.augmented(with: doubleIdentityMatrix)
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
	
	/// Multiply 2 matrices
	/// - Parameter matrix: The matrix you want to multiply by.
	/// - Returns: The multiplied matrix.
	func multiplied(by matrix: Matrix<T>) throws -> Matrix<T> {
		guard columnCount == matrix.rowCount else {
			throw LinearAlgebraErrors.invalidDimension
		}
		var newMatrix = Matrix(rows: rowCount, columns: matrix.columnCount, initialValue: 0)
		for row in 0 ..< rowCount {
			for col in 0 ..< matrix.columnCount {
				var cellValue: T = 0

				for k in 0 ..< columnCount {
					cellValue += self[row][k] * matrix[k][col]
				}
				newMatrix[row][col] = cellValue
			}
		}
		return newMatrix
	}
}
