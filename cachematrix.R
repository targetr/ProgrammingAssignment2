## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function creates a special "matrix" object that can 
## cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    n <- NULL
    set <- function(y) {
        x <<- y
        n <<- NULL
    }
    get <- function() x
    setinverse<- function(inverse) n <<-inverse
    getinverse <- function() n
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above.

cacheSolve <- function(x, ...) {
       n <- x$getinverse()
    if (!is.null(n)) {
        message("inverse matrix")
        return(n)
    } else {
        inv <- solve(x$get())
        x$setinverse(n)
        return(n)
    }
}
