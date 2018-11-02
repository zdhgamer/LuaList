---@class 顺序表
Array = {left=0,right=0}

Array.__index = Array;

---@type function New方法
---@return result Array 顺序表
function Array:New()
    local result = {}
    setmetatable(result, Array)
    result.left = 0
    result.right = 0;
    return result
end

---@type function 在左边插入值
---@param 值
---@return 当前位置
function Array:AddItemToLeft(value)
    self.left = self.left-1
    self[self.left] = value
    return self.left
end

---@type function 在右边插入值
---@param 值
---@return 当前位置
function Array:AddItemToRight(value)
    self[self.right] = value
    self.right = self.right+1
    return self.right
end

---@type function 在右边插入一系列的值
---@param otherArray Array
function Array:AddRangeToRight(otherArray)
    local otherIndex = otherArray:GetLeftIndex()
    for i = 1, otherArray:Count() do
        self[self.right+1] = otherArray:GetItemByIndex(otherIndex)
        otherIndex = otherIndex + 1
        self.right = self.right + 1
    end

end

---@type function 在左边插入一系列的值
---@param otherArray Array
function Array:AddRangeToLeft(otherArray)
    local otherIndex = otherArray:GetRightIndex()
    for i = 1, otherArray:Count() do
        self[self.left-1] = otherArray[otherIndex-i+1]
        otherIndex = otherIndex - 1
        self.left = self.left - 1
    end

end

---@type function 返回该坐标下的值
---@param index Number
function Array:GetItemByIndex(index)
    return self[index]
end

---@type function 从左往右遍历，删除第一个遇到的数据
---@param value 值
---@return temp Number 返回第一个找到的下标
function Array:RemoveOneItem(value)
    local temp = self.left
    for i = self.left, self.right do
        if self[i] == value then
            temp = i
            self[i] = nil
            break
        end
    end
    for i = temp, self.right-1 do
        self[i] = self[i+1]
    end
    self.right = self.right-1
    return temp
end

---@type function 从左往右遍历，删除所有遇到的数据
---@param value 值
function Array:RemoveAllItem(value)
    local temp = 0;
    for i = self.left, self.right do
        if self[i] == value then
            self[i] = nil
            temp = temp + 1
        end
    end
    if temp >0 then
        for i = 1, temp do
            for j = self.left, self.right do
                local pos = 0
                if self[j] == nil then
                    pos = j
                    for k = pos, self.right do
                        self[k] = self[k+1]
                    end
                    self.right = self.right-1
                    break
                end
            end
        end
    end
end

---@type function 返回有多少个数据
---@param value 值
function Array:Count()
    return self.right - self.left
end

---@type function 返回最左边的索引
---@Return self.left Number
function Array:GetLeftIndex()
    return self.left
end

---@type function 返回最右边的索引
---@Return self.right Number
function Array:GetRightIndex()
    return self.right -1
end

---@type function 按升序排列
function Array:SortItemByUp()
    local temp = 1;
    for i = self:GetLeftIndex(), self:GetRightIndex() do
        for j = self:GetLeftIndex(), self:GetRightIndex() - temp do
            if self:GetItemByIndex(j) > self:GetItemByIndex(j+1) then
                self[j],self[j+1] = self[j+1],self[j]
            end
        end
        temp = temp + 1
    end
end

---@type function 按降序排列
function Array:SortItemByDown()
    local temp = 1;
    for i = self:GetLeftIndex(), self:GetRightIndex() do
        for j = self:GetLeftIndex(), self:GetRightIndex() - temp do
            if self:GetItemByIndex(j) < self:GetItemByIndex(j+1) then
                self[j],self[j+1] = self[j+1],self[j]
            end
        end
        temp = temp + 1
    end
end

---@type function 清空
function Array:ClearArray()
    for i = self.left, self.right do
        self[i] = nil
    end
    self.left = 0
    self.right = 0
end

return Array

