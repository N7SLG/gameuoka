/mob/nagato/verb/BanshoTenin
    verb
        UseBansho(target as mob)
            set name = "Bansho Ten'in"
            set desc = "Universal Pull. Pulls a target closer."
            if(!usr || !target) return
            if(!(usr.admin==1||usr.owner==1) && src.Mchakra < 160) return usr << "Not enough chakra."
            if(!(usr.admin==1||usr.owner==1)) src.Mchakra -= 160
            usr << "You perform Banshō Ten'in to draw your foe in."
            target << "[usr] pulls you with Banshō Ten'in!"
            // particle FX
            flick("smoke2", usr)
            flick("smoke2", target)
            // attempt to move target to caster's location or one tile towards caster
            if(target.loc != usr.loc)
                // move target one step toward caster
                var/tx = target.loc.x
                var/ty = target.loc.y
                var/ux = usr.loc.x
                var/uy = usr.loc.y
                var/newx = tx + sign(ux - tx)
                var/newy = ty + sign(uy - ty)
                var/newloc = locate(newx, newy)
                if(newloc && newloc != target.loc)
                    try(target.Move(newloc))
            return