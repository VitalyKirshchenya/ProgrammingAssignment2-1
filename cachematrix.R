
cachematrix <- function(x, ...) {
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
}