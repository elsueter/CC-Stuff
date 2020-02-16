status = "Idle"
rednet.open("left")

function update(x, y, z)
    msg = {x, y, z, status}
    rednet.broadcast(msg, "update")
end

function updateStatus(stat)
    status = stat
end

function getJob()
    id, msg, prot = rednet.receive("job")
    str = textutils.unserialise(msg)
    h = fs.open("Job.lua", "w")
    h.write(str)
    h.close()
end