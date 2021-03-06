## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        ## This function creates a special "matrix" object that can cache its inverse.
m <- NULL
        set <- function(y)
        {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(solve) m <<- solve
        getmean <- function() m
        
        list( set = set, get = get, setmean = setmean, getmean = getmean)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        ##This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
        ##If the inverse has already been calculated (and the matrix has not changed),
        ##then cacheSolve should retrieve the inverse from the cache
        m <- x$getmean()
        if(!is.null(m))
        {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setmean(m)
        m
}
