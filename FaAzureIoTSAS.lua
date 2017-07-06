module("sas",package.seeeall)

-- create SAS
function create(fa, resourceUri, signingKey, expires, policy)
    local toSign = resourceUri:urlencode() .. "\n" .. expires
    local hex = fa.hash("hmac-sha256", toSign, signingKey:base64decode())
    local hmac = hex:fromhex()
    return "SharedAccessSignature sr="..resourceUri.."&sig="..hmac:base64encode():urlencode().."&se="..expires.."&skn="..policy
end

