this.getroottable().anatomists_expanded.doPotionDrop <- function (_killer, _skill, _tile, _fatalityType, chance, item)
{
	if (_tile != null && _killer == null || _killer.getFaction() == this.Const.Faction.Player || _killer.getFaction() == this.Const.Faction.PlayerAnimals)
	{
		local count = 0.0
		local roster = this.World.getPlayerRoster().getAll();
		foreach( i, bro in roster )
		{
			if (i >= 25)
			{
				break;
			}

			if (bro.getBackground().getID() == "background.anatomist")
			{
				count++;
			}
		}
		if (this.World.Assets.getOrigin().getID() == "scenario.anatomists")
		{
			count *= 2.0;
		}

		
		local rand = this.Math.rand(1.0, 100.0);
		//this.logInfo("Rolling for potion: " + rand + " vs " + chance * count)
		//TODO: Fix testing code
		//if (rand <= chance * count)
		if (true)
		{
			local loot = this.new(item);
			loot.drop(_tile);
		}
		
	}
}

this.getroottable().anatomists_expanded.hook_loot <- function ()
{
	::mods_hookExactClass("entity/tactical/enemies/alp", function (o)
	{
		local onDeath = ::mods_getMember(o, "onDeath");
		o.onDeath = function(_killer, _skill, _tile, _fatalityType)
		{
			onDeath(_killer, _skill, _tile, _fatalityType);
			local chance = 2.5;
			local item = "scripts/items/misc/anatomist/alp_potion_item";
			this.getroottable().anatomists_expanded.doPotionDrop(_killer, _skill, _tile, _fatalityType, chance, item);
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_demon_alp", function (o)
	{
		local onDeath = ::mods_getMember(o, "onDeath");
		o.onDeath = function(_killer, _skill, _tile, _fatalityType)
		{
			onDeath(_killer, _skill, _tile, _fatalityType);
			local chance = 5;
			local item = "scripts/items/misc/anatomist/demon_alp_potion_item";
			this.getroottable().anatomists_expanded.doPotionDrop(_killer, _skill, _tile, _fatalityType, chance, item);
		}
	});
	
	::mods_hookExactClass("entity/tactical/enemies/direwolf", function (o)
	{
		local onDeath = ::mods_getMember(o, "onDeath");
		o.onDeath = function(_killer, _skill, _tile, _fatalityType)
		{
			onDeath(_killer, _skill, _tile, _fatalityType);
			local chance = 2.5;
			local item = "scripts/items/misc/anatomist/direwolf_potion_item";
			this.getroottable().anatomists_expanded.doPotionDrop(_killer, _skill, _tile, _fatalityType, chance, item);
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_white_direwolf", function (o)
	{
		local onDeath = ::mods_getMember(o, "onDeath");
		o.onDeath = function(_killer, _skill, _tile, _fatalityType)
		{
			onDeath(_killer, _skill, _tile, _fatalityType);
			local chance = 5;
			local item = "scripts/items/misc/anatomist/white_direwolf_potion_item";
			this.getroottable().anatomists_expanded.doPotionDrop(_killer, _skill, _tile, _fatalityType, chance, item);
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/vampire", function (o)
	{
		local onDeath = ::mods_getMember(o, "onDeath");
		o.onDeath = function(_killer, _skill, _tile, _fatalityType)
		{
			onDeath(_killer, _skill, _tile, _fatalityType);
			local chance = 2.5;
			local item = "scripts/items/misc/anatomist/necrosavant_potion_item";
			this.getroottable().anatomists_expanded.doPotionDrop(_killer, _skill, _tile, _fatalityType, chance, item);
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_vampire_lord", function (o)
	{
		local onDeath = ::mods_getMember(o, "onDeath");
		o.onDeath = function(_killer, _skill, _tile, _fatalityType)
		{
			onDeath(_killer, _skill, _tile, _fatalityType);
			local chance = 5;
			local item = "scripts/items/misc/anatomist/necrosavant_lord_potion_item";
			this.getroottable().anatomists_expanded.doPotionDrop(_killer, _skill, _tile, _fatalityType, chance, item);
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_vampire_lord", function (o)
	{
		local onDeath = ::mods_getMember(o, "onDeath");
		o.onDeath = function(_killer, _skill, _tile, _fatalityType)
		{
			onDeath(_killer, _skill, _tile, _fatalityType);
			local chance = 5;
			local item = "scripts/items/misc/anatomist/necrosavant_lord_potion_item";
			this.getroottable().anatomists_expanded.doPotionDrop(_killer, _skill, _tile, _fatalityType, chance, item);
		}
	});

	::mods_hookExactClass("entity/tactical/goblin", function (o)
	{
		local onDeath = ::mods_getMember(o, "onDeath");
		o.onDeath = function(_killer, _skill, _tile, _fatalityType)
		{
			onDeath(_killer, _skill, _tile, _fatalityType);
			local chance = 1.25;
			local item = "scripts/items/misc/anatomist/goblin_grunt_potion_item";
			this.getroottable().anatomists_expanded.doPotionDrop(_killer, _skill, _tile, _fatalityType, chance, item);
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/goblin_leader", function (o)
	{
		local onDeath = ::mods_getMember(o, "onDeath");
		o.onDeath = function(_killer, _skill, _tile, _fatalityType)
		{
			onDeath(_killer, _skill, _tile, _fatalityType);
			local chance = 5;
			local item = "scripts/items/misc/anatomist/goblin_grunt_potion_item";
			this.getroottable().anatomists_expanded.doPotionDrop(_killer, _skill, _tile, _fatalityType, chance, item);
		}
	});

	::mods_hookExactClass("entity/tactical/goblin_shaman", function (o)
	{
		local onDeath = ::mods_getMember(o, "onDeath");
		o.onDeath = function(_killer, _skill, _tile, _fatalityType)
		{
			onDeath(_killer, _skill, _tile, _fatalityType);
			local chance = 2.5;
			local item = "scripts/items/misc/anatomist/goblin_grunt_potion_item";
			this.getroottable().anatomists_expanded.doPotionDrop(_killer, _skill, _tile, _fatalityType, chance, item);
		}
	});
	
	delete this.anatomists_expanded.hook_loot;
};