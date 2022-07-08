this.getroottable().anatomists_expanded.hook_items <- function ()
{

    ::mods_hookExactClass("items/misc/anatomist/direwolf_potion_item", function (o)
	{
        local create = ::mods_getMember(o, "create");
		o.create = function()
		{
            create();
            this.m.Name = "Direwolf";
		    this.m.Description = "This humoural concoction, borne from research into the dreaded direwolf, will turn even the clumsiest oaf into a lithe dancer of a warrior, able to gracefully move with the tides of battle long after lesser men succumb to fatigue! Mild akathisia after consuming is normal and expected.";
            this.m.Value = 1000;
        }

        local onUse = ::mods_getMember(o, "onUse");
		o.onUse = function(_actor, _item = null)
        {
            _actor.getSkills().add(this.new("scripts/skills/effects/direwolf_potion_effect"));
            _actor.getSkills().add(this.new("scripts/skills/effects/alp_potion_effect"));

            if (_actor.getSkills().getSkillByID("perk.pathfinder") == null)
            {
                _actor.getBackground().addPerk(this.Const.Perks.PerkDefs.Pathfinder, 0, false);
                _actor.getSkills().add(this.new("scripts/skills/perks/perk_pathfinder"));
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
                icon = "ui/icons/morale.png",
                text = "Elasticized Sinew: Attacks that miss have [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color] of their Fatigue cost refunded" + "\n[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Fatigue"
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/morale.png",
                text = "Enhanced Eye Rods: Not affected by nighttime penalties" + "\n[color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] Vision" + "\n[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Ranged Skill" + "\n[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Melee Skill"
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Pathfinder: Action Point costs for movement on all terrain is reduced by -1 to a minimum of 2 Action Points per tile, and Fatigue cost is reduced to half. Changing height levels also has no additional Action Point cost anymore."
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
                text = "Mutates the body. A long period of sicknes is expected. Under normal circumstances, drinking more than one mutation potion can severly cripple or even kill."
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
            this.m.Name = "Vampire";
		    this.m.Description = "Whoever drinks this incredible potion will find themselves in possession of the miraculous powers of the Necrosavant! Unfortunately, it does grant immortality. This may be considered a feature should the imbiber get a bit too comfortable drinking blood.";
            this.m.Value = 10000;
        }

        local onUse = ::mods_getMember(o, "onUse");
		o.onUse = function(_actor, _item = null)
        {
            _actor.getSkills().add(this.new("scripts/skills/effects/necrosavant_potion_effect"));

            if (_actor.getSkills().getSkillByID("perk.nine_lives") == null)
            {
                _actor.getBackground().addPerk(this.Const.Perks.PerkDefs.NineLives, 0, false);
                _actor.getSkills().add(this.new("scripts/skills/perks/perk_nine_lives"));
            }

            if (_actor.getSkills().getSkillByID("perk.legend_darkflight") == null)
            {
                _actor.getBackground().addPerk(this.Const.Perks.PerkDefs.LegendDarkflight, 1, false);
                _actor.getSkills().add(this.new("scripts/skills/perks/perk_legend_darkflight"));
            }

            if (_actor.getSkills().getSkillByID("perk.ptr_bloodlust") == null)
            {
                _actor.getBackground().addPerk(this.Const.Perks.PerkDefs.PTRBloodlust, 2, false);
                _actor.getSkills().add(this.new("scripts/skills/perks/perk_ptr_bloodlust"));
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
                text = "Heal [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color] of hitpoint damage inflicted on adjacent enemies that have blood" + "\n[color=" + this.Const.UI.Color.PositiveValue + "]+15[/color] Melee Skill."
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
                text = "Darkflight: Disapparate from your current location and reappear on the other side of the battlefield up to 6 tiles away."
            });
            result.push({
                id = 12,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Bloodlust: Every successful attack reduces current Fatigue by 5% per stack of Bleeding on the target and increases Fatigue Recovery by +1 per stack of Bleeding on the target. Bleeding inflicted by the attack, or killing a target, also counts towards the bonus."
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
                text = "Mutates the body. A long period of sicknes is expected. Under normal circumstances, drinking more than one mutation potion can severly cripple or even kill."
            });
            return result;
        }
    });
	
	delete this.anatomists_expanded.hook_items;
};