module("deviceTwin",package.seeeall)

-- Device Twin Api

-- Get Device
function getDeviceTwin(fa, iotName, id, auth)
    local b,c,h = fa.request{url="https://"..iotName..".azure-devices.net/twins/"..id.."?api-version=2016-11-14",
        method = "GET",
        headers = {["Authorization"] = auth,
                   ["Content-Type"]  = "application/json"
        }
    }
    return b
end

-- Invoke Device Method

-- Update Device Twin
function updateDeviceTwin(fa, iotName, id, auth, body)
    local b,c,h = fa.request{url="https://"..iotName..".azure-devices.net/twins/"..id.."?api-version=2016-11-14",
        method = "PATCH",
        headers = {["Authorization"]  = auth,
                   ["Content-Length"] = body:len(),
                   ["Content-Type"]   = "application/json"
        },
        body = body
    }
    return b
end
