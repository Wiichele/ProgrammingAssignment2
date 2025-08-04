## This script defines functions to create a special "matrix" object that can cache its inverse.
## The caching mechanism avoids recalculating the inverse multiple times, improving performance.

makeCacheMatrix <- function() {
  ## Initialize matrix storage
  mat <- NULL
  ## Initialize cache for the matrix inverse
  inv_cache <- NULL

  ## Function to set the matrix and reset the cached inverse
  setMatrix <- function(x) {
    mat <<- x
    inv_cache <<- NULL
  }

  ## Function to get the inverse of the matrix, computing it if not cached
  getInverse <- function() {
    if (is.null(inv_cache)) {
      ## Compute and store the inverse if not already cached
      inv_cache <<- solve(mat)
    }
    inv_cache
  }

  ## Return a list of the setter and getter functions
  list(setMatrix = setMatrix, getInverse = getInverse)
}

## Function to retrieve the cached inverse, computing it if needed
cacheSolve <- function(x, ...) {
  inv_cache <- x$getInverse()
  inv_cache
}
