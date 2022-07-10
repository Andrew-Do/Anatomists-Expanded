this.getroottable().anatomists_expanded.hook_items <- function ()
{
    ::mods_hookExactClass("items/misc/anatomist/alp_potion_item", function (o)
	{
        local create = ::mods_getMember(o, "create");
		o.create = function()
		{
            create();
            this.m.Name = "Sequence 9: Alp";
		    this.m.Description = "This draft, the result of intensive study into the so-called \'Third Eye\' of the Alp, allows whomever drinks it to see through the night as if it were day, see into the minds of others and torment them with nightmares! Blurry vision and hallucinations are expected while the body acclimates. It seems the body also changes to these potent mutagens. \n\nYou can drink potions of the same sequence without serious consequences, but you will still have to deal with the sickness.";
            this.m.Icon = "consumables/potion_34.png";
            this.m.Value = 5000;
        }

        local onUse = ::mods_getMember(o, "onUse");
		o.onUse = function(_actor, _item = null)
        {
            this.getroottable().anatomists_expanded.doInjuries(_actor, "alp");

            if (!_actor.getFlags().has("alp"))
			{
				_actor.getFlags().add("alp");
			}

            if (_actor.getSkills().getSkillByID("actives.nightmare_player") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/actives/nightmare_player"));
            }

            if (_actor.getSkills().getSkillByID("actives.sleep_player") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/actives/sleep_player"));
            }

            if (_actor.getSkills().getSkillByID("effects.alp_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/alp_potion_effect"));
            }

            if (_actor.getSkills().getSkillByID("effects.honor_guard_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/honor_guard_potion_effect"));
            }
            this.Sound.play("sounds/enemies/dlc2/alp_death_0" + this.Math.rand(1, 5) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/dlc2/alp_idle_0" + this.Math.rand(1, 12) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/dlc2/alp_hurt_0" + this.Math.rand(1, 4) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/dlc2/alp_nightmare_0" + this.Math.rand(1, 6) + ".wav", this.Const.Sound.Volume.Inventory);

            return this.anatomist_potion_item.onUse(_actor, _item);
        }


        local getTooltip = ::mods_getMember(o, "getTooltip");
		o.getTooltip = function()
        {
            local result = [
                {
                    id = 1,
                    type = "title",
                    text = this.getName()
                },
                {
                    id = 2,
                    type = "description",
                    text = this.getDescription()
                }
            ];
            result.push({
                id = 66,
                type = "text",
                text = this.getValueString()
            });

            if (this.getIconLarge() != null)
            {
                result.push({
                    id = 3,
                    type = "image",
                    image = this.getIconLarge(),
                    isLarge = true
                });
            }
            else
            {
                result.push({
                    id = 3,
                    type = "image",
                    image = this.getIcon()
                });
            }

            result.push({
                id = 11,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Nightmare: Torment the victim's soul with nightmares, bringing them ever closer to oblivion."
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Sleep: Lull them into the land of dreams."
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/morale.png",
                text = "Enhanced Eye Rods: Not affected by nighttime penalties" + "\n[color=" + this.Const.UI.Color.PositiveValue + "]+2[/color] Vision"
            });
            result.push({
                id = 11,
                type = "text",
                icon = "ui/icons/morale.png",
                text = "This character takes between [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color] and [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color] less damage from piercing attacks, such as those from bows or spears" + "\n[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Hitpoints"  
            });
            result.push({
                id = 65,
                type = "text",
                text = "Right-click or drag onto the currently selected character in order to drink. This item will be consumed in the process."
            });
            result.push({
                id = 65,
                type = "hint",
                icon = "ui/tooltips/warning.png",
                text = "Mutates the body. A long period of sickness is expected. Under normal circumstances, drinking more than one mutation potion can severly cripple or even kill."
            });
            return result;
        }
    });

    ::mods_hookExactClass("items/misc/anatomist/direwolf_potion_item", function (o)
	{
        local create = ::mods_getMember(o, "create");
		o.create = function()
		{
            create();
            this.m.Name = "Sequence 9: Direwolf";
		    this.m.Description = "This humoural concoction, borne from research into the dreaded direwolf, will turn even the clumsiest oaf into a lithe dancer of a warrior, able to gracefully move with the tides of battle long after lesser men succumb to fatigue! Mild akathisia after consuming is normal and expected.\n\nYou can drink potions of the same sequence without serious consequences, but you will still have to deal with the sickness.";
            this.m.Value = 5000;
        }

        local onUse = ::mods_getMember(o, "onUse");
		o.onUse = function(_actor, _item = null)
        {
            this.getroottable().anatomists_expanded.doInjuries(_actor, "werewolf");

            if (!_actor.getFlags().has("werewolf"))
			{
				_actor.getFlags().add("werewolf");
			}
            
            if (_actor.getSkills().getSkillByID("racial.werewolf_player") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/racial/werewolf_player_racial"));
            }

            if (_actor.getSkills().getSkillByID("effects.direwolf_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/direwolf_potion_effect"));
            }

            if (_actor.getSkills().getSkillByID("effects.alp_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/alp_potion_effect"));
            }

            if (_actor.getSkills().getSkillByID("perk.ptr_survival_instinct") == null)
            {
                _actor.getBackground().addPerk(this.Const.Perks.PerkDefs.PTRSurvivalInstinct, 1, false);
                _actor.getSkills().add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
            }
            this.Sound.play("sounds/enemies/werewolf_idle_0" + this.Math.rand(1, 8) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/werewolf_idle_0" + this.Math.rand(1, 8) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/werewolf_idle_0" + this.Math.rand(1, 8) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/werewolf_hurt_0" + this.Math.rand(1, 4) + ".wav", this.Const.Sound.Volume.Inventory);

            return this.anatomist_potion_item.onUse(_actor, _item);
        }

        local getTooltip = ::mods_getMember(o, "getTooltip");
		o.getTooltip = function()
        {
            local result = [
                {
                    id = 1,
                    type = "title",
                    text = this.getName()
                },
                {
                    id = 2,
                    type = "description",
                    text = this.getDescription()
                }
            ];
            result.push({
                id = 66,
                type = "text",
                text = this.getValueString()
            });

            if (this.getIconLarge() != null)
            {
                result.push({
                    id = 3,
                    type = "image",
                    image = this.getIconLarge(),
                    isLarge = true
                });
            }
            else
            {
                result.push({
                    id = 3,
                    type = "image",
                    image = this.getIcon()
                });
            }

            result.push({
                id = 11,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Direwolf: This character counts as a direwolf in skill checks, and inherits the direwolf's racial traits; that is inflicting more damage in proportion to missing health."
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/morale.png",
                text = "Elasticized Sinew: Attacks that miss have [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color] of their Fatigue cost refunded" + "\n[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Fatigue"
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/morale.png",
                text = "Enhanced Eye Rods: Not affected by nighttime penalties" + "\n[color=" + this.Const.UI.Color.PositiveValue + "]+2[/color] Vision"
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Survival Instinct: Every time you are attacked, gain +2 Melee and Ranged Defense on a miss and +5 on a hit. The bonus is reset at the start of every turn except the bonus gained from getting hit which is retained for the rest of the combat. This retained bonus cannot be higher than +10."
            });
            result.push({
                id = 65,
                type = "text",
                text = "Right-click or drag onto the currently selected character in order to drink. This item will be consumed in the process."
            });
            result.push({
                id = 65,
                type = "hint",
                icon = "ui/tooltips/warning.png",
                text = "Mutates the body. A long period of sickness is expected. Under normal circumstances, drinking more than one mutation potion can severly cripple or even kill."
            });
            return result;
        }
    });


    ::mods_hookExactClass("items/misc/anatomist/necrosavant_potion_item", function (o)
	{
        local create = ::mods_getMember(o, "create");
		o.create = function()
		{
            create();
            this.m.Name = "Sequence 9: Vampire";
		    this.m.Description = "Whoever drinks this incredible potion will find themselves in possession of the miraculous powers of the Necrosavant! Unfortunately, it doesn't grant immortality. Side effects might include immortality and removing old age.\n\nYou can drink potions of the same sequence without serious consequences, but you will still have to deal with the sickness.";
            this.m.Value = 15000;
        }

        local onUse = ::mods_getMember(o, "onUse");
		o.onUse = function(_actor, _item = null)
        {
            this.getroottable().anatomists_expanded.doInjuries(_actor, "vampire");

            if (_actor.getSkills().hasSkill("trait.old"))
            {
                _actor.getSkills().removeByID("trait.old");
            }

            if (!_actor.getFlags().has("vampire"))
			{
				_actor.getFlags().add("vampire");
			}

            if (_actor.getSkills().getSkillByID("effects.necrosavant_potion") == null)
            {
                 _actor.getSkills().add(this.new("scripts/skills/effects/necrosavant_potion_effect"));
            }

            if (_actor.getSkills().getSkillByID("perk.nine_lives") == null)
            {
                _actor.getBackground().addPerk(this.Const.Perks.PerkDefs.NineLives, 0, false);
                _actor.getSkills().add(this.new("scripts/skills/perks/perk_nine_lives"));
            }

            if (_actor.getSkills().getSkillByID("perk.ptr_bloodlust") == null)
            {
                _actor.getBackground().addPerk(this.Const.Perks.PerkDefs.PTRBloodlust, 1, false);
                _actor.getSkills().add(this.new("scripts/skills/perks/perk_ptr_bloodlust"));
            }

            if (_actor.getSkills().getSkillByID("perk.ptr_sanguinary") == null)
            {
                _actor.getBackground().addPerk(this.Const.Perks.PerkDefs.PTRSanguinary, 2, false);
                _actor.getSkills().add(this.new("scripts/skills/perks/perk_ptr_sanguinary"));
            }

            this.Sound.play("sounds/enemies/vampire_hurt_0" + this.Math.rand(1, 3) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/vampire_death_0" + this.Math.rand(1, 3) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/vampire_idle_0" + this.Math.rand(1, 3) + ".wav", this.Const.Sound.Volume.Inventory);

            return this.anatomist_potion_item.onUse(_actor, _item);
        }

        local getTooltip = ::mods_getMember(o, "getTooltip");
		o.getTooltip = function()
        {
            local result = [
                {
                    id = 1,
                    type = "title",
                    text = this.getName()
                },
                {
                    id = 2,
                    type = "description",
                    text = this.getDescription()
                }
            ];
            result.push({
                id = 66,
                type = "text",
                text = this.getValueString()
            });

            if (this.getIconLarge() != null)
            {
                result.push({
                    id = 3,
                    type = "image",
                    image = this.getIconLarge(),
                    isLarge = true
                });
            }
            else
            {
                result.push({
                    id = 3,
                    type = "image",
                    image = this.getIcon()
                });
            }

            result.push({
                id = 11,
                type = "text",
                icon = "ui/icons/health.png",
                text = "Parasitic Blood: Heal [color=" + this.Const.UI.Color.PositiveValue + "]15%[/color] of hitpoint damage inflicted on adjacent enemies that have blood" + "\n[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Hitpoints." + "\n[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Melee Skill."
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Nine Lives: Once per battle, upon receiving a killing blow, survive instead with a few hitpoints left and have all damage over time effects cured. Also grants a one in nine chance to survive a fatal blow with an injury."
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Bloodlust: Attacks on bleeding targets restore fatigue."
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Sanguinary: Increases the chance to inflict fatalities and fatalities restore fatigue. Attacks against bleeding targets improve your morale."
            });
            result.push({
                id = 65,
                type = "text",
                text = "Right-click or drag onto the currently selected character in order to drink. This item will be consumed in the process."
            });
            result.push({
                id = 65,
                type = "hint",
                icon = "ui/tooltips/warning.png",
                text = "Mutates the body. A long period of sickness is expected. Under normal circumstances, drinking more than one mutation potion can severly cripple or even kill."
            });
            return result;
        }
    });
	
	delete this.anatomists_expanded.hook_items;
};