module("httpRuntime",package.seeeall)

-- Http Runtime Api

-- Send Device Event
function sendDeviceEvent(fa, iotName, id, auth, body)
    local b,c,h = fa.request{url="https://"..iotName..".azure-devices.net/devices/"..id.."/messages/events?api-version=2016-11-14",
        method = "POST",
        headers = {["Authorization"]  = auth,
                   ["Content-Length"] = body:len(),
                   ["Content-Type"]   = "application/json"
        },
        body = body
    }
    return b
end
