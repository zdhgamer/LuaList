function MyReverse(value)
    local result= ""
    local temp = ""
    for i = #value, 1,-1 do
        temp = string.sub(value,i,i)
        result = result .. temp
    end
    return result
end

a = "123456789"

print(MyReverse(a))
