# FakeR

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://tp2750.github.io/FakeR.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://tp2750.github.io/FakeR.jl/dev/)
[![Build Status](https://github.com/tp2750/FakeR.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/tp2750/FakeR.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/tp2750/FakeR.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/tp2750/FakeR.jl)

_Fake it 'till you make it_

I have used R for 15+ year, but want to switch to Julia.
However lots of time I struggle to remember how to do something in Julia which I know exactly how to do in R.

This is my attempt to ease the transistion: implementation of some R functin names in julia.

This package does not export anything in order not to create confusion.
There are some functions names that are shared but with very different meanng.

E.g. the R function `range()` does the same as the julia function `extrema`, whereas the julia function `range` does the same as the R function `seq()`.

