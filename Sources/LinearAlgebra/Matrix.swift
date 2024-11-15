// Matrix.swift
//
// This file is part of the SwiftNum project.
// Licensed under the MIT licence, © 2024.
//

/// A Matrix is a 2-dimensional array with numeric elements.
public struct Matrix<T: Numeric>: Equatable {
	/// The number of rows of the matrix.
	public let rowCount: Int
	/// The number of columns of the matrix,
	public let columnCount: Int
	/// All matrix elements.
	public private(set) var grid: [[T]]

	/// Create a new ``Matrix`` in the specified size with default elements.
	/// - Parameters:
	///   - rows: Number of rows of the matrix.
	///   - columns: Number of columns of the matrix.
	///   - initialValue: The initial value you want all values to be filled with.
	public init(rows: Int, columns: Int, initialValue: T) {
		precondition(rows > 0, "Matrix must have at least one row")
		precondition(columns > 0, "Matrix must have at least one column")
		grid = Array(repeating: Array(repeating: initialValue, count: columns), count: rows)
		rowCount = rows
		columnCount = columns
	}

	/// Create a new ``Matrix`` with the elements already specified.
	/// - Parameter values: All the elements of the matrix.
	///
	/// The elements will be filled with the outer array being the rows and the inner array with the columns. So [[1, 3, 3, 4], [1, 2, 3, 4]] will create a Matrix in the form
	/// ```
	/// 1 2
	/// 3 2
	/// 3 3
	/// 4 4
	/// ```
	public init(values: [[T]]) {
		precondition(!values.isEmpty, "Matrix must have at least one row")
		precondition(!values.first!.isEmpty, "Matrix must have at least one column")
		self = Matrix(rows: values.count, columns: values.first!.count, initialValue: values.first![0])
		for (rowIndex, row) in values.enumerated() {
			for (columnIndex, value) in row.enumerated() {
				self[rowIndex, columnIndex] = value
			}
		}
	}

	/// Initilaize a vector.
	/// - Parameter vector: The vector elements.
	///
	/// A vector is a special matrix with only one column of values. This enables special operations on the matrix.
	public init(vector: [T]) {
		self = Matrix(rows: vector.count, columns: 1, initialValue: vector[0])
		for (index, value) in vector.enumerated() {
			self[index, 0] = value
		}
	}

	subscript(row: Int, column: Int) -> T {
		get {
			precondition(row >= 0 && row < rowCount && column >= 0 && column < columnCount, "Index out of range")
			return grid[row][column]
		}
		set {
			precondition(row >= 0 && row < rowCount && column >= 0 && column < columnCount, "Index out of range")
			grid[row][column] = newValue
		}
	}

	subscript(row: Int) -> [T] {
		get {
			precondition(row >= 0 && row < rowCount, "Row index out of range")
			return grid[row]
		}
		set {
			precondition(row >= 0 && row < rowCount, "Row index out of range")
			precondition(newValue.count == columnCount, "New row must have \(columnCount) columns")
			grid[row] = newValue
		}
	}

	/// A matrix is a square matrix if the count of the rows and columns is equal.
	public var isSquare: Bool { rowCount == columnCount }

	/// Get the element of a vector in the nth position
	/// - Parameter index: The index (starting at 0).
	/// - Returns: The element at the index.
	public func vectorElement(at index: Int) -> T {
		precondition(index >= 0 && index < columnCount, "Index out of range")
		precondition(columnCount == 1, "A vector must only have one column")
		return grid[index][0]
	}

	/// A matrix is diagonal if all elements outside the main diagonal are 0.
	///
	/// The following matrix is a diagonal matrix:
	/// ```
	/// [3, 0, 0],
	/// [0, 1, 0],
	/// [0, 0, 1]
	/// ```
	public var isDiagonal: Bool {
		if !isSquare {
			return false
		}
		for (rowIndex, row) in grid.enumerated() {
			for (columnIndex, value) in row.enumerated() where columnIndex != rowIndex {
				if value != 0 {
					return false
				}
			}
		}
		return true
	}

	/// The determinant of a square matrix.
	///
	/// - Warning: This computed variable currently only works for 2x2 and 3x3 matrices.
	public var determinant: T {
		precondition(rowCount == columnCount, "Matrix must be square.")
		switch rowCount {
			case 2:
				return twoByTwoDeterminant()
			case 3:
				return threeByThreeDeterminant()
			default:
				fatalError("Unsupported matrix size")
		}
	}

	/// The identiy matrix of a square matrix.
	public var identityMatrix: Matrix<Int> {
		precondition(rowCount == columnCount, "Matrix must be square.")
		var matrix = Matrix<Int>(rows: rowCount, columns: columnCount, initialValue: 0)
		for (rowIndex, row) in matrix.grid.enumerated() {
			for (columnIndex, _) in row.enumerated() where columnIndex == rowIndex {
				matrix[rowIndex][columnIndex] = 1
			}
		}
		return matrix
	}

	private func twoByTwoDeterminant() -> T {
		self[0, 0] * self[1, 1] - self[0, 1] * self[1, 0]
	}

	private func threeByThreeDeterminant() -> T {
		let a: T = self[0][0]
		let b: T = self[0][1]
		let c: T = self[0][2]
		let d: T = self[1][0]
		let e: T = self[1][1]
		let f: T = self[1][2]
		let g: T = self[2][0]
		let h: T = self[2][1]
		let i: T = self[2][2]
		let splitResultA: T = a * (e * i - f * h)
		let splitResultB: T = b * (d * i - f * g)
		let splitResultC: T = c * (d * h - e * g)

		return splitResultA - splitResultB + splitResultC
	}

	static func * (lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T> {
		do {
			return try lhs.multiplied(by: rhs)
		} catch {
			fatalError("Invalid dimension.")
		}
	}
}
