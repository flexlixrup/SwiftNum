// LinearAlgebraTests.swift
//
// This file is part of the SwiftNum project.
// Licensed under the MIT licence, © 2024.
//

@testable import LinearAlgebra
import Testing

@Suite("Matrix base tests")
struct MatrixBaseTests {
	@Test("Test empty matrix initialization")
	func emptyMatrixInitialization() {
		let matrix = Matrix(rows: 2, columns: 2, initialValue: 0)
		#expect(matrix[1][1] == 0)
	}

	@Test("Test filled matrix initialization")
	func filledMatrixInitialization() {
		let values = [[1, 3, 3, 4], [1, 2, 3, 4]]
		let matrix = Matrix(values: values)
		#expect(matrix[1, 1] == 2)
		#expect(matrix[0, 1] == 3)
	}

	@Test("Test Vector initialization")
	func vectorInitialization() {
		let values: [Double] = [1, 2, 3, 4]
		let vector = Matrix(vector: values)
		#expect(vector[1].first! == 2)
	}

	@Test("Test Vector element getter")
	func getVectorElement() {
		let values: [Double] = [1, 2, 3, 4]
		let vector = Matrix(vector: values)
		#expect(vector.vectorElement(at: 0) == 1)
	}

	@Test("Single subscript setter")
	func singleSubscriptSetter() {
		var matrix = Matrix(rows: 2, columns: 2, initialValue: 0)
		matrix[1] = [2, 3]
		#expect(matrix[1] == [2, 3])
	}

	@Test("Is Matrix square")
	func isMatrixSquare() {
		#expect(Matrix(rows: 2, columns: 2, initialValue: 0).isSquare)
		#expect(!Matrix(rows: 2, columns: 3, initialValue: 0xF).isSquare)
		#expect(!Matrix(rows: 3, columns: 2, initialValue: 1.0).isSquare)
	}

	@Test("Is Matrix diagonal")
	func isMatrixDiagonal() {
		let nonSquareMatrix = Matrix(rows: 2, columns: 3, initialValue: 0)
		#expect(!nonSquareMatrix.isDiagonal)
		let nonDiagonalMatrix = Matrix(values:
			[
				[1, 2, 3],
				[4, 5, 6],
				[7, 8, 9]
			])

		#expect(!nonDiagonalMatrix.isDiagonal)

		let diagonalMatrix = Matrix(values:
			[
				[3, 0, 0],
				[0, 1, 0],
				[0, 0, 1]
			])
		#expect(diagonalMatrix.isDiagonal)
	}
}

@Suite("Matrix math tests")
struct MatrixMathTests {
	@Test("Matrix transposition")
	func matrixTransposition() {
		let matrix = Matrix(values:
			[
				[1, 2, 3],
				[4, 5, 6],
				[7, 8, 9]
			])
		let expectedMatrix = Matrix(values:
			[
				[1, 4, 7],
				[2, 5, 8],
				[3, 6, 9]
			])

		#expect(matrix.transposed() == expectedMatrix)
	}
}
