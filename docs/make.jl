using FakeR
using Documenter

DocMeta.setdocmeta!(FakeR, :DocTestSetup, :(using FakeR); recursive=true)

makedocs(;
    modules=[FakeR],
    authors="Thomas Poulsen",
    repo="https://github.com/tp2750/FakeR.jl/blob/{commit}{path}#{line}",
    sitename="FakeR.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://tp2750.github.io/FakeR.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/tp2750/FakeR.jl",
    devbranch="main",
)
