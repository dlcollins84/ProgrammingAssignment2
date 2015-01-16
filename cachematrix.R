## Matrix inversion is usually a costly computation.
## Write a pair of functions that cache the inverse of a matrix.

makeCacheMatrix <- function(x = matrix()) {
## This function creates a special "matrix" object that can cache its inverse.
      
      m <<- x            ##this cache's the matrix itself in the global environment
      minv <<- solve(m)  ##this cache's the matrix inverse in the global environment
}



cacheSolve <- function(x, ...) {
## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated (and 
## the matrix has not changed), then cacheSolve should retrieve the inverse 
## from the cache
      
      
      if(exists("m") && exists("minv") && !is.null(m) && !is.null(minv)){
      ## Tests if the solution has already been cached, the matrix and its inverse
      ## should both be defined in the global environment, and not be NULL
            
            if(identical(m,x)){
            ## Tests if the original matrix has changed by comparing against the 
            ## matrix in the cache.
                  message("Retrieving the inverse matrix from the cache...")
                  minv
            } else{
                  message("Original matrix has changed since last cached, 
                          calculating the inverse matrix...")
                  makeCacheMatrix(x)
                  minv
            }
            
      } else { 
            message("Inverse matrix not found in cache, calculating the inverse matrix...")
            makeCacheMatrix(x)
            minv
      }
}
