module("device",package.seeeall)

-- Device Api

-- Bulk Device Operation
-- (not yet)
function bulkDeviceOperation(fa, iotName, id, auth)
    local body = '{id:"'..id..'"}'
    local b,c,h = fa.request{url="https://"..iotName..".azure-devices.net/devices?api-version=2016-11-14",
        method  = "POST",
        headers = {["Authorization"]  = auth,
                   ["Content-Length"] = body:len(),
                   ["Content-Type"]   = "application/json"
        },
        body = body
    }
    return b
end

-- Delete Device
function deleteDevice(fa, iotName, id, auth)
    local b,c,h = fa.request{url="https://"..iotName..".azure-devices.net/devices/"..id.."?api-version=2016-11-14",
        method = "DELETE",
        headers = {["Authorization"] = auth,
                   ["Content-Type"]  = "application/json",
                   ["If-Match"]      = "*"
        }
    }
    return b
end

-- Get Device
function getDevice(fa, iotName, id, auth)
    local body = '{deviceId:"'..id..'"}'
    local b,c,h = fa.request{url="https://"..iotName..".azure-devices.net/devices/"..id.."?api-version=2016-11-14",
        method = "GET",
        headers = {["Authorization"] = auth,
                   ["Content-Type"]  = "application/json"
        },
        body = body
    }
    return b
end

-- Get Devices
function getDevices(fa, iotName, auth)
    local b,c,h = fa.request{url="https://"..iotName..".azure-devices.net/devices?api-version=2016-11-14",
        method = "GET",
        headers = {["Authorization"] = auth,
                   ["Content-Type"]  = "application/json"
        }
    }
    return b
end

-- Get Registry Statistics

-- Get Service Statistic

-- Purge Command Queue

-- Put Device
function putDevice(fa, iotName, id, auth)
    local body = '{deviceId:"'..id..'"}'
    local b,c,h = fa.request{url="https://"..iotName..".azure-devices.net/devices/"..id.."?api-version=2016-11-14",
        method = "PUT",
        headers = {["Authorization"] = auth,
                   ["Content-Length"] = body:len(),
                   ["Content-Type"]  = "application/json"
        },
        body = body
    }
    return b
end

-- Query Devices

