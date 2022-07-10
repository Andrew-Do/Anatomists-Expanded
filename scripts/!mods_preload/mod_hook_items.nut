this.getroottable().anatomists_expanded.hook_items <- function ()
{
    ::mods_hookExactClass("items/misc/anatomist/ancient_priest_potion_item", function (o)
	{
        local create = ::mods_getMember(o, "create");
		o.create = function()
		{
            create();
            this.m.Name = "Sequence 8: Mountain";
		    this.m.Description = "From research on the legendary rock unhold, this potion improves upon the previous sequence\'s, granting the drinker increased regeneration and creating natural armor on their body that regenerates.\n\nYou can drink potions of the same sequence without serious consequences, but you will still have to deal with the sickness.";
            this.m.Icon = "consumables/potion_32.png";
            this.m.Value = 20000;
        }

        local onUse = ::mods_getMember(o, "onUse");
		o.onUse = function(_actor, _item = null)
        {
            this.getroottable().anatomists_expanded.doInjuries(_actor, "unhold");

            if (_actor.getSkills().hasSkill("trait.tiny"))
            {
                _actor.getSkills().removeByID("trait.tiny");
            }

            if (!_actor.getSkills().hasSkill("trait.huge"))
            {
                _actor.getSkills().add(this.new("scripts/skills/traits/huge_trait"));
            }
            
            if (!_actor.getFlags().has("unhold"))
			{
				_actor.getFlags().add("unhold");
			}

            if (!_actor.getFlags().has("unhold_8"))
			{
				_actor.getFlags().add("unhold_8");
			}

            if (_actor.getSkills().getSkillByID("effects.unhold_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/unhold_potion_effect"));
            }

            if (_actor.getSkills().getSkillByID("effects.ifrit_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/ifrit_potion_effect"));
            }

            if (_actor.getSkills().getSkillByID("effects.orc_warrior_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/orc_warrior_potion_effect"));
            }

            this.Sound.play("sounds/enemies/unhold_death_0" + this.Math.rand(1, 6) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/unhold_flee_0" + this.Math.rand(1, 3) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/unhold_hurt_0" + this.Math.rand(1, 4) + ".wav", this.Const.Sound.Volume.Inventory);

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
                text = "Induces major growth."
            });
            result.push({
                id = 11,
                type = "text",
                icon = "ui/icons/health.png",
                text = "Heals [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] hitpoints each turn. Cannot heal if poisoned."
            });
            result.push({
                id = 11,
                type = "text",
                icon = "ui/icons/armor_body.png",
                text = "Heals [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] head and body armor each turn.  Cannot heal if poisoned."
            });
            result.push({
                id = 11,
                type = "text",
                icon = "ui/icons/armor_body.png",
                text = "This character\'s skin is hard and stone-like, granting [color=" + this.Const.UI.Color.PositiveValue + "]50[/color] points of natural armor"
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Sensory Redundancy: [color=" + this.Const.UI.Color.PositiveValue + "]33%[/color] chance to resist the Dazed, Staggered, Stunned, Distracted, and Withered status effects" + "\n[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Hitpoints"
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

    ::mods_hookExactClass("items/misc/anatomist/unhold_potion_item", function (o)
	{
        local create = ::mods_getMember(o, "create");
		o.create = function()
		{
            create();
            this.m.Name = "Sequence 9: Unhold";
		    this.m.Description = "This potion will grant near immortality and power to whomever drinks it! That\'s right, just like the dreaded Unhold, any lucky enough to consume this will have their wounds close mere moments after opening! Take it! Quickly! Don\'t think, act!\n\nYou can drink potions of the same sequence without serious consequences, but you will still have to deal with the sickness.";
            this.m.Value = 10000;
        }

        local onUse = ::mods_getMember(o, "onUse");
		o.onUse = function(_actor, _item = null)
        {
            this.getroottable().anatomists_expanded.doInjuries(_actor, "unhold");

            if (_actor.getSkills().hasSkill("trait.tiny"))
            {
                _actor.getSkills().removeByID("trait.tiny");
            }

            if (!_actor.getSkills().hasSkill("trait.huge"))
            {
                _actor.getSkills().add(this.new("scripts/skills/traits/huge_trait"));
            }

            if (!_actor.getFlags().has("unhold"))
			{
				_actor.getFlags().add("unhold");
			}

            if (_actor.getSkills().getSkillByID("effects.unhold_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/unhold_potion_effect"));
            }

            if (_actor.getSkills().getSkillByID("effects.wiederganger_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/wiederganger_potion_effect"));
            }

            if (_actor.getSkills().getSkillByID("perk.colossus") == null)
            {
                _actor.getBackground().addPerk(this.Const.Perks.PerkDefs.Colossus, 0, false);
                _actor.getSkills().add(this.new("scripts/skills/perks/perk_colossus"));
            }

            if (_actor.getSkills().getSkillByID("perk.legend_muscularity") == null)
            {
                _actor.getBackground().addPerk(this.Const.Perks.PerkDefs.LegendMuscularity, 1, false);
                _actor.getSkills().add(this.new("scripts/skills/perks/perk_legend_muscularity"));
            }

            this.Sound.play("sounds/enemies/unhold_death_0" + this.Math.rand(1, 6) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/unhold_flee_0" + this.Math.rand(1, 3) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/unhold_hurt_0" + this.Math.rand(1, 4) + ".wav", this.Const.Sound.Volume.Inventory);

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
                text = "Induces major growth."
            });
            result.push({
                id = 11,
                type = "text",
                icon = "ui/icons/health.png",
                text = "Heals [color=" + this.Const.UI.Color.PositiveValue + "]5[/color] hitpoints each turn. Cannot heal if poisoned."
            });
            result.push({
                id = 11,
                type = "text",
                icon = "ui/icons/special.png",
                text = "The threshold to sustain injuries on getting hit is increased by [color=" + this.Const.UI.Color.PositiveValue + "]33%[/color]" + "\n[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Hitpoints"
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Colossus: Hitpoints are increased by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color], which also reduces the chance to sustain debilitating injuries when being hit."
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Muscularity: Put your full weight into every blow and gain [color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] of your current hitpoints as additional minimum and maximum damage, up to 50."
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
    
    ::mods_hookExactClass("items/misc/anatomist/webknecht_potion_item", function (o)
	{
        local create = ::mods_getMember(o, "create");
		o.create = function()
		{
            create();
            this.m.Name = "Sequence 9: Spider";
		    this.m.Description = "As any experienced beast hunter could tell you, what makes the overgrown arachnids known as Webknechts truly fearsome is their vicious poison. Imbimbing this potion grants the drinker the venom glands of a Webknecht and the ability to resist poisons as well as nightvision. The anatomist remarked that it was odd that this potion only granted three effects. Was he missing something? Where was the power of this species concentrated?\n\nYou can drink potions of the same sequence without serious consequences, but you will still have to deal with the sickness.";
            this.m.Value = 5000;
        }

        local onUse = ::mods_getMember(o, "onUse");
		o.onUse = function(_actor, _item = null)
        {
            this.getroottable().anatomists_expanded.doInjuries(_actor, "spider");

            if (!_actor.getFlags().has("spider"))
			{
				_actor.getFlags().add("spider");
			}

            if (_actor.getSkills().getSkillByID("effects.serpent_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/serpent_potion_effect"));
            }

            if (_actor.getSkills().getSkillByID("effects.webknecht_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/webknecht_potion_effect"));
            }
            
            if (_actor.getSkills().getSkillByID("effects.alp_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/alp_potion_effect"));
            }

            this.Sound.play("sounds/enemies/dlc2/giant_spider_death_0" + this.Math.rand(1, 8) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/dlc2/giant_spider_flee_0" + this.Math.rand(1, 3) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/dlc2/giant_spider_hurt_0" + this.Math.rand(1, 7) + ".wav", this.Const.Sound.Volume.Inventory);

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
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Venom Glands: Piercing or cutting attacks poison the target."
            });
            result.push({
                id = 11,
                type = "text",
                icon = "ui/icons/initiative.png",
                text = "+[color=" + this.Const.UI.Color.PositiveValue + "]" + 15 + "[/color] Initiative"
            });
            result.push({
                id = 11,
                type = "text",
                icon = "ui/icons/melee_skill.png",
                text = "+[color=" + this.Const.UI.Color.PositiveValue + "]" + 5 + "[/color] Melee Skill"
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Mutated Circulatory System: Immune to poison effects, including those of Webknechts and Goblins."
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/morale.png",
                text = "Enhanced Eye Rods: Not affected by nighttime penalties" + "\n[color=" + this.Const.UI.Color.PositiveValue + "]+2[/color] Vision"
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

    ::mods_hookExactClass("items/misc/anatomist/wiederganger_potion_item", function (o)
	{
        local create = ::mods_getMember(o, "create");
		o.create = function()
		{
            create();
            this.m.Name = "Sequence 8: Black Widow";
		    this.m.Description = "It turns out that most the strength of this species is focused on in it's poison making abilities. With research into the legendary Redback Spider, this potion improves upon the poison of the previous sequence, allowing the drinker to poison your enemies with redback poison when cutting or piercing them. They also gain the ability to spit webs at their foes among other improvements.\n\nYou can drink potions of the same sequence without serious consequences, but you will still have to deal with the sickness.";
            this.m.Value = 10000;
            this.m.Icon = "consumables/potion_31.png";
        }

        local onUse = ::mods_getMember(o, "onUse");
		o.onUse = function(_actor, _item = null)
        {
            this.getroottable().anatomists_expanded.doInjuries(_actor, "spider");

            if (!_actor.getFlags().has("spider"))
			{
				_actor.getFlags().add("spider");
			}

            if (!_actor.getFlags().has("spider_8"))
			{
				_actor.getFlags().add("spider_8");
			}

            if (_actor.getSkills().getSkillByID("effects.serpent_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/serpent_potion_effect"));
            }

            if (_actor.getSkills().getSkillByID("perk.perk_legend_item_web_skill") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/perks/perk_legend_item_web_skill"));
            }

            if (_actor.getSkills().getSkillByID("perk.nimble") == null)
            {
                _actor.getBackground().addPerk(this.Const.Perks.PerkDefs.Nimble, 0, false);
                _actor.getSkills().add(this.new("scripts/skills/perks/perk_nimble"));
            }

            this.Sound.play("sounds/enemies/dlc2/giant_spider_death_0" + this.Math.rand(1, 8) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/dlc2/giant_spider_flee_0" + this.Math.rand(1, 3) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/dlc2/giant_spider_hurt_0" + this.Math.rand(1, 7) + ".wav", this.Const.Sound.Volume.Inventory);

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
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Venom Glands: Piercing or cutting attacks poison the target with redback poison."
            });
            result.push({
                id = 11,
                type = "text",
                icon = "ui/icons/initiative.png",
                text = "+[color=" + this.Const.UI.Color.PositiveValue + "]" + 15 + "[/color] Initiative"
            });
            result.push({
                id = 11,
                type = "text",
                icon = "ui/icons/melee_skill.png",
                text = "+[color=" + this.Const.UI.Color.PositiveValue + "]" + 10 + "[/color] Melee Skill"
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Spit Web: Spit a web at your foes and trap them."
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Nimble: Specialize in light armor! By nimbly dodging or deflecting blows, convert any hits to glancing hits. Hitpoint damage taken is reduced by up to [color=" + this.Const.UI.Color.PositiveValue + "]60%[/color], but lowered exponentially by the total penalty to Maximum Fatigue from body and head armor above 15."
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

    ::mods_hookExactClass("items/misc/anatomist/serpent_potion_item", function (o)
	{
        local create = ::mods_getMember(o, "create");
		o.create = function()
		{
            create();
            this.m.Name = "Sequence 9: Serpent";
		    this.m.Description = "A quite interesting potion, according to the anatomist who made it. Although this species currently cannot support a sequence 8, this potion confers upon the drinker the ability to produce poison for their cutting and piercing attacks and be immune to various types of poisons. They also have developed the survival instinct of a snake and gain that species's pattern recognition skills. Sadly it does not greatly improve the user's physical attributes.";
            this.m.Value = 5000;
        }

        local onUse = ::mods_getMember(o, "onUse");
		o.onUse = function(_actor, _item = null)
        {
            this.getroottable().anatomists_expanded.doInjuries(_actor, "serpent");

            if (!_actor.getFlags().has("serpent"))
			{
				_actor.getFlags().add("serpent");
			}

            if (_actor.getSkills().getSkillByID("effects.serpent_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/serpent_potion_effect"));
            }

            if (_actor.getSkills().getSkillByID("effects.webknecht_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/webknecht_potion_effect"));
            }

            if (_actor.getSkills().getSkillByID("perk.ptr_pattern_recognition") == null)
            {
                _actor.getBackground().addPerk(this.Const.Perks.PerkDefs.PTRPatternRecognition, 0, false);
                _actor.getSkills().add(this.new("scripts/skills/perks/perk_ptr_pattern_recognition"));
            }

            if (_actor.getSkills().getSkillByID("perk.ptr_survival_instinct") == null)
            {
                _actor.getBackground().addPerk(this.Const.Perks.PerkDefs.PTRSurvivalInstinct, 1, false);
                _actor.getSkills().add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
            }

            this.Sound.play("sounds/enemies/orc_death_0" + this.Math.rand(1, 8) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/orc_flee_0" + this.Math.rand(1, 3) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/orc_hurt_0" + this.Math.rand(1, 7) + ".wav", this.Const.Sound.Volume.Inventory);

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
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Venom Glands: Piercing or cutting attacks poison the target."
            });
            result.push({
                id = 11,
                type = "text",
                icon = "ui/icons/initiative.png",
                text = "+[color=" + this.Const.UI.Color.PositiveValue + "]" + 15 + "[/color] Initiative"
            });
            result.push({
                id = 11,
                type = "text",
                icon = "ui/icons/melee_skill.png",
                text = "+[color=" + this.Const.UI.Color.PositiveValue + "]" + 5 + "[/color] Melee Skill"
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Mutated Circulatory System: Immune to poison effects, including those of Webknechts and Goblins."
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Pattern Recognition: Hitpoints are increased by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color], which also reduces the chance to sustain debilitating injuries when being hit."
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Survival Instinct: Fatigue Recovery is increased by [color=" + this.Const.UI.Color.PositiveValue + "]5%[/color] of your Maximum Fatigue after gear."
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
    
    ::mods_hookExactClass("items/misc/anatomist/orc_young_potion_item", function (o)
	{
        local create = ::mods_getMember(o, "create");
		o.create = function()
		{
            create();
            this.m.Name = "Sequence 9: Orc";
		    this.m.Description = "Many a general has wished orcs might be tamed, for if one could control the greenskins and direct their strength with the intellect of man, they would surely control an unstoppable force. With this, such fantasies are within reach!\n\nYou can drink potions of the same sequence without serious consequences, but you will still have to deal with the sickness.";
            this.m.Value = 7500;
        }

        local onUse = ::mods_getMember(o, "onUse");
		o.onUse = function(_actor, _item = null)
        {
            this.getroottable().anatomists_expanded.doInjuries(_actor, "orc");

            if (_actor.getSkills().hasSkill("trait.tiny"))
            {
                _actor.getSkills().removeByID("trait.tiny");
            }

            if (!_actor.getSkills().hasSkill("trait.huge"))
            {
                _actor.getSkills().add(this.new("scripts/skills/traits/huge_trait"));
            }

            if (!_actor.getFlags().has("orc"))
			{
				_actor.getFlags().add("orc");
			}

            if (_actor.getSkills().getSkillByID("effects.orc_young_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/orc_young_potion_effect"));
            }

            if (_actor.getSkills().getSkillByID("effects.orc_warrior_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/orc_warrior_potion_effect"));
            }

            if (_actor.getSkills().getSkillByID("perk.colossus") == null)
            {
                _actor.getBackground().addPerk(this.Const.Perks.PerkDefs.Colossus, 0, false);
                _actor.getSkills().add(this.new("scripts/skills/perks/perk_colossus"));
            }

            if (_actor.getSkills().getSkillByID("perk.ptr_hale_and_hearty") == null)
            {
                _actor.getBackground().addPerk(this.Const.Perks.PerkDefs.PTRHaleAndHearty, 1, false);
                _actor.getSkills().add(this.new("scripts/skills/perks/perk_ptr_hale_and_hearty"));
            }

            this.Sound.play("sounds/enemies/orc_death_0" + this.Math.rand(1, 8) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/orc_flee_0" + this.Math.rand(1, 3) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/orc_hurt_0" + this.Math.rand(1, 7) + ".wav", this.Const.Sound.Volume.Inventory);

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
                text = "Induces major growth."
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Shock Absorbant Wrists: Attacks do [color=" + this.Const.UI.Color.PositiveValue + "]+15%[/color] additional damage"
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Sensory Redundancy: [color=" + this.Const.UI.Color.PositiveValue + "]33%[/color] chance to resist the Dazed, Staggered, Stunned, Distracted, and Withered status effects" + "\n[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Hitpoints"
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Colossus: Hitpoints are increased by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color], which also reduces the chance to sustain debilitating injuries when being hit."
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Hale and Hearty: Fatigue Recovery is increased by [color=" + this.Const.UI.Color.PositiveValue + "]5%[/color] of your Maximum Fatigue after gear."
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

    ::mods_hookExactClass("items/misc/anatomist/orc_warlord_potion_item", function (o)
	{
        local create = ::mods_getMember(o, "create");
		o.create = function()
		{
            create();
            this.m.Name = "Sequence 8: Warlord";
		    this.m.Description = "Borne from the study of the renown Orc Warlord, this potion improves upon that of the previous sequence, allowing one to wield heavy orc weapons with ease as well as letting an orc\'s rage flow through one\'s veins.\n\nYou can drink potions of the same sequence without serious consequences, but you will still have to deal with the sickness.";
            this.m.Value = 15000;
        }

        local onUse = ::mods_getMember(o, "onUse");
		o.onUse = function(_actor, _item = null)
        {
            this.getroottable().anatomists_expanded.doInjuries(_actor, "orc");

            if (_actor.getSkills().hasSkill("trait.tiny"))
            {
                _actor.getSkills().removeByID("trait.tiny");
            }

            if (!_actor.getSkills().hasSkill("trait.huge"))
            {
                _actor.getSkills().add(this.new("scripts/skills/traits/huge_trait"));
            }

            if (!_actor.getFlags().has("orc"))
			{
				_actor.getFlags().add("orc");
			}

            if (!_actor.getFlags().has("orc_8"))
			{
				_actor.getFlags().add("orc_8");
			}

            if (_actor.getSkills().getSkillByID("effects.orc_warlord_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/orc_warlord_potion_effect"));
            }

            if (_actor.getSkills().getSkillByID("effects.orc_berserker_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/orc_berserker_potion_effect"));
            }

            this.Sound.play("sounds/enemies/orc_death_0" + this.Math.rand(1, 8) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/orc_flee_0" + this.Math.rand(1, 3) + ".wav", this.Const.Sound.Volume.Inventory);
            this.Sound.play("sounds/enemies/orc_hurt_0" + this.Math.rand(1, 7) + ".wav", this.Const.Sound.Volume.Inventory);

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
                text = "Induces major growth."
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Warlord: Improves upon the effects of the sequence 9 potion. \n[color=" + this.Const.UI.Color.PositiveValue + "]+15[/color]% Damage" + "\n[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Hitpoints"
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Improved Limbic System: Using orc weapons no longer imposes additional fatigue costs" + "\n[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Fatigue"
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Hyperactive Glands: This character gains two stacks of Rage each time they take hitpoint damage, and loses one stack at the end of each turn. Rage improves damage reduction and other combat stats."
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
    
    ::mods_hookExactClass("items/misc/anatomist/goblin_grunt_potion_item", function (o)
	{
        local create = ::mods_getMember(o, "create");
		o.create = function()
		{
            create();
            this.m.Name = "Sequence 9: Goblin";
		    this.m.Description = "Equal parts terrifying and annoying, the uncanny marksmanship of goblins has long been thought unobtainable by ordinary, self-respecting humans. With this wondrous potion, however, the discerning warrior can harness some of that latent skill and obtain the celerity inherent in these greenskins. Side effects might include shrinking.\n\nUnfortunately, the anatomist says that this race is too feeble to have develop a sequence 8 potion.";
            this.m.Value = 5000;
        }

        local onUse = ::mods_getMember(o, "onUse");
		o.onUse = function(_actor, _item = null)
        {
            this.getroottable().anatomists_expanded.doInjuries(_actor, "goblin");

            if (_actor.getSkills().hasSkill("trait.huge"))
            {
                _actor.getSkills().removeByID("trait.huge");
            }

            if (!_actor.getSkills().hasSkill("trait.tiny"))
            {
                _actor.getSkills().add(this.new("scripts/skills/traits/tiny_trait"));
            }

            if (!_actor.getFlags().has("goblin"))
			{
				_actor.getFlags().add("goblin");
			}

            if (_actor.getSkills().getSkillByID("effects.goblin_overseer_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/goblin_overseer_potion_effect"));
            }

            if (_actor.getSkills().getSkillByID("effects.goblin_grunt_potion") == null)
            {
                _actor.getSkills().add(this.new("scripts/skills/effects/goblin_grunt_potion_effect"));
            }

            if (_actor.getSkills().getSkillByID("perk.footwork") == null)
            {
                _actor.getBackground().addPerk(this.Const.Perks.PerkDefs.Footwork, 0, false);
                _actor.getSkills().add(this.new("scripts/skills/perks/perk_footwork"));
            }

            if (_actor.getSkills().getSkillByID("perk.ptr_nailed_it") == null)
            {
                _actor.getBackground().addPerk(this.Const.Perks.PerkDefs.PTRNailedIt, 1, false);
                _actor.getSkills().add(this.new("scripts/skills/perks/perk_ptr_nailed_it"));
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
                icon = "ui/icons/special.png",
                text = "Shrinks you."
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Reactive Leg Muscles: The AP cost of Rotation and Footwork is reduced to [color=" + this.Const.UI.Color.PositiveValue + "]2[/color] and the Fatigue costs are reduced by [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color]." + "\n[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Initiative"
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Mutated Cornea: An additional [color=" + this.Const.UI.Color.PositiveValue + "]5%[/color] of damage ignores armor when using bows or crossbows\n" + "[color=" + this.Const.UI.Color.PositiveValue + "]+20[/color] Ranged Skill"  + "\n[color=" + this.Const.UI.Color.PositiveValue + "]+20[/color] Ranged Defense"
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Footwork: Allows you to leave a Zone of Control without triggering free attacks by using skillful footwork."
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Nailed It!: The chance to hit the head with ranged attacks is increased by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color] but reduced by [color=" + this.Const.UI.Color.NegativeValue + "]5%[/color] per tile of distance between you and the target."
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
            this.Sound.play("sounds/enemies/dlc2/alp_idle_0" + this.Math.rand(1, 9) + ".wav", this.Const.Sound.Volume.Inventory);
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