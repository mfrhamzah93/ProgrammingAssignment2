# makeCacheMatrix creates a list containing a function to
# set the value of the matrix, get the value of the matrix, set the value of inverse of the matrix, get the value of inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

#cacheSolve is used to find the inverse of a matrix, which in this case matrix 'x'
cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data.")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinverse(inv)
  inv
}
bulu <- makeCacheMatrix( matrix(c(-1,15 1,27), nrow = 2, ncol = 2) )
summary(bulu)
cacheSolve(bulu)

