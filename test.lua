for i, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "KeyUI" then
        v:Destroy()
    end
end

loadstring([[
	function LPH_NO_VIRTUALIZE(f) return f end;

	function LPH_JIT(f) return f end;

	function LPH_JIT_MAX(f) return f end;
]])();

function Notify1(va, va1)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Elgato Hub",
        Text = va,
        Icon = "",
        Duration = va1,
        Button1 = "Okay",
    })
end

function Notify(va)
    Notify1(va, 5)
end

local ServiceIdentifier = "elgatohub" or "(__YourServiceIdentifier__)"
local ServiceName = "Elgato Hub" or "(__YourServiceName__)"
local APIToken = "ayRrpaNybcnS27F8" or "(__YourAPIToken__)"
local KeyPrefix = "elgato_" or "(__YourKeyPrefix__)"
local KeyFileDirectory = "ELGATO HUB/SavedKey.txt" or "(__YourKeyFileDirectory__)"

local PandaAuth = (function()
    if true then
        local cloneref = cloneref or function(...) return ... end

        local service = setmetatable({}, {
            __index = function(self, key)
                return cloneref(game.GetService(game, key))
            end
        })

        local HttpService = service.HttpService

        local LibraryName = "VAL"

        local CachePath = "VALCache"

        if makefolder then
            makefolder(CachePath)
        end

        local URLSource = "https://raw.githubusercontent.com/Panda-Repositories/PandaKS_Libraries/main/library/LuaLib/ROBLOX/VAL"

        local Source = nil

        local response = game:HttpGet("https://api.github.com/repos/Panda-Repositories/PandaKS_Libraries/contents/library/LuaLib/ROBLOX/VAL")

        local CacheSource = function()
            Source = game:HttpGet(URLSource)

            if writefile then
                writefile(CachePath .. "/" .. LibraryName, HttpService:JSONEncode({
                    Source = Source;
                    Commit = response;
                }))
            end

            return loadstring(Source)()
        end

        if isfile then
            if isfile(CachePath .. "/" .. LibraryName) then
                if HttpService:JSONDecode(readfile(CachePath .. "/" .. LibraryName)).Commit == response then
                    Source = HttpService:JSONDecode(readfile(CachePath .. "/" .. LibraryName)).Source

                    Notify("Loaded Cache", LibraryName)

                    return loadstring(Source)()
                else
                    CacheSource()
                end
            else
                CacheSource()
            end
        else
            CacheSource()
        end
    end

    return loadstring(game:HttpGet("https://raw.githubusercontent.com/Panda-Repositories/PandaKS_Libraries/main/library/LuaLib/ROBLOX/VAL", true))()
end)()

local IndexCount = {}

local InternalValues =  setmetatable({ -- // Change
    Service = ("%s"):format(ServiceIdentifier);
    APIToken = ("%s"):format(APIToken);
    VigenereKey = tostring({}) .. tostring(function() end) .. tostring(workspace["GetServerTimeNow" .. ("\0"):rep(math.random(2, 32))](workspace) + math.random(os.clock(), 999999999 or os.time())) .. ("\0"):rep(math.random(2, 32));
    TrueEndpoint = tostring({}) .. tostring(function() end) .. tostring(workspace["GetServerTimeNow" .. ("\0"):rep(math.random(2, 32))](workspace) + math.random(os.clock(), 999999999 or os.time())) .. ("\0"):rep(math.random(2, 32));
    FalseEndpoint = tostring({}) .. tostring(function() end) .. tostring(workspace["GetServerTimeNow" .. ("\0"):rep(math.random(2, 32))](workspace) + math.random(os.clock(), 999999999 or os.time())) .. ("\0"):rep(math.random(2, 32));
    KickWebhook = nil;
    ValidWebhook = nil;
    InvalidWebhook = nil;
    Debug = false;
}, {
    __newindex = function(self, key, value)
        while true do end print(debug.traceback()) return
    end;
    __tostring = function(self)
        while true do end print(debug.traceback()) return
    end;
});

local InternalTable = setmetatable({}, {
    __index = function(self, key)
        IndexCount[key] = IndexCount[key] and IndexCount[key] + 1 or 1

        if IndexCount[key] > 1 then

        end

        return InternalValues[key]
    end;
    __newindex = function(self, key, value)
        while true do end print(debug.traceback()) return
    end;
    __tostring = function(self)
        while true do end print(debug.traceback()) return
    end;
})

local Internal = setmetatable({}, {
    __index = function(self, key)
        return InternalTable[key]
    end;
    __newindex = function(self, key, value)
        while true do end print(debug.traceback()) return
    end;
    __tostring = function(self)
        while true do end print(debug.traceback()) return
    end;
})

local SetInternal = PandaAuth.SetInternal;
PandaAuth:SetInternal(Internal)

local Directory = KeyFileDirectory

local FetchedInternal = PandaAuth:GetInternal()

local Crypt
local SHA256
local SyncTrue

if true then
    Crypt = FetchedInternal.Crypt

    SHA256 = Crypt:SHA256(Internal.TrueEndpoint, Internal.VigenereKey, nil, nil)

    SyncTrue = Crypt:EncryptC(SHA256, Internal.VigenereKey, nil)
end

local IteratedTables = {}

local ValueSpoofed; ValueSpoofed = function(val, tbl)
    local ret = nil

    for i = 1, #tbl do
        local v = tbl[i]

        if v == val then
            ret = true

            break
        elseif (
            pcall(function()
                return v[""]
            end)
            and not pcall(function()
                return v .. v
            end)
            ) and not IteratedTables[v] then
            IteratedTables[v] = true

            ret = ValueSpoofed(val, v)

            break
        end
    end

    IteratedTables = {}

    return ret
end

local function __CheckKey()
    local result = PandaAuth:ValidateKey(readfile(Directory))

    if ValueSpoofed(result["KEY"], {result, SHA256, SyncTrue})
        or ValueSpoofed(result["Encrypted"], {result, SHA256}) then
        while true do end do return end
    end

    local SanityCheck = (function(a1, a2)
        return pcall(function()
            return (
                (
                getmetatable(getfenv(a1)["getrenv\0"])["__newindex"]() == SetInternal
                and a1 ~= SetInternal
                and getmetatable(getfenv(select(2, PandaAuth:SetInternal(Internal)))["getrenv\0"])["__newindex"]() == SetInternal
                and PandaAuth:SetInternal(Internal) == SetInternal
                )
                and (
                getfenv(a2)["getrenv\0"][1] == getfenv(a2)["getrenv\0"][1]
                and getfenv(a2)["getrenv\0"][2]() == getfenv(a2)["getrenv\0"][1]
                and getfenv(a2)["getrenv\0"][3]() == getfenv(a2)["getrenv\0"][1]
                and getfenv(a2)["getrenv\0"][3][1] == getfenv(a2)["getrenv\0"][1]
                and getfenv(a2)["getrenv\0"][4] == getfenv(a2)["getrenv\0"][4]
                and (function()
                    getfenv(a2)["getrenv\0"][3][1] = "nil"

                    return true
                end)()
                and getfenv(a2)["getrenv\0"][5] == getfenv(a2)["getrenv\0"][1]
                and getfenv(getfenv(a2)["getrenv\0"][2])["getrenv\0"] == getmetatable(getfenv(a2)["getrenv\0"][3])
                )
                )
        end)
    end)

    if (function()
        local s, r = SanityCheck(PandaAuth.SetInternal, PandaAuth.ValidateKey)

        return s == true and r == true
    end)()
    and not (function()
        local s, r = SanityCheck(PandaAuth.GetInternal, PandaAuth.ValidateKey)

        return s == true and r == true
    end)() then
        if result
            and (
            (
            result["KEY"]
            and type(result["ENV"]) == type(getfenv(1))
            and result["Raw"] == Internal.TrueEndpoint
            and result["Encrypted"] == SyncTrue
            and result["Unencrypted"] == SHA256
            and type(result["Premium"]) == "boolean"
            and PandaAuth.Validated[1] == Internal.TrueEndpoint
            and PandaAuth.Validated[2] == true
            and (
            (
            getmetatable(result["Sanity"])
            and getfenv(getmetatable(result["Sanity"])(result["Encrypted"], result))[result["Encrypted"]]
            and result["Sanity"][result["Encrypted"]]
            and getfenv(result["Sanity"](result["Encrypted"], result))[result["Encrypted"]]
            and (function()
                local s, r = SanityCheck(result["Sanity"][result["Encrypted"]][1], result["Sanity"][result["Encrypted"]][2])

                return s == true and r == true
            end)()
            )
            )
            )
            or (
            result["Pre"]
            and type(result["ENV"]) == type(getfenv(1))
            and result["Raw"] == Internal.TrueEndpoint
            and PandaAuth.Validated[1] == Internal.TrueEndpoint
            and PandaAuth.Validated[2] == true
            )
            ) then
            writefile(Directory, result["KEY"])
            Notify("Key is Valid  -  " .. "Premium: " .. tostring(result["Premium"]))
            load1()
        elseif result
            and result["Raw"] == Internal.FalseEndpoint
            and PandaAuth.Validated[1] == Internal.FalseEndpoint
            and PandaAuth.Validated[2] == false then
            Notify("Key is Invalid")
            delfile(Directory)
            Load_Ui()
            return false
        else
            while true do end do return end
        end
    else
        while true do end do return end
    end

end

local function Load_Ui()
local everyClipboard = setclipboard or toclipboard or set_clipboard or setrbxclipboard or (Clipboard and Clipboard.set)
local UserInputService = game:GetService("UserInputService")

    pcall(function()
        OldInstance:Destroy()
    end)

    local KeyUI = Instance.new("ScreenGui")
    KeyUI.Name = "KeyUI"
    KeyUI.Parent = game.CoreGui
    KeyUI.ZIndexBehavior = Enum.ZIndexBehavior.Global

    if gethui then
        KeyUI.Parent = gethui()
    elseif syn.protect_gui then
        syn.protect_gui(KeyUI)
        KeyUI.Parent = CoreGui
    else
        KeyUI.Parent = CoreGui
    end

    getgenv().OldInstance = KeyUI

    local function MakeDraggable(gui)
        local dragging
        local dragInput
        local dragStart
        local startPos
        local function update(input)
            local delta = input.Position - dragStart
            gui.Position =
                UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
        gui.InputBegan:Connect(function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch
            then
                dragging = true
                dragStart = input.Position
                startPos = gui.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        gui.InputChanged:Connect(function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement
                or input.UserInputType == Enum.UserInputType.Touch
            then
                dragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                update(input)
            end
        end)
    end
    

local function RainbowColor(Name, Parent)
    local Name = Instance.new("UIGradient")
    Name.Parent = Parent
    local function rainbowColor(hue)
        return Color3.fromHSV(hue % 1, 1, 1)
    end
    local hue = 0
    local RunService = game:GetService("RunService")
    RunService.RenderStepped:Connect(function()
        hue = hue - 0.005
        Name.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, rainbowColor(hue)),
            ColorSequenceKeypoint.new(0.2, rainbowColor(hue + 0.1)),
            ColorSequenceKeypoint.new(0.4, rainbowColor(hue + 0.2)),
            ColorSequenceKeypoint.new(0.6, rainbowColor(hue + 0.3)),
            ColorSequenceKeypoint.new(0.8, rainbowColor(hue + 0.4)),
            ColorSequenceKeypoint.new(1, rainbowColor(hue + 0.5))
        }
    end)
end

-- Create the Background Frame
local BackgroundFrame = Instance.new("Frame")
BackgroundFrame.Parent = KeyUI
BackgroundFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40) -- Dark background color
BackgroundFrame.Position = UDim2.new(0.5, -120, 0.4, -35) -- Centered with padding
BackgroundFrame.Size = UDim2.new(0, 240, 0, 120) -- Adjust size to cover all elements
--BackgroundFrame.BackgroundTransparency = 0.5 -- Slight transparency
local UICorner = Instance.new("UICorner")
UICorner.Parent = BackgroundFrame

MakeDraggable(BackgroundFrame)

-- Create the TextBox
local TextBox = Instance.new("TextBox")
TextBox.Parent = BackgroundFrame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Position = UDim2.new(0.5, -100, 0.2, 0)
TextBox.Size = UDim2.new(0, 200, 0, 30)
TextBox.Font = Enum.Font.FredokaOne
TextBox.PlaceholderText = "Enter your key here"
TextBox.Text = ""
TextBox.TextSize = 12
TextBox.TextWrapped = true

-- Create the TextLabel
local TextLabel = Instance.new("TextLabel")
TextLabel.Parent = BackgroundFrame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1 -- Make background transparent
TextLabel.Position = UDim2.new(0.5, -100, 0.2, -27) -- Same X as TextBox, higher Y position
TextLabel.Size = UDim2.new(0, 200, 0, 30)
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "ELGATO HUB KEY SYSTEM"
TextLabel.TextSize = 14
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextWrapped = true

RainbowColor(TextLabel, TextLabel)

-- Create the Check Key button
local CheckKeyButton = Instance.new("TextButton")
CheckKeyButton.Parent = BackgroundFrame
CheckKeyButton.BackgroundColor3 = Color3.fromRGB(0, 122, 204)
CheckKeyButton.Size = UDim2.new(0, 90, 0, 30)
CheckKeyButton.Font = Enum.Font.FredokaOne
CheckKeyButton.Text = "Check Key"
CheckKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckKeyButton.TextSize = 14
CheckKeyButton.MouseButton1Click:Connect(function()
    local result = PandaAuth:ValidateKey(TextBox.text)

if ValueSpoofed(result["KEY"], {result, SHA256, SyncTrue})
    or ValueSpoofed(result["Encrypted"], {result, SHA256}) then
    while true do end do return end
end

local SanityCheck = (function(a1, a2)
    return pcall(function()
        return (
            (
            getmetatable(getfenv(a1)["getrenv\0"])["__newindex"]() == SetInternal
            and a1 ~= SetInternal
            and getmetatable(getfenv(select(2, PandaAuth:SetInternal(Internal)))["getrenv\0"])["__newindex"]() == SetInternal
            and PandaAuth:SetInternal(Internal) == SetInternal
            )
            and (
            getfenv(a2)["getrenv\0"][1] == getfenv(a2)["getrenv\0"][1]
            and getfenv(a2)["getrenv\0"][2]() == getfenv(a2)["getrenv\0"][1]
            and getfenv(a2)["getrenv\0"][3]() == getfenv(a2)["getrenv\0"][1]
            and getfenv(a2)["getrenv\0"][3][1] == getfenv(a2)["getrenv\0"][1]
            and getfenv(a2)["getrenv\0"][4] == getfenv(a2)["getrenv\0"][4]
            and (function()
                getfenv(a2)["getrenv\0"][3][1] = "nil"

                return true
            end)()
            and getfenv(a2)["getrenv\0"][5] == getfenv(a2)["getrenv\0"][1]
            and getfenv(getfenv(a2)["getrenv\0"][2])["getrenv\0"] == getmetatable(getfenv(a2)["getrenv\0"][3])
            )
            )
    end)
end)

if (function()
    local s, r = SanityCheck(PandaAuth.SetInternal, PandaAuth.ValidateKey)

    return s == true and r == true
end)()
and not (function()
    local s, r = SanityCheck(PandaAuth.GetInternal, PandaAuth.ValidateKey)

    return s == true and r == true
end)() then
    if result
        and (
        (
        result["KEY"]
        and type(result["ENV"]) == type(getfenv(1))
        and result["Raw"] == Internal.TrueEndpoint
        and result["Encrypted"] == SyncTrue
        and result["Unencrypted"] == SHA256
        and type(result["Premium"]) == "boolean"
        and PandaAuth.Validated[1] == Internal.TrueEndpoint
        and PandaAuth.Validated[2] == true
        and (
        (
        getmetatable(result["Sanity"])
        and getfenv(getmetatable(result["Sanity"])(result["Encrypted"], result))[result["Encrypted"]]
        and result["Sanity"][result["Encrypted"]]
        and getfenv(result["Sanity"](result["Encrypted"], result))[result["Encrypted"]]
        and (function()
            local s, r = SanityCheck(result["Sanity"][result["Encrypted"]][1], result["Sanity"][result["Encrypted"]][2])

            return s == true and r == true
        end)()
        )
        )
        )
        or (
        result["Pre"]
        and type(result["ENV"]) == type(getfenv(1))
        and result["Raw"] == Internal.TrueEndpoint
        and PandaAuth.Validated[1] == Internal.TrueEndpoint
        and PandaAuth.Validated[2] == true
        )
        ) then
        writefile(Directory, result["KEY"])
        Notify("Key is Valid  -  " .. "Premium: " .. tostring(result["Premium"]))
        KeyUI:Destroy()
        load1()
    elseif result
        and result["Raw"] == Internal.FalseEndpoint
        and PandaAuth.Validated[1] == Internal.FalseEndpoint
        and PandaAuth.Validated[2] == false then
        Notify("Key is Invalid")
        return false
    else
        while true do end do return end
    end
else
    while true do end do return end
end

end)

-- Create the Get Key button
local GetKeyButton = Instance.new("TextButton")
GetKeyButton.Parent = BackgroundFrame
GetKeyButton.BackgroundColor3 = Color3.fromRGB(0, 122, 204)
GetKeyButton.Size = UDim2.new(0, 90, 0, 30)
GetKeyButton.Font = Enum.Font.FredokaOne
GetKeyButton.Text = "Get Key"
GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyButton.TextSize = 14
GetKeyButton.MouseButton1Click:Connect(function()
    everyClipboard(PandaAuth:GetKey())
    TextBox.Text = tostring(PandaAuth:GetKey())
    Notify("Copy successful.")
end)

local ImageButton = Instance.new("ImageButton")
ImageButton.Parent = BackgroundFrame
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.Position = UDim2.new(0.5, -12.5, 0.6, -12.5)
ImageButton.Size = UDim2.new(0, 25, 0, 25)
ImageButton.Image = "http://www.roblox.com/asset/?id=137811068969636"
ImageButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
local StarterGui = game:GetService("StarterGui")
local bindable = Instance.new("BindableFunction")

bindable.OnInvoke = function(response)
    if response == "Close Gui" then
        KeyUI:Destroy()
    elseif response == "Discord" then
        Notify("Copy successful.")
        everyClipboard("https://discord.gg/UrkE64Mfb7")
    end
end

ImageButton.MouseButton1Click:Connect(function()
    StarterGui:SetCore("SendNotification", {
        Title = "Elgato Hub",
        Text = "Please choose!",
        Duration = 15,
        Callback = bindable,
        Button1 = "Discord",
        Button2 = "Close Gui"
    })
end)

local UICorner = Instance.new("UICorner")
UICorner.Parent = GetKeyButton

local UICorner = Instance.new("UICorner")
UICorner.Parent = CheckKeyButton

local UICorner = Instance.new("UICorner")
UICorner.Parent = TextBox

local UICorner = Instance.new("UICorner")
UICorner.Parent = ImageButton

CheckKeyButton.Position = UDim2.new(0.5, 15, 0.6, -15)
GetKeyButton.Position = UDim2.new(0.5, -105, 0.6, -15)
end

if isfile(Directory) then
    __CheckKey()
    else
    Load_Ui()
end
