var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = FakeR","category":"page"},{"location":"#FakeR","page":"Home","title":"FakeR","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for FakeR.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [FakeR]","category":"page"},{"location":"#FakeR.c-Tuple","page":"Home","title":"FakeR.c","text":"R: c(1,2,3) vector constructor\njulia: [1,2,3]\n\n\n\n\n\n","category":"method"},{"location":"#FakeR.dim-Tuple{Any}","page":"Home","title":"FakeR.dim","text":"R: dim() dimentions of array\njulia: size\n\n\n\n\n\n","category":"method"},{"location":"#FakeR.dir_create-Tuple{Any}","page":"Home","title":"FakeR.dir_create","text":"R: dir.create(path, recursive = FALSE , mode = \"0777\").\ncreate dictionary\ndir_create\njulia: mkpath, mkdir\nUsing mkpath so effectively recursive = TRUE always.\nAlso dir.create() inly takes single path, dir_create can take a vector\n\n\n\n\n\n","category":"method"},{"location":"#FakeR.file_info-Tuple","page":"Home","title":"FakeR.file_info","text":"R: file.info(file)\nreturns data.frame of info on file\nfile_info\njulia: stat\nstat does not return dataframe, but this does\n\n\n\n\n\n","category":"method"},{"location":"#FakeR.list_files","page":"Home","title":"FakeR.list_files","text":"R: list.files(path=\".\", pattern=NULL, all.files=FALSE, full.names=FALSE, recursive=FALSE, ignore.case=FALSE, inclue.dirs=FALSE, no..=FALSE)\nlist files\nlist_files. TODO: more keyword arguments\njulia: readdir(path=\".\",; join=false, sort=true)\n\n\n\n\n\n","category":"function"},{"location":"#FakeR.range-Tuple{Vector}","page":"Home","title":"FakeR.range","text":"R: range(c(3,2,1)) == c(1,3)\nRetuns a vector of the extreme values of a vector.\njulia: extrema([3,2,1])\nNore range() in Julia has meaning similar to seq() in R\n\n\n\n\n\n","category":"method"},{"location":"#FakeR.toupper-Tuple{String}","page":"Home","title":"FakeR.toupper","text":"R: toupper(), tolower()\nUppercase or lowercase string or vector of strings\njulia: uppercase, lowercase\n\n\n\n\n\n","category":"method"},{"location":"#FakeR.@capture_output-Tuple{Expr}","page":"Home","title":"FakeR.@capture_output","text":"R: capture.output()\nCapture the output of a printing command.\n@capture_output print(a)\nReturns the output of the expression as a string\n\n\n\n\n\n","category":"macro"}]
}
