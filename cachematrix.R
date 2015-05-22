# ASSIGNMENT 2

# 
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
  
#

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
  
# Now I want to try if the fucntion works; so I create a matrix and compute its inverse, by recalling 
# the function created above

testMatrix = rbind(c(1,2,3), c(0,0,1), c(1,0,0))

c = makeCacheMatrix(testMatrix)
c
cacheSolve(c)

# this gives indeed the same result as with the standard way to compute and inverse matrix
solve(testMatrix)
