## This function create a list yhis four functions and the matrixes "x" and "inv" 
## in it's environment
## The cacheSolve use the functions of created list to create the inverse matrix and cache it

## Create a list of functions:
## set - to set the value of matrix "x" and inversed matrix "inv" to null
## get - to get matrix "x"
## setinv  - to set the iversed value of matrix "x" to cache
## getinv - to get the inversed value from cache

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  #set the value for "inv" equal to null in this function environment 
  set <<- function(y) {
    x <<- y
    #set the value for "x" equal to null in in the different from this function environment 
    inv <<- NULL
    #set the value for "inv" equal to null in the different from this function environment 
  }
  get <- function() x # just get the matrix which need to be inverse
  setinv <- function(inverse) inv <<- inverse # cache the value of inverse matrix!!
  getinv <- function() inv
  # get inverse matrix from cache!!
  list( get = get,
        setinv = setinv,
        getinv = getinv)
  # create a list with with four functions
}


## Use the list created by function above to inverse the matrix "x" and set that value to cache 
##and check inverse matrix in cache and if there is it then return it

cacheSolve <- function(x, ...) {
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
    #try to get cahche value of inverse matrix if it is not equal to zero else to continue
  }
  data <- x$get() # get the matrix from the myMatrix function environment wich now hold in list
  inv <- solve(data, ...) #inverse matrix
  x$setinv(inv) # set the cach value
  inv # get the inversed matrix      
  ## Return a matrix that is the inverse of 'x'
}
