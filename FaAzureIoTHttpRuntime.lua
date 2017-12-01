module("httpRuntime",package.seeeall)

-- Http Runtime Api

-- Receive Device Bound Notification
function receiveDeviceBoundNotification(fa, iotName, id, auth)
    local b,c,h = fa.request{url="https://"..iotName..".azure-devices.net/devices/"..id.."/messages/deviceBound?api-version=2016-11-14",
        method = "GET",
        headers = {["Authorization"]  = auth,
                   ["Content-Length"] = body:len(),
                   ["Content-Type"]   = "application/json"
        }
    }
    return b
end

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
