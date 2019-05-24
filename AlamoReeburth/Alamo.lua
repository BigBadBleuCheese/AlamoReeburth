local localizedClass, englishClass, classIndex = UnitClass('player')
if englishClass == 'DRUID' then
	if Settings == nil then
		Settings = {
			Enabled = true,
			Chance = 5,
			ChatType = 'SAY'
		}
	end

	local Messages = {
		Caster = {
			"DURIDS IS VEERY FAST AND STORNG IN PVP CAN CAST ROOT 4 MAKE PEEPS STOP WHEN MOVE!!",
			"Maybe B4 durids was week & stuff but now Durids is very storng.",
			"DURIDS IS 4 haf FUN TIME WIT FRENS",
			"every1 is like a fun time durid!!",
			"Durids is storng for bare or cat or seel or WHATVER",
			"DURIDS IS ALWAYS FRENDS, SO PLAY NISE, OK?"
		},

		Bear = {
			"OK, Sum durids is bare. Tehm whos bare durids, can B 4 tank.",
			"Tehm whos bare durids, can B 4 tank.",
			"Man, sum bare druids can maek sum peeps poop in feer bc/ tehms so storng.",
			"A bare durid haf many armors & when a thing hits durid, maybe thing gets borken hand LOL!",
			"Bare durids is 4 funs when u can charje & stun & haf sum armors lol.",
			"ONE THING NOW IS BARES IS CAN DUNCE! DUN DUN DUN! LOL!",
			"IS YOU LIEK A NISE HOT CUP O MANGEL?"
		},

		Cat = {
			"when cat durid is FITE do not ask for HEEL and NINIRVATE!",
			"I AM TELLS U B4: STORNG CAT DURID IS HAF NO NINERVATE OK!!! DRINK A POT NOOB LOL!!",	
			"Is a cat durid for eat sum1's hed & stuff? OMG YES LOL!",
			"OK now sum durid is cat. Cat durid, tehm dosent heel.  Cat uis for fite.",
			"CAT DURIDS is no spam moonfare! Sum cat durids dosent no wut is uh moonfare!",
			"CAT DURID IS NOT SPEEK MOONFARE!",
			"cat durids is life on MANE street LOL!",
			"cat durids is love some mangel!"
		},

		Travel = {
			"dont \"cheet\" or u get bann LOL! JK!!",
			"Cheetuh can run fast and him is can run away frum trubul."
		},

		Aquatic = {
			"Seel is can fite, but is kind week.",
			"Seel for swim, is fast & dont breeth.",
			"When seel is gone for fish, is nobody will catch.",
			"Seel is can teech frends how is swim. FREE SWIMIN LESSINS LOL!"
		},

		Flight = {
			"STORMCROW IS LIKE SHINY THING AND PECK AT EYES!",
			"B4 DURIDS IS CANT FLY, BUT NOW CAN EVEN POOP ON HEDS OF PEEPS LOL!"
		},

		Moonkin = {
			"Moonkins is look all funny liek maybe form MOON! LOL!",
			"mostly uh moonkin is 4 a spam moonfare",
			"Moonkin haf sum good armors & fite storng."
		},

		Tree = {
			"TREE DURIDS IS HEEL, BUT DOSENT RUN! IS OK, DURID IS CAN HAF FAST RUN ANYWAY",
			"TREE DURID IS MAKE STORNG HOT! ONLY DONT GIT 2 CLOSE 2 FIRES LOL!",
			"MAYBE U NO SEUM PEEPS WHO IS DONT UNDERSTAND TREE DURID! U CAN TELL THEM SUMTHING SILLY!",
			"I HEER IN XPAC SOME DRUIDS IS TREE!"
		}
	}

	local DruidForms = {
		Bear = 5487,
		Cat = 768,
		Travel = 783,
		Aquatic = 784,
		Flight = 785,
		Moonkin = 24858,
		Tree = 114282
	}

	local BalanceAffinityMoonkin = 197625
	local IncarnationTreeOfLife = 33891
	local StagForm = 210053

	local CurrentForm = nil
	local CurrentIncarnationTreeOfLifeActive = false
	local ToSpeakOnNextUpdate = nil
	local WaitToSpeakOnNextUpdateUntil = nil
	local index = GetShapeshiftForm()
	if index > 0 then
		local texture, name, isActive, isCastable, spellID = GetShapeshiftFormInfo(index)
		if spellID then
			CurrentForm = spellID
		end
	end

	local function Speak(spellID)
		local messageTable
		if spellID then
			for druidFormsKey, druidFormsValue in pairs(DruidForms) do
				if spellID == druidFormsValue then
					messageTable = Messages[druidFormsKey]
					break
				end
			end
		else
			messageTable = Messages.Caster
		end
		local message = messageTable[math.random(#messageTable)]
		if Settings.ChatType == 'PRIVATE' then
			print(message)
		else
			SendChatMessage(message, Settings.ChatType)
		end
	end

	local function RollToSpeak(spellID)
		if Settings.Enabled and math.random(100) <= Settings.Chance then
			ToSpeakOnNextUpdate = spellID
			WaitToSpeakOnNextUpdateUntil = GetTime() + 0.5
		end
	end

	local function ChangedForm()
		local texture, isActive, isCastable, spellID
		local index = GetShapeshiftForm()
		if index > 0 then
			texture, isActive, isCastable, spellID = GetShapeshiftFormInfo(index)
			if spellID == DruidForms.Travel then
				if IsSwimming() then
					spellID = DruidForms.Aquatic
				elseif IsFlyableArea() then
					spellID = DruidForms.Flight
				end
			elseif spellID == StagForm then
				spellID = DruidForms.Travel
			elseif spellID == BalanceAffinityMoonkin then
				spellID = DruidForms.Moonkin
			end
		end
		if CurrentForm ~= spellID then
			if CurrentIncarnationTreeOfLifeActive then
				RollToSpeak(DruidForms.Tree)
				CurrentForm = spellID
			else
				local validSpellID = not spellID
				if not validSpellID then
					for druidFormsKey, druidFormsValue in pairs(DruidForms) do
						if spellID == druidFormsValue then
							validSpellID = true
							break
						end
					end
				end
				if validSpellID then
					RollToSpeak(spellID)
					CurrentForm = spellID
				end
			end
		end
	end

	local function IsIncarnationTreeOfLifeActive()
		local buffIndex = 1
		local name, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId = UnitBuff('player', buffIndex)
		while name do
			if spellId == IncarnationTreeOfLife then
				return true
			end
			buffIndex = buffIndex + 1
			name, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId = UnitBuff('player', buffIndex)
		end
		return false
	end

	local function ShowHelp()
		print('Alamo Reeburth, by CodeBleu')
		print('Commands:')
		print('/alamo [on|off] - Turns Alamo on or off')
		print('/alamo chance - Gets/sets the chance that Alamo will speak when you shapeshift')
		print('/alamo chat - Gets/sets the chat Alamo will speak in')
		print('/alamo force - Makes Alamo speak now')
	end

	local AlamoFrame = CreateFrame('Frame')
	AlamoFrame:RegisterEvent('UNIT_AURA')
	AlamoFrame:RegisterEvent('UPDATE_SHAPESHIFT_FORM')
	AlamoFrame:SetScript('OnEvent', function(self, event, ...)
		if event == 'UNIT_AURA' then
			local unitID = ...
			if unitID == 'player' then
				local incarnationTreeOfLifeActive = IsIncarnationTreeOfLifeActive()
				if incarnationTreeOfLifeActive ~= CurrentIncarnationTreeOfLifeActive then
					if incarnationTreeOfLifeActive then
						RollToSpeak(DruidForms.Tree)
					else
						RollToSpeak(CurrentForm)
					end
					CurrentIncarnationTreeOfLifeActive = incarnationTreeOfLifeActive
				end
			end
		elseif event == 'UPDATE_SHAPESHIFT_FORM' then
			ChangedForm()
		end
	end)
	AlamoFrame:SetScript('OnUpdate', function()
		if WaitToSpeakOnNextUpdateUntil and GetTime() >= WaitToSpeakOnNextUpdateUntil then
			Speak(ToSpeakOnNextUpdate)
			WaitToSpeakOnNextUpdateUntil = nil
		end
	end)

	SLASH_ALAMO1 = '/alamo';
	function SlashCmdList.ALAMO(msg, editbox)
		if msg == nil or msg == '' then
			ShowHelp()
		else
			local command, arguments = msg:match("^(%S*)%s*(.-)$")
			if command == 'help' then
				ShowHelp()
			elseif command == 'force' then
				if CurrentIncarnationTreeOfLifeActive then
					Speak(DruidForms.Tree)
				else
					Speak(CurrentForm)
				end
			elseif command == 'on' then
				if Settings.Enabled then
					print('Alamo is already on with a ' .. Settings.Chance .. '% chance to speak when you shapeshift.')
				else
					Settings.Enabled = true
					print('Alamo is now on with a ' .. Settings.Chance .. '% chance to speak when you shapeshift.')
				end
			elseif command == 'off' then
				if Settings.Enabled then
					Settings.Enabled = false
					print('Alamo is now off.')
				else
					print('Alamo is already off.')
				end
			elseif command == 'chance' then
				if arguments == nil or arguments == '' then
					if Settings.Enabled then
						print('Alamo has a ' .. Settings.Chance .. '% chance to speak when you shapeshift.')
					else
						print('Alamo will have a ' .. Settings.Chance .. '% chance to speak when you shapeshift if you enable it.')
					end
				else
					local newChance = tonumber(arguments)
					if newChance ~= nil then
						if newChance >= 0 and newChance <= 100 then
							Settings.Chance = newChance
							if Settings.Enabled then
								print('Alamo now has a ' .. newChance .. '% chance to speak when you shapeshift.')
							else
								print('Alamo will now have a ' .. newChance .. '% chance to speak when you shapeshift if you enable it.')
							end
						else
							print('The announcement chance must be between 0 and 100 (inclusive).')
						end
					else
						print('The announcement chance must be a number.')
					end
				end
			elseif command == 'chat' or command == 'chattype' then
				if arguments == nil or arguments == '' then
					print("Alamo's current chat is " .. Settings.ChatType .. '. You can choose GUILD, INSTANCE_CHAT, OFFICER, PARTY, PRIVATE, RAID, RAID_WARNING, SAY, WHISPER, or YELL.')
				else
					local newChatType = string.upper(arguments)
					if newChatType == 'GUILD' or newChatType == 'INSTANCE_CHAT' or newChatType == 'OFFICER' or newChatType == 'PARTY' or newChatType == 'PRIVATE' or newChatType == 'RAID' or newChatType == 'RAID_WARNING' or newChatType == 'SAY' or newChatType == 'WHISPER' or newChatType == 'YELL' then
						Settings.ChatType = newChatType
						print("Alamo's chat is now " .. Settings.ChatType .. '.')
					else
						print('That is not an acceptable chat type.');
					end
				end
			else
				print("Alamo doesn't understand what you mean.");
			end
		end
	end

	-- Create Alamo options tab in Interface->Addons
	local AlamoOptions = CreateFrame('Frame', nil, InterfaceOptionsFramePanelContainer)
	local title = AlamoOptions:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	local enableButton = CreateFrame('CheckButton', "AlamoOptionsCheck", AlamoOptions, "InterfaceOptionsCheckButtonTemplate")
	local chanceSlider = CreateFrame('SLIDER', "AlamoOptionsSlider", AlamoOptions, "OptionsSliderTemplate")
	local chatDropdown = CreateFrame("Frame", "AlamoOptionsChatDropdown", AlamoOptions, "UIDropDownMenuTemplate")

	local function CheckboxOnClick(self)
		Settings.Enabled = self:GetChecked()
		PlaySound(Settings.Enabled and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF)
		self:SetChecked(Settings.Enabled)
	end
	
	local function CheckBoxOnShow(self)
		self:SetChecked(Settings.Enabled)
	end

	local function SliderOnShow(self)
		chanceSlider:SetValue(Settings.Chance)
	end
	
	local function SliderOnChange(self)
		Settings.Chance = self:GetValue()
	end

	AlamoOptions:Hide()
	AlamoOptions:SetAllPoints()
	AlamoOptions.name = "Alamo Reeburth"

	title:SetPoint("TOPLEFT", 16, -16)
	title:SetText(AlamoOptions.name)
	InterfaceOptions_AddCategory(AlamoOptions, addonName)

	--Enable Checkbox--
	enableButton:SetScript('OnShow', CheckBoxOnShow)
	enableButton:SetScript('OnClick', CheckboxOnClick)
	getglobal(enableButton:GetName() .. 'Text'):SetText("Enable Alamo");
	enableButton.tooltipText = 'Enable Alamo Dialogue'
	enableButton:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -4)

	--Chance Slider--
	chanceSlider:SetScript('OnShow', SliderOnShow)
	chanceSlider:SetScript('OnValueChanged', SliderOnChange)
	chanceSlider:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -54)
	chanceSlider:SetMinMaxValues(1, 100)
	chanceSlider:SetValueStep(1)
	chanceSlider:SetObeyStepOnDrag(true)
	getglobal(chanceSlider:GetName() .. 'Text'): SetText("Chance to Speak")

	--chat channel dropdown--
	local chatDropdownLabel = AlamoOptions:CreateFontString(nil, 'ARTWORK', 'GameFontHighlightSmall')
	chatDropdownLabel:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -94)
	chatDropdownLabel:SetText("Chat Channel:")

	chatDropdown:SetPoint("TOPLEFT", chatDropdownLabel, "BOTTOMLEFT", -16, -4)
	local function ChatDropdown_OnClick(self, arg1, arg2, checked)
		Settings.ChatType = arg1
		UIDropDownMenu_SetText(chatDropdown, Settings.ChatType)
	end
	local function ChatDropdown_Menu(frame, level, menuList)
		local info = UIDropDownMenu_CreateInfo()
		info.func = ChatDropdown_OnClick
 		info.text, info.arg1 = "GUILD", "GUILD"
 		UIDropDownMenu_AddButton(info)
		info.text, info.arg1 = "INSTANCE_CHAT", "INSTANCE_CHAT"
		UIDropDownMenu_AddButton(info)
		info.text, info.arg1 = "OFFICER", "OFFICER"
		UIDropDownMenu_AddButton(info)
		info.text, info.arg1 = "PARTY", "PARTY"
		UIDropDownMenu_AddButton(info)
		info.text, info.arg1 = "PRIVATE", "PRIVATE"
		UIDropDownMenu_AddButton(info)
 		info.text, info.arg1 = "RAID", "RAID"
		UIDropDownMenu_AddButton(info)
		info.text, info.arg1 = "RAID_WARNING", "RAID_WARNING"
		UIDropDownMenu_AddButton(info)
		info.text, info.arg1 = "SAY", "SAY"
		UIDropDownMenu_AddButton(info)
		info.text, info.arg1 = "WHISPER", "WHISPER"
		UIDropDownMenu_AddButton(info)
		info.text, info.arg1 = "YELL", "YELL"
		UIDropDownMenu_AddButton(info)
	end
	local function DropdownOnShow(self)
		UIDropDownMenu_SetText(self, Settings.ChatType)
	end
	UIDropDownMenu_Initialize(chatDropdown, ChatDropdown_Menu)
	chatDropdown:SetScript('OnShow', DropdownOnShow)

else
	SLASH_ALAMO1 = '/alamo';
	function SlashCmdList.ALAMO(msg, editbox)
		print('Alamo is disabled; this is not a druid.')
	end
end