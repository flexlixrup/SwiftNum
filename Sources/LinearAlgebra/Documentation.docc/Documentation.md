# ``LinearAlgebra``

LinearAlgebra provides different numeric functionalities to Swift, similiar to numpy for Python.

## Overview

For now, the package supports basic linear algebra, but it is planned to add more functionality in the future.

### Creating a Matrix

You can create a ``Matrix`` in different ways:

```swift
let matrix = Matrix(rows: 2, columns: 2, initialValue: 0)

// 
// [0, 0
//  0, 0]
//

let values = [[1, 3, 3, 4], [1, 2, 3, 4]]
let matrix = Matrix(values: values)
// [1 2
//  3 2
//  3 3
//  4 4]
```

The dimensions of the Matrix are always guaranteed and the size cannot be changed later on.
## Topics

- ``Matrix``

### Mathematical Operations

- ``Matrix/augmented(with:)``
- ``Matrix/transposed()``
- ``Matrix/inversed()``
- ``Matrix/multiplied(by:)``
