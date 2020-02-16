rednet.open("left")
monitor = peripheral.wrap("right")
monitor.clear()

turtles = {}
index = 0

function sortTurtles(msg)
    bool = false;

    for index, value in pairs(turtles) do
        if value == bool then
            bool = true
        end
    end

    if not bool then
        table.insert(turtles, {})
        index = index + 1
        turtles[index] = {id, msg[4]}
    end
end

function getTurtle()
    for index, value in pairs(turtles) do
        if value[2] == "Idle" then
            return value[1]
        end
    end
end

function getIndex(id)
    i = 1
    for index, value in pairs(turtles) do
        if value[1] == id then
            return i
        end
        i = i + 1
    end
end

while true do
    id, msg, prot = rednet.receive()

    sortTurtles(msg)

    if prot == "update" then
        monitor.setCursorPos(1, getIndex(id))
        monitor.clearLine()
        monitor.write(id.." is at: "..msg[1].." "..msg[2].." "..msg[3].." and is: "..msg[4])
    end

    if prot == "jobReq" then
        print("Job request received")
        local temp = getTurtle()
        print("Checked turtles")
        if type(temp) == "number" then
            print("Turtle "..temp.." being sent job")
            rednet.send(temp, msg, "job")
        else
            print("no turtles avaliable")
        end
    end
end
