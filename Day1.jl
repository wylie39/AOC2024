function main()
    input = readlines("Day1.txt")


    left = []
    right = []


    for row in input
        parts = split(row, "  ")  # Parse only once
        push!(left, parse(Int64, parts[1]))
        push!(right, parse(Int64, parts[2]))
    end

    sort!(left)
    sort!(right)

    total = 0
    total2 = 0

    for (l, r) in zip(left, right)
        total += abs(l - r)
        total2 += l * count(x -> x == l, right)
    end

    println(total)
    println(total2)
end

main()


