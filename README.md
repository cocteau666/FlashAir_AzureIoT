# FlashAir_AzureIoT
This library is for using AzureIoT from FlashAir.

Tested with W-04 with FlashAir_Timestamp.


API
====================
+ Device API (delete device, get device, get devices)
+ Device Twin API (get device twin)


How to use
====================
Write this lines in your Lua program.

    -- output header to exec as CGI
    print [[Content-Type: text/plain; charset=utf-8
    
    ]]
    
    -- require
    require "FaTimestamp"
    require "FaUtil"
    require "FaAzureIoTSAS"
    require "FaAzureIoTDevice"
    require "FaAzureIoTDeviceTwin"
    
    -- config
    -- iot hub name
    local iotName = "yourname"
    -- resource URI
    local resourceUri = "yourname.azure-devices.net"
    -- primary key
    local signingKey = "primary key"
    -- shared access policy
    local policy = "iothubowner"
    -- SAS expire time (second)
    local expire = 86400
    
    -- create SAS
    local timestamp = getTimestamp()
    local expires = timestamp + expire
    local auth = sas.create(fa, resourceUri, signingKey, expires, policy)
    
    -- get devices (show all devices)
    res = device.getDevices(fa, iotName, auth)
    print(res.."\n")
    
    -- get specific device twin (for example, id is "test123")
    res = deviceTwin.getDeviceTwin(fa, iotName, "test123", auth)
    print(res.."\n")


License
====================
Microsoft Public License

https://opensource.org/licenses/MS-PL

