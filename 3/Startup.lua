os.loadAPI("network.lua")
os.loadAPI("move.lua")

function readXYZ()
    h = fs.open("XYZ", "r")
    x = tonumber(h.readLine())
    y = tonumber(h.readLine())
    z = tonumber(h.readLine())
    dir = tonumber(h.readLine())
    network.update(x, y, z)
    move.setXYZ(x, y, z)
    move.setDir(dir)
end

readXYZ()

network.getJob()

os.run({}, "Job.lua")