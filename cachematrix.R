
## The calculation of the inverse of a matrix is one of the computations in statistics that are known to be time-consuming. 
## in order to save time, it might be usefull to cache an inverted matrix, so if in the future computations it will be used again, it will be simply extracted from memory instead of being calculated again.
## The two functions below enable us to do it: makeCacheMatrix function creates a special "matrix" object that can cache its inverse. CacheSolve function computes the inverse of the special "Matrix" returned by makeCacheMatrix. In case the inverse process has already been applied on the matrix, and it's the same input matrix, the function cacheSolve will get the inverse from the cache. 

## makeCacheMatrix function creates an R object that stores a matrix and its inversed matrix. 

makeCacheMatrix <- function(x = matrix()) {
		inversed <- NULL
		set <- function(y) {
				x <<- y
				inversed <<- NULL
}
get <- function() x
setInversion <- function(inversion) inversed <<- inversion
getInversion <- function() inversed
list(set = set,
	 get = get,
 	 setInversion = setInversion,
	 getInversion = getInversion)
}


## cacheSolve function takes an argument returned by makeCacheMatrix and either computes an inverted matrix or retrieves the inversed matrix from cache if it already was calculated. 

cacheSolve <- function(x, ...) {
		inversed <- x$getInversion()
		if (!is.null(inversed)) {
				message("getting cached data")
				return(inversed)
}
matrix <- x$get()
inversed <- solve(matrix, ...)
x$setInversion(inversed)
inversed
}
