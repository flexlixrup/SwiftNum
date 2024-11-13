// MatrixMathTests.swift
//
// This file is part of the SwiftNum project.
// Licensed under the MIT licence, © 2024.
//

@testable import LinearAlgebra
import Testing

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

	@Test("Matrix augmention")
	func matrixAugmentation() throws {
		let matrix = Matrix(values:
			[
				[1, 2, 3],
				[4, 5, 6],
				[7, 8, 9]
			])
		let vector = Matrix(vector: [10, 11, 12])
		let expectedMatrix = Matrix(values:
			[
				[1, 2, 3, 10],
				[4, 5, 6, 11],
				[7, 8, 9, 12]
			])

		#expect(try matrix.augmented(with: vector) == expectedMatrix)
	}

	@Test("Matrix inversion")
	func matrixInversion() throws {
		let matrix = Matrix(values:
			[
				[1, 5],
				[6, 2]
			])
		let expectedMatrix = Matrix<Double>(values:
			[
				[-1.0 / 14.0, 5.0 / 28.0],
				[3.0 / 14.0, -1.0 / 28.0]
			]).grid.map { row in
			row.map {
				$0.rounded()
			}
		}

		let inversedMatrix = try! matrix.inversed().grid.map { row in
			row.map {
				$0.rounded()
			}
		}

		#expect(inversedMatrix == expectedMatrix)
	}

	@Test("Multiply Test")
	func multiplyTest() throws {
		let matrix = Matrix(values:
			[
				[1, 2, 3],
				[4, 5, 6],
				[7, 8, 9]
			])
		let vector = Matrix(vector: [10, 11, 12])

		let mulMatrix = try matrix.multiplied(by: vector)
		#expect(Matrix(vector: [68, 167, 266]) == mulMatrix)

		let mulMatrixInfix = matrix * vector
		#expect(Matrix(vector: [68, 167, 266]) == mulMatrixInfix)
	}
}
