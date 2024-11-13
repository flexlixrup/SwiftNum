// LinearAlgebraErrors.swift
//
// This file is part of the SwiftNum project.
// Licensed under the MIT licence, © 2024.
//

import Foundation

enum LinearAlgebraErrors: Error, LocalizedError {
	case invalidDimension
	case invalidMatrixSize
	case invalidVectorSize
	case invalidMatrixRank
	case invalidMatrixRankForInversion
	case invalidMatrixRankForSVD
	case invalidMatrixRankForQR
	case invalidMatrixRankForCholesky
	case invalidMatrixRankForLU

	var errorDescription: String? {
		switch self {
			case .invalidDimension:
				"Invalid dimension."
			case .invalidMatrixSize:
				"Invalid matrix size."
			case .invalidVectorSize:
				"Invalid vector size."
			case .invalidMatrixRank:
				"Invalid matrix rank."
			case .invalidMatrixRankForInversion:
				"Invalid matrix rank for inversion."
			case .invalidMatrixRankForSVD:
				"Invalid matrix rank for SVD."
			case .invalidMatrixRankForQR:
				"Invalid matrix rank for QR."
			case .invalidMatrixRankForCholesky:
				"Invalid matrix rank for Cholesky."
			case .invalidMatrixRankForLU:
				"Invalid matrix rank for LU."
		}
	}
}
