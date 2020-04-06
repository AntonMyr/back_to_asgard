local condition = Condition(CONDITION_OUTFIT)
condition:setParameter(CONDITION_PARAM_TICKS, 20000)
condition:setOutfit(0, 230, 0, 0, 0, 0)
condition:setOutfit(0, 231, 0, 0, 0, 0)
condition:setOutfit(0, 232, 0, 0, 0, 0)
condition:setOutfit(0, 233, 0, 0, 0, 0)
condition:setOutfit(0, 234, 0, 0, 0, 0)
condition:setOutfit(0, 235, 0, 0, 0, 0)
condition:setOutfit(0, 236, 0, 0, 0, 0)
condition:setOutfit(0, 237, 0, 0, 0, 0)
condition:setOutfit(0, 238, 0, 0, 0, 0)
condition:setOutfit(0, 239, 0, 0, 0, 0)
condition:setOutfit(0, 240, 0, 0, 0, 0)
condition:setOutfit(0, 241, 0, 0, 0, 0)
condition:setOutfit(0, 242, 0, 0, 0, 0)
condition:setOutfit(0, 243, 0, 0, 0, 0)
condition:setOutfit(0, 244, 0, 0, 0, 0)
condition:setOutfit(0, 245, 0, 0, 0, 0)
condition:setOutfit(0, 246, 0, 0, 0, 0)
condition:setOutfit(0, 247, 0, 0, 0, 0)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setArea(createCombatArea(AREA_SQUARE1X1))
combat:setCondition(condition)

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end
