function main()
    mulEnabled = true
    function execute(x)
        println(x)
        if x == "do()"
            mulEnabled = true
        elseif x == "don't()"
            mulEnabled = false
        elseif mulEnabled
            return reduce(*, map(y -> parse(Int64, y), split(x, ",")))
        end
        return 0
    end
    print(
        reduce(+,
            map(x -> execute(x.match),
                collect(eachmatch(r"((?<=mul\()\d*,\d*(?=\)))|(do\(\))|(don't\(\))", readline("./Day3.txt"))))))
end
main()
