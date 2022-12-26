function base64Decode(str)
  
  local padding = #str - (#str / 4) * 4   -- handle the length of the input string if it is not a multiple of 4
  str = string.sub(str, 1, #str - padding)

  local bytes = {}

  for i = 1, #str, 4 do
    local group = string.sub(str, i, i + 3)
    local decimalValue = 0

    for j = 1, #group do
      local character = string.sub(group, j, j)
      local value = string.find("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", character) - 1
      decimalValue = (decimalValue * 64) + value
    end

      -- represent the bytes of the original data after it has been decoded from the base64 string
    
    local b1 = math.floor(decimalValue / (256 * 256))
    local b2 = math.floor((decimalValue - (b1 * 256 * 256)) / 256)
    local b3 = decimalValue % 256

    table.insert(bytes, string.char(b1))
    table.insert(bytes, string.char(b2))
    table.insert(bytes, string.char(b3))
  end

  return table.concat(bytes)
end

local str = ""  -- insert your b64 encoded string here
local decoded = base64Decode(str)
print(decoded)
