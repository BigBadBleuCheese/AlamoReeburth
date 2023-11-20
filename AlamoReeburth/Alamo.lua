local _, _, classIndexx = UnitClass('player')
if classIndexx == 11 then
	local interfaceVersion = select(4, GetBuildInfo())
	local isClassic = interfaceVersion < 20000
	local isBCC = interfaceVersion >= 20000 and interfaceVersion < 30000
	local isWotLKC = interfaceVersion >= 30000 and interfaceVersion < 40000
	local isRetail = not (isClassic or isBCC or isWotLKC)

	if Settingss == nil then
		Settingss = {
			Enabled = true,
			Chance = 5,
			ChatType = 'DYNAMIC'
		}
	end

	local Messages = {
		Caster = {
			"DURIDS IS VEERY FAST AND STORNG IN PVP CAN CAST ROOT 4 MAKE PEEPS STOP WHEN MOVE!!",
			"Maybe B4 durids was week & stuff but now Durids is very storng.",
			"DURIDS IS 4 haf FUN TIME WIT FRENS",
			"every1 is like a fun time durid!!",
			"Durids is storng for bare or cat or seel or WHATVER",
			"DURIDS IS ALWAYS FRENDS, SO PLAY NISE, OK?",
			"DURIDS IS HARD, & BUT STRONG"
		},

		Bear = {
			"OK, Sum durids is bare. Tehm whos bare durids, can B 4 tank.",
			"Tehm whos bare durids, can B 4 tank.",
			"Man, sum bare druids can maek sum peeps poop in feer bc/ tehms so storng.",
			"A bare durid haf many armors & when a thing hits durid, maybe thing gets borken hand LOL!",
			"Bare durids is 4 funs when u can charje & stun & haf sum armors lol."
		},

		Cat = {
			"when cat durid is FITE do not ask for HEEL and NINIRVATE!",
			"I AM TELLS U B4: STORNG CAT DURID IS HAF NO NINERVATE OK!!! DRINK A POT NOOB LOL!!",	
			"Is a cat durid for eat sum1's hed & stuff? OMG YES LOL!",
			"OK now sum durid is cat. Cat durid, tehm dosent heel.  Cat uis for fite.",
			"CAT DURIDS is no spam moonfare! Sum cat durids dosent no wut is uh moonfare!",
			"CAT DURID IS NOT SPEEK MOONFARE!",
			"cat durids is life on MANE street LOL!"
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

	if isClassic then
		table.insert(Messages.Bear, "SUM PEEPLE THINK DURIDS IS CANT BE BARE AND CAN ONLY HEEL AND THEM DOSENT")
	end

	if not isClassic then
		table.insert(Messages.Bear, "ONE THING NOW IS BARES IS CAN DUNCE! DUN DUN DUN! LOL!")
		table.insert(Messages.Bear, "DUNCING BARES IS CAN MAKE HAPPY TIMES FOR UDDER FRENDS!")
		table.insert(Messages.Bear, "IS YOU LIEK A NISE HOT CUP O MANGEL?")
		table.insert(Messages.Bear, "NOW BARE DURIDS IS CAN TANK GOOD!")
		table.insert(Messages.Bear, "REMEMBERS- HEEL BARES DURID! BARE DURIDS IS STORNG FREND!")
		table.insert(Messages.Caster, "DURIDS IS ALSO VERY STORNG 4 PVP! BARES AND CATS FITE, MOONKIN MAKES MOON STUFF, AND SUM DURIDS IS 4 HEEL!")
		table.insert(Messages.Caster, "DON'T BE SCARED OF FITE, ONLY REMEMBER IMPORTANT DURID STUFF!")
		table.insert(Messages.Caster, "REMEMBER, DURIDS IS BEST!")
		table.insert(Messages.Caster, "WHEN U IS HAF SUM FUN, ALL DURIDS IS HAF SUM FUN WIT U!!")
		table.insert(Messages.Cat, "cat durids is love some mangel!")
	end

	if isBCC then
		table.insert(Messages.Caster, "now, in BURN CROOSAID, is many things new durids is can do, what wuzznt cood do B4!")
	end

	if isWotLKC or isRetail then
		table.insert(Messages.Moonkin, "But Crazed MOON DURID, is ok to make a kiss right on the ECLIPS!")
	end
	
	if isRetail then
		table.insert(Messages.Bear, "OK now a Bare, him like sum HEVY METAL! BARE GOTTA THRASH. Just liek a thing wares short and high top sneeker and shake long hare reeeely fast!")
		table.insert(Messages.Bear, "But also, ware sum plug in an ear wen you make this THRASH, becawse it make a thing bleed!")
		table.insert(Messages.Bear, "Also, all bare make peeple go fast when him RORE!! This is good, because a bare is deseptively fast. A Fast BARE, this is danjerus BARE!")
		table.insert(Messages.Bear, "Bare don't even allow in OLIMPIC, becawse wonse upon a time, a bare run a rase in OLIMPIC. Maybe he dosen't win, but everduddy win after, becawse a BARE EAT ALL OTHER RASE MEN!")
		table.insert(Messages.Bear, "Don't rase a hungry bare, is what sumbuddy shuld tell peeple.")
		table.insert(Messages.Caster, "So DURID gonna be so storng heer, maybe everbuddy gonna be a durid thees day!")
		table.insert(Messages.Cat, "They make a new thing, with CAT and KISS! But mostly CAT dont kiss, just jump on a thing and KILL IT ALL DEAD!")
		table.insert(Messages.Cat, "But dont only kiss a cat, because u know: CAT IS 4 FITE!")
	end

	local DruidForms = {
		Cat = 768,
		Travel = 783,
		Aquatic = 784,
		Flight = 785,
		Bear = 5487,
		DireBear = 9634,
		Moonkin = 24858,
		ClassicFlight = 33943,
		SwiftFlight = 40120,
		TreeOfLife = 48371,
		Treant = 114282
	}

	local DruidFormToMessages = {
		ClassicFlight = 'Flight',
		DireBear = 'Bear',
		SwiftFlight = 'Flight',
		Treant = 'Tree',
		TreeOfLife = 'Tree'
	}

	if not isRetail then
		DruidForms.Aquatic = 1066
	end

	local BalanceAffinityMoonkin = 197625
	local IncarnationTreeOfLife = 33891
	local StagForm = 210053

	local CurrentForm = nil
	local CurrentIncarnationTreeOfLifeActive = false
	local ToSpeakOnNextUpdate = nil
	local WaitToSpeakOnNextUpdateUntil = nil
	local indexx = GetShapeshiftForm()
	if indexx > 0 then
		local texture, name, isActive, isCastable, spellID = GetShapeshiftFormInfo(indexx)
		if spellID then
			CurrentForm = spellID
		end
	end

	local function Speak(spellID)
		local messageTable
		if spellID then
			local messageTableKey
			for druidFormsKey, druidFormsValue in pairs(DruidForms) do
				if spellID == druidFormsValue then
					messageTableKey = druidFormsKey
					break
				end
			end
			for druidFormToMessageKey, druidFormToMessageValue in pairs(DruidFormToMessages) do
				if messageTableKey == druidFormToMessageKey then
					messageTableKey = druidFormToMessageValue
					break
				end
			end
			messageTable = Messages[messageTableKey]
		else
			messageTable = Messages.Caster
		end
		local message = messageTable[math.random(#messageTable)]
		if Settingss.ChatType == 'SAY' or Settingss.ChatType == 'YELL' then
			print('Alamo: Blizzard no longer allows add-ons to send messages to SAY or YELL outdoors when not directly tied to a hardware event. I have changed your chat type to DYNAMIC for now. You can change it in Interface options.')
			Settingss.ChatType = 'DYNAMIC'
		end
		if Settingss.ChatType == 'EMOTE' then
			DoEmote(message)
		end
		if Settingss.ChatType == 'PRIVATE' then
			print(message)
		elseif Settingss.ChatType == 'DYNAMIC' then
			local inInstance, _ = IsInInstance()
			if inInstance then
				if message:find('!') then
					SendChatMessage(message, 'YELL')
				else
					SendChatMessage(message, 'SAY')
				end
			elseif UnitInBattleground("player") ~= nil then
				SendChatMessage(message, 'INSTANCE_CHAT')
			elseif IsInRaid(LE_PARTY_CATEGORY_HOME) or IsInRaid(LE_PARTY_CATEGORY_INSTANCE) then
				SendChatMessage(message, 'RAID')
			elseif IsInGroup(LE_PARTY_CATEGORY_HOME) or IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
				SendChatMessage(message, 'PARTY')
			else
				local guildName, _, _, _ = GetGuildInfo('player')
				if (guildName ~= nil) then
					SendChatMessage(message, 'GUILD')
				else
					print(message)
				end
			end
		else
			SendChatMessage(message, Settingss.ChatType)
		end
	end

	local function RollToSpeak(spellID)
		if Settingss.Enabled and math.random(100) <= Settingss.Chance then
			ToSpeakOnNextUpdate = spellID
			WaitToSpeakOnNextUpdateUntil = GetTime() + 0.5
		end
	end

	local function ChangedForm()
		local spellID
		local indexx = GetShapeshiftForm()
		if indexx > 0 then
			_, _, _, spellID = GetShapeshiftFormInfo(indexx)
			if spellID == DruidForms.DireBear then
				spellID = DruidForms.Bear
			elseif spellID == DruidForms.Travel and isRetail then
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
				RollToSpeak(DruidForms.TreeOfLife)
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
		local buffIndexx = 1
		local name, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId = UnitBuff('player', buffIndexx)
		while name do
			if spellId == IncarnationTreeOfLife then
				return true
			end
			buffIndexx = buffIndexx + 1
			name, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId = UnitBuff('player', buffIndexx)
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
	AlamoFrame:SetScript('OnEvent', function(__, event, ...)
		if event == 'UNIT_AURA' then
			local unitID = ...
			if unitID == 'player' then
				local incarnationTreeOfLifeActive = IsIncarnationTreeOfLifeActive()
				if incarnationTreeOfLifeActive ~= CurrentIncarnationTreeOfLifeActive then
					if incarnationTreeOfLifeActive then
						RollToSpeak(DruidForms.TreeOfLife)
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
					Speak(DruidForms.TreeOfLife)
				else
					Speak(CurrentForm)
				end
			elseif command == 'on' then
				if Settingss.Enabled then
					print('Alamo is already on with a ' .. Settingss.Chance .. '% chance to speak when you shapeshift.')
				else
					Settingss.Enabled = true
					print('Alamo is now on with a ' .. Settingss.Chance .. '% chance to speak when you shapeshift.')
				end
			elseif command == 'off' then
				if Settingss.Enabled then
					Settingss.Enabled = false
					print('Alamo is now off.')
				else
					print('Alamo is already off.')
				end
			elseif command == 'chance' then
				if arguments == nil or arguments == '' then
					if Settingss.Enabled then
						print('Alamo has a ' .. Settingss.Chance .. '% chance to speak when you shapeshift.')
					else
						print('Alamo will have a ' .. Settingss.Chance .. '% chance to speak when you shapeshift if you enable it.')
					end
				else
					local newChance = tonumber(arguments)
					if newChance ~= nil then
						if newChance >= 0 and newChance <= 100 then
							Settingss.Chance = newChance
							if Settingss.Enabled then
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
					print("Alamo's current chat is " .. Settingss.ChatType .. '. You can choose DYNAMIC, EMOTE, GUILD, INSTANCE_CHAT, OFFICER, PARTY, PRIVATE, RAID, RAID_WARNING, or WHISPER.')
				else
					local newChatType = string.upper(arguments)
					if newChatType == 'DYNAMIC' or newChatType == 'EMOTE' or newChatType == 'GUILD' or newChatType == 'INSTANCE_CHAT' or newChatType == 'OFFICER' or newChatType == 'PARTY' or newChatType == 'PRIVATE' or newChatType == 'RAID' or newChatType == 'RAID_WARNING' or newChatType == 'WHISPER' then
						Settingss.ChatType = newChatType
						print("Alamo's chat is now " .. Settingss.ChatType .. '.')
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
		Settingss.Enabled = self:GetChecked()
		PlaySound(Settingss.Enabled and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF)
		self:SetChecked(Settingss.Enabled)
	end
	
	local function CheckBoxOnShow(self)
		self:SetChecked(Settingss.Enabled)
	end

	local function SliderOnShow(self)
		chanceSlider:SetValue(Settingss.Chance)
	end
	
	local function SliderOnChange(self)
		Settingss.Chance = self:GetValue()
	end

	AlamoOptions:Hide()
	AlamoOptions:SetAllPoints()
	AlamoOptions.name = "Alamo Reeburth"

	title:SetPoint("TOPLEFT", 16, -16)
	title:SetText(AlamoOptions.name)
	InterfaceOptions_AddCategory(AlamoOptions, addonName)

--	--Enable Checkbox--
	enableButton:SetScript('OnShow', CheckBoxOnShow)
	enableButton:SetScript('OnClick', CheckboxOnClick)
	getglobal(enableButton:GetName() .. 'Text'):SetText("Enable Alamo");
	enableButton.tooltipText = 'Enable Alamo Dialogue'
	enableButton:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -4)

--	--Chance Slider--
--	chanceSlider:SetWidth(20)
--	chanceSlider:SetHeight(100)
	chanceSlider:SetOrientation('HORIZONTAL')
	chanceSlider:Show()
	chanceSlider.tooltipText = 'This is the Tooltip hint'   -- Creates a tooltip on mouseover.
	_G[chanceSlider:GetName() .. 'Low']:SetText('1')        -- Sets the left-side slider text (default is "Low").
	_G[chanceSlider:GetName() .. 'High']:SetText('100')     -- Sets the right-side slider text (default is "High").
	_G[chanceSlider:GetName() .. 'Text']:SetText('5')       -- Sets the "title" text (top-centre of slider).
	chanceSlider:SetScript('OnShow', SliderOnShow)
	chanceSlider:SetScript('OnValueChanged', SliderOnChange)
	chanceSlider:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -54)
	chanceSlider:SetMinMaxValues(1, 100)
	chanceSlider:SetValueStep(1)
	chanceSlider:SetObeyStepOnDrag(true)
	getglobal(chanceSlider:GetName() .. 'Text'): SetText("Chance to Speak")

--	--chat channel dropdown--
	local chatDropdownLabel = AlamoOptions:CreateFontString(nil, 'ARTWORK', 'GameFontHighlightSmall')
	chatDropdownLabel:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -94)
	chatDropdownLabel:SetText("Chat Channel:")

	chatDropdown:SetPoint("TOPLEFT", chatDropdownLabel, "BOTTOMLEFT", -16, -4)
	local function ChatDropdown_OnClick(self, arg1, arg2, checked)
		Settingss.ChatType = arg1
		UIDropDownMenu_SetText(chatDropdown, Settingss.ChatType)
	end
	local function ChatDropdown_Menu(frame, level, menuList)
		local info = UIDropDownMenu_CreateInfo()
		info.func = ChatDropdown_OnClick
		info.text, info.arg1 = "DYNAMIC", "DYNAMIC"
		UIDropDownMenu_AddButton(info)
		info.text, info.arg1 = "EMOTE", "EMOTE"
 		UIDropDownMenu_AddButton(info)
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
		info.text, info.arg1 = "WHISPER", "WHISPER"
		UIDropDownMenu_AddButton(info)
	end
	local function DropdownOnShow(self)
		UIDropDownMenu_SetText(self, Settingss.ChatType)
	end
	UIDropDownMenu_Initialize(chatDropdown, ChatDropdown_Menu)
	chatDropdown:SetScript('OnShow', DropdownOnShow)

else
	SLASH_ALAMO1 = '/alamo';
	function SlashCmdList.ALAMO(msg, editbox)
		print('Alamo is disabled; this is not a druid.')
	end
end