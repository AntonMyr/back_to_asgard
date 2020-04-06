function onStepIn(creature, item, position, fromPosition)
	if item.actionid == 100 then
		local player = creature:getPlayer()
		if player == nil then
			return false
		end

        if item:hasAttribute(ITEM_ATTRIBUTE_TEXT) then
            --local modalWindow = ModalWindow(1, "Tutorial Island", item:getAttribute(ITEM_ATTRIBUTE_TEXT))
            --modalWindow:addButton(2, "Continue")
            --modalWindow:sendToPlayer(player)

            player:sendTextMessage(19, item:getAttribute(ITEM_ATTRIBUTE_TEXT), 9)
        end
	end
	return true
end
