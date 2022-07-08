this.getroottable().anatomists_expanded.hook_mutations <- function ()
{
    //sickness logic + injury mutation logic
    ::mods_hookExactClass("items/misc/anatomist/anatomist_potion_item", function (o)
	{
		local onUse = ::mods_getMember(o, "onUse");
		o.onUse = function( _actor, _item = null )
		{
            local mutations_num = _actor.getFlags().getAsInt("ActiveMutations");
            //injury logic
            if (mutations_num > 0  && (this.World.Assets.getOrigin().getID() != "scenario.anatomists" || mutations_num > 1 || _actor.getSkills().getSkillByID("perk.hold_out") == null))
            {
                local potential = [];
                local injuries = this.Const.Injury.Permanent;
                local numPermInjuries = 0;

                foreach( inj in injuries )
                {
                    if (inj.ID == "injury.legend_scarred_injury" || inj.ID == "injury.missing_finger")
                    {
                        continue;
                    }
                    else if (inj.ID == "injury.broken_elbow_joint" && _actor.getSkills().getSkillByID("trait.legend_prosthetic_forearm") != null)
                    {
                        continue;
                    }
                    else if (inj.ID == "injury.broken_knee" && _actor.getSkills().getSkillByID("trait.legend_prosthetic_leg") != null)
                    {
                        continue;
                    }
                    else if (inj.ID == "injury.maimed_foot" && _actor.getSkills().getSkillByID("trait.legend_prosthetic_foot") != null)
                    {
                        continue;
                    }
                    else if (inj.ID == "injury.missing_ear" && _actor.getSkills().getSkillByID("trait.legend_prosthetic_ear") != null)
                    {
                        continue;
                    }
                    else if (inj.ID == "injury.missing_eye" && _actor.getSkills().getSkillByID("trait.legend_prosthetic_eye") != null)
                    {
                        continue;
                    }
                    else if (inj.ID == "injury.missing_hand" && _actor.getSkills().getSkillByID("trait.legend_prosthetic_hand") != null)
                    {
                        continue;
                    }
                    else if (inj.ID == "injury.missing_nose" && _actor.getSkills().getSkillByID("trait.legend_prosthetic_nose") != null)
                    {
                        continue;
                    }
                    else if (inj.ID == "injury.legend_burned_injury")
                    {
                        if (_actor.getSkills().getSkillByID(inj.ID) != null)
                        {
                            numPermInjuries = ++numPermInjuries;
                            numPermInjuries = numPermInjuries;
                            continue;
                        }

                        local isBurned = false;

                        foreach( b in this.Const.Injury.Burning )
                        {
                            if (_actor.getSkills().getSkillByID(b.ID)  != null)
                            {
                                isBurned = true;
                                break;
                            }
                        }

                        if (isBurned)
                        {
                            potential.push(inj);
                        }
                    }
                    else if (_actor.getSkills().getSkillByID(inj.ID) == null)
                    {
                        potential.push(inj);
                    }
                    else
                    {
                        numPermInjuries = ++numPermInjuries;
                        numPermInjuries = numPermInjuries;
                    }
                }

                if (potential.len() > 0)
                {
                    local inj_index = this.Math.rand(0, potential.len() - 1);
                    local skill = this.new("scripts/skills/" + potential[inj_index].Script);
                    _actor.getSkills().add(skill);
                    if (potential.len() > 1)
                    {
                        potential.remove(inj_index);
                        inj_index = this.Math.rand(0, potential.len() - 1);
                        skill = this.new("scripts/skills/" + potential[inj_index].Script);
                        _actor.getSkills().add(skill);
                    }
                    if (potential.len() > 1)
                    {
                        potential.remove(inj_index);
                        inj_index = this.Math.rand(0, potential.len() - 1);
                        skill = this.new("scripts/skills/" + potential[inj_index].Script);
                        _actor.getSkills().add(skill);
                    }
                }
                else
                {
                    //kill bro
                }
            }

            //sickness logic
            this.Sound.play("sounds/combat/drink_0" + this.Math.rand(1, 3) + ".wav", this.Const.Sound.Volume.Inventory);
            // if (!_actor.getSkills().hasSkill("injury.sickness"))
            // {
            //     _actor.getSkills().add(this.new("scripts/skills/injury/sickness_injury"));
            // }
            
            _actor.getFlags().increment("ActiveMutations");
            // _actor.getSkills().getSkillByID("injury.sickness").addHealingTime(_actor.getFlags().getAsInt("ActiveMutations") * 10);

            local time = 0.0;

            if (("State" in this.World) && this.World.State != null && this.World.State.getCombatStartTime() != 0)
            {
                time = this.World.State.getCombatStartTime();
            }
            else
            {
                time = this.Time.getVirtualTimeF();
            }

            _actor.getFlags().set("PotionLastUsed", time);
            _actor.getFlags().increment("PotionsUsed", 1);
            //play sound screaming
            return true;
		}
	});

	delete this.anatomists_expanded.hook_mutations;
};