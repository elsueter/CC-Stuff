x, y, z = 0, 0, 0
dir = 0

function check()
    tru, data, meta = turtle.inspect()
    return checkData(data)
end

function checkUp()
    tru, data, meta = turtle.inspectUp()
    return checkData(data)
end

function checkDn()
    tru, data, meta = turtle.inspectDown()
    return checkData(data)
end

function checkData(data)
    if true then
        if data.name == "computercraft:turtle" then
            return true
        elseif data.name == "computercraft:turtle_advanced" then
            return true
        end
    end
    return false
end
 
function fw(i)
    for j = 1, i do
        if not check() then
            while not turtle.forward() do
                turtle.dig()
            end
            if dir == 0 then
                z = z - 1
            elseif dir == 1 then
                x = x + 1
            elseif dir == 2 then
                z = z + 1
            else
                x = x - 1
            end
        end
    end
end
 
function bk(i)
    tr(2)
    fw(i)
    tr(2)
end
 
function up(i)
    for j = 1, i do
        if not checkUp() then
            while not turtle.up() do
                turtle.digUp()
            end
            y  = y + 1
        end
    end
end
 
function dn(i)
    for j = 1, i do
        if not checkDn() then
            while not turtle.down() do
                turtle.digDown()
            end
            y = y - 1
        end
    end
end
 
function tr(i)
    for j = 1, i do
        turtle.turnRight()
        dir = dir + 1
        if dir > 3 then
            dir = 0
        end
    end
end
 
function tl(i)
    for j = 1, i do
        turtle.turnLeft()
        dir = dir - 1
        if dir < 0 then
            dir = 3
        end
    end
end

function getXYZ()
    print(x)
    print(y)
    print(z)
end
 
function setXYZ(x1, y1, z1)
    x = x1
    y = y1
    z = z1
end
 
function setDir(dir1)
    dir = dir1
end
 
function setXYZDir(x1, y1, z1, dir1)
    setXYZ(x1, x2, x3)
    setDir(dir1)
end
 
function gotoDir(dir1)
    while not dir == dir1 do
        tr(1)
    end
end
 
function gotoY(y1)
    while y < y1 do
        up(1)
    end
end
 
function gotoXYZ(x1, y1, z1)
    gotoY(100)
    xdif = x - x1
    if xdif < 0 then  
        xdif = xdif * -1
    end
    if x1 < x then
        gotoDir(3)
        fw(xdif)
    elseif x1 > x then
        gotoDir(1)
        fw(xdif)
    end
    ydif = y - y1
    if ydif < 0 then
        ydif = ydif * -1
    end
    zdif = z - z1
    if zdif < 0 then
        zdif = zdif * -1
    end
    if z1 < z then
        gotoDir(0)
        fw(zdif)
    elseif z1 > z then
        gotoDir(2)
        fw(zdif)
    end
    if y1 < y then
        dn(ydif)
    else
        up(ydif)
    end
end

function checkList()
    tru, data, meta = turtle.inspect()
    if tru then
        if not list(data.name) then
            return true
        end
    end
    return false
end

function checkListUp()
    tru, data, meta = turtle.inspectUp()
    if tru then
        if not list(data.name) then
            return true
        end
    end
    return false
end

function checkListDn()
    tru, data, meta = turtle.inspectDown()
    if tru then
        if not list(data.name) then
            return true
        end
    end
    return false
end

function list(name)
    if name == "minecraft:stone" then
        return true;
    elseif name == "minecraft:dirt" then
        return true;
    elseif name == "minecraft:diorite" then
        return true;
    elseif name == "minecraft:granite" then
        return true;
    end
    return false;
end

function vein(type)
    for i = 0, 3 do
        if checkList() then
            fw(1)
            vein(0)
            bk(1)
        end
        tr(1)
    end
    if type == 0 then
        if checkListUp() then
            up(1)
            vein(0)
            dn(1)
        end
        if checkListDn() then
            dn(1)
            vein(0)
            up(1)
        end
    end
end

function quarry(x1, z1)
    while y > 5 do
        dn(1)
        vein(1)
    end
end