require("Array.Array")


local myArray1 = Array:New()
local myArray2 = Array:New()

print(myArray1)
print(myArray2)

myArray1:AddItemToLeft(10)
myArray1:AddItemToLeft(13)
myArray1:AddItemToLeft(9)
myArray1:AddItemToRight(32)
myArray1:AddItemToRight(14)
myArray1:AddItemToRight(10)

print('myArray1的item总数量'..myArray1:Count())
for i = myArray1:GetLeftIndex(), myArray1:GetRightIndex() do
    print('myArray1的下标为'..i ..'的值为'.. myArray1:GetItemByIndex(i))
end

print('删除一个10')
myArray1:RemoveOneItem(10)
print('myArray1的item总数量'..myArray1:Count())
for i = myArray1:GetLeftIndex(), myArray1:GetRightIndex() do
    print('myArray1的下标为'..i ..'的值为'.. myArray1:GetItemByIndex(i))
end

print('再添加一个10')
myArray1:AddItemToLeft(10)
print('myArray1的item总数量'..myArray1:Count())
for i = myArray1:GetLeftIndex(), myArray1:GetRightIndex() do
    print('myArray1的下标为'..i ..'的值为'.. myArray1:GetItemByIndex(i))
end

print('删除所有的10')
myArray1:RemoveAllItem(10)
print('myArray1的item总数量'..myArray1:Count())
for i = myArray1:GetLeftIndex(), myArray1:GetRightIndex() do
    print('myArray1的下标为'..i ..'的值为'.. myArray1:GetItemByIndex(i))
end

myArray1:SortItem()