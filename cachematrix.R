# ASSIGNMENT 2

# I need to create a function that set the value of a matrix, get the value of that matrix, 
# set the value of the inverse matrix and get the value of the inverse matrix. To do that I write:

makeCacheMatrix = function(x = matrix()) {
m = NULL
set = function(y) {
x <<- y
m <<- NULL  
}
  
get = function() x
setinverse = function(ciao) m <<- ciao
getinverse = function() m
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}
  
# Now I want to create a function that checks if the inverse of a matrix has already been calculated. 
# If so, it gets this inverse from the cache and skips the computation. 
# Otherwise, it computes the inverse of the data and sets the value of the inverse matrix in the cache via the setmean function.
# To do that I write:

cacheSolve = function(x) {
m = x$getinverse()
if(!is.null(m)) {
message("getting cached data")  
return(m)  
}
  
data = x$get()
m = solve(data)
x$setinverse(m)
m
}

# Now I want to try if the function works; so I create a matrix and compute its inverse, by recalling 
# the function created above

testMatrix = rbind(c(1,2,3), c(0,0,1), c(1,0,0))

c = makeCacheMatrix(testMatrix)
c
cacheSolve(c)

# this gives indeed the same result as with the standard way to compute and inverse matrix
solve(testMatrix)
