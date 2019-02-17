---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Administrator.
--- DateTime: 2018/11/2 16:55
---

print('开始测试List')

require('List.List')

local list = List:New()

list:AddItemToLeft(10)
list:AddItemToLeft(9)
list:AddItemToRight(11)
list:AddItemToRight(16)
list:AddItemToRight(14)


local first = list.firstNode

while(first~=nil) do
    print(first.data)
    first = first.rightPointer
end

print('list的长度为'..list.count)

print('删除一个14')
list:RemoveOneItem(14)
first = list.firstNode
while(first~=nil) do
    print(first.data)
    first = first.rightPointer
end

print('测试迭代器')
local listNext = list:Next()
local value = listNext()
while(value~=nil) do
    print(value)
    value = listNext()
end

print('再次测试迭代器')
local listNext = list:Next()
local value = listNext()
while(value~=nil) do
    print(value)
    value = listNext()
end

list:ClearList()

print('list的长度为'..list.count)

print('测试List结束')