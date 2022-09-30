module FakeR

using DataFrames

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

"""
    R: dim() dimentions of array
    julia: size
"""    
dim(x) = size(x)


"""
    R: dir.create(path, recursive = FALSE , mode = "0777").
    create dictionary
    dir_create
    julia: mkpath, mkdir
    Using mkpath so effectively recursive = TRUE always.
    Also dir.create() inly takes single path, dir_create can take a vector
"""
function dir_create(x; recursive = false, mode = "0777")
    Omode = parse(UInt16, mode, base = 8)
    mkpath.([x;], mode = Omode)
end

"""
    R: grepl(pattern, vector, ignore.case=false)
    look for pattern in vector
    julia: occursin/contains. Use string for the pattern
    FakeR.grepl("^a", ["ale", "bale"])
"""
function grepl(p,v; ignore_case = false)
    pat = ignore_case ? Regex(p,"i") : Regex(p)
    occursin.(pat, [v;])
end

"""
    R: grep(pattern, x, ignore.case = FALSE, value = FALSE, invert = FALSE)
    return indices or values of match
    julia: filter and occursin/contains
"""
function grep(p, v; value=false, ignore_case = false, invert = false)
    pat = ignore_case ? Regex(p,"i") : Regex(p)
    found = contains(pat).(v)
    invert && (found = .!found)
    if value
        return v[found]
    end
    findall(found)
end

"""
    R: file.info(file)
    returns data.frame of info on file
    file_info
    julia: stat
    stat does not return dataframe, but this does
"""
function file_info(x...)
    DataFrame(stat.([x... ;]))
end
    

## TODO exists. The following does not work
# """
#     R: exists("a") check if variable "a" exists.
#     Note in R the name of the variable is provided as string
#     julia: @isdefined(a)
#     In julia the object to check is given bare.
# """
# exists(x) = @isdefined(x)

"""
    R: list.files(path=".", pattern=NULL, all.files=FALSE, full.names=FALSE, recursive=FALSE, ignore.case=FALSE, inclue.dirs=FALSE, no..=FALSE)
    list files
    list_files. TODO: more keyword arguments
    julia: readdir(path=".",; join=false, sort=true)
"""
function list_files(path=pwd(); pattern = nothing, full_names=false, recursive = false, all_files=false)
    if recursive
        res = full_names ? reduce(vcat,[joinpath.(x[1],x[3]) for x in walkdir(path)]) : reduce(vcat,[x[3] for x in walkdir(path)])
    else
        res = full_names ? readdir(path, join = true) : readdir(path)
    end
    if ! isnothing(pattern)
        return res[[occursin(Regex(pattern), x) for x in res]]
    end
    if ! all_files
        res = filter( x -> !occursin(r"^\.|/\.", x), res)
    end
    res
end

"""
    R: range(c(3,2,1)) == c(1,3)
    Retuns a vector of the extreme values of a vector.
    julia: extrema([3,2,1])
    Nore range() in Julia has meaning similar to seq() in R
"""
range(v::Vector) = extrema(v)


"""
    R: toupper(), tolower()
    Uppercase or lowercase string or vector of strings
    julia: uppercase, lowercase
"""
toupper(x::String) = uppercase(x)
tolower(x::String) = lowercase(x)

toupper(v::Vector{String}) = uppercase.(v)
tolower(v::Vector{String}) = lowercase.(v)

const TRUE = true
const FALSE = false


end

# Eg
# NzMisc::checkRows -> assertrows
# NzMisc::CVpct
# Plyr::summarise
# List.files()
# Capture.output
# Basename, sans ext
# Dirname
# Sub, gsub
# plyr::arrange: sort
# lattice:xyplot
# seq
# ddply
# runif, dnorm, rnrom and other sampligs
# lm
# t.test
# expand.grid
# see also http://www.johnmyleswhite.com/notebook/2012/04/09/comparing-julia-and-rs-vocabularies/
## http://adv-r.had.co.nz/Vocabulary.html

# Interactions: csv strip_whitespace
