function isSafe(report)
    function check(report)
        z = 0  # Direction tracker: 1 for increasing, -1 for decreasing
        for i in 1:length(report)-1
            diff = report[i+1] - report[i]
            if abs(diff) > 3 || abs(diff) < 1
                return false
            end
            direction = sign(diff)
            if direction != 0
                if z == 0
                    z = direction
                elseif z != direction
                    return false
                end
            end
        end
        return true
    end

    if check(report)
        return true  # Already safe
    end

    # Try removing one element and check
    for i in 1:length(report)
        if check(vcat(report[1:i-1], report[i+1:end]))
            return true
        end
    end

    return false  # Not safe even after removing one element
end

print(length(filter(x -> x == 1, map(x -> isSafe(map(y -> parse(Int64, y), split(x, " "))), readlines("./Day2.txt")))))



