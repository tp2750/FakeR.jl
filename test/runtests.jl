using FakeR
using Test

@testset "FakeR.jl" begin
    @test FakeR.c(1,2,3) == [1,2,3]
    a = 2
    @test FakeR.@capture_output(print(a)) == "2"
    @test FakeR.dim([1 2 ; 3 4 ]) == (2,2)
##    @test FakeR.exists("a") == true
##    @test FakeR.exists("b") == false
    @test FakeR.toupper(FakeR.tolower(FakeR.c("ABC", "cde"))) == FakeR.c("ABC", "CDE")
    @test FakeR.TRUE
    @test FakeR.FALSE == false    
    @test FakeR.file_info( FakeR.dir_create("/tmp/a", mode = "777")).desc == ["/tmp/a"]
    @test any(occursin.(r"/tmp/a",FakeR.list_files("/tmp", full_names = true)))
    @test FakeR.grepl("^a", ["ale", "bale"]) == [true, false]
    @test FakeR.grepl("^a", ["Ale", "bale"], ignore_case = true) == [true, false]
    @test FakeR.grep("^a", ["Ale", "bale"], ignore_case = true) == [1]
    @test FakeR.grep("^a", ["Ale", "bale"], ignore_case = true, value = true) == ["Ale"]
    @test FakeR.grep("^a", ["Ale", "bale"], ignore_case = true, invert = true) == [2]
end
