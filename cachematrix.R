## This second programming assignment will require you to write an R function 
## is able to cache potentially time-consuming computations.



## makeCacheMatrix creates a special "vector" containing functions:
##  set the value of the matrix
##  get the value of the matrix
##  set the value of the inverse of the matrix
##  get the value of the inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
  # null the cached value
  inverse <- NULL
  
  # setter function
  set <- function(value) {
    m <<- value
    inverse <<- NULL
  }
  
  # getter function
  get <- function() {
    m
  }
  
  # setter function for inverse
  setinverse <- function(value) {
    inverse <<- value
  }
  
  # getter function for inverse
  getinverse <- function() {
    inverse
  }
  
  list(
    set = set,
    get = get,
    setinverse = setinverse,
    getinverse = getinverse
  )
}

## cacheSolve returns the inverse of the invertible matrix.  This
## function may cache
cacheSolve <- function(m, ...) {
  # if we have a cached inverse, use it
  inverse <- m$getinverse()
  if (!is.null(inverse)) {
    return (inverse)
  }
  
  # calculate the inverse
  inverse <- solve(m$get())
  
  # cache it
  m$setinverse(inverse)
  
  inverse
}
