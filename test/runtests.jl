using FakeR
using Test

@testset "FakeR.jl" begin
    @test FakeR.c(1,2,3) == [1,2,3]
    a = 2
    @test FakeR.@capture_output(print(a)) == "2"
    @test FakeR.dim([1 2 ; 3 4 ]) == (2,2)
##    @test FakeR.exists("a") == true
##    @test FakeR.exists("b") == false
end
