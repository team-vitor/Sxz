--// Note: Wind UI Remake (Sxz Edition)

local Library = {}
Library.__index = Library
Library.Async = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local UI = Library.Async --// Shortened

Library.Window = nil

function Library:Setup()
	local version = (typeof(LRM_ScriptVersion) == "string" and "v" .. table.concat(LRM_ScriptVersion:split(""), "."))
		or "Dev Version"

	self.Window = UI:CreateWindow({
		Title = "Sxz Hub",
		Icon = "rbxassetid://",
		Author = ((premium and "Premium") or "Grow a Garden") .. " | " .. version,
		Folder = "Sxz",
		Size = UDim2.fromOffset(580, 460),
		Transparent = true,
		Theme = "Dark",
		Resizable = true,
		SideBarWidth = 200,
		Background = "",
		BackgroundImageTransparency = 0.42,
		HideSearchBar = true,
		ScrollBarEnabled = false,
		User = {
			Enabled = true,
			Anonymous = false,
			Callback = function()
				print("clicked")
			end,
		},
	})

	return self.Window
end

function Library:CreateTab(Name, Icon)
	local window = self.Window or self:Setup()
	if not window then
		error("[Sxz Library]: Failed to create/find Window")
		return
	end

	local Tab = window:Tab({
		Title = Name,
		Icon = Icon,
		Locked = false,
	})

	return Tab
end

function Library:CreateSection(Tab, Title, Size)
	return Tab:Section({
		Title = Title,
		TextXAlignment = "Left",
		TextSize = Size or 17,
	})
end

function Library:CreateToggle(Tab, Table)
	return Tab:Toggle(Table)
end

function Library:CreateButton(Tab, Table)
	return Tab:Button(Table)
end

function Library:CreateSlider(Tab, Table)
	return Tab:Slider(Table)
end

function Library:CreateDropdown(Tab, Table)
	return Tab:Dropdown(Table)
end

function Library:CreateInput(Tab, Table)
	return Tab:Input(Table)
end

--// Special Setups
function Library:SetupAboutUs(AboutUs)
	local window = self.Window or self:Setup()
	if not window then
		error("[Sxz Library]: Failed to create/find Window")
		return
	end

	AboutUs:Paragraph({
		Title = "Discord Invites",
		Icon = "discord",
		Desc = "Join our communities for updates and support!",
	})

	AboutUs:Button({
		Title = "Discord Link (Click to Copy)",
		Icon = "link",
		Callback = function()
			if setclipboard then
				setclipboard("discord.gg/SxzHub")
				if Library.Notify then
					Library:Notify({ Title = "Copied!", Content = "Discord link copied!", Duration = 3 })
				end
			end
		end,
	})
end

return Library -- Sxz Edition
