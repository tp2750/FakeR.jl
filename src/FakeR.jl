module FakeR

## TODO plyr::arrange: sort

"""
    R: c(1,2,3) vector constructor
    julia: [1,2,3]
"""
c(a...) = [a...]

"""
    R: capture.output()
    Capture the output of a printing command.
    @capture_output print(a)
    Returns the output of the expression as a string
"""
macro capture_output(ex::Expr)
    ## See https://giordano.github.io/blog/2022-06-18-first-macro/
    ## eg sprint(io -> show(io,a))
    return :( sprint(io -> $(esc(ex.args[1]))(io,$(esc(ex.args[2])))) )
end

## TODO: ddply

"""
    R: dim() dimentions of array
    julia: size
"""    
dim(x) = size(x)

## TODO exists. The following does not work
# """
#     R: exists("a") check if variable "a" exists.
#     Note in R the name of the variable is provided as string
#     julia: @isdefined(a)
#     In julia the object to check is given bare.
# """
# exists(x) = @isdefined(x)

"""
    R: range(c(3,2,1)) == c(1,3)
    Retuns a vector of the extreme values of a vector.
    julia: extrema([3,2,1])
    Nore range() in Julia has meaning similar to seq() in R
"""
range(v::Vector) = extrema(v)

## TODO seq

## TODO lattice:xyplot

end

# Eg
# Dir.create
# File.info
# NzMisc::checkRows -> assertrows
# NzMisc::CVpct
# Plyr::summarise
# List.files()
# Capture.output
# Basename, sans ext
# Dirname
# Grep, grepl
# Sub, gsub


# Interactions: csv strip_whitespace
