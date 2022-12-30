require("lua/utils/reflection.lua")

function SetHealth(entity)

	--total time you play in ms
    local time_ms = reflection_helper( EntityService:GetSingletonComponent("TimeOfDaySystemDataComponent")).time
	--turn it into days     second > minute > hour > day 1000 / 60 / 60 / 24
    local time_days = time_ms / 86400000
	--enemy's Health
    local MaxHealth = (HealthService:GetMaxHealth(entity))

    local multiplier = 1 + time_days / 20

    HealthService:SetMaxHealth(entity, (MaxHealth  * multiplier ))
    HealthService:SetHealth(entity, (MaxHealth  * multiplier )) 
end