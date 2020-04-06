local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local progress = 0
local modalWindow = ModalWindow(1, "Axel", "This is the text")

-- Upon greeting
local function greetCallback(cid)
    local player = Player(cid)
    npcHandler:setMessage(MESSAGE_GREET, "", cid)

    modalWindow:setMessage("Hello there, most unfitting adventurer! I am in dire need of your help!")
    modalWindow:addButton(1, "Continue...")

    modalWindow:sendToPlayer(player)
    progress = 0
	return true
end

-- Upon walkaway
--local function walkawayCallback(cid)
--    npcHandler:setMessage(MESSAGE_WALKAWAY, "Are you just gonna walk away!?")
--    progress = 0
--    return true
--end

-- Upon farewell
local function farewellCallback(cid)
    npcHandler:setMessage(MESSAGE_FAREWELL, "Good luck! Do not forget the world depends on you!... Or something...")
    return true
end

-- If Player message contains certain words
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
    end

	if progress == 0 and msgcontains(msg, "continue") then
        npcHandler:say("Ah, the world as we know it has been cursed! I myself cannot see to the curses' abolishment. Can you help me with this quest? (yes/no)", cid)
        progress = progress+1
    elseif progress == 1 and msgcontains(msg, "yes") then
        npcHandler:say("I'm from the future, sent back in time to reduce the spread of a deadly virus. It seems however that I might be infected as these poor lads died shortly after my arrival. (continue)", cid)
        progress = progress+1
    elseif progress == 2 and msgcontains(msg, "continue") then
        npcHandler:say("Yes, I might be infected aswell. I cannot, even with my huge intellect and big brain, understand how to solve this. You must find a way adventurer! Please, will you accept this quest? (yes/no)", cid)
        progress = progress+1
    elseif progress == 3 and msgcontains(msg, "yes") then
        npcHandler:say("Thank you young one! Explore the roads and save the world! I bid you farewell, and good luck on your journey!", cid)
        progress = 0
    elseif msgcontains(msg, "no") then
        npcHandler:say("So what are you gonna do? Just walk away?", cid)
    end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_FAREWELL, farewellCallback)
--npcHandler:setCallback(CALLBACK_WALKAWAY, walkawayCallback)
npcHandler:setMessage(MESSAGE_WALKAWAY, "Are you just gonna walk away!?")
npcHandler:addModule(FocusModule:new())