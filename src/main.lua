require('Array.ArrayTest')
print('\n\n\n\n\n')
require('List.ListTest')
require("Dictionary.DictionaryTest")

function tableIsEmpty(target)
    return _G.next(target) == nil
end

local t = {}

print(tableIsEmpty(t))